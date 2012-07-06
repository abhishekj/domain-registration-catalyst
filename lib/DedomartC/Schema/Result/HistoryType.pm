use utf8;
package DedomartC::Schema::Result::HistoryType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DedomartC::Schema::Result::HistoryType

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

=head1 TABLE: C<history_type>

=cut

__PACKAGE__->table("history_type");

=head1 ACCESSORS

=head2 ht_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 ht_explanation

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ht_dated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "ht_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "ht_explanation",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "ht_dated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</ht_id>

=back

=cut

__PACKAGE__->set_primary_key("ht_id");


# Created by DBIx::Class::Schema::Loader v0.07017 @ 2012-03-24 19:55:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yR0ZNVSY54XqrfqW/y5yxA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
