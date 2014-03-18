#!/bin/bash

if [ $# -ne 2 ]; then
    echo "For any lemma, print the shortest match defined in bidix, e.g. if tag is"
    echo "Pron and bidix defines translations for both ^eanas<Pron><Indef>$ and"
    echo "^eanas<Pron><Indef><Sg>$, print ^eanas<Pron><Indef>$"
    echo ""
    echo "Usage: $0 tag lt-expand-output"
    exit 1
fi

tag="$1"
expfile="$2"



test ! -s "$expfile" && lt-expand ../apertium-sme-nob.sme-nob.dix > "$expfile"


grep "^[^<]*<$tag>" "$expfile" | sed 's/:.*//' |\
awk -F'><' '
//  {
	if(!L[$1])     {L[$1]=9999999}
	if(L[$1] > NF) {L[$1]=NF; F[$1]=$0}
}
END {
	for(l in L) {print F[l] "\t" L[l]}
}'

# Useful when defining langs.cfg for update-lexc.py. If you define
# only "<Pron>" in the pos_filter field, and bidix has an entry for
# "foo<Pron><Indef>" while the morph has for both "foo<Pron><Indef>"
# and "foo<Pron><Dem>", the trimmer will add both entries; while if
# pos_filter is ["<Pron><Indef>", "<Pron><Dem>"], it won't get any
# partial matches. But then you have to ensure that, for any possible
# OtherTag, "<Pron><OtherTag>" is also in the pos_filter field.
