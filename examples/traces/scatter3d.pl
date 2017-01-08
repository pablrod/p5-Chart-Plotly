use HTML::Show;
use Chart::Plotly;
use Chart::Plotly::Trace::Scatter3d;
const my $PI => 4 * atan2( 1, 1 );
const my $DELTA => 0.1;
my ( @x, @y, @z );
for ( my $u = 0; $u <= 2 * $PI; $u += $DELTA ) {
    for ( my $v = -1; $v < 1; $v += $DELTA ) {
        push @x, ( 1 + ( $v / 2 ) * cos( $u / 2 ) ) * cos($u);
        push @y, ( 1 + ( $v / 2 ) * cos( $u / 2 ) ) * sin($u);
        push @z, ( $v / 2 ) * sin( $u / 2 );
    }
}
my $scatter3d = Chart::Plotly::Trace::Scatter3d->new( x => \@x, y => \@y, z => \@z, mode => 'lines' );

HTML::Show::show( Chart::Plotly::render_full_html( data => [$scatter3d] ) );

