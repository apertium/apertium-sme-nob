#!/bin/sh

## Only checks nouns and verbs so far, and only checks for the sg.ind
## form of nouns and inf form of verbs.  

## Usage (to get entries missing from nob.dix):
# dev/sme-nob.inconsistency.sh | grep '^#'

## Entries with the following pardefs still have to be checked manually:
# - pstv__verb
# - pass__verb with non-verb rhs's
# - deverbal__noun


DEV=`dirname $0`
BIDIX=${DEV}/../apertium-sme-nob.sme-nob.dix
UNSORTED=`mktemp /tmp/unsorted.XXXXX`
ANALYSES=`mktemp /tmp/analyses.XXXXX`
SURFACES=`mktemp /tmp/surfaces.XXXXX`

makepaste () {
    # given analyses, one per line, remove duplicates and output lines
    # of surfaceform:analysis
    sort | uniq |\
tee ${ANALYSES} |\
lt-proc -g sme-nob.autogen.bin > ${SURFACES} ;
    paste -d : ${SURFACES} ${ANALYSES}
}    

vblex () {
    cat ${BIDIX} |\
grep -v '"pstv__verb"' |\
grep '<s n="vblex"/>' | sed 's%.*<r>%^%' | sed 's%<s n="vblex"/>.*%<vblex><inf>$%' |\
sed 's%<g>\(.*\)</g><vblex><inf>%<vblex><inf>#\1%' |\
sed 's%<b/>% %g'
}

n () {
    cat ${BIDIX} |\
grep '<s n="n"/>' | sed 's%.*<r>%^%' |\
sed 's%<s n="n"/><s n="\([^"]*\)"/>.*%<n><\1><sg><ind>$%' |\
sed 's%<s n="n"/></r></p><par n="\(unc_\)*m_RL_f__n"/></e>%<n><m><sg><ind>$%' |\
sed 's%<s n="n"/></r></p><par n="\(unc_\)*f_RL_m__n"/></e>%<n><f><sg><ind>$%' |\
sed 's%<b/>% %g'
}


vblex >> ${UNSORTED}
n >> ${UNSORTED}

makepaste < ${UNSORTED}


rm ${SURFACES} ${ANALYSES} ${UNSORTED}
