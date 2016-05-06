#!/bin/sh

mkdir cmd
mkdir lib
mkdir bin
mkdir doc
echo ''

if [ -r tree-tagger.tar.gz ] 
then
    gunzip -c tree-tagger.tar.gz | tar -xf -
    echo 'SunOS version of TreeTagger installed.'
fi

if [ -r tree-tagger-linux.tar.gz ]
then
    gunzip -c tree-tagger-linux.tar.gz | tar -xf -
    echo 'Linux version of TreeTagger installed.'
fi

if [ -r tree-tagger-3.1.tar.gz ]
then
    gunzip -c tree-tagger-3.1.tar.gz | tar -xf -
    echo 'SunOS version of TreeTagger installed.'
fi

if [ -r tree-tagger-linux-3.1.tar.gz ]
then
    gunzip -c tree-tagger-linux-3.1.tar.gz | tar -xf -
    echo 'Linux version of TreeTagger installed.'
fi

if [ -r tree-tagger-MacOSX-3.1.tar.gz ]
then
    gunzip -c tree-tagger-MacOSX-3.1.tar.gz | tar -xf -
    echo 'Mac OS-X version of TreeTagger installed.'
fi

if [ -r tagger-scripts.tar.gz ] 
then
    gunzip -c tagger-scripts.tar.gz | tar -xf -
    chmod +x cmd/*
    echo 'Tagging scripts installed.'
fi

if [ -r german-par.bin.gz ] 
then
    gunzip -c german-par.bin.gz > lib/german.par
    echo 'German parameter file (SunOS) installed.'
fi

if [ -r english-par.bin.gz ] 
then
    gunzip -c english-par.bin.gz > lib/english.par
    echo 'English parameter file (SunOS) installed.'
fi

if [ -r french-par.bin.gz ] 
then
    gunzip -c french-par.bin.gz > lib/french.par
    echo 'French parameter file (SunOS) installed.'
fi

if [ -r italian-par.bin.gz ] 
then
    gunzip -c italian-par.bin.gz > lib/italian.par
    echo 'Italian parameter file (SunOS) installed.'
fi

if [ -r german-par-linux.bin.gz ] 
then
    gunzip -c german-par-linux.bin.gz > lib/german.par
    echo 'German parameter file (Linux) installed.'
fi

if [ -r german-bigpar-linux.bin.gz ] 
then
    gunzip -c german-bigpar-linux.bin.gz > lib/german.par
    echo 'Big German parameter file (Linux) installed.'
fi

if [ -r english-par-linux.bin.gz ] 
then
    gunzip -c english-par-linux.bin.gz > lib/english.par
    echo 'English parameter file (Linux) installed.'
fi

if [ -r french-par-linux.bin.gz ]
then
    gunzip -c french-par-linux.bin.gz > lib/french.par
    echo 'French parameter file (Linux) installed.'
fi

if [ -r italian-par-linux.bin.gz ]
then
    gunzip -c italian-par-linux.bin.gz > lib/italian.par
    echo 'Italian parameter file (Linux) installed.'
fi

if [ -r german-small-par-3.1.bin.gz ]
then
    gunzip -c german-small-par-3.1.bin.gz > lib/german.par
    echo 'Small German parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r german-par-3.1.bin.gz ]
then
    gunzip -c german-par-3.1.bin.gz > lib/german.par
    echo 'German parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r german-chunker-par-3.1.bin.gz ] 
then
    gunzip -c german-chunker-par-3.1.bin.gz > lib/german-chunker.par
    echo 'German chunker parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r english-par-3.1.bin.gz ]
then
    gunzip -c english-par-3.1.bin.gz > lib/english.par
    echo 'English parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r english-chunker-par-3.1.bin.gz ] 
then
    gunzip -c english-chunker-par-3.1.bin.gz > lib/english-chunker.par
    echo 'English chunker parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r french-par-3.1.bin.gz ]
then
    gunzip -c french-par-3.1.bin.gz > lib/french.par
    echo 'French parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r italian-par-3.1.bin.gz ]
then
    gunzip -c italian-par-3.1.bin.gz > lib/italian.par
    echo 'Italian parameter file (SunOS, MacOS-X) installed.'
fi

if [ -r german-small-par-linux-3.1.bin.gz ]
then
    gunzip -c german-small-par-linux-3.1.bin.gz > lib/german.par
    echo 'Small German parameter file (Linux) installed.'
fi

if [ -r german-par-linux-3.1.bin.gz ]
then
    gunzip -c german-par-linux-3.1.bin.gz > lib/german.par
    echo 'German parameter file (Linux) installed.'
fi

if [ -r german-chunker-par-linux-3.1.bin.gz ] 
then
    gunzip -c german-chunker-par-linux-3.1.bin.gz > lib/german-chunker.par
    echo 'German chunker parameter file (Linux) installed.'
fi

if [ -r english-par-linux-3.1.bin.gz ]
then
    gunzip -c english-par-linux-3.1.bin.gz > lib/english.par
    echo 'English parameter file (Linux) installed.'
fi

if [ -r english-chunker-par-linux-3.1.bin.gz ] 
then
    gunzip -c english-chunker-par-linux-3.1.bin.gz > lib/english-chunker.par
    echo 'English chunker parameter file (Linux) installed.'
fi

if [ -r french-par-linux-3.1.bin.gz ]
then
    gunzip -c french-par-linux-3.1.bin.gz > lib/french.par
    echo 'French parameter file (Linux) installed.'
fi

if [ -r italian-par-linux-3.1.bin.gz ]
then
    gunzip -c italian-par-linux-3.1.bin.gz > lib/italian.par
    echo 'Italian parameter file (Linux) installed.'
fi

for file in cmd/*
do
    awk '$0=="BIN=./bin"{print "BIN='`pwd`'/bin";next}\
         $0=="CMD=./cmd"{print "CMD='`pwd`'/cmd";next}\
         $0=="LIB=./lib"{print "LIB='`pwd`'/lib";next}\
         {print}' $file > $file.tmp;
    mv $file.tmp $file;
done
echo 'Path variables modified in tagging scripts.'

chmod 0755 cmd/*

echo ''
echo 'You should add '`pwd`'/cmd and '`pwd`'/bin to the command search path.'
echo ''
