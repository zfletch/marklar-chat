package MarklarChat::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';

sub welcome {
  my ($self) = @_;

  $self->render;
}

1;
