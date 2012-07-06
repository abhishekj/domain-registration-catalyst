use utf8;
package DedomartC::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 users_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 users_reseller

  data_type: 'integer'
  is_nullable: 0

=head2 users_email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 users_pass

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 users_customer_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 users_contact_id

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 users_mobile_cc

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 users_mobile_no

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 users_balance_usd

  data_type: 'float'
  default_value: 0.00
  is_nullable: 0
  size: [5,2]

=head2 users_dated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 modify_dated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 users_status

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 refer

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 users_name

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 users_company

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 users_address1

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 users_city

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 users_state

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 users_country

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 users_zip

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=cut

__PACKAGE__->add_columns(
  "users_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "users_reseller",
  { data_type => "integer", is_nullable => 0 },
  "users_email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "users_pass",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "users_customer_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "users_contact_id",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "users_mobile_cc",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "users_mobile_no",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "users_balance_usd",
  {
    data_type => "float",
    default_value => "0.00",
    is_nullable => 0,
    size => [5, 2],
  },
  "users_dated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "modify_dated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "users_status",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "refer",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "users_name",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "users_company",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "users_address1",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "users_city",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "users_state",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "users_country",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "users_zip",
  { data_type => "varchar", is_nullable => 1, size => 200 },
);

=head1 PRIMARY KEY

=over 4

=item * L</users_id>

=back

=cut

__PACKAGE__->set_primary_key("users_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-04-11 14:29:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SYCAMErPjokIbzKbVrTNbg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
