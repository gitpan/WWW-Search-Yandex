#! /usr/bin/perl
#

use blib;

use Test::More tests => 4;

BEGIN {
    use_ok ("WWW::Search");
    use_ok ("WWW::Search::Yandex")
};

my $srch = new WWW::Search ("Yandex",'charset' => "koi8-r");
ok (defined ($srch),"WWW::Search instance");
# $srch->{'_debug'} = 10;

$srch->native_query ("����� ���������");

my $cnt = 0;
while (my $res = $srch->next_result ()) {
    printf "%2d: %s\n",++$cnt,$res->url ();
}

ok ($cnt > 10,"results count: $cnt");

exit;

# That's all, folks!
