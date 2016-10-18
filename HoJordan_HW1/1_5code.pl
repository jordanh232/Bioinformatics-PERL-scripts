#!usr/bin/perl
#
open OUT,'>1_5output.txt';
$string = 'VRNrIAEelslrrFMVALILdIKrTPgNKPriaemICDIDtYIvEa';
$string =~ tr/A-Za-z/a-zA-z/;
print OUT $string;

