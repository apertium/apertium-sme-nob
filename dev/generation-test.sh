#!/bin/bash
DEV=`dirname $0`

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
	rm -f /tmp/sme-nob.corpus.txt
	for ((i=1; i <= $# ; i++)); do 
		if [[ ${args[$i]} != "" && -f ${args[$i]} ]]; then 
			cat ${args[$i]} >> /tmp/sme-nob.corpus.txt
		fi
	done
	echo "done.";
	echo -n "Translating corpus for generation test (this could take some time)... ";
	cat /tmp/sme-nob.corpus.txt | apertium -d ${DEV}/../ sme-nob-postchunk | sed 's/\$\W*\^/$\n^/g' > /tmp/sme.gentest.postchunk
	echo "done.";
fi

if [[ ! -f /tmp/sme.gentest.postchunk ]]; then
	echo "Something went wrong in processing the corpus, you have no output file.";
	echo "Try running:"
	echo "   sh generation-test.sh -r <corpus>";
	exit;
fi

cat /tmp/sme.gentest.postchunk  | sed 's/^ //g' | grep -v -e '@' -e '*' -e '[0-9]<Num>' -e '#}' -e '#{' | sed 's/\$>/$/g' | LC_ALL='C' sort -f | uniq -c | sort -gr > /tmp/sme.gentest.stripped
cat /tmp/sme.gentest.stripped | lt-proc -d ${DEV}/../sme-nob.autogen.bin > /tmp/sme.gentest.surface
cat /tmp/sme.gentest.stripped | sed 's/^ *[0-9]* \^/^/g' > /tmp/sme.gentest.nofreq
paste /tmp/sme.gentest.surface /tmp/sme.gentest.nofreq | grep -e '\/' -e '#'  > /tmp/sme.generation.errors.txt
cat /tmp/sme.generation.errors.txt  | grep -v '#' | grep '\/' > /tmp/sme-nob.multiform
cat /tmp/sme.generation.errors.txt  | grep '#.*\/' > /tmp/sme-nob.multibidix 
cat /tmp/sme.generation.errors.txt  | grep '#' | grep -v '\/' > /tmp/sme-nob.tagmismatch 

echo "";
echo "===============================================================================";
echo "Multiple surface forms for a single lexical form";
echo "===============================================================================";
cat /tmp/sme-nob.multiform

echo "";
echo "===============================================================================";
echo "Multiple bidix entries for a single source language lexical form";
echo "===============================================================================";
cat /tmp/sme-nob.multibidix

echo "";
echo "===============================================================================";
echo "Tag mismatch between transfer and generation";
echo "===============================================================================";
cat /tmp/sme-nob.tagmismatch

echo "";
echo "===============================================================================";
echo "Summary";
echo "===============================================================================";
wc -l /tmp/sme-nob.multiform /tmp/sme-nob.multibidix /tmp/sme-nob.tagmismatch
