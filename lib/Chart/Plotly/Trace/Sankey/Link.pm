package Chart::Plotly::Trace::Sankey::Link;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Sankey::Link::Line;


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

Sets the `link` color. It can be a single value, or an array for specifying color for each `link`. If `link.color` is omitted, then by default, a translucent grey link will be used.

=cut

has color => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
    documentation => "Sets the `link` color. It can be a single value, or an array for specifying color for each `link`. If `link.color` is omitted, then by default, a translucent grey link will be used.",
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
    default => "The links of the Sankey plot.",
);

=item * label

The shown name of the link.

=cut

has label => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "The shown name of the link.",
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
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Sankey::Link::Line",
);

=item * source

An integer number `[0..nodes.length - 1]` that represents the source node.

=cut

has source => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "An integer number `[0..nodes.length - 1]` that represents the source node.",
);

=item * sourcesrc

Sets the source reference on plot.ly for  source .

=cut

has sourcesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  source .",
);

=item * target

An integer number `[0..nodes.length - 1]` that represents the target node.

=cut

has target => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "An integer number `[0..nodes.length - 1]` that represents the target node.",
);

=item * targetsrc

Sets the source reference on plot.ly for  target .

=cut

has targetsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  target .",
);

=item * value

A numeric value representing the flow volume value.

=cut

has value => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "A numeric value representing the flow volume value.",
);

=item * valuesrc

Sets the source reference on plot.ly for  value .

=cut

has valuesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  value .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
