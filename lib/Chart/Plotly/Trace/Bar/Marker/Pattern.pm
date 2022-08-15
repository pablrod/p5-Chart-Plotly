package Chart::Plotly::Trace::Bar::Marker::Pattern;
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

=item * bgcolor

When there is no colorscale sets the color of background pattern fill. Defaults to a `marker.color` background when `fillmode` is *overlay*. Otherwise, defaults to a transparent background.

=cut

has bgcolor => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "When there is no colorscale sets the color of background pattern fill. Defaults to a `marker.color` background when `fillmode` is *overlay*. Otherwise, defaults to a transparent background.",
);

=item * bgcolorsrc

Sets the source reference on Chart Studio Cloud for `bgcolor`.

=cut

has bgcolorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `bgcolor`.",
);

=item * description


=cut

has description => (
    is => "ro",
    default => "Sets the pattern within the marker.",
);

=item * fgcolor

When there is no colorscale sets the color of foreground pattern fill. Defaults to a `marker.color` background when `fillmode` is *replace*. Otherwise, defaults to dark grey or white to increase contrast with the `bgcolor`.

=cut

has fgcolor => (
    is => "rw",
    isa => "Str|ArrayRef[Str]",
    documentation => "When there is no colorscale sets the color of foreground pattern fill. Defaults to a `marker.color` background when `fillmode` is *replace*. Otherwise, defaults to dark grey or white to increase contrast with the `bgcolor`.",
);

=item * fgcolorsrc

Sets the source reference on Chart Studio Cloud for `fgcolor`.

=cut

has fgcolorsrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `fgcolor`.",
);

=item * fgopacity

Sets the opacity of the foreground pattern fill. Defaults to a 0.5 when `fillmode` is *overlay*. Otherwise, defaults to 1.

=cut

has fgopacity => (
    is => "rw",
    isa => "Num",
    documentation => "Sets the opacity of the foreground pattern fill. Defaults to a 0.5 when `fillmode` is *overlay*. Otherwise, defaults to 1.",
);

=item * fillmode

Determines whether `marker.color` should be used as a default to `bgcolor` or a `fgcolor`.

=cut

has fillmode => (
    is => "rw",
    isa => enum(["replace","overlay"]),
    documentation => "Determines whether `marker.color` should be used as a default to `bgcolor` or a `fgcolor`.",
);

=item * shape

Sets the shape of the pattern fill. By default, no pattern is used for filling the area.

=cut

has shape => (
    is => "rw",
    isa => union([enum(["","/","\\","x","-","|","+","."]), "ArrayRef"]),
    documentation => "Sets the shape of the pattern fill. By default, no pattern is used for filling the area.",
);

=item * shapesrc

Sets the source reference on Chart Studio Cloud for `shape`.

=cut

has shapesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `shape`.",
);

=item * size

Sets the size of unit squares of the pattern fill in pixels, which corresponds to the interval of repetition of the pattern.

=cut

has size => (
    is => "rw",
    isa => "Num|ArrayRef[Num]",
    documentation => "Sets the size of unit squares of the pattern fill in pixels, which corresponds to the interval of repetition of the pattern.",
);

=item * sizesrc

Sets the source reference on Chart Studio Cloud for `size`.

=cut

has sizesrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `size`.",
);

=item * solidity

Sets the solidity of the pattern fill. Solidity is roughly the fraction of the area filled by the pattern. Solidity of 0 shows only the background color without pattern and solidty of 1 shows only the foreground color without pattern.

=cut

has solidity => (
    is => "rw",
    isa => "Num|ArrayRef[Num]",
    documentation => "Sets the solidity of the pattern fill. Solidity is roughly the fraction of the area filled by the pattern. Solidity of 0 shows only the background color without pattern and solidty of 1 shows only the foreground color without pattern.",
);

=item * soliditysrc

Sets the source reference on Chart Studio Cloud for `solidity`.

=cut

has soliditysrc => (
    is => "rw",
    isa => "Str",
    documentation => "Sets the source reference on Chart Studio Cloud for `solidity`.",
);

=pod

=back

=cut


__PACKAGE__->meta->make_immutable();
1;
