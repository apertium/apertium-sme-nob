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
SRC=$GTHOME/gt/$LANG1/src
DEV=`dirname $0`
OUTFILE=$DEV/../$BASENAME.$LANG1.lexc

echo "GTHOME in $SRC";
echo "OUTFILE is $OUTFILE";

### Extract contents of bilingual dictionary (lema + pos)

### Extract head 

cat $SRC/$LANG1-lex.txt > $OUTFILE



### Extract verbs
echo -n '+++ Verbs... '

cat $SRC/verb-$LANG1-lex.txt >> $OUTFILE; 

echo 'done.';

### Extract noun
echo -n '+++ Nouns... '

cat $SRC/noun-$LANG1-lex.txt >> $OUTFILE; 

echo 'done.';

### Extract adjectives 
echo -n '+++ Adjectives... '

cat $SRC/adj-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract proper nouns 

echo -n '+++ Proper nouns... ';

cat $SRC/propernoun-$LANG1-morph.txt >> $OUTFILE;

cat $SRC/propernoun-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract conjunctions
echo -n '+++ Conjunctions... ';

cat $SRC/conjunction-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract adverbs
echo -n '+++ Adverbs... '

cat $SRC/adv-$LANG1-lex.txt >> $OUTFILE; 

echo 'done.';

### Extract subordinating conjunctions 
echo -n '+++ Subjunctions... ';

cat $SRC/subjunction-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract pronouns 
echo -n '+++ Pronouns... ';

cat $SRC/pronoun-$LANG1-morph.txt >> $OUTFILE;
cat $SRC/pronoun-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract particles
echo -n '+++ Particles... ';

cat $SRC/particle-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract adpositions
echo -n '+++ Adpositions... ';

cat $SRC/pp-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Extract adpositions
echo -n '+++ Numerals... ';

cat $SRC/numeral-$LANG1-lex.txt >> $OUTFILE;

echo 'done.';

### Add abbreviations
echo -n '+++ Abbreviations... ';

cat $SRC/abbr-$LANG1-lex.txt >> $OUTFILE;

### Add punctuation
echo -n '+++ Punctuation... ';

PUNCTLEXC=$SRC/punct-$LANG1-lex.txt

punct_point=`grep -nH ' real pilcrow' $PUNCTLEXC | cut -f2 -d':'`;
head -n $punct_point $PUNCTLEXC >> $OUTFILE;


echo 'done.';

