#!/usr/bin/perl
# Program to check matches

open OUT,'>4.5output.txt';

print "Please Input String: ";
$varstring = <>;
print OUT "Testing $varstring";

$varstring =~ s/(CA){5}(CA)*/X/g;
print OUT "Output: $varstring";
print $varstring;
