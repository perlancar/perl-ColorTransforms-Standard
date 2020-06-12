package ColorTransform::Darken;

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
    summary => 'Darken color',
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
            args => {color=>'ff0000'},
            result  => '7f0000',
        },
        {
            args => {color=>'ff0000', percent=>75},
            result  => '3f0000',
        },
    ],
};
sub transform {
    my %args = @_;

    mix_2_rgb_colors($args{color}, '000000', ($args{percent} // 50)/100);
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTransform::Lighten>
