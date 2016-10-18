#!/usr/bin/perl
# Program to check matches

open OUT,'>4.2output.txt';
print "Please Input String: ";
$string = <>;
print OUT "Testing (TA)+GG";

if ($string =~ m/(TA)+GG/){
    print OUT "Test $string (TA)+GG Passed\n";
}
else{
    print OUT "Test $string (TA)+GG Failed\n";
}

