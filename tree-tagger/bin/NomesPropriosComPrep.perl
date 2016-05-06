#!/usr/bin/perl

# IDENTIFICA EXPRESSOES DE TAMANHO N QUE COMEÇAM POR MAJUSCULA
#lê um texto .txt
# gera o mesmo texto .txt onde as expressoes identificadas são colocadas numa string com o conector "&".
# o argumento é o tamanho máximo dos n-gramas que devem ter as expressões identificadas (valor recomendado: 4)
 

$N = shift(@ARGV);  ##valor recomendado: 4


$UpperCase = "[A-Z\ÁÉÍÓÚÀÈÌÒÙçÃẼÑ]" ;
$LowerCase = "[a-záéíóúàèìòùçãõñ]" ;
$Separador = "[\.\,\;\:\«\»\&\%\+\=\$\(\)\<\>\!\¡\?\¿\\[\\]\*]";
$Prep = "d[aeou](s?)" ;

$ContarCandidatos = 0;
while ($line = <STDIN>) {
       chop $line;
       $linhaFinal = "";
       
      (@line) = split (" ", $line);
      for ($i=0; $i<=$#line; $i++) {
          $k = $i - 1 ;
          #if ($line[$i] =~ /$Separador$/) {next}

	  if   ( ($line[$i] =~ /^$UpperCase$LowerCase+/) && ($line[$k] !~ /\.$/) ) {
              
	     $Candidate = $line[$i] ;
             $Nocandidate = $line[$i] ;
             
             $count = 1;
             $found = 0;
          
            # while ( (!$found) && ($count < $N) )    {
               while  (!$found)      {
                 $j = $i + $count;
                 if ( ($line[$j] !~ /^$UpperCase$LowerCase+/ || $Candidate =~ /$Separador$/) &&
                      ($line[$j] !~ /^($Prep)$/) ) {  
                   $found = 1 ;
                 }
                 else { 
                   $Candidate .= "&" . $line[$j] ;
                   $Nocandidate .=  " " . $line[$j] ; 
                   $count++;
                   #print STDERR "okk: $Candidate\n";                 
	         }

                 
                 
             }
             #print STDERR "#$count#\n";

            if ($count > $N){ 
               # print STDERR "No Candidate!! #$count#\n";
                $i = $i + $count - 1;
		$line[$i] =  $Nocandidate ;                  
             }
	     elsif ($Candidate =~ /\&($Prep)$/) {
              # print STDERR "DEEEEEE: #$Candidate#\n";
               $i = $i + $count - 1;
	       $line[$i] =  $Nocandidate ;                  
            } 

            elsif ( ($count > 1) && ($count <= $N) && ($Candidate !~ /$Separador\&/) ) {
		#print STDERR "#$Candidate#\n";
                 $i = $i + $count - 1;
		 $line[$i] =  $Candidate ;  
                 $ContarCandidatos++
            }
           # elsif (  ($count >1) && ($count <= $N) && ($Candidate =~ /$Separador$/) ){
             #   $i = $i + $count - 1;
	#	 $line[$i] =  $Nocandidate ;  
	   # }
	  
          }
          
	  $linhaFinal .= "$line[$i] ";
      }
      $linhaFinal =~  s/ $//; 
      print "$linhaFinal\n";
}
                
                       
     
#print STDERR "O numero de candidatos é: #$ContarCandidatos#\n";
