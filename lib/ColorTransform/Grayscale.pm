package ColorTransform::Grayscale;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Color::RGB::Util qw(rgb2grayscale);

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Convert to grayscale',
    description => <<'_',
_
    args => {
        color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 0,
        },
    },
    result_naked => 1,
    examples => [
    ],
};
sub transform {
    my %args = @_;

    rgb2grayscale($args{color});
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<ColorTransform::Monotone>

L<Color::RGB::Util>'s C<rgb2grayscale>
