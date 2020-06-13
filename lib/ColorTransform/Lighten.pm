package ColorTransform::Lighten;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Color::RGB::Util qw(mix_2_rgb_colors);

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Lighten color',
    description => <<'_',

Lightening is done by mixing the input color with white (ffffff).

_
    args => {
        color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 0,
        },
        percent => {
            schema => ['num*', between=>[0,100]],
            default => '50',
        },
    },
    result_naked => 1,
    examples => [
        {
            args => {color=>'800000'},
            result  => 'bf7f7f',
        },
        {
            args => {color=>'800000', percent=>75},
            result  => 'dfbfbf',
        },
    ],
};
sub transform {
    my %args = @_;

    mix_2_rgb_colors($args{color}, 'ffffff', ($args{percent} // 50)/100);
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTransform::Lighten>

L<ColorTransform::Tint>
