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
use HTML::Show;

# VERSION

=encoding utf-8

=head1 NAME

Chart::Plotly - Generate html/javascript charts from perl data using javascript library plotly.js

=head1 SYNOPSIS

# EXAMPLE: examples/basic.pl

# EXAMPLE: examples/pdl.pl
     
=head1 DESCRIPTION

Generate html/javascript charts from perl data using javascript library plotly.js. The result
is a file that you could see in your favourite browser.

The interface is "sub" oriented, but the API is subject to changes.

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
    my %params = validate( @_,
                           {  data    => { type => ARRAYREF | OBJECT },
                           }
    );

    my $template = <<'DYGRAPH_TEMPLATE';
<html>
<head>
<script src="https://cdn.plot.ly/plotly-1.17.3.min.js"></script>
</head>
<body>
<div id="plotly_graph"></div>
<script>
Plotly.plot(document.getElementById('plotly_graph'),{$data});
</script>
</body>
</html>
DYGRAPH_TEMPLATE

    my $json_formatter = JSON->new->utf8->allow_blessed(1)->convert_blessed(1);
	local *PDL::TO_JSON = sub {$_[0]->unpdl};
    my $data = $params{'data'};
    my $ref = ref $data;
    if ($ref ne 'ARRAY') {
	my $adapter_name = 'Chart::Plotly::Adapter::' . $ref;
	eval {
		load $adapter_name;
		my $adapter = $adapter_name->new(data => $data);
		$data = $adapter->traces();
	};
	if ($@) {
		warn 'Cannot load adapter: ' . $adapter_name . '. ' . $@;
	}
    }
    my $data_string = $json_formatter->encode( $data );
    my $template_variables = {
                           data => $data_string,
    };

    return Text::Template::fill_in_string( $template, HASH => $template_variables );
}

=head2 show_plot

=head3 Parameters

Data to be represented. The format is the same as the parameter data in render_full_html

=cut


sub show_plot {
	my $data = shift;
	HTML::Show::show(render_full_html(data => $data));		
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

