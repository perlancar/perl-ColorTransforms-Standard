package ColorTransform::Weight;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Weight each component (R, G, B) of the color',
    description => <<'_',

Weighting is used to create grayscale/sepia/duotone transforms.

See: <http://www.techrepublic.com/blog/howdoi/how-do-i-convert-images-to-grayscale-and-sepia-tone-using-c/120>

_
    args => {
        color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 0,
        },
        r1 => { schema => 'float*', req => 1, pos=>1 },
        g1 => { schema => 'float*', req => 1, pos=>2 },
        b1 => { schema => 'float*', req => 1, pos=>3 },
        r2 => { schema => 'float*', req => 1, pos=>4 },
        g2 => { schema => 'float*', req => 1, pos=>5 },
        b2 => { schema => 'float*', req => 1, pos=>6 },
        r3 => { schema => 'float*', req => 1, pos=>7 },
        g3 => { schema => 'float*', req => 1, pos=>8 },
        b3 => { schema => 'float*', req => 1, pos=>9 },
    },
    result_naked => 1,
    examples => [
    ],
};
sub transform {
    my %args = @_;

    $args{color} =~ /^#?([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})$/o
        or die "Invalid rgb color, must be in 'ffffff' form";
    my $r = hex($1);
    my $g = hex($2);
    my $b = hex($3);

    my $or = ($r*$args{r1}) + ($g*$args{g1}) + ($b*$args{b1});
    my $og = ($r*$args{r2}) + ($g*$args{g2}) + ($b*$args{b2});
    my $ob = ($r*$args{r3}) + ($g*$args{g3}) + ($b*$args{b3});
    for ($or, $og, $ob) { $_ = 255 if $_ > 255 }
    return sprintf("%02x%02x%02x", $or, $og, $ob);
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTransform::Darken>

L<ColorTransform::Lighten>

L<Color::RGB::Util>'s C<tint_rgb_color>
