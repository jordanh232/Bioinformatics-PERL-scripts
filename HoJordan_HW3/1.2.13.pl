#!/usr/bin/perl
# Program to check matches

open OUT,'>1.2.13output.txt';

print "Please Input String: ";
$string = <>;
chomp $string;

print OUT "Testing $string for m/TTTACA or M/TATGTT";

if ($string =~ m/TTTACA/ || $string =~ m/TTTACA/ ){
    print "Test for $string Passed\n";
    print OUT "Test for $string Passed\n";
}
else{
    print "Test for $string Failed\n";
    print OUT "Test for $string Failed\n";
}
