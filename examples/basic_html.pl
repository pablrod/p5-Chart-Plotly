use Chart::Plotly 'html_plot';

my $data = { x    => [ 1 .. 10 ],
             type => 'bar'
};
$data->{'y'} = [ 1 .. 10 ];

open my $fh, '>', 'bar.html';
print $fh html_plot([$data]);
close $fh
