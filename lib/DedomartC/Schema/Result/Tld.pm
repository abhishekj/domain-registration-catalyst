use utf8;
package DedomartC::Schema::Result::Tld;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::Tld

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

=head1 TABLE: C<tld>

=cut

__PACKAGE__->table("tld");

=head1 ACCESSORS

=head2 t_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 t_category

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 t_price

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 t_tld

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 t_active

  data_type: 'varchar'
  default_value: 'enabled'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "t_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "t_category",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "t_price",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "t_tld",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "t_active",
  {
    data_type => "varchar",
    default_value => "enabled",
    is_nullable => 0,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</t_id>

=back

=cut

__PACKAGE__->set_primary_key("t_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:G6gZvRnJySqRuapBrjdWeQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
