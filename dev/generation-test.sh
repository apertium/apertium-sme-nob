#!/bin/bash
DEV=`dirname $0`
tmp_prefix=/tmp/gentest.$pair
# $tmp_prefix is prepended to all files used by this script

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
	if [[ ! -f $tmp_prefix.pretransfer ]]; then
		echo "Can't find the pretransfer output, try running with -r but without -t first" 1>&2
		exit 1;
	else
		apertium_morph_to_pretransfer () {
			echo -n " re-using results up to pretransfer $tmp_prefix.pretransfer ... " 1>&2
			cat $tmp_prefix.pretransfer
		}
	fi
else
	apertium_morph_to_pretransfer () {
		echo -n " from scratch (this could take some time)... " 1>&2
		apertium-destxt < $tmp_prefix.corpus.txt | apertium -d ${DEV}/../ sme-nob-pretransfer -f none | tee $tmp_prefix.pretransfer
	}
fi

if $RERUN || $FROMTRANSFER; then
	args=("$@")
	echo "Corpus in: "`dirname $1` 1>&2
	echo -n "Processing corpus for generation test... " 1>&2
	rm -f $tmp_prefix.corpus.txt
	for ((i=0; i <= $# ; i++)); do
		if [[ ${args[$i]} != "" && -f ${args[$i]} ]]; then 
			cat ${args[$i]} >> $tmp_prefix.corpus.txt
		fi
	done
	echo "done." 1>&2;
	echo -n "Translating corpus for generation test" 1>&2
	apertium_morph_to_pretransfer | apertium -d ${DEV}/../ sme-nob-postchunk-from-transfer -f none | apertium-retxt | sed 's/\$[^^]*\^/$\n^/g' > $tmp_prefix.postchunk
	echo "done." 1>&2
fi

if [[ ! -f $tmp_prefix.postchunk ]]; then
	echo "Something went wrong in processing the corpus, you have no output file." 1>&2
	echo "Try running:" 1>&2
	echo "   sh generation-test.sh -r <corpus>" 1>&2
	exit 1;
fi


sed 's/^[^^][^^]*//g' < $tmp_prefix.postchunk| sed 's/\$..*/$/g' | grep -v -e '@' -e '*' -e '[0-9]<Num>' -e '#}' -e '#{' | LC_ALL='C' sort -f | uniq -c | sort -gr > $tmp_prefix.stripped
lt-proc -d ${DEV}/../sme-nob.autogen.bin < $tmp_prefix.stripped > $tmp_prefix.surface
sed 's/^ *[0-9]* \^/^/g'                 < $tmp_prefix.stripped > $tmp_prefix.nofreq
paste $tmp_prefix.surface $tmp_prefix.nofreq | grep -e '\/' -e '^[^	]*#'  > $tmp_prefix.errors.txt
grep -v '^[^	]*#' $tmp_prefix.errors.txt | grep    '\/[^	>]' > $tmp_prefix.multiform
grep    '^[^	]*#' $tmp_prefix.errors.txt | grep    '\/[^	>]' > $tmp_prefix.multibidix
grep    '^[^	]*#' $tmp_prefix.errors.txt | grep -v '\/[^	>]' > $tmp_prefix.tagmismatch


echo "";
echo "===============================================================================";
echo "Multiple surface forms for a single lexical form";
echo "===============================================================================";
cat $tmp_prefix.multiform

echo "";
echo "===============================================================================";
echo "Multiple bidix entries for a single source language lexical form";
echo "===============================================================================";
cat $tmp_prefix.multibidix

echo "";
echo "===============================================================================";
echo "Tag mismatch between transfer and generation";
echo "===============================================================================";
cat $tmp_prefix.tagmismatch

echo "";
echo "===============================================================================";
echo "Summary";
echo "===============================================================================";
wc -l $tmp_prefix.multiform $tmp_prefix.multibidix $tmp_prefix.tagmismatch
