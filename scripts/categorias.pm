
@EXPORT = qw(Prep Nome Adj Verbo VPP Num Mod Adv Pcle);

sub Prep {
  my ($x) = @_;
  my $result=0;
  if ( ($x =~ /PRP/) || ($x =~ /PREP/) || 
       ($x eq "PDEL") || ($x eq "IN") || ($x eq "TO") ||
       ($x =~ /^SP/) ) {
     $result = 1;
  }
  return $result;
}


sub Nome {
  my ($x) = @_;
  my $result=0;
  if ($x =~ /^N/)  {
     $result = 1;
  }
  return $result;
}

sub Verbo {
  my ($x) = @_;
  my $result=0;
  if ($x =~ /^V/ || $x =~ /^MD/)  {
     $result = 1;
  }
  return $result;
}

sub VPP {
  my ($x) = @_;
  my $result=0;
  if ( ($x =~ /^VMP/) || ($x =~ /^VBP/))  {
     $result = 1;
  }
  return $result;
}


sub Adj {
  my ($x) = @_;
  my $result=0;
  if ( ($x =~ /ADJ/) || ($x eq "JJ") || ($x =~ /AQ/)) {
     $result = 1;
  }
  return $result;
}
 

sub Num {
  my ($x) = @_;
  my $result=0;
  if ($x =~ /CARD/)  {
     $result = 1;
  }
  return $result;
}

sub Mod {
  my ($x) = @_;
  my $result=0;
  if ( ($x =~ /ADJ/) || ($x eq "JJ") || 
       ($x =~ /ADV/) || ($x =~ /^RB/) ||
       ($x =~ /AQ/) ){
     $result = 1;
  }
  return $result;
}


sub Adv {
  my ($x) = @_;
  my $result=0;
  if ( ($x =~ /ADV/) || ($x =~ /^RB/) ) {
     $result =1 
  }
   return $result;
}

sub Pcle {
  my ($x) = @_;
  my $result=0;
  if ($x =~ /^RP/)  {
     $result =1 
  }
   return $result;
}

