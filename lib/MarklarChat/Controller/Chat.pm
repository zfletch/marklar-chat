package MarklarChat::Controller::Chat;
use Mojo::Base 'Mojolicious::Controller';

use lib "lib";
use Marklarizer qw(marklarize_text);

my %connections;

sub marklar {
  my ($self) = @_;

  $self->inactivity_timeout(300);

  my $key = $self->tx->connection;
  $connections{$key} = $self;

  $self->on(message => sub {
    my ($c, $msg) = @_;

    my $debug = Marklarizer::readable_non_marklar($msg);
    $msg = Marklarizer::marklarize_text($msg);
    $_->send({ json => { msg => $msg, uid => $key, debug => $debug } }) for (values %connections);
  });

  $self->on(finish => sub {
    my ($c, $code, $reason) = @_;

    delete $connections{$key};
  });
}

1;
