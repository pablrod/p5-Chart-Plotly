package Chart::Plotly::Trace::Bar::Marker::Colorbar::Tickformatstop;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace bar.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/bar.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace bar.

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

=item * dtickrange

range [*min*, *max*], where *min*, *max* - dtick values which describe some zoom level, it is possible to omit *min* or *max* value by passing *null*

=cut

has dtickrange => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "range [*min*, *max*], where *min*, *max* - dtick values which describe some zoom level, it is possible to omit *min* or *max* value by passing *null*",
);

=item * value

string - dtickformat for described zoom level, the same as *tickformat*

=cut

has value => (
    is => "rw",
    isa => "Str",
    documentation => "string - dtickformat for described zoom level, the same as *tickformat*",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
