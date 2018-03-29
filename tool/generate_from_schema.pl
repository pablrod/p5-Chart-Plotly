#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use Getopt::Long::Descriptive;
use Const::Fast;
use Path::Tiny;
use Text::Template;
use JSON;
use Cwd;
use Data::Dump;
use Data::Dumper;

const my $common_attributes => {name => {valType => 'string', description => 'Sets the trace name'}};
my $generate_attribute_class_name = sub {
	my $parent_name = shift();
	my $attribute_name = shift();
	return 'Chart::Plotly::Trace::' . ucfirst($parent_name) . '::Attribute::' . ucfirst($attribute_name);
};
my $moose_type_for = {any => 'Any', number => 'Num', string => 'Str', boolean => 'Bool'};
my $subclasses = {};
my $template = path("template/trace.tmpl")->slurp_utf8();
my $type_template = path("template/type.tmpl")->slurp_utf8();
my $plotly_js_dist_path = path("../plotly.js/dist");
my $current_dir = cwd;

my $plotly_schema = from_json($plotly_js_dist_path->child('plot-schema.json')->slurp_utf8());
#print join ("\n", sort keys %{$plotly_schema->{'traces'}{'scatter'}{'attributes'}});

my $traces_schema = $plotly_schema->{'traces'};

for my $trace_name (sort keys %$traces_schema) {
    my $trace_schema = $traces_schema->{$trace_name};
    GeneratePerlClass($trace_schema, $trace_name);
}
for my $trace_name (sort keys %$subclasses) {
    my $trace_attributes = $subclasses->{$trace_name};
    for my $trace_attribute_name (sort keys %$trace_attributes) {
        my $attribute_schema = $trace_attributes->{$trace_attribute_name};
        GeneratePerlClass($attribute_schema, $trace_attribute_name, $trace_name );
    }
}

#print Dumper( $subclasses );

sub GeneratePerlClass {
			my $contents = shift();
			my $trace_name = shift();
			my $subclass_type = shift();
			my $class_name = ucfirst $trace_name;
            my $file_contents = "";
	        my @type_constraints;
			my $render_field = sub {
				my $field = shift();
				my $value = shift();
				my $trace_name = shift();
				if ($field eq "_deprecated") {
					return;
				}
				my $is_a_subclass = 1;
				if (ref $value eq 'HASH') {
                    if (exists $value->{'role'} && $value->{'role'} eq "object" ) {
                        $is_a_subclass = 1;
                    } else {
                        $is_a_subclass = 0;
                    }
				} else {
					$is_a_subclass = 0;
				}
				if ($is_a_subclass) {
					$subclasses->{$trace_name}{$field} = $value;
				} 
				$file_contents .= "=item * " . $field . "\n";
				if (ref $value eq 'HASH' && defined $value->{'description'}) {
                    my $description = $value->{'description'};
                    $description =~ s/M<(.+?)>/$1/g;
					$file_contents .= "\n". $description;
				}
				$file_contents .= "\n\n=cut\n\n";
                		$file_contents .= "has $field => (\n    is => 'rw',";
				if ($is_a_subclass) {
					my $class_name = $generate_attribute_class_name->($trace_name, $field);
					push @type_constraints, $class_name;
					$file_contents .= "\n    isa => " . Data::Dump::quote("Maybe[HashRef]|" . $class_name );
				} else {
				if (ref $value eq 'HASH' && defined $value->{'valType'}) {
					my $plotly_val_type = $value->{'valType'};
					my $moose_type = $moose_type_for->{$plotly_val_type};
					if (defined $moose_type) {
                            if ($field eq 'text') {
                                $moose_type = 'Maybe[ArrayRef]|' . $moose_type;
                            }
                			$file_contents .= "\n    isa => ". Data::Dump::quote($moose_type) . ",";
					}
				}
				if (ref $value eq 'HASH' && defined $value->{'description'}) {
                    my $description = $value->{'description'};
                    $description =~ s/M<(.+?)>/$1/g;
					$file_contents .= "\n    documentation => " . Data::Dump::quote($description) . ",";
				}
				}
				$file_contents .= "\n);\n\n";
			};
            my $attributes_contents = $contents->{'attributes'};
            if (defined $subclass_type) {
                $attributes_contents = $contents;
            }
			for my $field (sort keys %$attributes_contents) {
				my $value = $attributes_contents->{$field};
				$render_field->($field, $value, $trace_name);
            }
			for my $field (sort keys %$common_attributes) {
				my $value = $common_attributes->{$field};
				$render_field->($field, $value, $trace_name);
            }

        $file_contents .= "=pod\n\n=back\n\n=cut\n\n";
	    if (!defined $subclass_type) {
		$file_contents .= $type_template;
	    }
            $file_contents .= "\n__PACKAGE__->meta->make_immutable();\n";
            $file_contents .= "1;\n";
	    my $used_modules = "";
	    for my $type_constraint (@type_constraints) {
		$used_modules .= "use $type_constraint;\n";
	    }
	    my $header =
              Text::Template::fill_in_string( $template, HASH => { package_name => 'Chart::Plotly::Trace::' . (defined $subclass_type ? join("::", ucfirst($subclass_type), 'Attribute', $class_name) : $class_name ), trace_name => $trace_name, used_modules => $used_modules,
(
    defined $contents->{'meta'}{'description'} ? 
        (description => $contents->{'meta'}{'description'})
    :
    ()

) } ); 
	    $file_contents = $header . $file_contents;
			chdir $current_dir;
            my $file_path = path('lib/Chart/Plotly/Trace');
            if (defined $subclass_type) {
                $file_path = $file_path->child(ucfirst($subclass_type))->child('Attribute');
                $file_path->mkpath();
            }
			$file_path->child($class_name . ".pm")->spew_utf8($file_contents); 
}
