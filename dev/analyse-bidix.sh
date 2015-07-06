#!/bin/bash

# Find words in bidix which are not in the fst or where the PoS or
# other tags are not correct. Expects no parameters.

bidix="$(dirname $0)"/../apertium-sme-nob.sme-nob.dix
analyser="$(dirname $0)"/../sme-nob.automorf.hfst.ol

awk '/<section /{s++} {sub("<!--.*-->","")} s&&/<l>/{gsub("<b/>"," ");sub(/.*<l>/,"");sub(/<.*/,"");print}' "${bidix}" |
    hfst-optimised-lookup "${analyser}" |
    awk -F'\t' '$2=="+?"'
