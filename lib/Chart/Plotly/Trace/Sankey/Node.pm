package Chart::Plotly::Trace::Sankey::Node;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Sankey::Node::Hoverlabel;
use Chart::Plotly::Trace::Sankey::Node::Line;


# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace sankey.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/sankey.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace sankey.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#sankey>

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

=item * color

Sets the `node` color. It can be a single value, or an array for specifying color for each `node`. If `node.color` is omitted, then the default `Plotly` color palette will be cycled through to have a variety of colors. These defaults are not fully opaque, to allow some visibility of what is beneath the node.

=cut

has color => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets the `node` color. It can be a single value, or an array for specifying color for each `node`. If `node.color` is omitted, then the default `Plotly` color palette will be cycled through to have a variety of colors. These defaults are not fully opaque, to allow some visibility of what is beneath the node.",
);

=item * colorsrc

Sets the source reference on Chart Studio Cloud for `color`.

=cut

has colorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `color`.",
);

=item * customdata

Assigns extra data to each node.

=cut

has customdata => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Assigns extra data to each node.",
);

=item * customdatasrc

Sets the source reference on Chart Studio Cloud for `customdata`.

=cut

has customdatasrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `customdata`.",
);

=item * description


=cut

has description => (
    is => "ro",
    default => "The nodes of the Sankey plot.",
);

=item * groups

Groups of nodes. Each group is defined by an array with the indices of the nodes it contains. Multiple groups can be specified.

=cut

has groups => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Groups of nodes. Each group is defined by an array with the indices of the nodes it contains. Multiple groups can be specified.",
);

=item * hoverinfo

Determines which trace information appear when hovering nodes. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.

=cut

has hoverinfo => (
    is => "rw",
    isa => enum(["all","none","skip"]),
    documentation => "Determines which trace information appear when hovering nodes. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.",
);

=item * hoverlabel


=cut

has hoverlabel => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Sankey::Node::Hoverlabel",
);

=item * hovertemplate

Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example "y: %{y}" as well as %{xother}, {%_xother}, {%_xother_}, {%xother_}. When showing info for several points, *xother* will be added to those with different x positions from the first point. An underscore before or after *(x|y)other* will add a space on that side, only when this field is shown. Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plotly.com/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `value` and `label`. Anything contained in tag `<extra>` is displayed in the secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag `<extra></extra>`.

=cut

has hovertemplate => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example \"y: %{y}\" as well as %{xother}, {%_xother}, {%_xother_}, {%xother_}. When showing info for several points, *xother* will be added to those with different x positions from the first point. An underscore before or after *(x|y)other* will add a space on that side, only when this field is shown. Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example \"Price: %{y:\$.2f}\". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example \"Day: %{2019-01-01|%A}\". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plotly.com/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `value` and `label`. Anything contained in tag `<extra>` is displayed in the secondary box, for example \"<extra>{fullData.name}</extra>\". To hide the secondary box completely, use an empty tag `<extra></extra>`.",
);

=item * hovertemplatesrc

Sets the source reference on Chart Studio Cloud for `hovertemplate`.

=cut

has hovertemplatesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `hovertemplate`.",
);

=item * label

The shown name of the node.

=cut

has label => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "The shown name of the node.",
);

=item * labelsrc

Sets the source reference on Chart Studio Cloud for `label`.

=cut

has labelsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `label`.",
);

=item * line


=cut

has line => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Sankey::Node::Line",
);

=item * pad

Sets the padding (in px) between the `nodes`.

=cut

has pad => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the padding (in px) between the `nodes`.",
);

=item * thickness

Sets the thickness (in px) of the `nodes`.

=cut

has thickness => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the thickness (in px) of the `nodes`.",
);

=item * x

The normalized horizontal position of the node.

=cut

has x => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "The normalized horizontal position of the node.",
);

=item * xsrc

Sets the source reference on Chart Studio Cloud for `x`.

=cut

has xsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `x`.",
);

=item * y

The normalized vertical position of the node.

=cut

has y => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "The normalized vertical position of the node.",
);

=item * ysrc

Sets the source reference on Chart Studio Cloud for `y`.

=cut

has ysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `y`.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
