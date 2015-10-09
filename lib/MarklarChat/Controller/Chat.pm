package MarklarChat::Controller::Chat;
use Mojo::Base 'Mojolicious::Controller';

my %connections;

sub marklar {
  my ($self) = @_;

  $self->inactivity_timeout(300);

  my $key = $self->tx->connection;
  $connections{$key} = $self;

  $self->on(message => sub {
    my ($c, $msg) = @_;
    $_->send($msg) for (values %connections);
  });

  $self->on(finish => sub {
    my ($c, $code, $reason) = @_;
    delete $connections{$key};
  });
}

1;

