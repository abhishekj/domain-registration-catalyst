use utf8;
package DedomartC::Schema::Result::Hosting;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::Hosting

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

=head1 TABLE: C<hostings>

=cut

__PACKAGE__->table("hostings");

=head1 ACCESSORS

=head2 h_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 h_users_id

  data_type: 'integer'
  is_nullable: 0

=head2 h_hp_id

  data_type: 'integer'
  is_nullable: 0

=head2 h_domain

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 h_expires_on

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 h_registered_on

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 h_ftp_username

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "h_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "h_users_id",
  { data_type => "integer", is_nullable => 0 },
  "h_hp_id",
  { data_type => "integer", is_nullable => 0 },
  "h_domain",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "h_expires_on",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "h_registered_on",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "h_ftp_username",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</h_id>

=back

=cut

__PACKAGE__->set_primary_key("h_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JPyP9VQT8IV6Kwq3hgyCLQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
