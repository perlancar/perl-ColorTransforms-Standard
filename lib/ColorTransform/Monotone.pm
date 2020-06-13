package ColorTransform::Monotone;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Color::RGB::Util qw(rgb2hsv hsv2rgb);

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Monotone color',
    description => <<'_',

Change the hue of color to a single value. By default, a red monotone (hue=0) is
produced. You can configure the `hue` option (0-360) to produce monotone of
other hues, e.g. green (120) or blue (240).

_
    args => {
        color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 0,
        },
        hue => {
            schema => ['num*', between=>[0,360]],
            default => '0',
        },
    },
    result_naked => 1,
    examples => [
    ],
};
sub transform {
    my %args = @_;

    my $hsv = rgb2hsv($args{color});
    my ($h, $s, $v) = split / /, $hsv;
    $h = $args{hue} // 0;
    hsv2rgb("$h $s $v");
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTransform::Grayscale>
