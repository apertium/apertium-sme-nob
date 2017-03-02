#!/bin/bash

set -e -u

cd "$(dirname "$0")"/../..

analyse_untrimmed () {
    hfst-optimised-lookup sme-nob.automorf-untrimmed.hfst
}
lookup_lemmas () {
    cut -f2 | cut -d '<' -f1 | sort -u | grep .
}
bidix_left_lm () {
    grep -o '<l>.*</l>'| sed 's,<l>,,;s,<b/>, ,g;s,<.*,,' | sort -u | grep .
}
bidix_grep_left () {
    grep "$1.*</l>" apertium-sme-nob.sme-nob.dix
}

trap 'rm "${bi_lms}" "${ana_lms}"' EXIT
bi_lms=$(mktemp -t sme_bidix_sanity.XXXXXXXXXX)
ana_lms=$(mktemp -t sme_bidix_sanity.XXXXXXXXXX)

compare () {
    local anagrep="$1"
    local bigrep="${anagrep//></\".*\"}"; bigrep="${bigrep//>/\"}"; bigrep="${bigrep//</\"}"
    local comp

    bidix_grep_left "${bigrep}" | bidix_left_lm > "${bi_lms}"
    analyse_untrimmed < "${bi_lms}" | grep "${anagrep}" | lookup_lemmas > "${ana_lms}"
    if comp=$(comm -23 "${bi_lms}" "${ana_lms}" | analyse_untrimmed | grep . ); then
        echo "### Lemmas tagged ${bigrep} in bidix that only had an analysis other than ${anagrep} in the full analyser: ###"
        echo "${comp}"
        return 1
    fi
}

tests=(
    '<tv>'
    '<iv>'
    '<n>'
    '<adv>'
    '<adj>'
    '<po>'
    '<pr>'
    '<num>'
    '<prn>'
    '<cnjcoo>'
    '<cnjsub>'
    '<pcle>'
    '<np>'
)

declare -i res=0
for t in "${tests[@]}"; do
    compare "$t" || (( res++ )) || true
done
exit "${res}"
