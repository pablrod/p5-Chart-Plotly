use HTML::Show;
use Chart::Plotly;
use Chart::Plotly::Trace::Scattergl;
my $scattergl = Chart::Plotly::Trace::Scattergl->new(
    x => [
        map {
            2 * cos( $ARG * 2 * 3.14 / 100 ) +
              cos( 2 * $ARG * 2 * 3.14 / 100 )
        } ( 1 .. 101 )
    ],
    y => [
        map {
            2 * sin( $ARG * 2 * 3.14 / 100 ) + sin( 2 * $ARG * 2 * 3.14 / 100 )
        } ( 1 .. 101 )
    ]
);

HTML::Show::show( Chart::Plotly::render_full_html( data => [$scattergl] ) );

