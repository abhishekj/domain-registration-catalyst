package DedomartC::View::BootStrapD;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    INCLUDE_PATH       => [
        DedomartC->path_to( 'root', 'bootstrap','src' )
    ],
    ENCODING => 'utf8',
    WRAPPER  => 'wrapper.tt2',
    render_die => 1,
);

=head1 NAME

DedomartC::View::BootStrapD - TT View for DedomartC

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
