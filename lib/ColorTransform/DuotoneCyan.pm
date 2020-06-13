package ColorTransform::DuotoneCyan;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use ColorTransform::Weight ();

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Cyan duotone',
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

    ColorTransform::Weight::transform(
        color => $args{color},
        r1 => 0.1, g1 => 0.3, b1 => 0.1,
        r2 => 0.2, g2 => 0.5, b2 => 0.3,
        r3 => 0.4, g3 => 0.7, b3 => 0.3,
    );
}

1;
# ABSTRACT:

=head1 SEE ALSO
