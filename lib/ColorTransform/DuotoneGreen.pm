package ColorTransform::DuotoneGreen;

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
    summary => 'Green duotone',
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
        r1 => 0.4, g1 => 0.3, b1 => 0.2,
        r2 => 0.3, g2 => 0.8, b2 => 0.4,
        r3 => 0.3, g3 => 0.5, b3 => 0.1,
    );
}

1;
# ABSTRACT:

=head1 SEE ALSO
