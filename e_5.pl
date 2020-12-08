#!/usr/bin/env perl

use v5.10.0;
use warnings;


my $filename = 'input_3';

open(FH, '<', $filename) or die $!;

$idx = 0;
$hits = 0;
while(<FH>){

    $hit = substr($_, $idx, 1);

    if ($hit eq "#"){
	$hits = $hits + 1
    }
    $idx = ($idx + 3) % (length($_)-1);
}

close(FH);

print $hits;
print "\n";
