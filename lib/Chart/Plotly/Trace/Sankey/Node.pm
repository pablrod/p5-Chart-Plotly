package Chart::Plotly::Trace::Sankey::Node;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);

use Chart::Plotly::Trace::Sankey::Node::Line;


# VERSION

=encoding utf-8

=head1 NAME 

Chart::Plotly::Trace::Sankey::Node

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
    isa => "Maybe[ArrayRef]",
    documentation => "Sets the `node` color. It can be a single value, or an array for specifying color for each `node`. If `node.color` is omitted, then the default `Plotly` color palette will be cycled through to have a variety of colors. These defaults are not fully opaque, to allow some visibility of what is beneath the node.",
);

=item * colorsrc

Sets the source reference on plot.ly for  color .

=cut

has colorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  color .",
);

=item * description


=cut

has description => (
    is => "ro",
    default => "The nodes of the Sankey plot.",
);

=item * label

The shown name of the node.

=cut

has label => (
    is => "rw",
    isa => "ArrayRef",
    documentation => "The shown name of the node.",
);

=item * labelsrc

Sets the source reference on plot.ly for  label .

=cut

has labelsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  label .",
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

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
