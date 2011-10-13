#!/bin/bash
SMENOB=$(dirname $0)/../

grep 'slr=' "$SMENOB"apertium-sme-nob.sme-nob.dix |\
awk -F'<l>|<s|</l>' '{print $2}' |\
sort -u |\
while read lemma; do
    grep -q "\"$lemma\"" "$SMENOB"apertium-sme-nob.sme-nob.lex || echo "$lemma"; 
done
