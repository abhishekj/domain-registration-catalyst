use utf8;
package DedomartC::Schema::Result::BankDetail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::BankDetail

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

=head1 TABLE: C<bank_details>

=cut

__PACKAGE__->table("bank_details");

=head1 ACCESSORS

=head2 b_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 payee_name

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 bank

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 deposit_method

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 amount

  data_type: 'float'
  is_nullable: 0

=head2 reference_no

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 deposit_at_branch

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 users_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "b_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "payee_name",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "bank",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "deposit_method",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "amount",
  { data_type => "float", is_nullable => 0 },
  "reference_no",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "deposit_at_branch",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "users_id",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</b_id>

=back

=cut

__PACKAGE__->set_primary_key("b_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qzAe2SMTTLVY61HKqmQ8iQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
