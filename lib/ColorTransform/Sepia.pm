package ColorTransform::Sepia;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Color::RGB::Util qw(rgb2sepia);

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Convert to sepia tone',
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

    rgb2sepia($args{color});
}

1;
# ABSTRACT:

=head1 SEE ALSO

L<Color::RGB::Util>'s C<rgb2sepia>
