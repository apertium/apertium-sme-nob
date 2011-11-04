#!/bin/bash
DEV=`dirname $0`
TMP=/tmp

if [[ $# -lt 1 ]]; then
	echo "Not enough arguments to generation-test.sh -r";
	echo "bash generation-test.sh -r <corpus>";
	exit;
fi

if [[ $1 == "-r" ]]; then
	if [[ $# -lt 2 ]]; then 
		echo $#;
		echo "Not enough arguments to generation-test.sh -r";
		echo "bash generation-test.sh -r <corpus>";
		exit;
	fi
	args=("$@")
	echo "Corpus in: "`dirname $2`;
	echo -n "Processing corpus for generation test... ";
	rm -f $TMP/sme-nob.corpus.txt
	for ((i=1; i <= $# ; i++)); do 
		if [[ ${args[$i]} != "" && -f ${args[$i]} ]]; then 
			cat ${args[$i]} >> $TMP/sme-nob.corpus.txt
		fi
	done
	echo "done.";
	echo -n "Translating corpus for generation test (this could take some time)... ";
	cat $TMP/sme-nob.corpus.txt | apertium -d ${DEV}/../ sme-nob-postchunk | sed 's/\$\W*\^/$\n^/g' > $TMP/sme.gentest.postchunk
	echo "done.";
fi

if [[ ! -f $TMP/sme.gentest.postchunk ]]; then
	echo "Something went wrong in processing the corpus, you have no output file.";
	echo "Try running:"
	echo "   sh generation-test.sh -r <corpus>";
	exit;
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
