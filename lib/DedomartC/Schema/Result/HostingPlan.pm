use utf8;
package DedomartC::Schema::Result::HostingPlan;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::HostingPlan

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

=head1 TABLE: C<hosting_plan>

=cut

__PACKAGE__->table("hosting_plan");

=head1 ACCESSORS

=head2 hp_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 hp_price

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 hp_active

  data_type: 'varchar'
  default_value: 'enabled'
  is_nullable: 0
  size: 255

=head2 hp_flag

  data_type: 'enum'
  default_value: 'l'
  extra: {list => ["l","w"]}
  is_nullable: 0

=head2 hp_description

  data_type: 'text'
  is_nullable: 0

=head2 hp_name

  data_type: 'varchar'
  is_nullable: 0
  size: 225

=cut

__PACKAGE__->add_columns(
  "hp_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "hp_price",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "hp_active",
  {
    data_type => "varchar",
    default_value => "enabled",
    is_nullable => 0,
    size => 255,
  },
  "hp_flag",
  {
    data_type => "enum",
    default_value => "l",
    extra => { list => ["l", "w"] },
    is_nullable => 0,
  },
  "hp_description",
  { data_type => "text", is_nullable => 0 },
  "hp_name",
  { data_type => "varchar", is_nullable => 0, size => 225 },
);

=head1 PRIMARY KEY

=over 4

=item * L</hp_id>

=back

=cut

__PACKAGE__->set_primary_key("hp_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TpB/io8MUSCg7JQOTNzhXQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
