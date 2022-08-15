package Chart::Plotly::Trace::Parcoords::Dimension;
use Moose;
use MooseX::ExtraArgs;
use Moose::Util::TypeConstraints qw(enum union);
if (!defined Moose::Util::TypeConstraints::find_type_constraint('PDL')) {
    Moose::Util::TypeConstraints::type('PDL');
}



# VERSION

# ABSTRACT: This attribute is one of the possible options for the trace parcoords.

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/traces/parcoords.pl

=head1 DESCRIPTION

This attribute is part of the possible options for the trace parcoords.

This file has been autogenerated from the official plotly.js source.

If you like Plotly, please support them: L<https://plot.ly/> 
Open source announcement: L<https://plot.ly/javascript/open-source-announcement/>

Full reference: L<https://plot.ly/javascript/reference/#parcoords>

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

=item * constraintrange

The domain range to which the filter on the dimension is constrained. Must be an array of `[fromValue, toValue]` with `fromValue <= toValue`, or if `multiselect` is not disabled, you may give an array of arrays, where each inner array is `[fromValue, toValue]`.

=cut

has constraintrange => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "The domain range to which the filter on the dimension is constrained. Must be an array of `[fromValue, toValue]` with `fromValue <= toValue`, or if `multiselect` is not disabled, you may give an array of arrays, where each inner array is `[fromValue, toValue]`.",
);

=item * description


=cut

has description => (
    is => "ro",
    default => "The dimensions (variables) of the parallel coordinates chart. 2..60 dimensions are supported.",
);

=item * label

The shown name of the dimension.

=cut

has label => (
    is => "rw",
    isa => "Str",
    documentation => "The shown name of the dimension.",
);

=item * multiselect

Do we allow multiple selection ranges or just a single range?

=cut

has multiselect => (
    is => "rw",
    isa => "Bool",
    documentation => "Do we allow multiple selection ranges or just a single range?",
);

=item * name

When used in a template, named items are created in the output figure in addition to any items the figure already has in this array. You can modify these items in the output figure by making your own item with `templateitemname` matching this `name` alongside your modifications (including `visible: false` or `enabled: false` to hide it). Has no effect outside of a template.

=cut

has name => (
    is => "rw",
    isa => "Str",
    documentation => "When used in a template, named items are created in the output figure in addition to any items the figure already has in this array. You can modify these items in the output figure by making your own item with `templateitemname` matching this `name` alongside your modifications (including `visible: false` or `enabled: false` to hide it). Has no effect outside of a template.",
);

=item * range

The domain range that represents the full, shown axis extent. Defaults to the `values` extent. Must be an array of `[fromValue, toValue]` with finite numbers as elements.

=cut

has range => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "The domain range that represents the full, shown axis extent. Defaults to the `values` extent. Must be an array of `[fromValue, toValue]` with finite numbers as elements.",
);

=item * templateitemname

Used to refer to a named item in this array in the template. Named items from the template will be created even without a matching item in the input figure, but you can modify one by making an item with `templateitemname` matching its `name`, alongside your modifications (including `visible: false` or `enabled: false` to hide it). If there is no template or no matching item, this item will be hidden unless you explicitly show it with `visible: true`.

=cut

has templateitemname => (
    is => "rw",
    isa => "Str",
    documentation => "Used to refer to a named item in this array in the template. Named items from the template will be created even without a matching item in the input figure, but you can modify one by making an item with `templateitemname` matching its `name`, alongside your modifications (including `visible: false` or `enabled: false` to hide it). If there is no template or no matching item, this item will be hidden unless you explicitly show it with `visible: true`.",
);

=item * tickformat

Sets the tick label formatting rule using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add two items to d3's date formatter: *%h* for half of the year as a decimal number as well as *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*

=cut

has tickformat => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the tick label formatting rule using d3 formatting mini-languages which are very similar to those in Python. For numbers, see: https://github.com/d3/d3-format/tree/v1.4.5#d3-format. And for dates see: https://github.com/d3/d3-time-format/tree/v2.2.3#locale_format. We add two items to d3's date formatter: *%h* for half of the year as a decimal number as well as *%{n}f* for fractional seconds with n digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display *09~15~23.46*",
);

=item * ticktext

Sets the text displayed at the ticks position via `tickvals`.

=cut

has ticktext => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the text displayed at the ticks position via `tickvals`.",
);

=item * ticktextsrc

Sets the source reference on Chart Studio Cloud for `ticktext`.

=cut

has ticktextsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `ticktext`.",
);

=item * tickvals

Sets the values at which ticks on this axis appear.

=cut

has tickvals => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Sets the values at which ticks on this axis appear.",
);

=item * tickvalssrc

Sets the source reference on Chart Studio Cloud for `tickvals`.

=cut

has tickvalssrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `tickvals`.",
);

=item * values

Dimension values. `values[n]` represents the value of the `n`th point in the dataset, therefore the `values` vector for all dimensions must be the same (longer vectors will be truncated). Each value must be a finite number.

=cut

has values => (
    is => "rw",
    isa => "ArrayRef|PDL",
    documentation => "Dimension values. `values[n]` represents the value of the `n`th point in the dataset, therefore the `values` vector for all dimensions must be the same (longer vectors will be truncated). Each value must be a finite number.",
);

=item * valuessrc

Sets the source reference on Chart Studio Cloud for `values`.

=cut

has valuessrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `values`.",
);

=item * visible

Shows the dimension when set to `true` (the default). Hides the dimension for `false`.

=cut

has visible => (
    is => "rw",
    isa => "Bool",
    documentation => "Shows the dimension when set to `true` (the default). Hides the dimension for `false`.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
