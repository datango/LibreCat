package Mojolicious::Plugin::LibreCat::Api;

use Catmandu::Sane;
use LibreCat -self;
use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app, $conf) = @_;

    my $models = librecat->models;
    my $r = $app->routes;

    $r->add_shortcut(
        librecat_api => sub {
            my ($r, $model) = @_;

            my $model_api = $r->any("/api/$model")->to('api#', model => $model);

            $model_api->get('/:id')->to('#show', model => $model)->name($model);

            $model_api->delete('/:id')->to('#remove', model => $model)->name($model);

            $model_api->put('/:id')->to('#create', model => $model)->name($model);

            $model_api->post->to('#add', model => $model)->name($model);

            return $model_api;
        }
    );

    $r->librecat_api($_) for @$models
}

1;

__END__

=pod

=head1 NAME

Mojolicious::Plugin::LibreCat::Api - Routes

=head2



=cut