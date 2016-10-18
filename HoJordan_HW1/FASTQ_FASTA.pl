#!usr/bin/perl
#
open IN, 'sample.fastq';
open OUT,'>return.fasta';

$newline = NULL;

while ($newline = <IN>){
    $newline =~ tr/@/>/;
    print OUT "$newline";
    $newline = <IN>;
    print OUT $newline;
    $newline = <IN>;
    $newline = <IN>;
}
close(IN);
close(OUT);


 
