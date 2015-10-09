package MarklarChat;
use Mojo::Base 'Mojolicious';

sub startup {
  my ($self) = @_;

  my $router = $self->routes;

  $router->get('/')->to('index#welcome');
  $router->websocket('/marklar')->to('chat#marklar');
}

1;
