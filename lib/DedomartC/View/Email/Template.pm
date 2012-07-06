package DedomartC::View::Email::Template;

use strict;
use base 'Catalyst::View::Email::Template';

__PACKAGE__->config(
    stash_key       => 'email',
    template_prefix => 'email',
);

=head1 NAME

DedomartC::View::Email::Template - Templated Email View for DedomartC

=head1 DESCRIPTION

View for sending template-generated email from DedomartC. 

=head1 AUTHOR

user

=head1 SEE ALSO

L<DedomartC>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
