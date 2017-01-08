use HTML::Show;
use Chart::Plotly;
use Chart::Plotly::Trace::Surface;
my $surface = Chart::Plotly::Trace::Surface->new(
    x => [ 0 .. 10 ],
    y => [ 0 .. 10 ],
    z => [
        map {
            my $y = $ARG;
            [ map { $ARG - $y * $y } ( 0 .. 10 ) ]
        } ( 0 .. 10 )
    ]
);

HTML::Show::show( Chart::Plotly::render_full_html( data => [$surface] ) );

