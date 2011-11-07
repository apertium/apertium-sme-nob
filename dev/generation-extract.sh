#!/bin/bash

if [ $# -ne 2 ];then
    echo "Usage:"
    echo "\$ ./$0 'word<tag><tag>' corpus.pilcrowed"
    echo "where 'word<tag><tag> is from the dev/generation-test.sh report"
    echo ""
    echo "Assumes corpus was preprocessed like:"
    echo "\$ awk 'p&&/^ *$/{print NR\"¶\";p=0} {print} /[^ ]/{p=1}' corpus > corpus.pilcrowed"
    echo "before running dev/generation-test.sh"
    exit 1
fi
needle="$1"
CORPUS="$2"

pilcrow="¶"

TMP=/tmp

POSTCHUNKOUT="$TMP/sme.gentest.postchunk"

extract () {
    awk -F"\\\^|<det><qnt>" "
/${1}/ && n && seen==0 { print n; seen=1 }
/¶/                    { n=prev }
/¶/ && seen            { print n; exit } 
/<det><qnt>/           { prev=\$2 }
" "$2";
}

IFS=$' \t\n' read -a lines <<< `extract "${needle}" "$POSTCHUNKOUT"`
if [ "${#lines[@]}" == "2" ]; then
    echo "found ${needle} between lines ${lines[0]} and ${lines[1]}" 1>&2
    awk "/^${lines[0]}$pilcrow\$/,/^${lines[1]}$pilcrow$/{print}" "$CORPUS"
else
    echo "Couldn't find ${needle}!" 1>&2
    exit 1
fi
