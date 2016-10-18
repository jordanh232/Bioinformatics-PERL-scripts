#!usr/bin/perl
#
open OUT,'>1_6output.txt';
$string = 'SEETQMRLQLKRKLQRNRTSFTQEQIEALEKEFERTHYPDVFARERL';
print OUT "$string\n";
$string =~ tr/ACGPSTWYRNDQEHKILMFV/AAAAAAAAEEEEEEEIIIII/;
print OUT "$string\n";
