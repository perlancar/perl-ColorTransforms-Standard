package ColorTransform::Noop;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict 'subs', 'vars';
use warnings;

our %SPEC;

$SPEC{transform} = {
    v => 1.1,
    summary => 'Return color as-is',
    args => {
        color => {
            schema => 'color::rgb24*',
            req => 1,
            pos => 0,
        },
    },
    result_naked => 1,
    examples => [
        {
            args => {color=>'ff0000'},
            result  => 'ff0000',
        },
    ],
};
sub transform {
    my %args = @_;

    $args{color};
}

1;
# ABSTRACT:

=head1 SEE ALSO
