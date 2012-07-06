package DedomartC::View::DedomartC;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    INCLUDE_PATH       => [
        DedomartC->path_to( 'root', 'src' )
    ],
    ENCODING => 'utf8',
    WRAPPER  => 'wrapper.tt2',
    render_die => 1,
#    COMPILE_DIR => '/tmp/template_cache',
);

=head1 NAME

DedomartC::View::DedomartC - TT View for DedomartC

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
