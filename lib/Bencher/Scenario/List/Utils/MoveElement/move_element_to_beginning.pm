package Bencher::Scenario::List::Utils::MoveElement::move_element_to_beginning;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

our $scenario = {
    summary => "Benchmark move_to_beginning()",
    participants => [
        {fcall_template=>'List::Utils::MoveElement::move_element_to_beginning(<i>, @{<array>})', result_is_list=>1},
        {fcall_template=>'List::Utils::MoveElement::PP::to_beginning(<i>, @{<array>})', result_is_list=>1},
        {fcall_template=>'List::Utils::MoveElement::Splice::to_beginning_copy(<i>, @{<array>})', result_is_list=>1},
        {fcall_template=>'List::Utils::MoveElement::Splice::to_beginning_nocopy(<i>, @{<array>})', result_is_list=>1},
    ],
    datasets => [
        {name=>'a1_1'       , args=>{i=>1, array=>[qw/a b/]}, result=>[qw/b a/]},
        {name=>'a5_10'      , args=>{i=>5, array=>[(('a') x 5), 'b', (('a') x 4)]}, result=>['b', (('a') x 9)]},
        {name=>'a500_1000'  , args=>{i=>500, array=>[(('a') x 500), 'b', (('a') x 499)]}, result=>['b', (('a') x 999)]},
        {name=>'a5000_10000', args=>{i=>5000, array=>[(('a') x 5000), 'b', (('a') x 4999)]}, result=>['b', (('a') x 9999)]},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

Using copy+splice+unshift (L<List::Utils::MoveElement::Splice>) is faster. And
we can get significantly faster still with larger list by avoiding copying
C<@_>.
