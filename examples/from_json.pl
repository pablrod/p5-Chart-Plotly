#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use Chart::Plotly;
use Chart::Plotly::Plot;

my $json = '
{
    "data": [{
         "type": "scatter",
         "x": [1, 2, 3],
         "y": [1, 2, 3]
        }],
 "layout": {
        "title": {
                "text": "sample title"
            }
        },
 "config": {
         "responsive": true,
         "displayModeBar": false 
        }
}
';

my $plot = Chart::Plotly::Plot->from_json($json);

# print Chart::Plotly::render_full_html(data => $plot);

Chart::Plotly::show_plot($plot);

# Another plot loading the json from github url

use LWP::Simple;

my $volume_json = get('https://raw.githubusercontent.com/plotly/plotly.js/e23b2c39173f215438198bdcd5ad4d9395626237/test/image/mocks/gl3d_volume_airflow.json');

my $plot_from_remote_json = Chart::Plotly::Plot->from_json($volume_json);

Chart::Plotly::show_plot($plot_from_remote_json);

