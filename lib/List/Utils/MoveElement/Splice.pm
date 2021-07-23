package List::Utils::MoveElement::Splice;

# AUTHORITY
# DATE
# DIST
# VERSION

sub to_beginning_copy {
    my ($i, @ary) = @_;
    # XXX some sanity checks
    return @ary if $i == 0; # no-op
    my $el = splice @ary, $i, 1;
    unshift @ary, $el;
    @ary;
}

sub to_beginning_nocopy {
    my $i = shift;
    # XXX some sanity checks
    return @_ if $i == 0; # no-op
    my $el = splice @_, $i, 1;
    unshift @_, $el;
    @_;
}

1;
# ABSTRACT: A variant of List::Utils::MoveElement that uses splice()

=for Pod::Coverage ^(.+)$
