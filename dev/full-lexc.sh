#!/bin/bash

###
###  This script trims a GT sm* analyser to an Apertium bidix
### 

if [ ! -e $GTHOME  ]; then
	echo "Please set the \$GTHOME environment variable";
	exit;
fi

LANG1=sme
LANG2=nob
BASENAME=apertium-$LANG1-$LANG2
PREFIX1=$LANG1-$LANG2
SRC=$GTHOME/trunk/gt/$LANG1/src
DEV=`dirname $0`
OUTFILE=$DEV/../$BASENAME.$LANG1.lexc

echo "GTHOME in $SRC";
echo "OUTFILE is $OUTFILE";

### Extract contents of bilingual dictionary (lema + pos)

### Extract head 

cat $SRC/$LANG1-lex.txt > $OUTFILE



### Extract verbs
echo -n '+++ Verbs... '

VERBLEXC=$SRC/verb-$LANG1-lex.txt
cat $VERBLEXC >> $OUTFILE; 

echo 'done.';

### Extract noun
echo -n '+++ Nouns... '

NOUNLEXC=$SRC/noun-$LANG1-lex.txt
cat $NOUNLEXC >> $OUTFILE; 

echo 'done.';

### Extract adjectives 
echo -n '+++ Adjectives... '

ADJLEXC=$SRC/adj-$LANG1-lex.txt
cat $ADJLEXC >> $OUTFILE;

echo 'done.';

### Extract proper nouns 

echo -n '+++ Proper nouns... ';

cat $SRC/propernoun-$LANG1-morph.txt >> $OUTFILE;

NPLEXC=$SRC/propernoun-$LANG1-lex.txt
cat $NPLEXC >> $OUTFILE;

echo 'done.';

### Extract conjunctions
echo -n '+++ Conjunctions... ';

CCLEXC=$SRC/conjunction-$LANG1-lex.txt

cat $CCLEXC >> $OUTFILE;

echo 'done.';

### Extract adverbs
echo -n '+++ Adverbs... '

ADVLEXC=$SRC/adv-$LANG1-lex.txt
cat $ADVLEXC >> $OUTFILE; 

echo 'done.';

### Extract subordinating conjunctions 
echo -n '+++ Subjunctions... ';

CSLEXC=$SRC/subjunction-$LANG1-lex.txt

cat $CSLEXC >> $OUTFILE;

echo 'done.';

### Extract pronouns 
echo -n '+++ Pronouns... ';

PRONLEXC=$SRC/pronoun-$LANG1-lex.txt

cat $PRONLEXC >> $OUTFILE;

echo 'done.';

### Extract particles
echo -n '+++ Particles... ';

PARTLEXC=$SRC/particle-$LANG1-lex.txt

cat $PARTLEXC >> $OUTFILE;

echo 'done.';

### Extract adpositions
echo -n '+++ Adpositions... ';

PPLEXC=$SRC/pp-$LANG1-lex.txt

cat $PPLEXC >> $OUTFILE;

echo 'done.';

### Extract adpositions
echo -n '+++ Numerals... ';

NUMLEXC=$SRC/numeral-$LANG1-lex.txt

cat $NUMLEXC >> $OUTFILE;

echo 'done.';

### Add abbreviations
echo -n '+++ Abbreviations... ';

ABBRLEXC=$SRC/abbr-$LANG1-lex.txt

cat $ABBRLEXC >> $OUTFILE;

### Add punctuation
echo -n '+++ Punctuation... ';

PUNCTLEXC=$SRC/punct-$LANG1-lex.txt

punct_point=`grep -nH ' real pilcrow' $PUNCTLEXC | cut -f2 -d':'`;
head -n $punct_point $PUNCTLEXC >> $OUTFILE;


echo 'done.';

