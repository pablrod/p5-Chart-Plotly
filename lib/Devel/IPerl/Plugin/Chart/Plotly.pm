package Devel::IPerl::Plugin::Chart::Plotly;

use 5.022001;

use strict;
use warnings;
use utf8;

use English qw(-no_match_vars);
use Const::Fast;
use namespace::autoclean;


# VERSION

# ABSTRACT: Inline display of plotly charts in Jupyter notebooks using L<Devel::IPerl> kernel


=encoding utf8

=head1 SYNOPSIS

    # In notebook
    IPerl->load_plugin('Chart::Plotly');

    use Chart::Plotly::Trace::Scatter;
    use Chart::Plotly::Plot;
    my $scatter_trace = Chart::Plotly::Trace::Scatter->new( x => [ 1 .. 5 ], y => [ 1 .. 5 ] );
    my $plot = Chart::Plotly::Plot->new(traces => [$scatter_trace]);

=head1 DESCRIPTION

Plugin to display automatically L<Chart::Plotly> plot objects in Jupyter notebooks using kernel L<Devel::IPerl>

=head1 INSTANCE METHODS

=cut

=head2 register

This method is called automatically by L<Devel::IPerl>. You only need to load the plugin:

    IPerl->load_plugin('Chart::Plotly');

=cut

sub register {
	# only works registering the plugin for each notebook
	require Chart::Plotly::Plot;
	require Role::Tiny;

	Role::Tiny->apply_roles_to_package( 'Chart::Plotly::Plot', q(Devel::IPerl::Plugin::Chart::Plotly::Plot::IPerlRole) );
}


{
package
	Devel::IPerl::Plugin::Chart::Plotly::Plot::IPerlRole;

use Moo::Role;

use Devel::IPerl::Display::HTML;

sub iperl_data_representations {
	my ($plot) = @_;
    my $require_plotly = '
<script>
            if(!window.Plotly) {
                requirejs.config({
                    paths: { 
                    \'plotly\': [\'https://cdn.plot.ly/plotly-latest.min\']},
                });
                window.Plotly = {
                    "plot" : function(div, data, layout) {
                    require([\'plotly\'],
                    function(plotly) {window.Plotly=plotly;
                        Plotly.plot(div, data, layout);
                        });
                    }
                }
            }
</script>
';
    Devel::IPerl::Display::HTML->new($require_plotly . $plot->html)->iperl_data_representations;
}

}

=head1 CLASS METHODS

=cut

1; 

