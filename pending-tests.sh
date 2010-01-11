#!/bin/bash

# Mac mktemp has no default template, this works on both
SRCLIST=`mktemp -t tmp.XXXXXXXXXX`;
TRGLIST=`mktemp -t tmp.XXXXXXXXXX`;
TSTLIST=`mktemp -t tmp.XXXXXXXXXX`;

basedir=`pwd`;
mode=sme-nob

ECHO=echo

if test x$(uname -s) = xDarwin; then 
	ECHO=/opt/local/bin/gecho; 
fi

wget -O - -q http://wiki.apertium.org/wiki/Northern_Sámi_and_Norwegian/Pending_tests | grep '<li>' | sed 's/<.*li>//g' | sed 's/ /_/g' | cut -f2 -d')' | sed 's/<i>//g' | sed 's/<\/i>//g' | cut -f2 -d'*' | sed 's/→/!/g' | cut -f1 -d'!' | sed 's/(note:/!/g' | sed 's/_/ /g' | sed 's/^ *//g' | sed 's/ *$//g' | sed 's/$/\n@@@/g' | sed 's/\.$/ ./g' | sed 's/ /\n/g' > $SRCLIST;
wget -O - -q http://wiki.apertium.org/wiki/Northern_Sámi_and_Norwegian/Pending_tests | grep '<li>' | sed 's/<.*li>//g' | sed 's/ /_/g' | sed 's/(\w\w)//g' | sed 's/<i>//g' | cut -f2 -d'*' | sed 's/<\/i>_→/!/g' | cut -f2 -d'!' | sed 's/_/ /g' | sed 's/^ *//g' | sed 's/ *$//g' | sed 's/$/./g' > $TRGLIST;

apertium -f none -d . $mode < $SRCLIST > $TSTLIST;

cat $SRCLIST | sed 's/\.$//g' | sed 's/$/ /g' | sed ':a;N;$!ba;s/\n//g' | sed 's/\*\\@\\@\\@/\n/g' | sed 's/^ *//g' > $SRCLIST.n; mv $SRCLIST.n $SRCLIST;
cat $TRGLIST | sed 's/\.$//g' > $TRGLIST.n; mv $TRGLIST.n $TRGLIST;
cat $TSTLIST | sed 's/\.$//g' | sed 's/\t/ /g'  | sed 's/$/ /g' | sed ':a;N;$!ba;s/\n//g' | sed 's/\*\\@\\@\\@/\n/g' | sed 's/^ *//g' > $TSTLIST.n; mv $TSTLIST.n $TSTLIST;

TOTAL=0
CORRECT=0
for LINE in `paste $SRCLIST $TRGLIST $TSTLIST | sed 's/ /%_%/g' | sed 's/\t/!/g'`; do
#	echo $LINE;

	SRC=`$ECHO $LINE | sed 's/%_%/ /g' | cut -f1 -d'!' | sed 's/^ *//g' | sed 's/ *$//g' | sed 's/  / /g' |sed 's/\.$//g'|sed 's/\*//g'`;
	TRG=`$ECHO $LINE | sed 's/%_%/ /g' | cut -f2 -d'!' | sed 's/^ *//g' | sed 's/ *$//g' | sed 's/  / /g' |sed 's/\.$//g'|sed 's/\*//g'`;
	TST=`$ECHO $LINE | sed 's/%_%/ /g' | cut -f3 -d'!' | sed 's/^ *//g' | sed 's/ *$//g' | sed 's/  / /g' |sed 's/\.$//g'|sed 's/\*//g'`;

#	if [ "$SRC" = "" ]; then
#		continue;
#	fi
	
	$ECHO $TRG | grep "^$TST$" > /dev/null;	
	if [ $? -eq 1 ]; then
		$ECHO -e $mode"\t  "$SRC"\n\t- $TRG\n\t+ "$TST"\n";
	else
		$ECHO -e $mode"\t  "$SRC"\nWORKS\t  $TST\n";
		CORRECT=`expr $CORRECT + 1`;
	fi
	TOTAL=`expr $TOTAL + 1`;
done

$ECHO $CORRECT" / "$TOTAL ;
if [ -x /usr/bin/calc ]; then
	WORKING=`calc $CORRECT" / "$TOTAL" * 100" | head -c 7`;

	$ECHO $WORKING"%";
fi

#rm $SRCLIST $TRGLIST $TSTLIST;
