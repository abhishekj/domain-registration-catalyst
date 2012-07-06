use utf8;
package DedomartC::Schema::Result::PaymentGateway;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::PaymentGateway

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<payment_gateway>

=cut

__PACKAGE__->table("payment_gateway");

=head1 ACCESSORS

=head2 p_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 p_amount

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 p_user_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 p_gateway

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 p_currency

  data_type: 'varchar'
  default_value: 'usd'
  is_nullable: 0
  size: 255

=head2 p_transaction_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 p_token

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "p_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "p_amount",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "p_user_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "p_gateway",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "p_currency",
  {
    data_type => "varchar",
    default_value => "usd",
    is_nullable => 0,
    size => 255,
  },
  "p_transaction_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "p_token",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</p_id>

=back

=cut

__PACKAGE__->set_primary_key("p_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-25 19:56:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4VAAHtR+NsUbOmsyTvN5jg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
