package Chart::Plotly::Trace::Bar;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Bar::Error_x;
use Chart::Plotly::Trace::Bar::Error_y;
use Chart::Plotly::Trace::Bar::Hoverlabel;
use Chart::Plotly::Trace::Bar::Insidetextfont;
use Chart::Plotly::Trace::Bar::Legendgrouptitle;
use Chart::Plotly::Trace::Bar::Marker;
use Chart::Plotly::Trace::Bar::Outsidetextfont;
use Chart::Plotly::Trace::Bar::Selected;
use Chart::Plotly::Trace::Bar::Stream;
use Chart::Plotly::Trace::Bar::Textfont;
use Chart::Plotly::Trace::Bar::Transform;
use Chart::Plotly::Trace::Bar::Unselected;


# VERSION

# ABSTRACT: The data visualized by the span of the bars is set in `y` if `orientation` is set th *v* (the default) and the labels are set in `x`. By setting `orientation` to *h*, the roles are interchanged.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/bar.pl

=head1 DESCRIPTION

The data visualized by the span of the bars is set in `y` if `orientation` is set th *v* (the default) and the labels are set in `x`. By setting `orientation` to *h*, the roles are interchanged.

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/bar.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/bar.png)

=end markdown

=begin HTML

<p>
<iframe src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/bar.html" style="border:none;" width="80%" height="520"></iframe>
</p>

=end HTML

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#bar>

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
    my $plotly_meta = delete $hash{'pmeta'};
    if (defined $plotly_meta) {
        $hash{'meta'} = $plotly_meta;
    }
    %hash = (%hash, %$extra_args);
    delete $hash{'extra_args'};
    if ($self->can('type') && (!defined $hash{'type'})) {
        $hash{type} = $self->type();
    }
    return \%hash;
}

=head2 type

Trace type.

=cut

sub type {
	my @components = split(/::/, __PACKAGE__);
	return lc($components[-1]);
}

=head1 ATTRIBUTES

=over

=cut

=item * alignmentgroup

Set several traces linked to the same position axis or matching axes to the same alignmentgroup. This controls whether bars compute their positional range dependently or independently.

=cut

has alignmentgroup => (
    is => "rw",
    isa => "Str",
    documentation => "Set several traces linked to the same position axis or matching axes to the same alignmentgroup. This controls whether bars compute their positional range dependently or independently.",
);

=item * base

Sets where the bar base is drawn (in position axis units). In *stack* or *relative* barmode, traces that set *base* will be excluded and drawn in *overlay* mode instead.

=cut

has base => (
    is => "rw",
    isa => "Any|ArrayRef[Any]",
    documentation => "Sets where the bar base is drawn (in position axis units). In *stack* or *relative* barmode, traces that set *base* will be excluded and drawn in *overlay* mode instead.",
);

=item * basesrc

Sets the source reference on Chart Studio Cloud for `base`.

=cut

has basesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `base`.",
);

=item * cliponaxis

Determines whether the text nodes are clipped about the subplot axes. To show the text nodes above axis lines and tick labels, make sure to set `xaxis.layer` and `yaxis.layer` to *below traces*.

=cut

has cliponaxis => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether the text nodes are clipped about the subplot axes. To show the text nodes above axis lines and tick labels, make sure to set `xaxis.layer` and `yaxis.layer` to *below traces*.",
);

=item * constraintext

Constrain the size of text inside or outside a bar to be no larger than the bar itself.

=cut

has constraintext => (
    is => "rw",
    isa => enum(["inside","outside","both","none"]),
    documentation => "Constrain the size of text inside or outside a bar to be no larger than the bar itself.",
);

=item * customdata

Assigns extra data each datum. This may be useful when listening to hover, click and selection events. Note that, *scatter* traces also appends customdata items in the markers DOM elements

=cut

has customdata => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Assigns extra data each datum. This may be useful when listening to hover, click and selection events. Note that, *scatter* traces also appends customdata items in the markers DOM elements",
);

=item * customdatasrc

Sets the source reference on Chart Studio Cloud for `customdata`.

=cut

has customdatasrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `customdata`.",
);

=item * dx

Sets the x coordinate step. See `x0` for more info.

=cut

has dx => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the x coordinate step. See `x0` for more info.",
);

=item * dy

Sets the y coordinate step. See `y0` for more info.

=cut

has dy => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the y coordinate step. See `y0` for more info.",
);

=item * error_x


=cut

has error_x => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Error_x",
);

=item * error_y


=cut

has error_y => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Error_y",
);

=item * hoverinfo

Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.

=cut

has hoverinfo => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.",
);

=item * hoverinfosrc

Sets the source reference on Chart Studio Cloud for `hoverinfo`.

=cut

has hoverinfosrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `hoverinfo`.",
);

=item * hoverlabel


=cut

has hoverlabel => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Hoverlabel",
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

=item * hovertext

Sets hover text elements associated with each (x,y) pair. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.

=cut

has hovertext => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets hover text elements associated with each (x,y) pair. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.",
);

=item * hovertextsrc

Sets the source reference on Chart Studio Cloud for `hovertext`.

=cut

has hovertextsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `hovertext`.",
);

=item * ids

Assigns id labels to each datum. These ids for object constancy of data points during animation. Should be an array of strings, not numbers or any other type.

=cut

has ids => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Assigns id labels to each datum. These ids for object constancy of data points during animation. Should be an array of strings, not numbers or any other type.",
);

=item * idssrc

Sets the source reference on Chart Studio Cloud for `ids`.

=cut

has idssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `ids`.",
);

=item * insidetextanchor

Determines if texts are kept at center or start/end points in `textposition` *inside* mode.

=cut

has insidetextanchor => (
    is => "rw",
    isa => enum(["end","middle","start"]),
    documentation => "Determines if texts are kept at center or start/end points in `textposition` *inside* mode.",
);

=item * insidetextfont


=cut

has insidetextfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Insidetextfont",
);

=item * legendgroup

Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.

=cut

has legendgroup => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.",
);

=item * legendgrouptitle


=cut

has legendgrouptitle => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Legendgrouptitle",
);

=item * legendrank

Sets the legend rank for this trace. Items and groups with smaller ranks are presented on top/left side while with `*reversed* `legend.traceorder` they are on bottom/right side. The default legendrank is 1000, so that you can use ranks less than 1000 to place certain items before all unranked items, and ranks greater than 1000 to go after all unranked items.

=cut

has legendrank => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the legend rank for this trace. Items and groups with smaller ranks are presented on top/left side while with `*reversed* `legend.traceorder` they are on bottom/right side. The default legendrank is 1000, so that you can use ranks less than 1000 to place certain items before all unranked items, and ranks greater than 1000 to go after all unranked items.",
);

=item * marker


=cut

has marker => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Marker",
);

=item * pmeta

Assigns extra meta information associated with this trace that can be used in various text attributes. Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text` `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the index or key of the `meta` item in question. To access trace `meta` in layout attributes, use `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.

=cut

has pmeta => (
    is => "rw",
    isa => "Any|ArrayRef[Any]",
    documentation => "Assigns extra meta information associated with this trace that can be used in various text attributes. Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text` `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the index or key of the `meta` item in question. To access trace `meta` in layout attributes, use `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.",
);

=item * metasrc

Sets the source reference on Chart Studio Cloud for `meta`.

=cut

has metasrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `meta`.",
);

=item * name

Sets the trace name. The trace name appear as the legend item and on hover.

=cut

has name => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the trace name. The trace name appear as the legend item and on hover.",
);

=item * offset

Shifts the position where the bar is drawn (in position axis units). In *group* barmode, traces that set *offset* will be excluded and drawn in *overlay* mode instead.

=cut

has offset => (
    is => "rw",
    isa => "Num|ArrayRef[Num]",
    documentation => "Shifts the position where the bar is drawn (in position axis units). In *group* barmode, traces that set *offset* will be excluded and drawn in *overlay* mode instead.",
);

=item * offsetgroup

Set several traces linked to the same position axis or matching axes to the same offsetgroup where bars of the same position coordinate will line up.

=cut

has offsetgroup => (
    is => "rw",
    isa => "Str",
    documentation => "Set several traces linked to the same position axis or matching axes to the same offsetgroup where bars of the same position coordinate will line up.",
);

=item * offsetsrc

Sets the source reference on Chart Studio Cloud for `offset`.

=cut

has offsetsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `offset`.",
);

=item * opacity

Sets the opacity of the trace.

=cut

has opacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the opacity of the trace.",
);

=item * orientation

Sets the orientation of the bars. With *v* (*h*), the value of the each bar spans along the vertical (horizontal).

=cut

has orientation => (
    is => "rw",
    isa => enum(["v","h"]),
    documentation => "Sets the orientation of the bars. With *v* (*h*), the value of the each bar spans along the vertical (horizontal).",
);

=item * outsidetextfont


=cut

has outsidetextfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Outsidetextfont",
);

=item * selected


=cut

has selected => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Selected",
);

=item * selectedpoints

Array containing integer indices of selected points. Has an effect only for traces that support selections. Note that an empty array means an empty selection where the `unselected` are turned on for all points, whereas, any other non-array values means no selection all where the `selected` and `unselected` styles have no effect.

=cut

has selectedpoints => (
    is => "rw",
    isa => "Any",
    documentation => "Array containing integer indices of selected points. Has an effect only for traces that support selections. Note that an empty array means an empty selection where the `unselected` are turned on for all points, whereas, any other non-array values means no selection all where the `selected` and `unselected` styles have no effect.",
);

=item * showlegend

Determines whether or not an item corresponding to this trace is shown in the legend.

=cut

has showlegend => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not an item corresponding to this trace is shown in the legend.",
);

=item * stream


=cut

has stream => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Stream",
);

=item * text

Sets text elements associated with each (x,y) pair. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.

=cut

has text => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets text elements associated with each (x,y) pair. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.",
);

=item * textangle

Sets the angle of the tick labels with respect to the bar. For example, a `tickangle` of -90 draws the tick labels vertically. With *auto* the texts may automatically be rotated to fit with the maximum size in bars.

=cut

has textangle => (
    is => "rw",
    documentation => "Sets the angle of the tick labels with respect to the bar. For example, a `tickangle` of -90 draws the tick labels vertically. With *auto* the texts may automatically be rotated to fit with the maximum size in bars.",
);

=item * textfont


=cut

has textfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Textfont",
);

=item * textposition

Specifies the location of the `text`. *inside* positions `text` inside, next to the bar end (rotated and scaled if needed). *outside* positions `text` outside, next to the bar end (scaled if needed), unless there is another bar stacked on this one, then the text gets pushed inside. *auto* tries to position `text` inside the bar, but if the bar is too small and no bar is stacked on this one the text is moved outside. If *none*, no text appears.

=cut

has textposition => (
    is => "rw",
    isa => union([enum(["inside","outside","auto","none"]), "ArrayRef"]),
    documentation => "Specifies the location of the `text`. *inside* positions `text` inside, next to the bar end (rotated and scaled if needed). *outside* positions `text` outside, next to the bar end (scaled if needed), unless there is another bar stacked on this one, then the text gets pushed inside. *auto* tries to position `text` inside the bar, but if the bar is too small and no bar is stacked on this one the text is moved outside. If *none*, no text appears.",
);

=item * textpositionsrc

Sets the source reference on Chart Studio Cloud for `textposition`.

=cut

has textpositionsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `textposition`.",
);

=item * textsrc

Sets the source reference on Chart Studio Cloud for `text`.

=cut

has textsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `text`.",
);

=item * texttemplate

Template string used for rendering the information text that appear on points. Note that this will override `textinfo`. Variables are inserted using %{variable}, for example "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. Every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `value` and `label`.

=cut

has texttemplate => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Template string used for rendering the information text that appear on points. Note that this will override `textinfo`. Variables are inserted using %{variable}, for example \"y: %{y}\". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example \"Price: %{y:\$.2f}\". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example \"Day: %{2019-01-01|%A}\". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. Every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `value` and `label`.",
);

=item * texttemplatesrc

Sets the source reference on Chart Studio Cloud for `texttemplate`.

=cut

has texttemplatesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `texttemplate`.",
);

=item * transforms


=cut

has transforms => (
    is => "rw",
    isa => "ArrayRef|ArrayRef[Chart::Plotly::Trace::Bar::Transform]",
);

=item * uid

Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.

=cut

has uid => (
    is => "rw",
    isa => "Str",
    documentation => "Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.",
);

=item * uirevision

Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`, `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app can add/remove traces before the end of the `data` array, such that the same trace has a different index, you can still preserve user-driven changes if you give each trace a `uid` that stays with it as it moves.

=cut

has uirevision => (
    is => "rw",
    isa => "Any",
    documentation => "Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`, `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app can add/remove traces before the end of the `data` array, such that the same trace has a different index, you can still preserve user-driven changes if you give each trace a `uid` that stays with it as it moves.",
);

=item * unselected


=cut

has unselected => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Bar::Unselected",
);

=item * visible

Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).

=cut

has visible => (
    is => "rw",
    documentation => "Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).",
);

=item * width

Sets the bar width (in position axis units).

=cut

has width => (
    is => "rw",
    isa => "Num|ArrayRef[Num]",
    documentation => "Sets the bar width (in position axis units).",
);

=item * widthsrc

Sets the source reference on Chart Studio Cloud for `width`.

=cut

has widthsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `width`.",
);

=item * x

Sets the x coordinates.

=cut

has x => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the x coordinates.",
);

=item * x0

Alternate to `x`. Builds a linear space of x coordinates. Use with `dx` where `x0` is the starting coordinate and `dx` the step.

=cut

has x0 => (
    is => "rw",
    isa => "Any",
    documentation => "Alternate to `x`. Builds a linear space of x coordinates. Use with `dx` where `x0` is the starting coordinate and `dx` the step.",
);

=item * xaxis

Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.

=cut

has xaxis => (
    is => "rw",
    documentation => "Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.",
);

=item * xcalendar

Sets the calendar system to use with `x` date data.

=cut

has xcalendar => (
    is => "rw",
    isa => enum(["chinese","coptic","discworld","ethiopian","gregorian","hebrew","islamic","jalali","julian","mayan","nanakshahi","nepali","persian","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `x` date data.",
);

=item * xhoverformat

Sets the hover text formatting rulefor `x`  using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add two items to d3's date formatter: *%h* for half of the year as a decimal number as well as *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*By default the values are formatted using `xaxis.hoverformat`.

=cut

has xhoverformat => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the hover text formatting rulefor `x`  using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add two items to d3's date formatter: *%h* for half of the year as a decimal number as well as *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*By default the values are formatted using `xaxis.hoverformat`.",
);

=item * xperiod

Only relevant when the axis `type` is *date*. Sets the period positioning in milliseconds or *n* on the x axis. Special values in the form of *n* could be used to declare the number of months. In this case `n` must be a positive integer.

=cut

has xperiod => (
    is => "rw",
    isa => "Any",
    documentation => "Only relevant when the axis `type` is *date*. Sets the period positioning in milliseconds or *n* on the x axis. Special values in the form of *n* could be used to declare the number of months. In this case `n` must be a positive integer.",
);

=item * xperiod0

Only relevant when the axis `type` is *date*. Sets the base for period positioning in milliseconds or date string on the x0 axis. When `x0period` is round number of weeks, the `x0period0` by default would be on a Sunday i.e. 2000-01-02, otherwise it would be at 2000-01-01.

=cut

has xperiod0 => (
    is => "rw",
    isa => "Any",
    documentation => "Only relevant when the axis `type` is *date*. Sets the base for period positioning in milliseconds or date string on the x0 axis. When `x0period` is round number of weeks, the `x0period0` by default would be on a Sunday i.e. 2000-01-02, otherwise it would be at 2000-01-01.",
);

=item * xperiodalignment

Only relevant when the axis `type` is *date*. Sets the alignment of data points on the x axis.

=cut

has xperiodalignment => (
    is => "rw",
    isa => enum(["start","middle","end"]),
    documentation => "Only relevant when the axis `type` is *date*. Sets the alignment of data points on the x axis.",
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

Sets the y coordinates.

=cut

has y => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the y coordinates.",
);

=item * y0

Alternate to `y`. Builds a linear space of y coordinates. Use with `dy` where `y0` is the starting coordinate and `dy` the step.

=cut

has y0 => (
    is => "rw",
    isa => "Any",
    documentation => "Alternate to `y`. Builds a linear space of y coordinates. Use with `dy` where `y0` is the starting coordinate and `dy` the step.",
);

=item * yaxis

Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.yaxis2`, and so on.

=cut

has yaxis => (
    is => "rw",
    documentation => "Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.yaxis2`, and so on.",
);

=item * ycalendar

Sets the calendar system to use with `y` date data.

=cut

has ycalendar => (
    is => "rw",
    isa => enum(["chinese","coptic","discworld","ethiopian","gregorian","hebrew","islamic","jalali","julian","mayan","nanakshahi","nepali","persian","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `y` date data.",
);

=item * yhoverformat

Sets the hover text formatting rulefor `y`  using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add two items to d3's date formatter: *%h* for half of the year as a decimal number as well as *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*By default the values are formatted using `yaxis.hoverformat`.

=cut

has yhoverformat => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the hover text formatting rulefor `y`  using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add two items to d3's date formatter: *%h* for half of the year as a decimal number as well as *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*By default the values are formatted using `yaxis.hoverformat`.",
);

=item * yperiod

Only relevant when the axis `type` is *date*. Sets the period positioning in milliseconds or *n* on the y axis. Special values in the form of *n* could be used to declare the number of months. In this case `n` must be a positive integer.

=cut

has yperiod => (
    is => "rw",
    isa => "Any",
    documentation => "Only relevant when the axis `type` is *date*. Sets the period positioning in milliseconds or *n* on the y axis. Special values in the form of *n* could be used to declare the number of months. In this case `n` must be a positive integer.",
);

=item * yperiod0

Only relevant when the axis `type` is *date*. Sets the base for period positioning in milliseconds or date string on the y0 axis. When `y0period` is round number of weeks, the `y0period0` by default would be on a Sunday i.e. 2000-01-02, otherwise it would be at 2000-01-01.

=cut

has yperiod0 => (
    is => "rw",
    isa => "Any",
    documentation => "Only relevant when the axis `type` is *date*. Sets the base for period positioning in milliseconds or date string on the y0 axis. When `y0period` is round number of weeks, the `y0period0` by default would be on a Sunday i.e. 2000-01-02, otherwise it would be at 2000-01-01.",
);

=item * yperiodalignment

Only relevant when the axis `type` is *date*. Sets the alignment of data points on the y axis.

=cut

has yperiodalignment => (
    is => "rw",
    isa => enum(["start","middle","end"]),
    documentation => "Only relevant when the axis `type` is *date*. Sets the alignment of data points on the y axis.",
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
