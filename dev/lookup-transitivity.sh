#!/bin/bash

### Usage: cat dev/inc-sme-nob-dic-verb.txt | dev/lookup-transitivity.sh
### Note: If the <l> (sme lemma) has <b/> or other tags in it, this will ignore anything after the first <
### Also removes everything up until the <l> (eg. c attribute of <e>)

if [ ! -e $GTLANGS  ]; then
	echo "Please set the \$GTLANGS environment variable";
	exit;
fi
FST=$GTLANGS/lang-sme/src/fst/analyser-gt-desc.hfstol

sed 's/.*<l>//'| sed 's%<.*</l>%</l>%' | sed 's%</l>\(.*\)$%[\1]%' |\
hfst-proc $FST |\
while read line; do
    lemma=$(echo $line | sed 's%\^\([^/]*\).*%\1%')
    rhs=$(echo $line | gsed 's%.*\[\(.*\)\].*%\1%')
    valences=$(echo $line | sed 's%\[.*%%' | tr '/' '\n' | grep "^${lemma}+V+" | grep -v "+Der" | sed 's/.*\+\([TI]V\)\+.*/\1/' | uniq)
    if [ ${#valences} -eq 0 ]; then
	echo "<e><p><l>${lemma}<s n=\"V\"/><s n=\"TODO\"/></l>${rhs}"
    fi;
    for trans in ${valences}; do
	echo "<e><p><l>${lemma}<s n=\"V\"/><s n=\"${trans}\"/></l>${rhs}"
    done
done
