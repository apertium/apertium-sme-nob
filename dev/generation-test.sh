#!/bin/bash
DEV=`dirname $0`
TMP=/tmp

RERUN=false
if [[ $1 == "-r" ]]; then RERUN=true; shift; fi
FROMTRANSFER=false
if [[ $1 == "-t" ]]; then FROMTRANSFER=true; shift; fi

if [[ $# -lt 1 ]]; then
	echo "Not enough arguments to generation-test.sh -r" 1>&2
	echo "bash generation-test.sh -r <corpus>" 1>&2
	exit 1;
fi


if $FROMTRANSFER; then
	if [[ ! -f $TMP/sme.gentest.pretransfer ]]; then
		echo "Can't find the pretransfer output, try running with -r but without -t first" 1>&2
		exit 1;
	else
		apertium_morph_to_pretransfer () {
			echo -n " re-using results up to pretransfer $TMP/sme.gentest.pretransfer ... " 1>&2
			cat $TMP/sme.gentest.pretransfer
		}
	fi
else
	apertium_morph_to_pretransfer () {
		echo -n " from scratch (this could take some time)... " 1>&2
		apertium-destxt < $TMP/sme-nob.corpus.txt | apertium -d ${DEV}/../ sme-nob-pretransfer -f none | tee $TMP/sme.gentest.pretransfer
	}
fi

if $RERUN || $FROMTRANSFER; then
	args=("$@")
	echo "Corpus in: "`dirname $1` 1>&2
	echo -n "Processing corpus for generation test... " 1>&2
	rm -f $TMP/sme-nob.corpus.txt
	for ((i=0; i <= $# ; i++)); do
		if [[ ${args[$i]} != "" && -f ${args[$i]} ]]; then 
			cat ${args[$i]} >> $TMP/sme-nob.corpus.txt
		fi
	done
	echo "done.";
	echo -n "Translating corpus for generation test" 1>&2
	apertium_morph_to_pretransfer | apertium -d ${DEV}/../ sme-nob-postchunk-from-transfer -f none | apertium-retxt | sed 's/\$[^^]*\^/$\n^/g' > $TMP/sme.gentest.postchunk
	echo "done." 1>&2
fi

if [[ ! -f $TMP/sme.gentest.postchunk ]]; then
	echo "Something went wrong in processing the corpus, you have no output file." 1>&2
	echo "Try running:" 1>&2
	echo "   sh generation-test.sh -r <corpus>" 1>&2
	exit 1;
fi


sed 's/^[ –	]*//g' < $TMP/sme.gentest.postchunk | grep -v -e '@' -e '*' -e '[0-9]<Num>' -e '#}' -e '#{' | sed 's/\$>/$/g' | LC_ALL='C' sort -f | uniq -c | sort -gr > $TMP/sme.gentest.stripped
lt-proc -d ${DEV}/../sme-nob.autogen.bin < $TMP/sme.gentest.stripped > $TMP/sme.gentest.surface
sed 's/^ *[0-9]* \^/^/g'                 < $TMP/sme.gentest.stripped > $TMP/sme.gentest.nofreq
paste $TMP/sme.gentest.surface $TMP/sme.gentest.nofreq | grep -e '\/' -e '^[^	]*#'  > $TMP/sme.generation.errors.txt
grep -v '^[^	]*#' $TMP/sme.generation.errors.txt | grep    '\/[^	>]' > $TMP/sme-nob.multiform
grep    '^[^	]*#' $TMP/sme.generation.errors.txt | grep    '\/[^	>]' > $TMP/sme-nob.multibidix
grep    '^[^	]*#' $TMP/sme.generation.errors.txt | grep -v '\/[^	>]' > $TMP/sme-nob.tagmismatch


echo "";
echo "===============================================================================";
echo "Multiple surface forms for a single lexical form";
echo "===============================================================================";
cat $TMP/sme-nob.multiform

echo "";
echo "===============================================================================";
echo "Multiple bidix entries for a single source language lexical form";
echo "===============================================================================";
cat $TMP/sme-nob.multibidix

echo "";
echo "===============================================================================";
echo "Tag mismatch between transfer and generation";
echo "===============================================================================";
cat $TMP/sme-nob.tagmismatch

echo "";
echo "===============================================================================";
echo "Summary";
echo "===============================================================================";
wc -l $TMP/sme-nob.multiform $TMP/sme-nob.multibidix $TMP/sme-nob.tagmismatch
