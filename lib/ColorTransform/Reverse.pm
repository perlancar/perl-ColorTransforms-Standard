package ColorTransform::Reverse;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Color::RGB::Util qw(reverse_rgb_color);

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

    reverse_rgb_color($args{color});
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<Color::RGB::Util>'s C<reverse_rgb_color>
