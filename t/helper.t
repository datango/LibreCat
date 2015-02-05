use strict;
use warnings;
use Test::More;
use Catmandu;
use Data::Dumper;
use App::Helper;

my $p = {
    "deeply.nested.hash" => "Value",
    "some.array.0.key"   => "Here we go!",
    "untouched"          => "ok",
    "empty" => '',
};
$p->{"not_defined"} = undef;

is_deeply(
    h->nested_params($p),
    {   untouched => "ok",
        deeply    => { nested => { hash => "Value" } },
        some      => { array => [ { key => "Here we go!" } ] },
    },
    "nested params ok"
);


is h->generateURN('urn:nbn:de:0070-pub-','2508111'), 'urn:nbn:de:0070-pub-25081113';

done_testing;
