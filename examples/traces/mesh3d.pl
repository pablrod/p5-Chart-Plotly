use HTML::Show;
use Chart::Plotly;
use Chart::Plotly::Trace::Mesh3d;
use List::Flatten;
use List::MoreUtils qw/pairwise/;
my @x = flat map { [ 0 .. 10 ] } ( 0 .. 10 );
my @y = flat map {
    my $y = $ARG;
    map { $y } ( 0 .. 10 )
} ( 0 .. 10 );
my @z = pairwise { $a * $a + $b * $b } @x, @y;
my $mesh3d = Chart::Plotly::Trace::Mesh3d->new( x => \@x, y => \@y, z => \@z );

HTML::Show::show( Chart::Plotly::render_full_html( data => [$mesh3d] ) );

