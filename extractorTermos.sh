#!/bin/bash

###################################################################
# Script para facilitar o uso do extractor de termos galXtract.
#   - - A variábel GALEEXTRA_DIR establece o PATH dos programas.
#   - - Cada tagger ten as súas propias variábeis e configuracións.
#
# Grupo ProLNat@GE, Abril, 2013
###################################################################

############################
# Config
############################

GALEEXTRA_DIR="./galeXtra"
PROGS=$GALEEXTRA_DIR"/scripts"

############################
# Parameters
############################

FR=1

############################
# Config de Freeling
############################

export FREELINGSHARE="/usr/local/share/freeling"
FREELING="/usr/local/bin/analyzer"
FREELING_OPTS=""
FILTER="$PROGS/filtrar-freeling.perl"

############################
# Config de Treetagger
############################

TREETAGGER="./tree-tagger/cmd/tree-tagger"

############################
# Functions
############################

help()
{
  echo "Syntax: extractorTermos.sh <tagger> <lang> <measure> <file> [FR]
  
      tagger=freeling, treetagger
      language=gl, es, en, pt, fr
      measure=chi,log,mi,scp,cooc

      FR=lowest frequency
"
  exit
}


# Parámetros obrigatorios
[ $# -lt 3 ] && help
TAGGER=$1
LING=$2
MEASURE=$3
FILE=$4

# Parámetro optativo
[ "$5" != "" ] && FR=$5

# Comprobacións
if [ "$TAGGER" != "freeling" ]; then
  FILTER="$PROGS/filtrar-tagged.perl"
  [ "$TAGGER" != "treetagger" ] && help
fi

case $LING in
  es) ;;
  en) ;;
  gl) ;;
  pt) ;;
  fr) ;;
  *) help
esac

case $MEASURE in
  cooc) ;;
  log) ;;
  mi)  ;;
  scp) ;;
  chi) ;;
  *) help
esac

if [ "$TAGGER" == "freeling" ]; then
  CMD="$FREELING $FREELING_OPTS -f $FREELINGSHARE/config/$LING.cfg"
else
  CMD="$TREETAGGER-$LING"
fi

cat $FILE | $CMD | $FILTER | $PROGS/6tokens.perl | $PROGS/ExtrMW.perl $MEASURE $FR
