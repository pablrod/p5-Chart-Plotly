use HTML::Show;
use Chart::Plotly;

my $data = { x    => [ 1 .. 10 ],
             mode => 'markers',
             type => 'scatter'
};
$data->{'y'} = [ map { rand 10 } @{ $data->{'x'} } ];

HTML::Show::show( Chart::Plotly::render_full_html( data => [$data] ) );

use aliased 'Chart::Plotly::Trace::Scattergl';

my $big_array = [ 1 .. 10000 ];
my $scattergl = Scattergl->new( x => $big_array, y => [ map { rand 100 } @$big_array ] );

HTML::Show::show( Chart::Plotly::render_full_html( data => [$scattergl] ) );

