#!/usr/bin/perl
# Program to check matches

open OUT,'>1.2.14output.txt';

print "Please Input String: ";
$string = <>;

if ($string =~ m/TATA[AT]A[AT][ATCG]{17}[CT]{2}CA[AG]{2}/){
    print "Test for $string Passed\n";
    print OUT "Test for $string Passed\n";
}
else{
    print "Test for $string Failed\n";
    print OUT "Test for $string Failed\n";
}
