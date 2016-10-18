#generate a random DNA strings and print it to file specified by the user.
#use diagnostics;
open (OUT, ">6.2output.txt");
print "How many nucleotides for each string?\n";
$n = <>;

$numstring = ''; # start with the empty string;

$s=0;
$trials=100;



$w = 0;
while ($w < $n) {

    $numstring = int(rand(4)) . $numstring;     # generate a new random integer
                                                    # between 0 and 3, and concatenate
                                                    # it with the existing $numstring,
                                                    # assigning the result to $numstring.
    $w++;                                       # increase the value of $i by one.
}
    
$dnastring = $numstring;                  # unneeded, but good for clarity.
$dnastring =~ tr/0123/actg/; # translate the numbers to DNA characters.
@string1 = split(//, $dnastring);
#print "@string1\n";

for ($f=0; $f<$trials; $f++){
    
    $numstring = '';
    $w = 0;
    while ($w < $n) {
        
        $numstring = int(rand(4)) . $numstring;     # generate a new random integer
        # between 0 and 3, and concatenate
        # it with the existing $numstring,
        # assigning the result to $numstring.
        $w++;                                       # increase the value of $i by one.
    }
    
    $dnastring = $numstring;                  # unneeded, but good for clarity.
    $dnastring =~ tr/0123/actg/; # translate the numbers to DNA characters.
    @string2 = split(//, $dnastring);
    #print "@string2\n";
    
    
        $V[0][0] = 0;                  # Assign the 0,0 entry of the V matrix
    
        for ($i = 1; $i <= $n; $i++) { # Assign the column 0  values and print
            # String 1  See section 5.2 of Johnson
            # for loops
            $V[$i][0] = 0;
            #$V[$i][0] = $i;
        }
    
        
        for ($j = 1; $j <= $n; $j++) { # Assign the row 0 values and print String 2
            $V[0][$j] = 0;
            #print OUT "$string2[$j-1]";
        }
        
        for ($i = 1; $i <= $n; $i++) {      # follow the recurrences to fill in the V matrix.
            for ($j = 1; $j <= $n; $j++) {
                #   print OUT "$string1[$i-1], $string2[$j-1]\n"; # This is here  for debugging purposes.
                if ($string1[$i-1] eq $string2[$j-1]) {
                    $t = 1; }
                else {
                    $t = 0;
                }
                
                $max = $V[$i-1][$j-1] + $t;
                #  print OUT "For $i, $j, t is $t \n"; # Another debugging line.
                if ($max < $V[$i][$j-1] - 0) {
                    $max = $V[$i][$j-1] - 0;
                }
                
                if ($V[$i-1][$j] - 0 > $max) {
                    $max = $V[$i-1][$j] - 0;
                }
                $V[$i][$j] = $max; 
                #print OUT "V[$i][$j] has value $V[$i][$j]\n";
            }
        }
        $averageLCS = $averageLCS + $V[$n][$n];

}
    
    $averageLCS = $averageLCS/($trials - 1);
print $averageLCS;
    print OUT $averageLCS;

