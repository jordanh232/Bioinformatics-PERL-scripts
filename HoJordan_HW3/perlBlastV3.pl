open (OUT, ">perlBlastV3_output.txt");
open INQ, 'genbank.txt';
print "Input the length of the window\n";
$k = <>;
chomp $k;

$ks = $k;

print "Input the Threshold\n";
$t = <>;
chomp $t;

%kmer = ();                   # This initializes the hash called kmer.
$i = 1;
$dna_ori;
$count = 0;
$/= "";
while($q = <INQ>){
    $count ++;
    $q =~s/\n//g;
    $q =~s/\r//g;
    print OUT "$q\n";
    $dna_ori = $q;
    while (length($q) >= $k) {
        $q =~ m/(.{$k})/;
        
        if (!defined $kmer{$1}) {     #defined is a function that returns true
            # if a value has already been assigned to
            # $kmer{$1}, otherwise it returns false.
            # the ! character is the negation, so
            # if $kmer{$1} has no value, then it will
            # be assigned the value of $i, the position
            # where the k-mer is first found.
            #$kmer{$1}=$i;
            $kmer{$1} = [$i];
        }
        else{
            push (@{$kmer{$1}}, $i);
        }
        
        $i++;
        $q = substr($q, 1, length($q) -1);
    }
}
foreach $kmerkey (sort keys(%kmer)) {
    $occrs = join(', ' , @{$kmer{$kmerkey}});
    print OUT "The occurrences of string $kmerkey are in positions $occrs \n";
}


    
open IN, 'query.txt';

$/= "";
while($s=<IN>){
    %skmer = ();
    $is = 1;
    %stringhash = ();
    $s =~s/\n//g;
    $s =~s/\r//g;
    print OUT "$s\n";
    $s_ori = $s;
    @Qstring = split(//,$dna_ori);
    @Sstring = split(//,$s_ori);
    
    
    while (length($s) >= $ks){
        $s =~ m/(.{$ks})/;
        if (!defined $skmer{$1}){
            #$skmer{$1}=$is;
            $skmer{$1} = [$is];        }
        else{
            push (@{$skmer{$1}}, $is);
        }

    
        if (defined $kmer{$1}){
            for $j ( 0 .. $#{ $kmer{$1} } ) {
                print OUT "match: $1\n";
        
                $posQ = $kmer{$1}[$j]-1;
                $posS = $is-1;
        
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
        
                #print $maxIndexQ;
                #print $maxIndexS;
        
                while($indexQRight < $maxIndexQ && $indexSRight < $maxIndexS){
                    if ($Qstring[$indexQRight+1] eq $Sstring[$indexSRight+1] ){
                        $indexQRight++;
                        $indexSRight++;
                    }else{last;}
                }
                #print $indexSRight;
                #print $indexQLeft;
                
                $L=($indexQRight - $indexQLeft+1);
                if ($L >= $t) {
                    $goodMatch= substr($s_ori, $indexSLeft,$L);
                    print $goodMatch;
                    if(!defined $stringhash{$goodMatch}) {
                        $hashvalue =  $indexQLeft+1;
                        $stringhash{$goodMatch} = [$hashvalue];
                    }
                    else{
                        $hashvalue = $indexQLeft + 1;
                        $flag = 0;
                        for $t ( 0 .. $#{ $stringhash{$goodMatch} } ) {
                            if ($stringhash{$goodMatch}[$t] == $hashvalue)
                            {
                                $flag = 1;
                            }
                        }
                        if ($flag == 0){
                        push (@{stringhash{$goodMatch}}, $hashvalue);
                        }
                    }
                }
        
            }
        }
            $is++;
            $s = substr($s, 1, length($s)-1);
    }

    my $length = 0;
    my $result;
    foreach $Skey (sort keys(%stringhash)) {
        $oc = join(', ' , @{$stringhash{$Skey}});
            print OUT "HSP in Q: $Skey at positions $oc \n";
        if ($length < length ($Skey)){
            $result = $Skey;
            $length = length ($Skey);
        }
    }
    print OUT "The Longest string is $result with length $length\n";
}
