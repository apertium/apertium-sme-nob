#!/bin/bash

if [ ! -e $GTHOME  ]; then
	echo "Please set the \$GTHOME environment variable";
	exit;
fi

LANG1=sme
LANG2=nob
BASENAME=apertium-$LANG1-$LANG2
PREFIX1=$LANG1-$LANG2
SRC=$GTHOME/trunk/gt/$LANG1/src
EXP=`mktemp /tmp/exp.XXXXX`;
VTMP=`mktemp /tmp/vtmp.XXXX`;
NTMP=`mktemp /tmp/vtmp.XXXX`;
OUTFILE=../$BASENAME.$LANG1.lexc

echo "GTHOME in $SRC";
echo "OUTFILE is $OUTFILE";

### Extract contents of bilingual dictionary (lema + pos)

lt-expand ../$BASENAME.$PREFIX1.dix  | cut -f1 -d'>' |\
sed 's/<n$/<N/g' |\
sed 's/<v/<V/g' \
> $EXP 

### Extract head 

cat $SRC/$LANG1-lex.txt > $OUTFILE

### Extract verbs
echo -n '+++ Verbs... '

VERBLEXC=$SRC/verb-$LANG1-lex.txt
v_point=`grep -nH ' VerbRoot' $VERBLEXC | cut -f2 -d':'`;
v_lenfile=`cat $VERBLEXC | wc -l`;
v_tail=`expr $v_lenfile - $v_point`;

head -n $v_point $VERBLEXC >> $OUTFILE; 
cat $VERBLEXC | sed 's/0//g' > $VTMP;

for i in `cat $EXP | sed 's/ /_/g' | grep '<V'`; do
	lema=`echo $i | cut -f1 -d'<'`;
	lineno=`grep -nH -e "^ \?$lema:" -e "^ \?$lema " $VERBLEXC | cut -f2 -d':'`;
	if [ "$lineno" != "" ]; then 
		head -n$lineno $VERBLEXC | tail -1 >> $OUTFILE;
	fi
done

echo 'done.';

### Extract noun
echo -n '+++ Nouns... '

NOUNLEXC=$SRC/noun-$LANG1-lex.txt
n_point=`grep -nH ' NounRoot$' $NOUNLEXC | cut -f2 -d':'`;
n_lenfile=`cat $NOUNLEXC | wc -l`;
n_tail=`expr $n_lenfile - $n_point`;

head -n $n_point $NOUNLEXC >> $OUTFILE; 
cat $NOUNLEXC | sed 's/0//g' > $NTMP;

for i in `cat $EXP | sed 's/ /_/g' | grep '<N'`; do
	lema=`echo $i | cut -f1 -d'<'`;
	lineno=`grep -nH -e "^ \?$lema:" -e "^ \?$lema " $NTMP | cut -f2 -d':'`;
	if [ "$lineno" != "" ]; then 
		head -n$lineno $NOUNLEXC | tail -1 >> $OUTFILE;
	fi
done

echo 'done.';

### Extract conjunctions
echo -n '+++ Conjunctions... ';

CONJLEXC=$SRC/conjunction-$LANG1-lex.txt

cat $CONJLEXC >> $OUTFILE;

echo 'done.';

### Add punctuation
echo -n '+++ Punctuation... ';

PUNCTLEXC=$SRC/punct-$LANG1-lex.txt

punct_point=`grep -nH ' real pilcrow' $PUNCTLEXC | cut -f2 -d':'`;
head -n $punct_point $PUNCTLEXC >> $OUTFILE;


echo 'done.';

### Cleanup

rm $EXP;
rm $VTMP;
rm $NTMP;
