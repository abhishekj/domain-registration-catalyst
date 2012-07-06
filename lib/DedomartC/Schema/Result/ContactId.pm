use utf8;
package DedomartC::Schema::Result::ContactId;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::ContactId

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

=head1 TABLE: C<contact_ids>

=cut

__PACKAGE__->table("contact_ids");

=head1 ACCESSORS

=head2 ci_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ci_users_id

  data_type: 'integer'
  is_nullable: 0

=head2 ci_contact_id

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 ci_contact_type

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "ci_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ci_users_id",
  { data_type => "integer", is_nullable => 0 },
  "ci_contact_id",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "ci_contact_type",
  { data_type => "varchar", is_nullable => 0, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ci_id>

=back

=cut

__PACKAGE__->set_primary_key("ci_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-04-11 14:29:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8JTaYfqYHjTGTC9W1gze/g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
