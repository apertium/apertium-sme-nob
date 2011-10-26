#!/bin/bash

## Usage:
# echo -e 'leat\tV\nbeana\tN\n' | dev/gt-expand-to-bidix.sh | grep '/@'
## (ie. send in lemma and main POS, with a tab between them, one entry per line)

DEV=$(dirname $0)

expandforms () {
    # Get all forms of a single lemma and pos
    LM="$1";
    POS="$2";
    URL="http://sami-cgi-bin.uit.no/cgi-bin/smi/smi.cgi?text=${LM}&pos=${POS}&mode=dialect&action=paradigm&charset=utf-8&lang=sme&plang=eng";
    wget --quiet -O - "$URL" \
	| grep '<font color="red"' \
	| sed 's%.*"red">\(.*\)</font>.*%\1%'
    sleep 5;			# don't hurt their server too much
}

forms2bidix () {
    # Look up forms in generator, then split into one reading per line, then send through bidix
    hfst-proc -w -p $DEV/../sme-nob.automorf.hfst.ol \
	| awk -F'/' '{ gsub(/\$/,""); for ( i = 2; i <= NF; i++ ) {printf("%s/%s$\n",$1,$i);}}' \
	| apertium-tagger -g $DEV/../sme-nob.prob \
	| apertium-pretransfer \
	| lt-proc -b $DEV/../sme-nob.autobil.bin
}

while read line; do
    expandforms "${line/	*/}" "${line/*	/}";
done | forms2bidix
