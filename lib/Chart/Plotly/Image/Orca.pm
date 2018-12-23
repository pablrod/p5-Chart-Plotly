package Chart::Plotly::Image::Orca;

use Moose;
use File::Which;
use utf8;

# VERSION

my $ORCA_COMMAND = 'orca';

=encoding utf-8

=head1 NAME

Chart::Plotly::Image::Orca - Export static images of Plotly charts using orca

=head1 SYNOPSIS

# EXAMPLE: examples/orca.pl
     
=head1 DESCRIPTION

This module generate static images of Plotly charts without a browser using
L<Orca|https://github.com/plotly/orca>

Orca is an L<Electron|https://electronjs.org/> app that must be installed before
using this module. See L<https://github.com/plotly/orca#installation>

=head1 METHODS

=cut

=head2 orca

Export L<Chart::Plotly::Plot> as a static image file

=over 4

=item plot

Object to export

=item file

Filename (with or without path) to export

=back

=cut

sub orca {
    my %params = @_;

    # TODO we should check for plotly command (orca is also a screen reader: https://help.gnome.org/users/orca/stable/)
    if (which($ORCA_COMMAND)) {
        my $plot = $params{plot};
        my @orca_line = ($ORCA_COMMAND, 'graph', "'" . $plot->TO_JSON . "'", '-o', $params{file});
        my $orca_line = join(" ", @orca_line);
        system ($orca_line);
    } else {
        warn "Orca tool must be installed and in PATH in order to export images";
    }
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

Copyright 2018 Pablo Rodríguez González.

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut

