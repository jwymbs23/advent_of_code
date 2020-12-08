#!/usr/bin/env perl

use v5.10.0;
use warnings;


my $filename = 'input_3';

open(FH, '<', $filename) or die $!;

@idx = (0,0,0,0,0);
@hits = (0,0,0,0,0);

# rules
@right = (1,3,5,7,1);
@down = (1,1,1,1,2);

@a = (0..4);

$row = 0;
while(<FH>){


    for $i (@a){

	if ($down[$i] == 1){
	    #print $down[$i];

	    $hit = substr($_, $idx[$i], 1);
	    #print $hit;
	    if ($hit eq "#"){
		$hits[$i] = $hits[$i] + 1
	    }
	    
	    $idx[$i] = ( $idx[$i] + $right[$i] ) % (length($_)-1);

	}
	else {
	    
	    if ($row == 0){
                $hit = substr($_, $idx[$i], 1);
                if ($hit eq "#"){
                    $hits[$i] = $hits[$i] + 1
                }
		
                $idx[$i] = ( $idx[$i] + $right[$i] ) % (length($_)-1);
		
	    }
	    elsif ($row % ($down[$i]) == 0) {
		$hit = substr($_, $idx[$i], 1);
		if ($hit eq "#"){
		    $hits[$i] = $hits[$i] + 1
		}
		
		$idx[$i] = ( $idx[$i] + $right[$i] ) % (length($_)-1);
	    }
	    
	}

	


    }
    $row = $row + 1;

      
    #$idx = ($idx + 3) % (length($_)-1);
}

close(FH);

print $hits;
print "\n";
print $hits[0];
print "\n";
print $hits[1];
print "\n";
print $hits[2];
print "\n";
print $hits[3];
print "\n";
print $hits[4];
print "\n";
print $hits[5];
print "\n";
my $score = 1; #Need to initialize to 1 for multiplying
foreach $element (@hits) {
    $score *= $element;
}
print $score;
print "\n";
