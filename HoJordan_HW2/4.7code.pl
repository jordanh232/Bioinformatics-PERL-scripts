#!/usr/bin/perl
# Program to check matches

open OUT,'>4.7output.txt';

print "Please Input String: ";
$string = <>;
print OUT "Testing for GCC[ATCG]{5}GGC\n";

if ($string =~ m/GCC[ATCG]{5}GGC/){
    print "Test for $string Passed\n";
    print OUT "Test for $string Passed\n";
}
else{
    print "Test for $string Failed\n";
    print OUT "Test for $string Failed\n";
}


