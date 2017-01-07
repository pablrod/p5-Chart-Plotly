package Chart::Plotly::Adapter;

use strict;
use warnings;
use utf8;

use Moose;

use overload q{""} => 'stringify';

# VERSION

=encoding utf-8

=head1 NAME

Chart::Plotly::Adapter - Adapts diferent objects to plot with Chart::Plotly

=head1 SYNOPSIS

# EXAMPLE: examples/plot.pl

=head1 DESCRIPTION

Adapts diferent objects to be plotted with Chart::Plotly.

This class simply dispatchs to the appropiate object using the type of the object.
For example, in order to plot a Data::Table, this delegates to Chart::Plotly::Adapter::Data::Table

=head1 METHODS

=cut

=head2 stringify

=head3 Parameters

=over

=item * data:

Data to be represented. It could be:

=over

=item Perl data structure of the json expected by plotly.js: L<http://plot.ly/javascript/reference/> (this data would be serialized to JSON)

=item Array ref of objects of type Chart::Plotly::Trace::*

=item Anything that could be serialized to JSON with the json expected by plotly.js

=back

=back

=cut

sub stringify {
    my $self = shift();
    return Chart::Plotly::render_full_html(data => $self->data);
}

has data => (
    is => 'ro'
);

1;

__END__

=head1 AUTHOR

Pablo Rodríguez González

=head1 BUGS

Please report any bugs or feature requests via github: L<https://github.com/pablrod/p5-Chart-Plotly/issues>

=head1 LICENSE AND COPYRIGHT

Copyright 2016 Pablo Rodríguez González.

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut

