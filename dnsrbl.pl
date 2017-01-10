#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
use Net::RBLClient;
my $bl = ['ix.dnsbl.manitu.net','zen.spamhaus.org','b.barracudacentral.org','all.s5h.net','dnsbl-1.uceprotect.net','virbl.dnsbl.bit.nl','proxies.blackholes.easynet.nl','cbl.abuseat.org','blackholes.easynet.nl','relays.bl.kundenserver.de','agobot.bl.kundenserver.de'];
my $rbl = Net::RBLClient->new(
    lists => $bl,
    max_time => 5,
    timeout => 1,
    query_txt => 1,
    max_hits => 10,
    server => '8.8.8.8',
);
my $ip = param('ip');
print header(-type  =>  'text/html',
	'X-FRAME-OPTIONS' => 'SAMEORIGIN');
print start_html(-title  =>'IP Blacklist Check',
	-style=>{'src'=>'//cdn.jsdelivr.net/bootstrap/3.3.7/css/bootstrap.min.css'});
print '<div class="container">';
print '<div class="well">';
print h1("Checked IP: $ip");
print '</div>';
my $result = $rbl->lookup($ip);
my @listed_by = $rbl->listed_by;
my @listed_hash = $rbl->listed_hash;
my @listed_txt = $rbl->txt_hash;
 foreach my $list (keys @listed_by){
	print '<div class="alert alert-danger" role="alert">';
	print '<h4>';
        print b($listed_by[$list],": ");
        print p($listed_hash[$list]," ");
        print i($listed_txt[$list]," ");
	print '</h4>';
	print '</div>';
     }
if (! @listed_by) {
	print '<div class="alert alert-success" role="alert">';
	print '<h3>';
	print 'IP not found on blacklist';
	print '</h3>';
	print '</div>';
}
print '</div>';
print end_html;
