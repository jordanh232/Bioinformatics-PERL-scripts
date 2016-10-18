#!/usr/bin/perl
# Program to check matches

open OUT,'>4.1output.txt';
print "Please Input String1: ";
$string1 = <>;
print "Please Input String2: ";
$string2 = <>;

#Testing Test TA*GG
print "Test TA+GG\n";
print OUT "Test TA+GG\n";

if ($string1 =~ m/TA+GG/){
    print OUT "Test $string1 TA+GG Passed\n";
    print "Test $string1 TA+GG Passed\n";
}
else{
    print OUT "Test $string1 TA+GG Failed\n";
    print "Test $string1 TA+GG Failed\n";
}

if ($string2 =~ m/TA+GG/){
    print OUT "Test $string2 TA+GG Passed\n";
    print "Test $string2 TA+GG Passed\n";
}
else{
    print OUT "Test $string2 TA+GG Failed\n";
    print "Test $string2 TA+GG Failed\n";
}

#Testing Test TA*GG
print "Test TA+GG\n";
print OUT "Test TA*GG\n";

if ($string1 =~ m/TA*GG/){
    print OUT "Test $string1 TA*GG Passed\n";
    print "Test $string1 TA*GG Passed\n";
}
else{
    print OUT "Test $string1 TA*GG Failed\n";
    print "Test $string1 TA*GG Failed\n";
}

if ($string2 =~ m/TA*GG/){
    print OUT "Test $string2 TA*GG Passed\n";
    print "Test $string2 TA*GG Passed\n";
}
else{
    print OUT "Test $string2 TA*GG Failed\n";
    print "Test $string2 TA*GG Failed\n";
}
