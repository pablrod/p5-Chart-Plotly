use Chart::Plotly qw(show_plot);
use PDL;
use PDL::Math;

use aliased 'Chart::Plotly::Trace::Surface';

my $bessel_size = 50;
my $bessel      = Surface->new(
    x => xvals($bessel_size),
    y => xvals($bessel_size),
    z => bessj0( rvals( zeroes( $bessel_size, $bessel_size ) ) / 2 )
);

show_plot([$bessel]);

