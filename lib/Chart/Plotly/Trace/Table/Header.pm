package Chart::Plotly::Trace::Table::Header;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}

use Chart::Plotly::Trace::Table::Header::Fill;
use Chart::Plotly::Trace::Table::Header::Font;
use Chart::Plotly::Trace::Table::Header::Line;


# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace table.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/table.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace table.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#table>

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

Sets the horizontal alignment of the `text` within the box. Has an effect only if `text` spans more two or more lines (i.e. `text` contains one or more <br> HTML tags) or if an explicit width is set to override the text width.

=cut

has align => (
    is => "rw",
    isa => union([enum(["left","center","right"]), "ArrayRef"]),
    documentation => "Sets the horizontal alignment of the `text` within the box. Has an effect only if `text` spans more two or more lines (i.e. `text` contains one or more <br> HTML tags) or if an explicit width is set to override the text width.",
);

=item * alignsrc

Sets the source reference on plot.ly for  align .

=cut

has alignsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  align .",
);

=item * fill


=cut

has fill => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Table::Header::Fill",
);

=item * font


=cut

has font => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Table::Header::Font",
);

=item * format

Sets the cell value formatting rule using d3 formatting mini-language which is similar to those of Python. See https://github.com/d3/d3-format/blob/master/README.md#locale_format

=cut

has format => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the cell value formatting rule using d3 formatting mini-language which is similar to those of Python. See https://github.com/d3/d3-format/blob/master/README.md#locale_format",
);

=item * formatsrc

Sets the source reference on plot.ly for  format .

=cut

has formatsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  format .",
);

=item * height

The height of cells.

=cut

has height => (
    is => "rw",
    isa => "Num",
    documentation => "The height of cells.",
);

=item * line


=cut

has line => (
    is => "rw",
    isa => "Maybe[HashRef]|Chart::Plotly::Trace::Table::Header::Line",
);

=item * prefix

Prefix for cell values.

=cut

has prefix => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Prefix for cell values.",
);

=item * prefixsrc

Sets the source reference on plot.ly for  prefix .

=cut

has prefixsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  prefix .",
);

=item * suffix

Suffix for cell values.

=cut

has suffix => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "Suffix for cell values.",
);

=item * suffixsrc

Sets the source reference on plot.ly for  suffix .

=cut

has suffixsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  suffix .",
);

=item * values

Header cell values. `values[m][n]` represents the value of the `n`th point in column `m`, therefore the `values[m]` vector length for all columns must be the same (longer vectors will be truncated). Each value must be a finite number or a string.

=cut

has values => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Header cell values. `values[m][n]` represents the value of the `n`th point in column `m`, therefore the `values[m]` vector length for all columns must be the same (longer vectors will be truncated). Each value must be a finite number or a string.",
);

=item * valuessrc

Sets the source reference on plot.ly for  values .

=cut

has valuessrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on plot.ly for  values .",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
