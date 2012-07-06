use strict;
use warnings;

use DedomartC;

my $app = DedomartC->apply_default_middlewares(DedomartC->psgi_app);
$app;

