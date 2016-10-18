#!/usr/bin/perl
#
open OUT,'>1_8output.txt';
print "Enter a DNA sequence\n";
print OUT "Enter a DNA sequence\n";
$input =<STDIN>;
print OUT $input;
$input =~ tr/ATCGatcg/TAGCtagc/;
print OUT "$input\n";
