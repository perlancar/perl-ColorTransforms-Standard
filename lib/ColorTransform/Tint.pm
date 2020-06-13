package ColorTransform::Tint;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Color::RGB::Util qw(tint_rgb_color);

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Tint color',
    description => <<'_',

Tinting is similar to mixing, but the less luminance the color is the less it is
tinted with the tint color. This has the effect of black color still being black
instead of becoming tinted.

_
    args => {
        color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 0,
        },
        tint_color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 1,
        },
        percent => {
            schema => ['num*', between=>[0,100]],
            default => '50',
        },
    },
    result_naked => 1,
    examples => [
        {
            args => {color=>'ff0000', tint_color=>'00ff00'},
            result  => 'e31b00',
        },
        {
            args => {color=>'000000', tint_color=>'00ff00'},
            result  => '000000',
        },
        {
            args => {color=>'ff0000', tint_color=>'00ff00', percent=>75},
            result  => 'd62800',
        },
    ],
};
sub transform {
    my %args = @_;

    tint_rgb_color($args{color}, $args{tint_color}, ($args{percent} // 50)/100);
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTransform::Darken>

L<ColorTransform::Lighten>

L<Color::RGB::Util>'s C<tint_rgb_color>
