use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('MarklarChat');
$t->get_ok('/')->status_is(200)->content_like(qr/Hello Marklar/i);

done_testing();
