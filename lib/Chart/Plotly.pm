package Chart::Plotly;

use strict;
use warnings;
use utf8;

use Exporter 'import';
use vars qw(@EXPORT_OK);
@EXPORT_OK = qw(show_plot);

use JSON;
use Params::Validate qw(:all);
use Text::Template;
use Module::Load;
use Ref::Util;
use HTML::Show;

# VERSION

# ABSTRACT: Generate html/javascript charts from perl data using javascript library plotly.js

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/basic.pl

# EXAMPLE: examples/pdl.pl
     
=head1 DESCRIPTION

Generate html/javascript charts from perl data using javascript library plotly.js. The result
is a file that you could see in your favourite browser.

Example screenshot of plot generated with examples/anscombe.pl:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/anscombe.png" alt="Anscombe's quartet plotted with plotly">
</p>

=end HTML

=begin markdown

![Anscombe's quartet plotted with plotly](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/anscombe.png)

=end markdown

The API is subject to changes.

=head1 FUNCTIONS

=cut

=head2 render_full_html

=head3 Parameters

=over

=item * data:

Data to be represented. It could be:

=over

=item Perl data structure of the json expected by plotly.js: L<http://plot.ly/javascript/reference/> (this data would be serialized to JSON)

=item Array ref of objects of type Chart::Plotly::Trace::*

=item Anything that could be serialized to JSON with the json expected by plotly.js

=item Object that could be adapted using Chart::Plotly::Adapter::*

=back

=back

=cut

sub render_full_html {
    my %params = validate( @_, { data => { type => ARRAYREF | OBJECT }, } );

	my $data = $params{'data'};
    my $chart_id = 'plotly_graph';
    my $html;
    if ( Ref::Util::is_blessed_ref($data) && $data->isa('Chart::Plotly::Plot') ) {
        $html = _render_html_wrap( $data->html( div_id => $chart_id ) );
    } else {
        $html = _render_html_wrap( _render_cell( _process_data( $data ), $chart_id ) );
    }
    return $html;
}

sub _render_html_wrap {
    my $body       = shift;
    my $html_begin = <<'HTML_BEGIN';
<html>
<head>
</head>
<body>
HTML_BEGIN
    my $html_end = <<'HTML_END';
</body>
</html>
HTML_END
    return $html_begin . $body . $html_end;
}

sub _render_cell {
    my $data_string = shift();
    my $chart_id    = shift();
    my $layout      = shift();
    if (defined $layout) {
	$layout = "," . $layout; 	
    }	
    my $template    = <<'TEMPLATE';
<div id="{$chart_id}"></div>
<script src="https://cdn.plot.ly/plotly-1.20.5.min.js"></script>
<script>
Plotly.plot(document.getElementById('{$chart_id}'),{$data} {$layout});
</script>
TEMPLATE

    my $template_variables = { data     => $data_string,
                               chart_id => $chart_id,
			       defined $layout ? (layout   => $layout) : ()
    };
    return Text::Template::fill_in_string( $template, HASH => $template_variables );
}

sub _process_data {
    my $data           = shift;
    my $json_formatter = JSON->new->utf8->allow_blessed(1)->convert_blessed(1);
    local *PDL::TO_JSON = sub { $_[0]->unpdl };
    if ( Ref::Util::is_blessed_ref($data) ) {
        my $adapter_name = 'Chart::Plotly::Adapter::' . ref $data;
        eval {
            load $adapter_name;
            my $adapter = $adapter_name->new( data => $data );
            $data = $adapter->traces();
        };
        if ($@) {
            warn 'Cannot load adapter: ' . $adapter_name . '. ' . $@;
        }
    }
    my $data_string = $json_formatter->encode($data);
    return $data_string;
}

=head2 show_plot

Opens the plot in a browser locally

=head3 Parameters

Data to be represented. The format is the same as the parameter data in render_full_html

=cut

sub show_plot {
    my @data_to_plot = @_;

    my $rendered_cells = "";
    my $numeric_id     = 0;
    for my $data (@data_to_plot) {
        my $id = 'chart_' . $numeric_id++;
        if ( Ref::Util::is_blessed_ref($data) && $data->isa('Chart::Plotly::Plot') ) {
            $rendered_cells .= $data->html( div_id => $id );
        } else {
            $rendered_cells .= _render_cell( _process_data($data), $id );
        }
    }
    my $plot = _render_html_wrap($rendered_cells);
    HTML::Show::show($plot);
}

1;

__END__

=head1 BUGS

Please report any bugs or feature requests via github: L<https://github.com/pablrod/p5-Chart-Plotly/issues>

=head1 DISCLAIMER

This is an unofficial Plotly Perl module. Currently I'm not affiliated in any way with Plotly. 
But I think plotly.js is a great library and I want to use it with perl.

If you like plotly.js please consider supporting them purchasing a pro subscription: L<https://plot.ly/products/cloud/>

=cut

