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

my $plotly_js_src_path = path("../plotly.js/src");
my $plotly_traces_path = $plotly_js_src_path->child('traces');
my $current_dir = cwd;
my $script_name_aux_dumper = "dump.js";
path('tool', $script_name_aux_dumper)->copy($plotly_js_src_path);


const my $common_attributes => {name => {valType => 'string', description => 'Sets the trace name'}};
const my $subplot_attributes => {scatter => {
		xaxis => {valType => 'string', description => 'Sets a reference between this trace\'s x coordinates and a 2D cartesian x axis. If "x" (the default value), the x coordinates refer to `layout.xaxis`. If "x2", the x coordinates refer to `layout.xaxis2`, and so on. '},
		yaxis => {valType => 'string', description => 'Sets a reference between this trace\'s y coordinates and a 2D cartesian y axis. If "y" (the default value), the y coordinates refer to `layout.yaxis`. If "y2", the y coordinates refer to `layout.yaxis2`, and so on. '},
		}};
my $moose_type_for = {any => 'Any', number => 'Num', string => 'Str', boolean => 'Bool'};
my $subclasses = {};

my $generate_attribute_class_name = sub {
	my $attribute_name = shift();
	return 'Chart::Plotly::Trace::Attribute::' . ucfirst($attribute_name);
};

my $template = <<'TEMPLATE';
package {$package_name};
use Moose;

{$used_modules}

# VERSION

=encoding utf-8

=head1 NAME 

{$package_name}

=head1 SYNOPSIS

	use HTML::Show;
	use Chart::Plotly;
	use {$package_name};
	my ${$trace_name} = {$package_name}->new(x => [1 .. 5], y => [1 .. 5]);
	
	HTML::Show::show(Chart::Plotly::render_full_html(data => [${$trace_name}]));


=head1 DESCRIPTION

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#{$trace_name}>

=head1 DISCLAIMER

This is an unofficial Plotly Perl module. Currently I'm not affiliated in any way with Plotly. 
But I think plotly.js is a great library and I want to use it with perl.

=head1 METHODS

=cut

=head2 TO_JSON

Serialize the trace to JSON. This method should be called only by L<JSON> serializer.

=cut

sub TO_JSON \{
	my $self = shift; 
	my %hash = %$self; 
	if ($self->can('type') && (!defined $hash\{'type'\})) \{
		$hash\{type\} = $self->type();
	\}
	return \%hash;
\}

{$type_method}

=head1 ATTRIBUTES

=over

=cut

TEMPLATE

my $type_template = <<'TYPE_TEMPLATE';

=head2 type

Trace type.

=cut

sub type {
	my @components = split(/::/, __PACKAGE__);
	return lc($components[-1]);
}

TYPE_TEMPLATE

my $render_class = sub {
			my $contents = shift();
			my $trace_name = shift();
			my $subclass_type = shift();
			my $class_name = ucfirst $trace_name;
            my $file_contents = "";
	    my @type_constraints;
			my $render_field = sub {
				my $field = shift();
				my $value = shift();
				if ($field eq "_deprecated") {
					return;
				}
				my $is_a_subclass = 1;
				if (ref $value eq 'HASH') {
					for my $subvalue (values %$value) {
						if (ref $subvalue ne 'HASH') {
							$is_a_subclass = 0;
							last;
						}
					}
                    if ($field eq 'x' || $field eq 'y' || $field eq 'z') {
                        $is_a_subclass = 0;
                    } 
				} else {
					$is_a_subclass = 0;
				}
				if ($is_a_subclass) {
					$subclasses->{$field} = $value;
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
					my $class_name = $generate_attribute_class_name->($field);
					push @type_constraints, $class_name;
					$file_contents .= "\n    isa => " . Data::Dump::quote("Maybe[HashRef]|" . $class_name );
				} else {
				if (ref $value eq 'HASH' && defined $value->{'valType'}) {
					my $plotly_val_type = $value->{'valType'};
					my $moose_type = $moose_type_for->{$plotly_val_type};
					if (defined $moose_type) {
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
			for my $field (sort keys %$contents) {
				my $value = $contents->{$field};
				$render_field->($field, $value);
            }
			for my $field (sort keys %$common_attributes) {
				my $value = $common_attributes->{$field};
				$render_field->($field, $value);
            }

			if (exists $subplot_attributes->{$trace_name}) {
				my $trace_subplot_attributes = $subplot_attributes->{$trace_name};
				for my $field (sort keys %$trace_subplot_attributes) {
					my $value = $trace_subplot_attributes->{$field};
					$render_field->($field, $value);
            	}
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
              Text::Template::fill_in_string( $template, HASH => { package_name => 'Chart::Plotly::Trace::' . (defined $subclass_type ? join("::", $subclass_type, $class_name) : $class_name ), trace_name => $trace_name, used_modules => $used_modules } ); 
	    $file_contents = $header . $file_contents;
			chdir $current_dir;
			path('lib/Chart/Plotly/Trace/' . ( defined $subclass_type ? join("/", $subclass_type, $class_name) : $class_name ) . ".pm")->spew_utf8($file_contents); 
};

for my $plotly_trace ( $plotly_traces_path->children() ) {
	my $trace_name = $plotly_trace->basename;
    my $attributes_file = $plotly_trace->child('attributes.js');
    if ( $attributes_file->exists() ) {
		chdir $plotly_js_src_path->parent();
		my $result = `node src/$script_name_aux_dumper $trace_name`;
            if ($@) {
                warn $trace_name . " can't be processed: $@\n";
				use Data::Dumper;
				print Dumper($result);
				die;
                next;
            }
			my $contents = from_json($result);
			$render_class->($contents, $trace_name);
        }
}

for my $attribute (keys %$subclasses) {
	my $fields = $subclasses->{$attribute};
	$render_class->($fields, $attribute, "Attribute");
}

