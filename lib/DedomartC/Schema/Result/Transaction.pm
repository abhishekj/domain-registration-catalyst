use utf8;
package DedomartC::Schema::Result::Transaction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::Transaction

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

=head1 TABLE: C<transactions>

=cut

__PACKAGE__->table("transactions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 particulars

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=head2 date

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 credit

  data_type: 'float'
  is_nullable: 0

=head2 debit

  data_type: 'float'
  is_nullable: 0

=head2 balance

  data_type: 'float'
  is_nullable: 0

=head2 users_id

  data_type: 'integer'
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "particulars",
  { data_type => "varchar", is_nullable => 0, size => 225 },
  "date",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "credit",
  { data_type => "float", is_nullable => 0 },
  "debit",
  { data_type => "float", is_nullable => 0 },
  "balance",
  { data_type => "float", is_nullable => 0 },
  "users_id",
  { data_type => "integer", is_nullable => 0 },
  "status",
  { data_type => "varchar", is_nullable => 0, size => 225 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<id>

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->add_unique_constraint("id", ["id"]);


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:inzeaxzxetbR6SU+3jhp0g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
