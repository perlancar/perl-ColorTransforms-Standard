package ColorTransform::DuotoneRandom;

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
    summary => "Random duotone on every program's run",
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
    state $r1 = rand();
    state $g1 = rand();
    state $b1 = rand();
    state $r2 = rand();
    state $g2 = rand();
    state $b2 = rand();
    state $r3 = rand();
    state $g3 = rand();
    state $b3 = rand();

    ColorTransform::Weight::transform(
        color => $args{color},
        r1=>$r1, g1=>$g1, b1=>$b1,
        r2=>$r2, g2=>$g2, b2=>$b2,
        r3=>$r3, g3=>$g3, b3=>$b3,
    );
}

1;
# ABSTRACT:

=head1 SEE ALSO
