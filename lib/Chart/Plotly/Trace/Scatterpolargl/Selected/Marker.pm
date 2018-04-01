package Chart::Plotly::Trace::Scatterpolargl::Selected::Marker;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace scatterpolargl.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scatterpolargl.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace scatterpolargl.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#scatterpolargl>

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

Sets the marker color of selected points.

=cut

has color => (
    is => "rw",
    documentation => "Sets the marker color of selected points.",
);

=item * opacity

Sets the marker opacity of selected points.

=cut

has opacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the marker opacity of selected points.",
);

=item * size

Sets the marker size of selected points.

=cut

has size => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the marker size of selected points.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
