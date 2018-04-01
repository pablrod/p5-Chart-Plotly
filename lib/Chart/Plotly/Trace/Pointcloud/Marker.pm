package Chart::Plotly::Trace::Pointcloud::Marker;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Pointcloud::Marker::Border;


# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace pointcloud.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/pointcloud.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace pointcloud.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#pointcloud>

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

=item * blend

Determines if colors are blended together for a translucency effect in case `opacity` is specified as a value less then `1`. Setting `blend` to `true` reduces zoom/pan speed if used with large numbers of points.

=cut

has blend => (
    is => "rw",
    isa => "Bool",
    documentation => "Determines if colors are blended together for a translucency effect in case `opacity` is specified as a value less then `1`. Setting `blend` to `true` reduces zoom/pan speed if used with large numbers of points.",
);

=item * border


=cut

has border => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Pointcloud::Marker::Border",
);

=item * color

Sets the marker fill color. It accepts a specific color.If the color is not fully opaque and there are hundreds of thousandsof points, it may cause slower zooming and panning.

=cut

has color => (
    is => "rw",
    documentation => "Sets the marker fill color. It accepts a specific color.If the color is not fully opaque and there are hundreds of thousandsof points, it may cause slower zooming and panning.",
);

=item * opacity

Sets the marker opacity. The default value is `1` (fully opaque). If the markers are not fully opaque and there are hundreds of thousands of points, it may cause slower zooming and panning. Opacity fades the color even if `blend` is left on `false` even if there is no translucency effect in that case.

=cut

has opacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the marker opacity. The default value is `1` (fully opaque). If the markers are not fully opaque and there are hundreds of thousands of points, it may cause slower zooming and panning. Opacity fades the color even if `blend` is left on `false` even if there is no translucency effect in that case.",
);

=item * sizemax

Sets the maximum size (in px) of the rendered marker points. Effective when the `pointcloud` shows only few points.

=cut

has sizemax => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the maximum size (in px) of the rendered marker points. Effective when the `pointcloud` shows only few points.",
);

=item * sizemin

Sets the minimum size (in px) of the rendered marker points, effective when the `pointcloud` shows a million or more points.

=cut

has sizemin => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the minimum size (in px) of the rendered marker points, effective when the `pointcloud` shows a million or more points.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
