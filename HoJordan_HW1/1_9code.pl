#!usr/bin/perl
#
open OUT,'>1_9output.txt';
print "Enter a DNA sequence: ";
print OUT "Enter a DNA sequence: ";
$string= <STDIN>;
print OUT $string;
$purine = $string =~ tr/AGag/AGag/;
$pyramydine = $string =~ tr/CTct/CTct/;
print OUT "Purine Count: $purine\n";
print OUT "Pyramydine Count: $pyramydine\n"; 
