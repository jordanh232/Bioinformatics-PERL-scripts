#!/usr/bin/perl
#
open OUT, '>1_3output.txt';
$nucstring  = 'acCuagGgCCUUAcga';
print OUT "$nucstring \n";
$nucstring =~ tr/uU/tT/;
print OUT "$nucstring \n";
