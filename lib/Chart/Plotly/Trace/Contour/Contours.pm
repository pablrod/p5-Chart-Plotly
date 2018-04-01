package Chart::Plotly::Trace::Contour::Contours;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Contour::Contours::ImpliedEdits;
use Chart::Plotly::Trace::Contour::Contours::Labelfont;


# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace contour.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/contour.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace contour.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#contour>

=head1 DISCLAIMER

This is an unofficial Plotly Perl module. Currently I'm not affiliated in any way with Plotly. 
But I think plotly.js is a great library and I want to use it with perl.

=head1 METHODS

=cut

=head2 TO_JSON

Serialize the trace to JSON. This method should be called only by L<JSON> serializer.

=cut

sub TO_JSON {
    my $self = shift; 
    my $extra_args = $self->extra_args // {};
    my $meta = $self->meta;
    my %hash = %$self;
    for my $name (sort keys %hash) {
        my $attr = $meta->get_attribute($name);
        if (defined $attr) {
            my $value = $hash{$name};
            my $type = $attr->type_constraint;
            if ($type && $type->equals('Bool')) {
                $hash{$name} = $value ? \1 : \ 0;
            }
        }
    }
    %hash = (%hash, %$extra_args);
    delete $hash{'extra_args'};
    if ($self->can('type') && (!defined $hash{'type'})) {
        $hash{type} = $self->type();
    }
    return \%hash;
}

=head1 ATTRIBUTES

=over

=cut

=item * coloring

Determines the coloring method showing the contour values. If *fill*, coloring is done evenly between each contour level If *heatmap*, a heatmap gradient coloring is applied between each contour level. If *lines*, coloring is done on the contour lines. If *none*, no coloring is applied on this trace.

=cut

has coloring => (
    is => "rw",
    isa => enum(["fill","heatmap","lines","none"]),
    documentation => "Determines the coloring method showing the contour values. If *fill*, coloring is done evenly between each contour level If *heatmap*, a heatmap gradient coloring is applied between each contour level. If *lines*, coloring is done on the contour lines. If *none*, no coloring is applied on this trace.",
);

=item * end

Sets the end contour level value. Must be more than `contours.start`

=cut

has end => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the end contour level value. Must be more than `contours.start`",
);

=item * impliedEdits


=cut

has impliedEdits => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Contour::Contours::ImpliedEdits",
);

=item * labelfont


=cut

has labelfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Contour::Contours::Labelfont",
);

=item * labelformat

Sets the contour label formatting rule using d3 formatting mini-language which is very similar to Python, see: https://github.com/d3/d3-format/blob/master/README.md#locale_format.

=cut

has labelformat => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the contour label formatting rule using d3 formatting mini-language which is very similar to Python, see: https://github.com/d3/d3-format/blob/master/README.md#locale_format.",
);

=item * operation

Sets the constraint operation. *=* keeps regions equal to `value` *<* and *<=* keep regions less than `value` *>* and *>=* keep regions greater than `value` *[]*, *()*, *[)*, and *(]* keep regions inside `value[0]` to `value[1]` *][*, *)(*, *](*, *)[* keep regions outside `value[0]` to value[1]` Open vs. closed intervals make no difference to constraint display, but all versions are allowed for consistency with filter transforms.

=cut

has operation => (
    is => "rw",
    isa => enum(["=","<",">=",">","<=","[]","()","[)","(]","][",")(","](",")["]),
    documentation => "Sets the constraint operation. *=* keeps regions equal to `value` *<* and *<=* keep regions less than `value` *>* and *>=* keep regions greater than `value` *[]*, *()*, *[)*, and *(]* keep regions inside `value[0]` to `value[1]` *][*, *)(*, *](*, *)[* keep regions outside `value[0]` to value[1]` Open vs. closed intervals make no difference to constraint display, but all versions are allowed for consistency with filter transforms.",
);

=item * showlabels

Determines whether to label the contour lines with their values.

=cut

has showlabels => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether to label the contour lines with their values.",
);

=item * showlines

Determines whether or not the contour lines are drawn. Has an effect only if `contours.coloring` is set to *fill*.

=cut

has showlines => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not the contour lines are drawn. Has an effect only if `contours.coloring` is set to *fill*.",
);

=item * size

Sets the step between each contour level. Must be positive.

=cut

has size => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the step between each contour level. Must be positive.",
);

=item * start

Sets the starting contour level value. Must be less than `contours.end`

=cut

has start => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the starting contour level value. Must be less than `contours.end`",
);

=item * value

Sets the value or values of the constraint boundary. When `operation` is set to one of the comparison values (=,<,>=,>,<=) *value* is expected to be a number. When `operation` is set to one of the interval values ([],(),[),(],][,)(,](,)[) *value* is expected to be an array of two numbers where the first is the lower bound and the second is the upper bound.

=cut

has value => (
    is => "rw",
    isa => "Any",
    documentation => "Sets the value or values of the constraint boundary. When `operation` is set to one of the comparison values (=,<,>=,>,<=) *value* is expected to be a number. When `operation` is set to one of the interval values ([],(),[),(],][,)(,](,)[) *value* is expected to be an array of two numbers where the first is the lower bound and the second is the upper bound.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
