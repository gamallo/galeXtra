#!/usr/bin/perl -w

#$file = shift(@ARGV);

#open (FILE, $file) or die "O ficheiro não pode ser aberto: $!\n";


while (<>) {
     chop($_);
      if ( ($_ eq "") || ($_ =~ /^<[^ ]*>$/) ) {
      next
    }


    else {
     ($pal, $tag, $lema) = split("\t", $_);
     	if ( ($tag eq "DT") || ($tag eq "PDT") ||
             ( $tag =~ /^DET/) ) {
         }
	elsif ($lema eq "<unknown>") {
	    $lema = $pal;
          printf "%s\t%s\t%s\n", $pal, $tag, $lema;	
	} 
	elsif ($lema eq "\@card\@") {
	    $tag = "CARD";
          printf "%s\t%s\t%s\n", $pal, $tag, $lema;	
	} 
        #os numerais que nao sao numeros sao quase sempre determinantes
        elsif ( ($tag eq "CD") || ($tag eq "NUM") ) {
        }
	elsif ($lema eq "du") {
	    $lema = "de";
          printf "%s\t%s\t%s\n", $pal, $tag, $lema;	
	} 	
	elsif ($lema eq "au") {
	    $lema = "à";
          printf "%s\t%s\t%s\n", $pal, $tag, $lema;	
	}


 	else {
         printf  "%s\t%s\t%s\n", $pal, $tag, $lema;

	}
     }

}
	

#close FILE;

