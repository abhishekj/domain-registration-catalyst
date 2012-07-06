use utf8;
package DedomartC::Schema::Result::OrderTable;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::OrderTable

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

=head1 TABLE: C<order_table>

=cut

__PACKAGE__->table("order_table");

=head1 ACCESSORS

=head2 o_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 o_reseller

  data_type: 'integer'
  is_nullable: 0

=head2 o_type

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 o_p_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 o_domain_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 o_years

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 o_active

  data_type: 'varchar'
  default_value: 'enabled'
  is_nullable: 0
  size: 255

=head2 o_customer_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 o_contact_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 o_users_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 date

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 order_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "o_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "o_reseller",
  { data_type => "integer", is_nullable => 0 },
  "o_type",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "o_p_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "o_domain_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "o_years",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "o_active",
  {
    data_type => "varchar",
    default_value => "enabled",
    is_nullable => 0,
    size => 255,
  },
  "o_customer_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "o_contact_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "o_users_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "date",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "order_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</o_id>

=back

=cut

__PACKAGE__->set_primary_key("o_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ApvDSlqMoqaEVXb7zIakQg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
