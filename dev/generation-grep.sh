#!/bin/bash

maxhits=1
OPTIND=1; while getopts "m:" opt; do
  case "$opt" in
    m) maxhits=$OPTARG;;
  esac
done
shift $((OPTIND-1))

if [ $# -ne 2 ];then
    echo "Usage:"
    echo "\$ ./$0 [-m2] 'word<tag><tag>' corpus.pilcrowed"
    echo "where 'word<tag><tag> is from the dev/generation-test.sh report"
    echo "and -mN means return a max of N hits (default:1)"
    echo ""
    echo "Assumes corpus was preprocessed like:"
    echo "\$ awk 'p&&/^ *$/{print \"|\"NR\"¶\";p=0} {print} /[^ ]/{p=1}' corpus > corpus.pilcrowed"
    echo "before running dev/generation-test.sh"
    # The | is just used as a separator, ensures possible preceding numbers are not seen as part of this one.
    # It's of course possible to write "|NR¶" on _each_ line, but that's rather invasive and you might miss some errors.
    exit 1
fi
needle="$1"
CORPUS="$2"

pilcrow="¶"

TMP=/tmp

POSTCHUNKOUT="$TMP/sme.gentest.postchunk"

extract () {
    awk -vm="$maxhits" -F"\\\^|<det><qnt>" "
/${1}/ && n && seen==0 { printf(\"%s:\",n); seen=1 }
/¶/                    { n=prev }
/¶/ && seen            { print n; seen=0; if(--m==0) exit;} 
/<det><qnt>/           { prev=\$2 }
" "$2";
}

foundone=false
IFS=$' \t\n' read -a allhits <<< `extract "${needle}" "$POSTCHUNKOUT"`
for h in "${allhits[@]}"; do
    IFS=$':' read -a hit <<< "$h"
    if [ "${#hit[@]}" == "2" ]; then
	echo "found ${needle} between lines ${hit[0]} and ${hit[1]}" 1>&2
	awk "/^\|${hit[0]}$pilcrow\$/,/^\|${hit[1]}$pilcrow$/{print}" "$CORPUS"
	foundone=true
    fi
done
$foundone || ( echo "Couldn't find ${needle}!" 1>&2; exit 1; )
