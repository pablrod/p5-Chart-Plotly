package Chart::Plotly::Trace::Isosurface::Spaceframe;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace isosurface.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/isosurface.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace isosurface.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#isosurface>

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

=item * fill

Sets the fill ratio of the `spaceframe` elements. The default fill value is 0.15 meaning that only 15% of the area of every faces of tetras would be shaded. Applying a greater `fill` ratio would allow the creation of stronger elements or could be sued to have entirely closed areas (in case of using 1).

=cut

has fill => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the fill ratio of the `spaceframe` elements. The default fill value is 0.15 meaning that only 15% of the area of every faces of tetras would be shaded. Applying a greater `fill` ratio would allow the creation of stronger elements or could be sued to have entirely closed areas (in case of using 1).",
);

=item * show

Displays/hides tetrahedron shapes between minimum and maximum iso-values. Often useful when either caps or surfaces are disabled or filled with values less than 1.

=cut

has show => (
    is => "rw",
    isa => "Bool",
    documentation => "Displays/hides tetrahedron shapes between minimum and maximum iso-values. Often useful when either caps or surfaces are disabled or filled with values less than 1.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
