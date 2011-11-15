use strict;
use warnings;

BEGIN {
    use Test::Mock::Apache2 { SomeConfig => 42, OtherConfig => 'foo' };
}

use Test::More tests => 10;

my $u = Apache2::RequestUtil->new();
ok($u, 'Apache2::RequestUtil->new returns something');
isa_ok($u, 'Apache2::RequestUtil', '... an Apache2::RequestUtil object');
ok($u->dir_config("SomeConfig"), "SomeConfig exists");
is($u->dir_config("SomeConfig"), 42, "SomeConfig is 42");
is($u->dir_config("OtherConfig"), 'foo', "OtherConfig is 'foo'");

# $r->dir_config should also work
my $r = $u->request();
ok($r, 'Apache2::RequestUtil->request() returns something');
isa_ok($r, 'Apache2::RequestRec');
ok($r->dir_config("SomeConfig"), "SomeConfig exists");
is($r->dir_config("SomeConfig"), 42, "SomeConfig is 42");
is($r->dir_config("OtherConfig"), 'foo', "OtherConfig is 'foo'");

# Fin

