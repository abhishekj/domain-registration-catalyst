use utf8;
package DedomartC::Schema::Result::Domain;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::Domain

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

=head1 TABLE: C<domains>

=cut

__PACKAGE__->table("domains");

=head1 ACCESSORS

=head2 d_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 d_users_id

  data_type: 'integer'
  is_nullable: 0

=head2 d_order_id

  data_type: 'integer'
  is_nullable: 0

=head2 d_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 d_expires_on

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 d_registered_on

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ns1

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 ns2

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 ns3

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 ns4

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 d_contact_id

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "d_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "d_users_id",
  { data_type => "integer", is_nullable => 0 },
  "d_order_id",
  { data_type => "integer", is_nullable => 0 },
  "d_domain",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "d_expires_on",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "d_registered_on",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "ns1",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "ns2",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "ns3",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "ns4",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "d_contact_id",
  { data_type => "varchar", is_nullable => 0, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</d_id>

=back

=cut

__PACKAGE__->set_primary_key("d_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-04-11 14:29:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8tEa5sxE76ttkQvc29jS/w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
