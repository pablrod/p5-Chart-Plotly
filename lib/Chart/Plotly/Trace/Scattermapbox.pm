package Chart::Plotly::Trace::Scattermapbox;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Scattermapbox::Hoverlabel;
use Chart::Plotly::Trace::Scattermapbox::Legendgrouptitle;
use Chart::Plotly::Trace::Scattermapbox::Line;
use Chart::Plotly::Trace::Scattermapbox::Marker;
use Chart::Plotly::Trace::Scattermapbox::Selected;
use Chart::Plotly::Trace::Scattermapbox::Stream;
use Chart::Plotly::Trace::Scattermapbox::Textfont;
use Chart::Plotly::Trace::Scattermapbox::Transform;
use Chart::Plotly::Trace::Scattermapbox::Unselected;


# VERSION

# ABSTRACT: The data visualized as scatter point, lines or marker symbols on a Mapbox GL geographic map is provided by longitude/latitude pairs in `lon` and `lat`.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scattermapbox.pl

=head1 DESCRIPTION

The data visualized as scatter point, lines or marker symbols on a Mapbox GL geographic map is provided by longitude/latitude pairs in `lon` and `lat`.

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/scattermapbox.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/scattermapbox.png)

=end markdown

=begin HTML

<p>
<iframe src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/scattermapbox.html" style="border:none;" width="80%" height="520"></iframe>
</p>

=end HTML

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#scattermapbox>

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

=item * below

Determines if this scattermapbox trace's layers are to be inserted before the layer with the specified ID. By default, scattermapbox layers are inserted above all the base layers. To place the scattermapbox layers above every other layer, set `below` to *''*.

=cut

has below => (
    is => "rw",
    isa => "Str",
    documentation => "Determines if this scattermapbox trace's layers are to be inserted before the layer with the specified ID. By default, scattermapbox layers are inserted above all the base layers. To place the scattermapbox layers above every other layer, set `below` to *''*.",
);

=item * connectgaps

Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.

=cut

has connectgaps => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not gaps (i.e. {nan} or missing values) in the provided data arrays are connected.",
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

=item * fill

Sets the area to fill with a solid color. Use with `fillcolor` if not *none*. *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into a closed shape.

=cut

has fill => (
    is => "rw",
    isa => enum(["none","toself"]),
    documentation => "Sets the area to fill with a solid color. Use with `fillcolor` if not *none*. *toself* connects the endpoints of the trace (or each segment of the trace if it has gaps) into a closed shape.",
);

=item * fillcolor

Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.

=cut

has fillcolor => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Hoverlabel",
);

=item * hovertemplate

Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example "y: %{y}" as well as %{xother}, {%_xother}, {%_xother_}, {%xother_}. When showing info for several points, *xother* will be added to those with different x positions from the first point. An underscore before or after *(x|y)other* will add a space on that side, only when this field is shown. Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plotly.com/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available.  Anything contained in tag `<extra>` is displayed in the secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag `<extra></extra>`.

=cut

has hovertemplate => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example \"y: %{y}\" as well as %{xother}, {%_xother}, {%_xother_}, {%xother_}. When showing info for several points, *xother* will be added to those with different x positions from the first point. An underscore before or after *(x|y)other* will add a space on that side, only when this field is shown. Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example \"Price: %{y:\$.2f}\". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example \"Day: %{2019-01-01|%A}\". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plotly.com/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available.  Anything contained in tag `<extra>` is displayed in the secondary box, for example \"<extra>{fullData.name}</extra>\". To hide the secondary box completely, use an empty tag `<extra></extra>`.",
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

Sets hover text elements associated with each (lon,lat) pair If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (lon,lat) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.

=cut

has hovertext => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets hover text elements associated with each (lon,lat) pair If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (lon,lat) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.",
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

=item * lat

Sets the latitude coordinates (in degrees North).

=cut

has lat => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the latitude coordinates (in degrees North).",
);

=item * latsrc

Sets the source reference on Chart Studio Cloud for `lat`.

=cut

has latsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `lat`.",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Legendgrouptitle",
);

=item * legendrank

Sets the legend rank for this trace. Items and groups with smaller ranks are presented on top/left side while with `*reversed* `legend.traceorder` they are on bottom/right side. The default legendrank is 1000, so that you can use ranks less than 1000 to place certain items before all unranked items, and ranks greater than 1000 to go after all unranked items.

=cut

has legendrank => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the legend rank for this trace. Items and groups with smaller ranks are presented on top/left side while with `*reversed* `legend.traceorder` they are on bottom/right side. The default legendrank is 1000, so that you can use ranks less than 1000 to place certain items before all unranked items, and ranks greater than 1000 to go after all unranked items.",
);

=item * line


=cut

has line => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Line",
);

=item * lon

Sets the longitude coordinates (in degrees East).

=cut

has lon => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the longitude coordinates (in degrees East).",
);

=item * lonsrc

Sets the source reference on Chart Studio Cloud for `lon`.

=cut

has lonsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `lon`.",
);

=item * marker


=cut

has marker => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Marker",
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

=item * mode

Determines the drawing mode for this scatter trace. If the provided `mode` includes *text* then the `text` elements appear at the coordinates. Otherwise, the `text` elements appear on hover.

=cut

has mode => (
    is => "rw",
    isa => "Str",
    documentation => "Determines the drawing mode for this scatter trace. If the provided `mode` includes *text* then the `text` elements appear at the coordinates. Otherwise, the `text` elements appear on hover.",
);

=item * name

Sets the trace name. The trace name appear as the legend item and on hover.

=cut

has name => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the trace name. The trace name appear as the legend item and on hover.",
);

=item * opacity

Sets the opacity of the trace.

=cut

has opacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the opacity of the trace.",
);

=item * selected


=cut

has selected => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Selected",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Stream",
);

=item * subplot

Sets a reference between this trace's data coordinates and a mapbox subplot. If *mapbox* (the default value), the data refer to `layout.mapbox`. If *mapbox2*, the data refer to `layout.mapbox2`, and so on.

=cut

has subplot => (
    is => "rw",
    documentation => "Sets a reference between this trace's data coordinates and a mapbox subplot. If *mapbox* (the default value), the data refer to `layout.mapbox`. If *mapbox2*, the data refer to `layout.mapbox2`, and so on.",
);

=item * text

Sets text elements associated with each (lon,lat) pair If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (lon,lat) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.

=cut

has text => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets text elements associated with each (lon,lat) pair If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (lon,lat) coordinates. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.",
);

=item * textfont


=cut

has textfont => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Textfont",
);

=item * textposition

Sets the positions of the `text` elements with respects to the (x,y) coordinates.

=cut

has textposition => (
    is => "rw",
    isa => enum(["top left","top center","top right","middle left","middle center","middle right","bottom left","bottom center","bottom right"]),
    documentation => "Sets the positions of the `text` elements with respects to the (x,y) coordinates.",
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

Template string used for rendering the information text that appear on points. Note that this will override `textinfo`. Variables are inserted using %{variable}, for example "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. Every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `lat`, `lon` and `text`.

=cut

has texttemplate => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Template string used for rendering the information text that appear on points. Note that this will override `textinfo`. Variables are inserted using %{variable}, for example \"y: %{y}\". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example \"Price: %{y:\$.2f}\". https://github.com/d3/d3-format/tree/v1.4.5#d3-format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example \"Day: %{2019-01-01|%A}\". https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format for details on the date formatting syntax. Every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available. variables `lat`, `lon` and `text`.",
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
    isa => "ArrayRef|ArrayRef[Chart::Plotly::Trace::Scattermapbox::Transform]",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scattermapbox::Unselected",
);

=item * visible

Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).

=cut

has visible => (
    is => "rw",
    documentation => "Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
