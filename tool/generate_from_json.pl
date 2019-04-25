#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use JSON;
use Path::Tiny;
use Text::Template;
use Data::Dumper;

my $trace_name = shift;

my $example_template = path("template/example_template.tmpl")->slurp_utf8();
my $plotly_js_path = path("../plotly.js");
my $plotly_mocks = $plotly_js_path->child("test/image/mocks");

for my $mock_json ($plotly_mocks->children(qr/.*\Q$trace_name\E\.json$/)) {
    print "Processing: $mock_json ...";
    my $chart_struct = from_json($mock_json->slurp_utf8);

    my $file = path($mock_json->basename('.json') . ".pl");

    my $data = $chart_struct->{data};

    local $Data::Dumper::Terse = 1;

    my %traces_packages;
    my @traces_declarations;
    my $list_of_traces = '';
    my $trace_counter = 1;
    for my $trace (@{$data}) {
        my $type = delete $trace->{type};
        if (not defined $type) {
            $type = 'scatter';
        }
        $traces_packages{$type} = 'use Chart::Plotly::Trace::' . ucfirst($type) . ";";
        my $trace_content = Dumper($trace);
        if ($trace_content =~ /{(.+)}/ms) {
            $trace_content = $1;
        }
        my $trace_name = '$trace' . $trace_counter;
        push @traces_declarations, 'my ' . $trace_name . ' = ' .
            'Chart::Plotly::Trace::' . ucfirst($type) . '->new('
            . $trace_content
        . ");\n";
        $list_of_traces .= $trace_name . ", ";
        $trace_counter += 1;
    }
    
    my $layout = $chart_struct->{layout};
    if (not defined $layout) {
        $layout = {};
    }
    
    my $contents = 
        Text::Template::fill_in_string($example_template, HASH => {
            traces_packages => join("\n", values %traces_packages),
            traces_declaration => join("\n", @traces_declarations),
            list_of_traces => $list_of_traces,
            layout  => Dumper($layout)
        });
    $file->spew_utf8($contents);
    print " Done!\n";
}

