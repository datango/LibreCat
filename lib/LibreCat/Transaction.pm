package LibreCat::Transaction;

use Catmandu::Sane;
use Catmandu;
use Moo::Role;
use namespace::clean;

sub transaction {
    Catmandu->store('main')->transaction($_[1]);
}

sub tx {
    $_[0]->transaction($_[1]);
}

sub in_transaction {
    Catmandu->store('main')->_in_transaction;
}

sub in_tx {
    $_[0]->in_transaction;
}

1;

__END__

=pod

=head1 NAME

LibreCat::Transaction - Role that provides transactions.

=head1 METHODS

=head2 transaction($cb)

Execute C<$cb> within a transaction. If C<$cb> dies, all database changes will be rolled back.

    # foo will not be stored
    $self->transaction(sub {
        $self->store_foo;
        die 'aargh';
        $self->store_bar;
    });

Nested transactions will be subsumed into the parent transaction.

=head2 tx($cb)

Alias for transaction.

=cut
