package App::Search;

use Catmandu::Sane;
use Dancer qw/:syntax/;
use App::Helper;

use App::Search::Route::api;
#use App::Search::Route::award;
use App::Search::Route::person;
use App::Search::Route::mark;
#use App::Search::Route::project;
use App::Search::Route::publication;
use App::Search::Route::thumbnail;
use App::Search::Route::uri;
use App::Search::Route::unapi;
use App::Search::Route::directoryindex;

get '/' => sub {
    template '/websites/index_publication.tt', {bag => "home"};
};

1;
