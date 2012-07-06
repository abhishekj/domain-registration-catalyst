package DedomartC::Controller::Root;
use Moose;
use namespace::autoclean;
use DomainOperations::ResellerClubHTTP;
use Business::PayPal::NVP;
use IP::Country::Fast;
use IP::Country::MaxMind;
use Data::Dumper;
use Template::Stash;
use LWP::UserAgent;
use JSON::XS;
use Crypt::PassGen qw/ passgen /;

#BEGIN { extends 'Catalyst::Controller' }
BEGIN { extends 'Catalyst::Controller::HTML::FormFu'; }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config( namespace => '' );

=head1 NAME

DedomartC::Controller::Root - Root Controller for DedomartC

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index : Path('/') : Args(0) {
	my ( $self, $c ) = @_;
	$c->stash->{'template'} = 'index.tt2';
	$c->detach();
}

sub pricing_detail : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'pricing_detail.tt2';
	$c->detach();
}

sub faq : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'faq.tt2';
	$c->detach();
}

sub whois : Local {
	my ( $self, $c ) = @_;
	if ( !$c->user || !$c->request->params->{domain} ) {
		$c->redirect('/login');
	}
	my $user = $c->config->{whoisxmlapi}->{user};
	my $pass = $c->config->{whoisxmlapi}->{pass};
	my $dom  = $c->request->params->{domain};
	my $req =
	  HTTP::Request->new( GET =>
"http://www.whoisxmlapi.com/whoisserver/WhoisService?domainName=$dom&username=$user&password=$pass&outputFormat=JSON"
	  );
	$req->header( 'Accept' => 'text/html' );

	my $ua    = LWP::UserAgent->new;
	my $res   = $ua->request($req);
	my $coder = JSON::XS->new->ascii->pretty->allow_nonref;

	$c->stash->{whois} = $coder->decode( $res->content );
	$c->model('DB::DomainWhois')->create(
		{
			dw_users_id => $c->user ? $c->user->get('users_id') : '0',
			dw_search => $c->request->params->{'domain'},
			ip        => $c->req->address,
		}
	);

	$c->stash->{'template'} = 'whois.tt2';
	$c->detach();
}

sub testimonials : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'testimonials.tt2';
	$c->detach();
}

sub agreement : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'agreement.tt2';
	$c->detach();
}

sub promotions : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'promotions.tt2';
	$c->detach();
}

sub hosting : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'hosting.tt2';
	$c->detach();
}

sub about_us : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'about_us.tt2';
	$c->detach();
}

=head2 default

Standard 404 error page

=cut

sub forgot_password : Local : Args(0) : FormConfig {
	my ( $self, $c ) = @_;
	my $form = $c->stash->{form};

	#	$form->render_method('tt');
	#	$form->tt_args->{INCLUDE_PATH} =
	#	  "/home/vineet/workspace/delhi-pm/delhipm/root/templates";

	my $username = $c->request->params->{username};

	if ( $form->submitted_and_valid ) {
		my $user = $c->model("DB::User")->find( { users_email => $username } );
		if ($user) {
			$c->stash->{forgot_user} = $user;

			# email pass
			$c->stash->{email} = {
				to      => $username,
				from    => $c->config->{from_email},
				subject => 'Password for www.dedomart.com ',
				body    => 'Password for www.dedomart.com is '
				  . $user->get_column('users_pass'),
				content_type => 'multipart/alternative',
				template     => 'forgot_password.tt2'
			};

			$c->forward( $c->view("Email::Template") );
		}
	}
	$c->stash( template => 'forgot_password.tt2' );
	$c->detach();
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
}

sub login : Local : Args(0) : FormConfig {
	my ( $self, $c ) = @_;
	my $form = $c->stash->{form};

	#	$form->render_method('tt');
	#	$form->tt_args->{INCLUDE_PATH} =
	#	  "/home/vineet/workspace/delhi-pm/delhipm/root/templates";

	my $username = $c->request->params->{username};
	my $password = $c->request->params->{password};

	if ( $form->submitted_and_valid ) {
		if ( $username && $password ) {

			if (
				$c->authenticate(
					{
						users_email => $username,
						users_pass  => $password
					}
				)
			  )
			{
				$c->response->redirect( $c->uri_for('/cart') );
				$c->detach;
			}
			else {

				$c->stash( error_message => "Bad username or password." );
			}
		}
		else {

			$c->stash( error_message => "Empty username or password." );
		}

	}
	$c->stash( template => 'login.tt2' );
	$c->detach;

}

sub default : Private {
	my ( $self, $c ) = @_;
	$c->res->redirect("/");

}

sub auto : Private {
	my ( $self, $c ) = @_;

	my $getext = sub {
		my $domain = shift;
		my @temp = split( /\./, $domain, 2 );
		return $temp[$#temp];
	};
	my $getdomprice = sub {
		my $domain = shift;
		my @temp   = split( /\./, $domain->[0],2 );
		my $ext    = $temp[$#temp];
		my $years  = $domain->[1];

		return 1000 if !exists $c->config->{tlds}->{$ext};
		return $c->config->{tlds}->{$ext}->{newreg} * 1 +
		  $c->config->{tlds}->{$ext}->{renewal} * ( $years - 1 );
	};
	my $stash = Template::Stash->new();
	$stash->define_vmethod( item => getext      => $getext );
	$stash->define_vmethod( list => getdomprice => $getdomprice );

	$c->stash->{getext}      = $getext;
	$c->stash->{getdomprice} = $getdomprice;

	if ( !$c->session->{cflag} ) {
		my $reg = IP::Country::MaxMind->new(GEOIP_STANDARD);
		$c->session->{cflag} = lc $reg->inet_atocc( $c->req->address ) || 'in';
	}
	1;    # Very important else later actions not executed

	#	print STDERR Dumper $c->session->{cflag};

}

sub add : Local {
	my ( $self, $c ) = @_;

	if ( $c->request->params->{'domain'} ) {
		if ( lc ref( $c->request->params->{'domain'} ) eq 'array' ) {
			foreach my $domain ( @{ $c->request->params->{'domain'} } ) {
				my $ext = ( split( /\./, $domain, 2 ) )[1];
				$c->session->{cart}->{$domain}->{'year'} = 1;
				$c->session->{cart}->{$domain}->{'year'} = 2
				  if ( $ext eq 'co.uk'
					|| $ext eq 'org.uk'
					|| $ext eq 'eu'
					|| $ext eq 'nz '
					|| $ext eq 'ca'
					|| $ext eq 'ru' );
			}

		}
		else {
			$c->session->{cart}->{ $c->request->params->{'domain'} }->{'year'} =
			  1
			  if $c->request->params->{'domain'};
			my $ext = ( split( /\./, $c->request->params->{'domain'}, 2 ) )[1];
			$c->session->{cart}->{ $c->request->params->{'domain'} }->{'year'} =
			  2
			  if ( $ext eq 'co.uk'
				|| $ext eq 'org.uk'
				|| $ext eq 'eu'
				|| $ext eq 'nz '
				|| $ext eq 'ca'
				|| $ext eq 'ru' );
		}
	}

	$c->response->redirect( $c->uri_for('/cart') );
	$c->detach;
}

sub update : Local {
	my ( $self, $c ) = @_;
	if ( $c->request->params->{'domain'} ) {

		#		if ( lc ref( $c->request->params->{'domain'} ) eq 'array' ) {

		foreach my $domain ( keys %{ $c->session->{cart} } ) {
			if ( $c->request->params->{ 'year_' . $domain } ) {
				$c->session->{cart}->{$domain}->{'year'} =
				  $c->request->params->{ 'year_' . $domain } || 0;
				$c->session->{cart}->{$domain}->{'hosting'} =
				  $c->request->params->{ 'hosting_' . $domain } eq 'yes'
				  ? 'checked'
				  : undef;
			}
			else {
				delete $c->session->{cart}->{$domain};
			}

			#		print STDERR Dumper($c->session->{cart});
		}
	}
	if ( $c->request->params->{'hid'} eq 'book' ) {
		$c->response->redirect( $c->uri_for('/book') );
	}
	elsif ( $c->request->params->{'hid'} eq 'addfunds' ) {
		$c->response->redirect( $c->uri_for('/add_funds',{addfunds=>$c->request->params->{addfunds}}) );
	}
	else {
		$c->response->redirect( $c->uri_for('/cart') );
	}
}

sub remove : Local {
	my ( $self, $c ) = @_;
	if ( $c->request->params->{'domain'} ) {

		#		print STDERR Dumper( $c->request->params->{'domain'} );

		#		$c->detach;
		delete $c->session->{cart}->{ $c->request->params->{'domain'} };
	}
	$c->response->redirect( $c->uri_for('/cart') );
	$c->detach;
}

sub cart : Local {
	my ( $self, $c ) = @_;

	$c->stash->{'template'} = 'cart.tt2';
	$c->detach();
}

sub book : Local {
	my ( $self, $c ) = @_;
	my $do = DomainOperations::ResellerClubHTTP->new(
		username => $c->config->{ $c->config->{mode} }->{username},
		password => $c->config->{ $c->config->{mode} }->{password},
		account  => $c->config->{mode},
	);

	my $book_res = {};
	my $book_err = {};
	foreach my $cart ( %{ $c->session->{cart} } ) {
		my $row =
		  $c->model("DB::User")
		  ->find( { users_email => $c->user->get('users_email') } );

		#		  print STDERR Dumper $cart;
		my $price =
		  $c->stash->{getdomprice}(
			[ $cart, $c->session->{cart}->{$cart}->{year} ] )
		  if !ref($cart);
		if (   !ref($cart)
			&& $c->session->{cart}->{$cart}->{year} > 0
			&& ( $row->get_column('users_balance_usd') >= $price ) )
		{

			#			book

			#			print STDERR Dumper $c->stash->{getext};
			#			print STDERR "in book"
			#			  . $c->stash->{getdomprice}(
			#				[ $cart, $c->session->{cart}->{$cart}->{year} ] );
			my $row_contact;
			my $contact_type;
			my $contact_id;
			my $cid;
			my $ext = ( split( /\./, lc $cart, 2 ) )[1];
			if ( $ext eq 'co.uk' || $ext eq 'org.uk' ) {
				$row_contact = $c->model("DB::ContactId")->find(
					{
						ci_users_id     => $c->user->get('users_id'),
						ci_contact_type => 'ukcontact'
					}
				);
				$contact_type = 'UkContact';
			}
			elsif ( $ext eq 'eu' ) {
				$row_contact = $c->model("DB::ContactId")->find(
					{
						ci_users_id     => $c->user->get('users_id'),
						ci_contact_type => 'eucontact'
					}
				);

				$contact_type = 'EuContact';
			}
			elsif ( $ext eq 'nz' ) {
			}
			elsif ( $ext eq 'ca' ) {
				$row_contact = $c->model("DB::ContactId")->find(
					{
						ci_users_id     => $c->user->get('users_id'),
						ci_contact_type => 'cacontact'
					}
				);

				$contact_type = 'CaContact';
			}
			elsif ( $ext eq 'ru' ) {
				$row_contact = $c->model("DB::ContactId")->find(
					{
						ci_users_id     => $c->user->get('users_id'),
						ci_contact_type => 'rucontact'
					}
				);
				$contact_type = 'CaContact';

			}
			if ( $contact_type && !$row_contact ) {

				$contact_id = $do->createContact(
					{
						cemail       => $c->user->get('users_email'),
						cname        => $c->user->get('users_name'),
						caddress1    => $c->user->get('users_address1'),
						caddress2    => '',
						ccompany     => $c->user->get('users_company'),
						ccity        => $c->user->get('users_city'),
						cstate       => $c->user->get('users_state'),
						ccountry     => $c->user->get('users_country'),
						czip         => $c->user->get('users_zip'),
						ccountrycode => $c->user->get('users_mobile_cc')
						  || '91',
						cphone => $c->user->get('users_mobile_no'),
						type   => $contact_type,
						'customerid'	=>	$c->user->get('users_customer_id'),
					}
				);

				if ( $contact_id->{error}==0) {

#					print STDERR Dumper $contact_id;
					$cid = $contact_id->{res};
					$c->model("DB::ContactId")->create(
						{
							ci_users_id     => $c->user->get('users_id'),
							ci_contact_id   => $cid,
							ci_contact_type => $contact_type,
						}
					);

				}
				else {
					$contact_id = 0;
				}
			}
			elsif ($row_contact) {
				$cid = $row_contact->get_column('ci_contact_id');
			}
			my $res = $do->registerDomain(
				{
					domain => $cart,
					years  => $c->session->{cart}->{$cart}->{year},
					nameservers =>
					  [ $c->config->{nameserver1}, $c->config->{nameserver2} ],
					customer => $c->user->get('users_customer_id'),

					contact => $cid || $c->user->get('users_contact_id'),

				}
			);
			if ( !$res->{error} ) {

				$row->set_column( 'users_balance_usd',
					$row->get_column('users_balance_usd') - $price );
				$row->update;

				$c->model("DB::Domain")->create(
					{
						d_users_id   => $c->user->get('users_id'),
						d_order_id   => $res->{res},
						d_domain     => $cart,
						d_expires_on => \(
							    'date_add(now(), interval '
							  . $c->session->{cart}->{$cart}->{year}
							  . ' year)'
						),
						d_registered_on => \"now()",
						ns1             => $c->config->{nameserver1},
						ns2             => $c->config->{nameserver2},
						d_contact_id    => $cid
						  || $c->user->get('users_contact_id'),
					}
				);

				$book_res->{$cart} = $c->session->{cart}->{$cart}->{year};
			}
			else {
				if ( !ref($cart) ) {
					$book_res->{$cart} = 0;
					$book_err->{$cart} = $res->{errormessage};
				}
			}
		}
		else {
			if ( !ref($cart) ) {
				$book_res->{$cart} = 0;
			}
		}

	}

	#	print STDERR "abhishek jain";
	#	print STDERR Dumper $book_res;
	delete $c->session->{cart};
	$c->stash->{book_res}   = $book_res;
	$c->stash->{book_err}   = $book_err;
	$c->stash->{'template'} = 'book.tt2';
	$c->detach();
}

sub renew : Local {
	my ( $self, $c ) = @_;
	my $do = DomainOperations::ResellerClubHTTP->new(
		username => $c->config->{ $c->config->{mode} }->{username},
		password => $c->config->{ $c->config->{mode} }->{password},
		account  => $c->config->{mode},
	);
	my $book_res = {};
	my $did      = $c->request->params->{did};
	my $domain   = $c->request->params->{domain};
	my $years    = $c->request->params->{years};
	my @expdate  = split( /T/, $c->request->params->{expdate} );
	my $expdate  = $expdate[0];

	my $row =
	  $c->model("DB::User")
	  ->find( { users_email => $c->user->get('users_email') } );
	my $price = $c->stash->{getdomprice}( [ $domain, $years ] );
	my $domain_row = $c->model("DB::Domain")->find(
		{
			d_id     => $did,
			d_domain => $domain,
		}
	);

	#		print STDERR Dumper $domain_row;
	if (   $years > 0
		&& ( $row->get_column('users_balance_usd') >= $price )
		&& $domain_row )
	{

		#			renew

#		print STDERR Dumper $c->stash->{getext};
#		print STDERR "in book".$c->stash->{getdomprice}([$cart,$c->session->{cart}->{$cart}->{year}]);
		my $res = $do->renewDomain(
			{
				orderid => $domain_row->get_column('d_order_id'),
				years   => $years,
				expdate => $expdate,
			}
		);

		#		print STDERR "abbbbbb";
		#		print STDERR Dumper $res;
		if ( !$res->{error} ) {

			$row->set_column( 'users_balance_usd',
				$row->get_column('users_balance_usd') - $price );
			$row->update;

			$domain_row->set_column(
				d_expires_on => \(
					    'date_add('
					  . $domain_row->get_column("d_expires_on")
					  . ', interval '
					  . $years
					  . ' year)'
				)
			);
			$domain_row->update;

			$book_res->{$domain} = $years;
		}
		else {
			$book_res->{$domain} = 0;
		}
	}
	else {
		$book_res->{$domain} = 0;
	}

	#	print STDERR Dumper $book_res;
	$c->response->redirect( $c->uri_for('/myaccount') );
}

sub add_funds : Local {
	my ( $self, $c ) = @_;
	$c->stash->{'template'} = 'add_funds.tt2';
	$c->detach();
}

sub add_funds_bankdeposit : Local {
	my ( $self, $c ) = @_;
	$c->stash->{'template'} = 'add_funds.tt2';
	$c->detach();
}

sub add_funds_paypal : Local {
	my ( $self, $c ) = @_;

	my $invnum_row = $c->model("DB::PaymentGateway")->create(
		{
			p_user_id  => $c->user->get('users_id'),
			p_gateway  => 'Paypal',
			p_currency => 'USD',
			p_amount   => $c->request->params->{amount},

			#		p_token		=>	$token,
		}
	);
	my $invnum = $invnum_row->id;

	#$c->user->get('users_id').'-'.time;
	my $pp = new Business::PayPal::NVP(
		$c->config->{ $c->config->{mode} }->{paypalservermode} => {
			user => $c->config->{ $c->config->{mode} }->{paypalusername},
			pwd  => $c->config->{ $c->config->{mode} }->{paypalpassword},
			sig  => $c->config->{ $c->config->{mode} }->{paypalsignature}
		},
		branch => $c->config->{ $c->config->{mode} }->{paypalservermode}
	);

	#	print STDERR Dumper $pp;

	my %ans = $pp->SetExpressCheckout(
		AMT           => $c->request->params->{amount},
		DESC          => 'Add Funds',
		CUSTOM        => 'Add Funds for www.dedomart.com ',
		INVNUM        => $invnum,
		CURRENCYCODE  => 'USD',
		PAYMENTACTION => 'Sale',
		RETURNURL     => $c->uri_for('receive_funds_paypal'),
		CANCELURL     => $c->uri_for('cart'),
	);

	my $token = $ans{TOKEN};
	$invnum_row->set_column( 'p_token', $token );
	$invnum_row->update;

	#	$c->model("DB::PaymentGateway")->create({
	#		p_user_id	=>	$c->user->get('users_id'),
	#		p_gateway	=>	'Paypal',
	#		p_currency	=>	'USD',
	#		p_amount	=>	$c->request->params->{amount},
##		p_token		=>	$token,
	#	});

	$c->response->redirect( "https://"
		  . $c->config->{ $c->config->{mode} }->{paypalurl}
		  . ".paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=$token" );
	return;
}

sub receive_funds_paypal : Local {
	my ( $self, $c ) = @_;
	my $pp = new Business::PayPal::NVP(
		$c->config->{ $c->config->{mode} }->{paypalservermode} => {
			user => $c->config->{ $c->config->{mode} }->{paypalusername},
			pwd  => $c->config->{ $c->config->{mode} }->{paypalpassword},
			sig  => $c->config->{ $c->config->{mode} }->{paypalsignature}
		},

		branch => $c->config->{ $c->config->{mode} }->{paypalservermode}
	);
	my $token = $c->request->params->{token};
	my %ans = $pp->GetExpressCheckoutDetails( TOKEN => $token );

	my $payerid = $ans{PAYERID};
	my $invnum_row =
	  $c->model("DB::PaymentGateway")
	  ->find(
		{ 'p_user_id' => $c->user->get('users_id'), 'p_token' => $token } );
	my $amount = $invnum_row->get_column('p_amount');
	%ans = $pp->DoExpressCheckoutPayment(
		TOKEN         => $token,
		AMT           => $amount,
		PAYERID       => $payerid,
		PAYMENTACTION => 'Sale'
	);
	if ( $ans{TRANSACTIONID} ) {
		my $user_row =
		  $c->model("DB::User")
		  ->find( { users_id => $c->user->get("users_id") } );
		$user_row->set_column( "users_balance_usd",
			$user_row->get_column("users_balance_usd") + $ans{AMT} )
		  ;    #-$ans{FEEAMT});
		$user_row->update;
		$invnum_row->set_column( 'p_transaction_id', $ans{TRANSACTIONID} );
		$invnum_row->update;
		if ( $user_row->get_column("users_contact_id") > 0 ) {
			$c->response->redirect('/cart');
		}
		else {
			$c->response->redirect('/updateaccount?nstep=book');
		}

	}

}

sub myaccount : Local {
	my ( $self, $c ) = @_;
	@{ $c->stash->{domains} } = $c->model("DB::Domain")->search(
		{
			d_users_id   => $c->user->get('users_id'),
			d_expires_on => { '>=', \"DATE_SUB(now(), interval 2 month)" }
		}
	)->all;

	#	print STDERR Dumper $c->stash->{domains};
	$c->stash->{'template'} = 'myaccount.tt2';
	$c->detach();
}

sub search : Local : Args(0) : FormConfig {
	my ( $self, $c ) = @_;
	my $do = DomainOperations::ResellerClubHTTP->new(
		username => $c->config->{ $c->config->{mode} }->{username},
		password => $c->config->{ $c->config->{mode} }->{password},
		account  => $c->config->{mode},
	);

	my $form = $c->stash->{form};

	my $searchrow = $c->model('DB::DomainSearch')->create(
		{
			ds_users_id => $c->user ? $c->user->get('users_id') : '0',
			ds_search => $c->request->params->{'domain'} . '.'
			  . $c->request->params->{'ext'},
			ip => $c->req->address,
		}
	);

	my $res = $do->checkDomainAWithSuggestion(
		{
			'domains' => [ $c->request->params->{'domain'} ],
			'tlds'    => [ keys %{ $c->config->{tlds} } ],
		}
	);

	$c->stash->{res}    = $res;
	$c->stash->{tldreq} = $c->request->params->{'ext'};
	$c->stash->{domreq} = $c->request->params->{'domain'};

	$c->stash( template => 'search.tt2' );

	$c->detach;

}

sub update_nameservers : Local : Args(0) : FormConfig {
	my ( $self, $c ) = @_;

	my $do = DomainOperations::ResellerClubHTTP->new(
		username => $c->config->{ $c->config->{mode} }->{username},
		password => $c->config->{ $c->config->{mode} }->{password},
		account  => $c->config->{mode},
	);
	my $domain_row = $c->model("DB::Domain")->find(
		{
			d_id       => $c->request->params->{'did'},
			d_users_id => $c->user->get('users_id')
		}
	);
	my $form = $c->stash->{form};

#        $form->render_method( 'tt' );
#    	$form->tt_args->{INCLUDE_PATH} = "/home/vineet/workspace/delhi-pm/delhipm/root/templates";
	if ( $form->submitted_and_valid && $domain_row ) {

		# update ns1 2
		my $res = $do->modifyNameserver(
			{
				orderid => $domain_row->get_column('d_order_id'),
				nameservers =>
				  [ $c->request->params->{ns1}, $c->request->params->{ns2} ],
			}
		);
		if ( !$res->{error} ) {

			$domain_row->set_column( 'ns1', $c->request->params->{ns1} );
			$domain_row->set_column( 'ns2', $c->request->params->{ns2} );
			$domain_row->update;
			$c->response->redirect( $c->uri_for('/myaccount') );
		}
		else {
			$c->stash->{'error_message'} =
			  "Server Error: " . $res->{errormessage};
		}
	}

	$form->get_field( { name => 'ns1' } )
	  ->value( $domain_row->get_column('ns1') );
	$form->get_field( { name => 'ns2' } )
	  ->value( $domain_row->get_column('ns2') );
	$form->get_field( { name => 'did' } )
	  ->value( $c->request->params->{'did'} );
	$c->stash( template => 'update_nameservers.tt2' );

	$c->detach;

}

sub updateaccount : Local : Args(0) : FormConfig {
	my ( $self, $c ) = @_;

	my $do = DomainOperations::ResellerClubHTTP->new(
		username => $c->config->{ $c->config->{mode} }->{username},
		password => $c->config->{ $c->config->{mode} }->{password},
		account  => $c->config->{mode},
	);
	my $user_row =
	  $c->model("DB::User")->find( { users_id => $c->user->get('users_id') } );
	my $form = $c->stash->{form};
	my $customer;

	if (   $form->submitted_and_valid
		&& $user_row
		&& $c->user->get('users_contact_id') > 0 )
	{
		$do->modifyContact(
			{
				cemail       => $c->user->get('users_email'),
				cname        => $c->request->params->{'name'},
				ccompany     => $c->request->params->{'company'},
				caddress1    => $c->request->params->{'address1'},
				ccity        => $c->request->params->{'city'},
				cstate       => $c->request->params->{'state'},
				ccountry     => $c->request->params->{'country'},
				czip         => $c->request->params->{'zip'},
				ccountrycode => $c->request->params->{'ccode'} || 91,
				cphone       => $c->request->params->{'telephone'},
				contactid    => $c->user->get('users_contact_id')
			}
		);

		$do->modifyCustomer(
			{
				cemail       => $c->user->get('users_email'),
				cname        => $c->request->params->{'name'},
				ccompany     => $c->request->params->{'company'},
				caddress1    => $c->request->params->{'address1'},
				ccity        => $c->request->params->{'city'},
				cstate       => $c->request->params->{'state'},
				ccountry     => $c->request->params->{'country'},
				czip         => $c->request->params->{'zip'},
				ccountrycode => $c->request->params->{'ccode'} || 91,
				cphone       => $c->request->params->{'telephone'},
				customerid   => $c->user->get('users_customer_id')
			}
		);

	}
	elsif ($form->submitted_and_valid
		&& $user_row
		&& !$c->user->get('users_contact_id') )
	{

		#create customer and contact id.
		$customer = $do->createCustomer(
			{
				_add_default_contact => '1',
				cemail               => $c->user->get('users_email'),
				cpassword            => $c->user->get('users_pass'),
				cname                => $c->request->params->{'name'},
				caddress1            => $c->request->params->{'address1'},
				caddress2            => '',
				ccity                => $c->request->params->{'city'},
				cstate               => $c->request->params->{'state'},
				ccountry             => $c->request->params->{'country'},
				czip                 => $c->request->params->{'zip'},
				ccountrycode => $c->user->get('users_mobile_cc') || '91',
				cphone       => $c->request->params->{'telephone'},
			}
		);

#			if ($c->request->params->{'createrecord'} ne 'yes' || !$customer->{error} ) {
#				my $member = $c->model('DB::User')->create(
#					{
#						users_email       => $c->request->params->{'username'},
#						users_pass        => $c->request->params->{'password'},
#						users_customer_id => $customer->{res},
#						users_contact_id  => $customer->{contact},
#						users_name        => $c->request->params->{'name'},
#						users_company     => $c->request->params->{'cname'},
#						users_address1    => $c->request->params->{'address1'},
#						users_city        => $c->request->params->{'city'},
#						users_state       => $c->request->params->{'state'},
#						users_country     => $c->request->params->{'country'},
#						users_zip         => $c->request->params->{'zip'},
#						users_mobile_cc   => '91',
#						users_mobile_no   => $c->request->params->{'telephone'},
#						users_status      => 'active',
#						refer             => '',
#						users_dated       => \"NOW()",
#
#					}
#				);

	}
	else {
		$c->stash->{'error_message'} = "Not updated";
	}

	if ( $form->submitted_and_valid && $user_row ) {
		$user_row->set_column( 'users_name', $c->request->params->{'name'} );
		$user_row->set_column( 'users_company',
			$c->request->params->{'company'} );
		$user_row->set_column( 'users_address1',
			$c->request->params->{'address1'} );
		$user_row->set_column( 'users_city',  $c->request->params->{'city'} );
		$user_row->set_column( 'users_state', $c->request->params->{'state'} );
		$user_row->set_column( 'users_country',
			$c->request->params->{'country'} );
		$user_row->set_column( 'users_zip', $c->request->params->{'zip'} );
		$user_row->set_column( 'users_mobile_cc',
			$c->request->params->{'ccode'} );
		$user_row->set_column( 'users_mobile_no',
			$c->request->params->{'telephone'} );

		if ($customer) {
			$user_row->set_column( 'users_customer_id', $customer->{res} );
			$user_row->set_column( 'users_contact_id',  $customer->{contact} );
		}
#		print STDERR Dumper $customer;
		$user_row->update;
		if ( $c->request->params->{'nstep'} eq 'book' ) {
			$c->response->redirect( $c->uri_for('/book') );
		}
		else {
			$c->response->redirect( $c->uri_for('/myaccount') );
		}

	}

	$form->get_field( { name => 'name' } )
	  ->value( $user_row->get_column('users_name') );

	#	$form->get_field( { name => 'email' } )
	#	  ->value( $user_row->get_column('users_email') );
	$form->get_field( { name => 'company' } )
	  ->value( $user_row->get_column('users_company') );
	$form->get_field( { name => 'address1' } )
	  ->value( $user_row->get_column('users_address1') );
	$form->get_field( { name => 'city' } )
	  ->value( $user_row->get_column('users_city') );
	$form->get_field( { name => 'state' } )
	  ->value( $user_row->get_column('users_state') );
	$form->get_field( { name => 'country' } )
	  ->value( $user_row->get_column('users_country') );
	$form->get_field( { name => 'zip' } )
	  ->value( $user_row->get_column('users_zip') );
	$form->get_field( { name => 'telephone' } )
	  ->value( $user_row->get_column('users_mobile_no') );
	$c->stash( template => 'updateaccount.tt2' );

	$c->detach;

}

sub logout : Local {
	my ( $self, $c ) = @_;
	$c->logout();
	$c->response->redirect( $c->uri_for('/') );
	$c->detach;
}

sub join : Local : Args(0) : FormConfig {

	my ( $self, $c ) = @_;
	my $do = DomainOperations::ResellerClubHTTP->new(
		username => $c->config->{ $c->config->{mode} }->{username},
		password => $c->config->{ $c->config->{mode} }->{password},
		account  => $c->config->{mode},
	);

	my $form = $c->stash->{form};

	my $customer;
	my $generated_password = &generate_password;

	my $member_exists =
	  $c->model('DB::User')
	  ->find( { 'users_email' => $c->request->params->{'username'} } );
	if ( $form->submitted_and_valid ) {

		if ( !$member_exists ) {
			if ( $c->request->params->{'createrecord'} eq 'yes' ) {

				$customer = $do->createCustomer(
					{
						_add_default_contact => '1',
						cemail       => $c->request->params->{'username'},
						cpassword    => $c->request->params->{'password'},
						cname        => $c->request->params->{'name'},
						caddress1    => $c->request->params->{'address1'},
						caddress2    => '',
						ccity        => $c->request->params->{'city'},
						cstate       => $c->request->params->{'state'},
						ccountry     => $c->request->params->{'country'},
						czip         => $c->request->params->{'zip'},
						ccountrycode => '91',
						cphone       => $c->request->params->{'telephone'},
					}
				);
			}

			if ( $c->request->params->{'createrecord'} ne 'yes'
				|| !$customer->{error} )
			{
				my $member = $c->model('DB::User')->create(
					{
						users_email => $c->request->params->{'username'},
						users_pass  => $c->request->params->{'password'}
						  || $generated_password,
						users_customer_id => $customer->{res},
						users_contact_id  => $customer->{contact},
						users_name        => $c->request->params->{'name'},
						users_company     => $c->request->params->{'cname'},
						users_address1    => $c->request->params->{'address1'},
						users_city        => $c->request->params->{'city'},
						users_state       => $c->request->params->{'state'},
						users_country     => $c->request->params->{'country'},
						users_zip         => $c->request->params->{'zip'},
						users_mobile_cc   => '91',
						users_mobile_no   => $c->request->params->{'telephone'},
						users_status      => 'active',
						refer             => '',
						users_dated       => \"NOW()",

					}
				);

				if (
					$c->authenticate(
						{
							users_email => $c->request->params->{'username'},
							users_pass  => $c->request->params->{'password'}
							  || $generated_password,
						}
					)
				  )
				{
					$c->stash->{email} = {
						to       => $c->req->param('username'),
						from     => $c->config->{from_email},
						subject  => 'Welcome To DedoMart.com',
						template => 'join.tt2',
					};

					$c->forward( $c->view("Email::Template") );

				}
			}
			else {

				#				print STDERR Dumper $customer;
				$c->stash( error_message => 'Server returned Error! '
					  . $customer->{errormessage} );
				$c->stash( template => 'login.tt2' );
				$c->detach;

			}

			$c->response->redirect( $c->uri_for('/cart') );
			$c->detach;

		}
		else {
			$c->stash( error_message => 'Login name already Exists!' );
		}
	}

	my $reg = IP::Country::MaxMind->new(GEOIP_STANDARD);
	my $ccode = uc $reg->inet_atocc( $c->req->address ) || 'IN';
	$form->get_field("country")->value( $ccode eq '**' ? 'IN' : $ccode );
	$c->stash( template => 'login.tt2' );

	$c->detach;

}

sub sitemap_xml : Path('/sitemap.xml') {
	my ( $self, $c ) = @_;
	$c->serve_static_file(
		$c->config->{'home'} . "/root/specialstatic/sitemap.xml" );
	return 0;
}

sub generate_password {
	my ($self) = @_;

	my @passwords = passgen( NWORDS => 1, NLETT => 6 );

	return $passwords[0] . "12";
}

=head1 AUTHOR

user

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
