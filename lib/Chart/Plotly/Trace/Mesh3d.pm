package Chart::Plotly::Trace::Mesh3d;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Mesh3d::Colorbar;
use Chart::Plotly::Trace::Mesh3d::Contour;
use Chart::Plotly::Trace::Mesh3d::Hoverlabel;
use Chart::Plotly::Trace::Mesh3d::Lighting;
use Chart::Plotly::Trace::Mesh3d::Lightposition;
use Chart::Plotly::Trace::Mesh3d::Stream;


# VERSION

# ABSTRACT: Draws sets of triangles with coordinates given by three 1-dimensional arrays in `x`, `y`, `z` and (1) a sets of `i`, `j`, `k` indices (2) Delaunay triangulation or (3) the Alpha-shape algorithm or (4) the Convex-hull algorithm

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/mesh3d.pl

=head1 DESCRIPTION

Draws sets of triangles with coordinates given by three 1-dimensional arrays in `x`, `y`, `z` and (1) a sets of `i`, `j`, `k` indices (2) Delaunay triangulation or (3) the Alpha-shape algorithm or (4) the Convex-hull algorithm

Screenshot of the above example:

=begin HTML

<p>
<img src="https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/mesh3d.png" alt="Screenshot of the above example">
</p>

=end HTML

=begin markdown

![Screenshot of the above example](https://raw.githubusercontent.com/pablrod/p5-Chart-Plotly/master/examples/traces/mesh3d.png)

=end markdown

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#mesh3d>

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

=item * alphahull

Determines how the mesh surface triangles are derived from the set of vertices (points) represented by the `x`, `y` and `z` arrays, if the `i`, `j`, `k` arrays are not supplied. For general use of `mesh3d` it is preferred that `i`, `j`, `k` are supplied. If *-1*, Delaunay triangulation is used, which is mainly suitable if the mesh is a single, more or less layer surface that is perpendicular to `delaunayaxis`. In case the `delaunayaxis` intersects the mesh surface at more than one point it will result triangles that are very long in the dimension of `delaunayaxis`. If *>0*, the alpha-shape algorithm is used. In this case, the positive `alphahull` value signals the use of the alpha-shape algorithm, _and_ its value acts as the parameter for the mesh fitting. If *0*,  the convex-hull algorithm is used. It is suitable for convex bodies or if the intention is to enclose the `x`, `y` and `z` point set into a convex hull.

=cut

has alphahull => (
    is => "rw",
    isa => "Num",
    documentation => "Determines how the mesh surface triangles are derived from the set of vertices (points) represented by the `x`, `y` and `z` arrays, if the `i`, `j`, `k` arrays are not supplied. For general use of `mesh3d` it is preferred that `i`, `j`, `k` are supplied. If *-1*, Delaunay triangulation is used, which is mainly suitable if the mesh is a single, more or less layer surface that is perpendicular to `delaunayaxis`. In case the `delaunayaxis` intersects the mesh surface at more than one point it will result triangles that are very long in the dimension of `delaunayaxis`. If *>0*, the alpha-shape algorithm is used. In this case, the positive `alphahull` value signals the use of the alpha-shape algorithm, _and_ its value acts as the parameter for the mesh fitting. If *0*,  the convex-hull algorithm is used. It is suitable for convex bodies or if the intention is to enclose the `x`, `y` and `z` point set into a convex hull.",
);

=item * autocolorscale

Has an effect only if `color` is set to a numerical array. Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette determined by `colorscale`. In case `colorscale` is unspecified or `autocolorscale` is true, the default  palette will be chosen according to whether numbers in the `color` array are all positive, all negative or mixed.

=cut

has autocolorscale => (
    is => "rw",
    isa => "Bool",
    documentation => "Has an effect only if `color` is set to a numerical array. Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette determined by `colorscale`. In case `colorscale` is unspecified or `autocolorscale` is true, the default  palette will be chosen according to whether numbers in the `color` array are all positive, all negative or mixed.",
);

=item * cauto

Has an effect only if `color` is set to a numerical array and `cmin`, `cmax` are set by the user. In this case, it controls whether the range of colors in `colorscale` is mapped to the range of values in the `color` array (`cauto: true`), or the `cmin`/`cmax` values (`cauto: false`). Defaults to `false` when `cmin`, `cmax` are set by the user.

=cut

has cauto => (
    is => "rw",
    isa => "Bool",
    documentation => "Has an effect only if `color` is set to a numerical array and `cmin`, `cmax` are set by the user. In this case, it controls whether the range of colors in `colorscale` is mapped to the range of values in the `color` array (`cauto: true`), or the `cmin`/`cmax` values (`cauto: false`). Defaults to `false` when `cmin`, `cmax` are set by the user.",
);

=item * cmax

Has an effect only if `color` is set to a numerical array. Sets the upper bound of the color domain. Value should be associated to the `color` array index, and if set, `cmin` must be set as well.

=cut

has cmax => (
    is => "rw",
    isa => "Num",
    documentation => "Has an effect only if `color` is set to a numerical array. Sets the upper bound of the color domain. Value should be associated to the `color` array index, and if set, `cmin` must be set as well.",
);

=item * cmin

Has an effect only if `color` is set to a numerical array. Sets the lower bound of the color domain. Value should be associated to the `color` array index, and if set, `cmax` must be set as well.

=cut

has cmin => (
    is => "rw",
    isa => "Num",
    documentation => "Has an effect only if `color` is set to a numerical array. Sets the lower bound of the color domain. Value should be associated to the `color` array index, and if set, `cmax` must be set as well.",
);

=item * color

Sets the color of the whole mesh

=cut

has color => (
    is => "rw",
    documentation => "Sets the color of the whole mesh",
);

=item * colorbar


=cut

has colorbar => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Mesh3d::Colorbar",
);

=item * colorscale

Sets the colorscale and only has an effect if `color` is set to a numerical array. The colorscale must be an array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For example, `[[0, 'rgb(0,0,255)', [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale in color space, use `cmin` and `cmax`. Alternatively, `colorscale` may be a palette name string of the following list: Greys, YlGnBu, Greens, YlOrRd, Bluered, RdBu, Reds, Blues, Picnic, Rainbow, Portland, Jet, Hot, Blackbody, Earth, Electric, Viridis, Cividis

=cut

has colorscale => (
    is => "rw",
    documentation => "Sets the colorscale and only has an effect if `color` is set to a numerical array. The colorscale must be an array containing arrays mapping a normalized value to an rgb, rgba, hex, hsl, hsv, or named color string. At minimum, a mapping for the lowest (0) and highest (1) values are required. For example, `[[0, 'rgb(0,0,255)', [1, 'rgb(255,0,0)']]`. To control the bounds of the colorscale in color space, use `cmin` and `cmax`. Alternatively, `colorscale` may be a palette name string of the following list: Greys, YlGnBu, Greens, YlOrRd, Bluered, RdBu, Reds, Blues, Picnic, Rainbow, Portland, Jet, Hot, Blackbody, Earth, Electric, Viridis, Cividis",
);

=item * contour


=cut

has contour => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Mesh3d::Contour",
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

Sets the source reference on plot.ly for  customdata .

=cut

has customdatasrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  customdata .",
);

=item * delaunayaxis

Sets the Delaunay axis, which is the axis that is perpendicular to the surface of the Delaunay triangulation. It has an effect if `i`, `j`, `k` are not provided and `alphahull` is set to indicate Delaunay triangulation.

=cut

has delaunayaxis => (
    is => "rw",
    isa => enum(["x","y","z"]),
    documentation => "Sets the Delaunay axis, which is the axis that is perpendicular to the surface of the Delaunay triangulation. It has an effect if `i`, `j`, `k` are not provided and `alphahull` is set to indicate Delaunay triangulation.",
);

=item * facecolor

Sets the color of each face Overrides *color* and *vertexcolor*.

=cut

has facecolor => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the color of each face Overrides *color* and *vertexcolor*.",
);

=item * facecolorsrc

Sets the source reference on plot.ly for  facecolor .

=cut

has facecolorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  facecolor .",
);

=item * flatshading

Determines whether or not normal smoothing is applied to the meshes, creating meshes with an angular, low-poly look via flat reflections.

=cut

has flatshading => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not normal smoothing is applied to the meshes, creating meshes with an angular, low-poly look via flat reflections.",
);

=item * hoverinfo

Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.

=cut

has hoverinfo => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
    documentation => "Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.",
);

=item * hoverinfosrc

Sets the source reference on plot.ly for  hoverinfo .

=cut

has hoverinfosrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  hoverinfo .",
);

=item * hoverlabel


=cut

has hoverlabel => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Mesh3d::Hoverlabel",
);

=item * i

A vector of vertex indices, i.e. integer values between 0 and the length of the vertex vectors, representing the *first* vertex of a triangle. For example, `{i[m], j[m], k[m]}` together represent face m (triangle m) in the mesh, where `i[m] = n` points to the triplet `{x[n], y[n], z[n]}` in the vertex arrays. Therefore, each element in `i` represents a point in space, which is the first vertex of a triangle.

=cut

has i => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "A vector of vertex indices, i.e. integer values between 0 and the length of the vertex vectors, representing the *first* vertex of a triangle. For example, `{i[m], j[m], k[m]}` together represent face m (triangle m) in the mesh, where `i[m] = n` points to the triplet `{x[n], y[n], z[n]}` in the vertex arrays. Therefore, each element in `i` represents a point in space, which is the first vertex of a triangle.",
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

Sets the source reference on plot.ly for  ids .

=cut

has idssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  ids .",
);

=item * intensity

Sets the vertex intensity values, used for plotting fields on meshes

=cut

has intensity => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the vertex intensity values, used for plotting fields on meshes",
);

=item * intensitysrc

Sets the source reference on plot.ly for  intensity .

=cut

has intensitysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  intensity .",
);

=item * isrc

Sets the source reference on plot.ly for  i .

=cut

has isrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  i .",
);

=item * j

A vector of vertex indices, i.e. integer values between 0 and the length of the vertex vectors, representing the *second* vertex of a triangle. For example, `{i[m], j[m], k[m]}`  together represent face m (triangle m) in the mesh, where `j[m] = n` points to the triplet `{x[n], y[n], z[n]}` in the vertex arrays. Therefore, each element in `j` represents a point in space, which is the second vertex of a triangle.

=cut

has j => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "A vector of vertex indices, i.e. integer values between 0 and the length of the vertex vectors, representing the *second* vertex of a triangle. For example, `{i[m], j[m], k[m]}`  together represent face m (triangle m) in the mesh, where `j[m] = n` points to the triplet `{x[n], y[n], z[n]}` in the vertex arrays. Therefore, each element in `j` represents a point in space, which is the second vertex of a triangle.",
);

=item * jsrc

Sets the source reference on plot.ly for  j .

=cut

has jsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  j .",
);

=item * k

A vector of vertex indices, i.e. integer values between 0 and the length of the vertex vectors, representing the *third* vertex of a triangle. For example, `{i[m], j[m], k[m]}` together represent face m (triangle m) in the mesh, where `k[m] = n` points to the triplet  `{x[n], y[n], z[n]}` in the vertex arrays. Therefore, each element in `k` represents a point in space, which is the third vertex of a triangle.

=cut

has k => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "A vector of vertex indices, i.e. integer values between 0 and the length of the vertex vectors, representing the *third* vertex of a triangle. For example, `{i[m], j[m], k[m]}` together represent face m (triangle m) in the mesh, where `k[m] = n` points to the triplet  `{x[n], y[n], z[n]}` in the vertex arrays. Therefore, each element in `k` represents a point in space, which is the third vertex of a triangle.",
);

=item * ksrc

Sets the source reference on plot.ly for  k .

=cut

has ksrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  k .",
);

=item * legendgroup

Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.

=cut

has legendgroup => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.",
);

=item * lighting


=cut

has lighting => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Mesh3d::Lighting",
);

=item * lightposition


=cut

has lightposition => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Mesh3d::Lightposition",
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

Sets the opacity of the surface.

=cut

has opacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the opacity of the surface.",
);

=item * reversescale

Has an effect only if `color` is set to a numerical array. Reverses the color mapping if true (`cmin` will correspond to the last color in the array and `cmax` will correspond to the first color).

=cut

has reversescale => (
    is => "rw",
    isa => "Bool",
    documentation => "Has an effect only if `color` is set to a numerical array. Reverses the color mapping if true (`cmin` will correspond to the last color in the array and `cmax` will correspond to the first color).",
);

=item * scene

Sets a reference between this trace's 3D coordinate system and a 3D scene. If *scene* (the default value), the (x,y,z) coordinates refer to `layout.scene`. If *scene2*, the (x,y,z) coordinates refer to `layout.scene2`, and so on.

=cut

has scene => (
    is => "rw",
    documentation => "Sets a reference between this trace's 3D coordinate system and a 3D scene. If *scene* (the default value), the (x,y,z) coordinates refer to `layout.scene`. If *scene2*, the (x,y,z) coordinates refer to `layout.scene2`, and so on.",
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

=item * showscale

Determines whether or not a colorbar is displayed for this trace.

=cut

has showscale => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines whether or not a colorbar is displayed for this trace.",
);

=item * stream


=cut

has stream => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Mesh3d::Stream",
);

=item * text

Sets the text elements associated with the vertices. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.

=cut

has text => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Sets the text elements associated with the vertices. If trace `hoverinfo` contains a *text* flag and *hovertext* is not set, these elements will be seen in the hover labels.",
);

=item * textsrc

Sets the source reference on plot.ly for  text .

=cut

has textsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  text .",
);

=item * uid


=cut

has uid => (
    is => "rw",
    isa => "Str",
);

=item * vertexcolor

Sets the color of each vertex Overrides *color*.

=cut

has vertexcolor => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the color of each vertex Overrides *color*.",
);

=item * vertexcolorsrc

Sets the source reference on plot.ly for  vertexcolor .

=cut

has vertexcolorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  vertexcolor .",
);

=item * visible

Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).

=cut

has visible => (
    is => "rw",
    documentation => "Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).",
);

=item * x

Sets the X coordinates of the vertices. The nth element of vectors `x`, `y` and `z` jointly represent the X, Y and Z coordinates of the nth vertex.

=cut

has x => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the X coordinates of the vertices. The nth element of vectors `x`, `y` and `z` jointly represent the X, Y and Z coordinates of the nth vertex.",
);

=item * xcalendar

Sets the calendar system to use with `x` date data.

=cut

has xcalendar => (
    is => "rw",
    isa => enum(["gregorian","chinese","coptic","discworld","ethiopian","hebrew","islamic","julian","mayan","nanakshahi","nepali","persian","jalali","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `x` date data.",
);

=item * xsrc

Sets the source reference on plot.ly for  x .

=cut

has xsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  x .",
);

=item * y

Sets the Y coordinates of the vertices. The nth element of vectors `x`, `y` and `z` jointly represent the X, Y and Z coordinates of the nth vertex.

=cut

has y => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the Y coordinates of the vertices. The nth element of vectors `x`, `y` and `z` jointly represent the X, Y and Z coordinates of the nth vertex.",
);

=item * ycalendar

Sets the calendar system to use with `y` date data.

=cut

has ycalendar => (
    is => "rw",
    isa => enum(["gregorian","chinese","coptic","discworld","ethiopian","hebrew","islamic","julian","mayan","nanakshahi","nepali","persian","jalali","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `y` date data.",
);

=item * ysrc

Sets the source reference on plot.ly for  y .

=cut

has ysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  y .",
);

=item * z

Sets the Z coordinates of the vertices. The nth element of vectors `x`, `y` and `z` jointly represent the X, Y and Z coordinates of the nth vertex.

=cut

has z => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the Z coordinates of the vertices. The nth element of vectors `x`, `y` and `z` jointly represent the X, Y and Z coordinates of the nth vertex.",
);

=item * zcalendar

Sets the calendar system to use with `z` date data.

=cut

has zcalendar => (
    is => "rw",
    isa => enum(["gregorian","chinese","coptic","discworld","ethiopian","hebrew","islamic","julian","mayan","nanakshahi","nepali","persian","jalali","taiwan","thai","ummalqura"]),
    documentation => "Sets the calendar system to use with `z` date data.",
);

=item * zsrc

Sets the source reference on plot.ly for  z .

=cut

has zsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  z .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
