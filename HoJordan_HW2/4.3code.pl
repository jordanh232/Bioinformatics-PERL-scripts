#!/usr/bin/perl
# Program to check matches

open OUT,'>4.3output.txt';
print "Please Input String: ";
$string = <>;
print OUT "Testing for H(T|V|I)EL";

if ($string =~ m/H(T|V|I)EL/ || $string =~ m/(K|R|H|Q|A)(D|E|N|Q)EL/){
    print "Test $string H(T|V|I)EL or (K|R|H|Q|A)(D|E|N|Q)EL Passed\n";
    print OUT "Test $string H(T|V|I)EL or (K|R|H|Q|A)(D|E|N|Q)EL Passed\n";
}
else{
    print "Test $string H(T|V|I)EL or (K|R|H|Q|A)(D|E|N|Q)EL Failed\n";
    print OUT "Test $string H(T|V|I)EL or (K|R|H|Q|A)(D|E|N|Q)EL Failed\n";
}


