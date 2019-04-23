package Chart::Plotly::Trace::Scatter3d::Hoverlabel;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Scatter3d::Hoverlabel::Font;


# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace scatter3d.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/scatter3d.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace scatter3d.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#scatter3d>

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

=item * align

Sets the horizontal alignment of the text content within hover label box. Has an effect only if the hover label text spans more two or more lines

=cut

has align => (
    is => "rw",
    isa => union([enum(["left","right","auto"]), "ArrayRef"]),
    documentation => "Sets the horizontal alignment of the text content within hover label box. Has an effect only if the hover label text spans more two or more lines",
);

=item * alignsrc

Sets the source reference on plot.ly for  align .

=cut

has alignsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  align .",
);

=item * bgcolor

Sets the background color of the hover labels for this trace

=cut

has bgcolor => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
    documentation => "Sets the background color of the hover labels for this trace",
);

=item * bgcolorsrc

Sets the source reference on plot.ly for  bgcolor .

=cut

has bgcolorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  bgcolor .",
);

=item * bordercolor

Sets the border color of the hover labels for this trace.

=cut

has bordercolor => (
    is => "rw",
    isa => "Maybe[ArrayRef]",
    documentation => "Sets the border color of the hover labels for this trace.",
);

=item * bordercolorsrc

Sets the source reference on plot.ly for  bordercolor .

=cut

has bordercolorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  bordercolor .",
);

=item * font


=cut

has font => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Scatter3d::Hoverlabel::Font",
);

=item * namelength

Sets the default length (in number of characters) of the trace name in the hover labels for all traces. -1 shows the whole name regardless of length. 0-3 shows the first 0-3 characters, and an integer >3 will show the whole name if it is less than that many characters, but if it is longer, will truncate to `namelength - 3` characters and add an ellipsis.

=cut

has namelength => (
    is => "rw",
    isa => "Int|ArrayRef[Int]",
    documentation => "Sets the default length (in number of characters) of the trace name in the hover labels for all traces. -1 shows the whole name regardless of length. 0-3 shows the first 0-3 characters, and an integer >3 will show the whole name if it is less than that many characters, but if it is longer, will truncate to `namelength - 3` characters and add an ellipsis.",
);

=item * namelengthsrc

Sets the source reference on plot.ly for  namelength .

=cut

has namelengthsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  namelength .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
