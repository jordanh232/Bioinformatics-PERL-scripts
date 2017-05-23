open (OUT, ">perlBlastV1_output.txt");
open (OUT2, ">p.txt");
open INQ, 'genbank.txt';
print "Input the length of the window of \n";
$k = <>;
chomp $k;

$ks = $k;

print "Input the Threshold\n";
$t = <>;
chomp $t;


%kmer = ();                   # This initializes the hash called kmer.
$i = 1;
$dna_ori='';
$/= "";

while($q=<INQ>){
    #chomp $q;
    $q =~s/\n//g;
    #$q =~s/\r//g;
    $dna_ori = $dna_ori . $q;
    while (length($q) >= $k) {
        $q =~ m/(.{$k})/;
        
        if (!defined $kmer{$1}) {     #defined is a function that returns true
            # if a value has already been assigned to
            # $kmer{$1}, otherwise it returns false.
            # the ! character is the negation, so
            # if $kmer{$1} has no value, then it will
            # be assigned the value of $i, the position
            # where the k-mer is first found.
            $kmer{$1} = $i;
        }
        $i++;
        $q = substr($q, 1, length($q) -1);
    }
}
foreach $kmerkey (keys(%kmer)) {
    print "$kmerkey is in position $kmer{$kmerkey}\n";
}

#$dna_ori =~s/\n//g;
#$dna_ori =~s/\r//g;
#print length($dna_ori);
print OUT "$dna_ori\n";
open IN, 'query.txt';


while($s=<IN>){
    #$s =~s/\n//g;
    #$s =~s/\r//g;
    print OUT $s;
    %skmer = ();
    $is = 1;
    %stringhash = ();
    chomp $s;
    $s_ori = $s;
    @Qstring = split(//,$dna_ori);
    @Sstring = split(//,$s_ori);
    
    
    while (length($s) >= $ks){
        $s =~ m/(.{$ks})/;
        if (!defined $skmer{$1}){
            $skmer{$1} = $is;
        }
    
        if (defined $kmer{$1}){
        
        print OUT "match: $1\n";
        
        $posQ = $kmer{$1}-1;
        $posS = $skmer{$1}-1;
        
        $indexQLeft = $posQ;
        $indexSLeft = $posS;
        
        while($indexQLeft > 0 && $indexSLeft > 0){
            if ($Qstring[$indexQLeft-1] eq $Sstring[$indexSLeft-1] ){
                $indexQLeft--;
                $indexSLeft--;
            }else{last;}
        }
    
        $indexQRight = $posQ+($ks-1);
        $indexSRight = $posS+($ks-1);
        
        $maxIndexQ = (@Qstring-1);
        $maxIndexS = (@Sstring-1);
        
            #print "$maxIndexQ\n";
            #print $maxIndexS;
            
            
        while($indexQRight < $maxIndexQ && $indexSRight < $maxIndexS){
            if ($Qstring[$indexQRight+1] eq $Sstring[$indexSRight+1] ){
                $indexQRight++;
                $indexSRight++;
            }else{last;}
        }
         
        $L=($indexQRight - $indexQLeft) + 1;
        if ($L >= $t) {
            $goodMatch= substr($s_ori, $indexSLeft,$L);
            #print $goodMatch;
            if(!defined $stringhash{$goodMatch}) {
                $hashvalue =  $indexQLeft + 1;
                $stringhash{$goodMatch} = $hashvalue;
            }
        }
        
        }
        $is++;
        $s = substr($s, 1, length($s)-1);
    }
foreach $item (keys(%stringhash)){
   print OUT "HSP in Q: $item at position: $stringhash{$item}\n";
}
}
