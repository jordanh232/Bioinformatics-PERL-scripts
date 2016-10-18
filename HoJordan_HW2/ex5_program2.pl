#!/usr/bin/perl -w
#dg
#this reads in the first line from testfile and tests to see if
#the line contains what looks like a dna sequence of length at least three,
#either at the start of the line, or prepended by a space or an
# = or a >.
#If it does, then it prints the sequence
#else it prints a message that the line contains no sequence.
#At the end it prints the original sequence to show that is has
#not been modified. Make a file called testfile and try the
#program out. Change the contents of testfile to try different
#conditions. The straight line | in a regular expression is
# an OR. 

$file = 'ex5_testfile.txt';
open (INFO, $file);
open OUT,'> ex5.program2.output.txt';

$line = <INFO>;

if ($line =~ m/(^| |=|>)([atcgATCG]{3,})/ ) {
    print OUT "The input line does contain what looks like a dna sequence of length at least three, and it is $2 \n";
    print "The input line does contain what looks like a dna sequence of length at least three, and it is $2 \n";
}
else  {
    print OUT "The input line does not contain a dna sequence\n";
    print "The input line does not contain a dna sequence\n";
}
print OUT "The input line is \n$line\n";
print "The input line is \n$line\n";
