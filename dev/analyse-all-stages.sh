#!/bin/bash

### Expects input looking like:
#sme	Hui hárve boahtá ovdan oahppoplánabarggus maid sii gáibidit skuvllas
#nob	Svært sjelden kommer det fram i læreplanarbeidet hva de krever av skolen
#
#sme	…
#nob	…
#

### Will work just fine with monolingual text as well, for example
### sed 's/^/sme\t/' corpus.txt | dev/analyse-all-stages.sh

set -e -u

FROMLANG=sme
UNTOLANG=nob
PAIR=${FROMLANG}-${UNTOLANG}

unwrap-for () {
    name=$1
    sed "s%<apertium-notrans>${FROMLANG}\t\(.*\)</apertium-notrans>%<apertium-notrans>${name}</apertium-notrans>\t\1\n&%"
}
wrap () {
    name=$1
    sed "s%\(<apertium-notrans>${name}\)\(</apertium-notrans>\)\(.*\)%\1\3\2%"
}

tr -d '[]' |
sed 's%^...\t.*%<apertium-notrans>&</apertium-notrans>%'  |
    unwrap-for MORPH |
    apertium -f html-noent -d . ${PAIR}-morph |
    wrap MORPH | unwrap-for TAGGER |
    apertium -f html-noent -d . ${PAIR}-tagger |
    wrap TAGGER | unwrap-for BIL |
    apertium -f html-noent -d . ${PAIR}-biltrans |
    wrap BIL | unwrap-for DGEN |
    apertium -d . -f html-noent ${PAIR}-dgen |
    sed 's%</*apertium-notrans>%%g'
