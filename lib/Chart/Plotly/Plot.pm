package Chart::Plotly::Plot;

use Moose;
use utf8;

use UUID::Tiny ':std';

# VERSION

use Chart::Plotly;

=encoding utf-8

=head1 NAME

Chart::Plotly::Plot - Set of traces with their options and data

=head1 SYNOPSIS

# EXAMPLE: examples/plot_object.pl
     
=head1 DESCRIPTION

Represent a full plot composed of one or more traces (Chart::Plotly::Trace::*)

=head1 METHODS

=cut

has traces => (
    traits  => ['Array'],
    is      => 'rw',
    isa     => 'ArrayRef',
    default => sub { [] },
    handles => {
        add_trace    => 'push',
        get_trace    => 'get',
        insert_trace => 'insert',
        delete_trace => 'delete'
    }
);

has layout => (
   is => 'rw',
   isa => 'HashRef'
);

=head2 html

Returns the html corresponding to the plot

=head3 Parameters



=cut

sub html {
    my $self     = shift;
    my %params   = @_;
    my $chart_id = $params{'div_id'} // create_uuid_as_string(UUID_TIME);
    my $load_plotly_using_script_tag = $params{'load_plotly_using_script_tag'} // 1;
    my $layout = $self->layout;
    if (defined $layout) {
	$layout = Chart::Plotly::_process_data( $layout );
    }
    return Chart::Plotly::_render_cell(
        Chart::Plotly::_process_data( $self->traces() ), $chart_id, $layout, {load_plotly_using_script_tag => $load_plotly_using_script_tag});
}

1;

__END__

=head1 AUTHOR

Pablo Rodríguez González

=head1 BUGS

Please report any bugs or feature requests via github: L<https://github.com/pablrod/p5-Chart-Plotly/issues>

=head1 DISCLAIMER

This is an unofficial Plotly Perl module. Currently I'm not affiliated in any way with Plotly. 
But I think plotly.js is a great library and I want to use it with perl.

If you like plotly.js please consider supporting them purchasing a pro subscription: L<https://plot.ly/products/cloud/>

=head1 LICENSE AND COPYRIGHT

Copyright 2016 Pablo Rodríguez González.

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut

