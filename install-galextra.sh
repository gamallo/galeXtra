#!/bin/sh


for file in tree-tagger/cmd/*
do
    awk '$0=="BIN=./bin"{print "BIN='`pwd`'/tree-tagger/bin";next}\
         $0=="CMD=./cmd"{print "CMD='`pwd`'/tree-tagger/cmd";next}\
         $0=="LIB=./lib"{print "LIB='`pwd`'/tree-tagger/lib";next}\
         {print}' $file > $file.tmp;
    mv $file.tmp $file;
done

for file in extractorTermos.sh
do
    awk '$0=="TREETAGGER=\"./tree-tagger\""{print "TREETAGGER=\"'`pwd`'/tree-tagger/cmd/tree-tagger\"";next}\
         $0=="GALEEXTRA_DIR=\"./galeXtra\""{print "GALEEXTRA_DIR=\"'`pwd`'\"";next}\
        {print}' $file > $file.tmp;
    mv $file.tmp $file;
done


echo 'Path variables modified in tagging scripts.'

chmod 0755 *.sh
chmod 0755 scripts/*
chmod 0755 tree-tagger/cmd/*
chmod 0755 tree-tagger/bin/*

echo ''
echo "Installation has been concluded"
#echo 'You should add  '`pwd`', '`pwd`'/tree-tagger/cmd and '`pwd`'/tree-tagger/bin to the command search path.'
echo ''

echo "Don't forget that you can also install and use Freeling."
echo "If you use Freeling, it should be installed in /usr/local/."
