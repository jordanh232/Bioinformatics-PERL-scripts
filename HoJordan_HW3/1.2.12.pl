#!/usr/bin/perl
# Program to check matches

open OUT,'>1.2.12output.txt';

print "Please Input String: ";
$string = <>;
chomp $string;

print OUT "Testing $string for m/TTGACA(A|T|C|G){18}TATATT/";

if ($string =~ m/TTGACA(A|T|C|G){18}TATATT/ ){
    print "Test for $string Passed\n";
    print OUT "Test for $string Passed\n";
}
else{
    print "Test for $string Failed\n";
    print OUT "Test for $string Failed\n";
}

