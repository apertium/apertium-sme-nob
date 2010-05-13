#!/bin/bash

# Mac mktemp has no default template, this works on both
SRCLIST=`mktemp -t tmp.sme-src.XXXXXXXXXX`;
TRGLIST=`mktemp -t tmp.sme-trg.XXXXXXXXXX`;
TSTLIST=`mktemp -t tmp.sme-tst.XXXXXXXXXX`;

basedir=`pwd`;
mode=sme-nob-old

ECHOE="echo -e"
SED=sed

if test x$(uname -s) = xDarwin; then 
	ECHOE="builtin echo"
	SED=gsed
fi

wget -O - -q http://wiki.apertium.org/wiki/Northern_Sámi_and_Norwegian/Regression_tests | grep '<li>' | $SED 's/<.*li>//g' | $SED 's/ /_/g' | cut -f2 -d')' | $SED 's/<i>//g' | $SED 's/<\/i>//g' | cut -f2 -d'*' | $SED 's/→/!/g' | cut -f1 -d'!' | $SED 's/(note:/!/g' | $SED 's/_/ /g' | $SED 's/^ *//g' | $SED 's/ *$//g' | $SED 's/$/\n¶/g' | $SED 's/\.$/ ./g' | $SED 's/\([,?.]\) / \1 /g'  | sed 's/?/ ?/g' | $SED 's/ /\n/g' > $SRCLIST;
wget -O - -q http://wiki.apertium.org/wiki/Northern_Sámi_and_Norwegian/Regression_tests | grep '<li>' | $SED 's/<.*li>//g' | $SED 's/ /_/g' | $SED 's/(\w\w)//g' | $SED 's/<i>//g' | cut -f2 -d'*' | $SED 's/<\/i>_→/!/g' | cut -f2 -d'!' | $SED 's/_/ /g' | $SED 's/^ *//g' | $SED 's/ *$//g' | $SED 's/$/./g' > $TRGLIST;

apertium -f none -d . $mode < $SRCLIST > $TSTLIST;

cat $SRCLIST | $SED 's/\.$//g' | $SED 's/$/ /g' | $SED ':a;N;$!ba;s/\n//g' | $SED 's/¶/\n/g' | $SED 's/^ *//g'  | $SED 's/ \([,?.]\) /\1 /g' | grep -v '^ *$' > $SRCLIST.n; mv $SRCLIST.n $SRCLIST;
cat $TRGLIST | $SED 's/\.$//g' > $TRGLIST.n; mv $TRGLIST.n $TRGLIST;
cat $TSTLIST | $SED 's/\.$//g' | $SED 's/\t/ /g'  | $SED 's/$/ /g' | $SED ':a;N;$!ba;s/\n//g' | $SED 's/\\@¶/\n/g' | $SED 's/^ *//g'  | grep -v '^$' | $SED 's/ \([,?.]\) /\1 /g' > $TSTLIST.n; mv $TSTLIST.n $TSTLIST;

TOTAL=0
CORRECT=0
for LINE in `paste $SRCLIST $TRGLIST $TSTLIST | $SED 's/ /%_%/g' | $SED 's/\t/!/g'`; do
	SRC=`echo $LINE | $SED 's/%_%/ /g' | cut -f1 -d'!' | $SED 's/^ *//g' | $SED 's/ *$//g' | $SED 's/  / /g' |$SED 's/\.$//g'`;
	TRG=`echo $LINE | $SED 's/%_%/ /g' | cut -f2 -d'!' | $SED 's/^ *//g' | $SED 's/ *$//g' | $SED 's/  / /g' |$SED 's/\.$//g'`;
	TST=`echo $LINE | $SED 's/%_%/ /g' | cut -f3 -d'!' | $SED 's/^ *//g' | $SED 's/ *$//g' | $SED 's/  / /g' |$SED 's/\.$//g'`;

	if [ "$LINE" = "!!" ]; then
		continue;
	fi
	echo $TRG | grep "^${TST}$" > /dev/null;	
	if [ $? -eq 1 ]; then
		$ECHOE $mode"\t  ${SRC}\n\t- ${TRG}\n\t+ ${TST}\n\n";
	else
		$ECHOE $mode"\t  ${SRC}\nWORKS\t  ${TST}\n\n";
		CORRECT=`expr $CORRECT + 1`;
	fi
	TOTAL=`expr $TOTAL + 1`;
done

echo $CORRECT" / "$TOTAL ;
if [ -x /usr/bin/calc ]; then
	WORKING=`calc $CORRECT" / "$TOTAL" * 100" | head -c 7`;

	echo $WORKING"%";
fi

#rm $SRCLIST $TRGLIST $TSTLIST;
