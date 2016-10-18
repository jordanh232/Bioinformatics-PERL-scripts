#!usr/bin/perl
#
open OUT,'>1_4output.txt';
$silly = 'tttTTT';
$silly =~ tr/tT/Tt/;
print OUT $silly;
