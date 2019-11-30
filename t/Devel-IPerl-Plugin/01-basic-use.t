
use strict;
use warnings;

use Test::More;

eval 'use Devel::IPerl';
plan skip_all => 'Devel::IPerl not installed' if $@;

use Devel::IPerl::Plugin::Chart::Plotly;

Devel::IPerl::Plugin::Chart::Plotly->register();

ok(Chart::Plotly::Plot->can('iperl_data_representations'));
ok(Chart::Plotly::Trace::Scatter->can('iperl_data_representations'));
done_testing();


