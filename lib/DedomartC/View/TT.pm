package DedomartC::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

DedomartC::View::TT - TT View for DedomartC

=head1 DESCRIPTION

TT View for DedomartC.

=head1 SEE ALSO

L<DedomartC>

=head1 AUTHOR

user

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
