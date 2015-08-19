#!/bin/bash

D="$(dirname $0)/.."

input=$(mktemp -t XXXXXXXXXXX.smenob)
trap 'rm -f "${input}"' EXIT
cat >"${input}"

ours () {
    <"${input}" hfst-proc -w -p "$D"/sme-nob.automorf-untrimmed.hfst |cg-conv -a|vislcg3 --grammar "$D"/sme-nob.mor.rlx.bin
}

xerox-to-cg () {
    awk -F'\t' '!$2{$1=""} {print}' | cg-conv -f
}

gt () {
    <"${input}" hfst-proc -x "${GTHOME}"/langs/sme/tools/mt/apertium/analyser-mt-gt-desc.nob.hfstol|xerox-to-cg|vislcg3 -g "${GTHOME}"/langs/sme/tools/mt/apertium/disambiguation-mt-gt.cg3

}

diff -U10 -w \
     <(gt | tr '[:upper:]' '[:lower:]'|tr '/' _ |sed 's/<sme>//g' | tr -s ' ')  \
     <(ours | tr '[:upper:]' '[:lower:]'|tr '/' _ | sed 's/←/</g;s/→/>/g;s/vblex/v/g;s/pre\([st]\)/pr\1/g;s/adj/a/g;s/indic/ind/g;s/cnjcoo/cc/;s/prn/pron/g')

