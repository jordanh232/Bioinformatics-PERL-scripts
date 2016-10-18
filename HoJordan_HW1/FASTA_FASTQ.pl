#read from a file and output fastq file from fasta file

open IN, 'return.fasta';
open OUT, '>return.fastq';

$newline = NULL;
$firstline = NULL;

while ($newline = <IN>){
    $newline =~ tr/>/@/;
    print OUT $newline;
    $firstline = $newline;
    $newline = <IN>;
    print OUT $newline;
    $DNA = $newline;
    $firstline =~ tr/@/+/;
    print OUT $firstline;
    $DNA =~ tr/ATCG/X/;
    print OUT $DNA;
}

close(IN);
close(OUT);
