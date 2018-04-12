#!/usr/local/bin/perl

#variable used to determine when the user wants to quit
$keep_looping = "y";

#keep choosing random numbers as long as they want to
while($keep_looping eq "y"){
    #If we've already got a range, don't bother getting it again.
    for($i = 0; ($i <= 1) && ($range[$i] == null); $i++){

        #Get the generator range; If it wasn't passed as an argument,
        #prompt the user.
        if($ARGV[$i] == null){
            print "Enter the ", ($i==0)?"lowest":"highest", " number: ";
            $range[$i] = <STDIN>;
            chomp $range[$i];
        }else{
            $range[$i] = $ARGV[$i];
        }

        #if($i == 0){
            ##Subtract 1 to allow the low number
            #$range[0] -= 1;
        #}else{
            ##Add 1 to allow the high number
            #$range[1] += 1;
        #}
    }

    #Figure out the actual range
    $range[2] = $range[1] - $range[0];

    print "Picking a random number between ", $range[0], " and ", $range[1], "\n";

    my $random_number = int(rand($range[2])) + $range[0];
    print $random_number, "\n";

    print "Another number? (Y/N)";
    $keep_looping = lc(<STDIN>);
    chomp $keep_looping;
}
