use HTML::Show;
use Chart::Plotly;
use Chart::Plotly::Trace::Contour;
my $contour = Chart::Plotly::Trace::Contour->new(
    x => [ 0 .. 10 ],
    y => [ 0 .. 10 ],
    z => [
        map {
            my $y = $ARG;
            [ map { $ARG * $ARG + $y * $y } ( 0 .. 10 ) ]
        } ( 0 .. 10 )
    ]
);

HTML::Show::show( Chart::Plotly::render_full_html( data => [$contour] ) );

