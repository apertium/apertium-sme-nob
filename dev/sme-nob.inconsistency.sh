#!/bin/bash

## Usage (to get entries missing from nob.dix):
# dev/sme-nob.inconsistency.sh | grep '^#'
## Also, to just get nouns and adjs:
# dev/sme-nob.inconsistency.sh n adj | grep '^#'

## Only checks for the sg.ind form of nouns and inf form of verbs,
## etc. Commented lines in the bidix are not removed, watch out!

## Entries with the following pardefs still have to be checked manually:
# - pstv__verb
# - pass__verb with non-verb rhs's
# - deverbal__noun
## Also, cnjsub, acronyms, pronouns and determiners are not checked.

set -e -u

DEV="$(dirname "$0")"
BIDIX="${DEV}/../apertium-sme-nob.sme-nob.dix"
GENERATOR="${DEV}/../sme-nob.autogen.bin"
UNSORTED=$(mktemp -t unsorted.XXXXX)
ANALYSES=$(mktemp -t analyses.XXXXX)
SURFACES=$(mktemp -t surfaces.XXXXX)
trap 'rm "${SURFACES}" "${ANALYSES}" "${UNSORTED}"' EXIT

grep '<!--.*<!--' "${BIDIX}" >&2 && echo '^^^ several comments on one line, may lead to false negatives' >&2


uniq_analyses () {
    # given analyses, one per line, remove duplicates and output Apertium Stream Format
    sed 's%<g>\(.*\)</g>\(.*\)\$%\2#\1$%' |
        sed 's%<b/>% %g' |
        sort |
        uniq
}

generate_paste () {
    uniq_analyses |
        tee "${ANALYSES}" |
        lt-proc -g "${GENERATOR}" > "${SURFACES}"
    paste -d : "${SURFACES}" "${ANALYSES}"
}

rhsbidix () {
    <"${BIDIX}" sed 's%<!--.*-->%%' |
        awk '/<section/{p=1}p{print}' |
        sed 's%.*<r>%^%' |
        sed 's%\&amp;%\&%g'
}
vblex () {
    rhsbidix |
        grep '<s n="vblex"/>' |
        sed 's%<s n="vblex"/>.*<par n="pstv__verb"/>.*%<vblex><pstv><inf>$%' |
        sed 's%<s n="vblex"/>.*%<vblex><inf>$%' |
        perl -CSAD -wnpe 's%(<g>.*</g>)(.*)%$1$2\n^$1\$%'
        # ^ output vblex lemq's on their own too, since they may be moved by transfer
}

n () {
    rhsbidix |
        grep '<s n="n"/>' |
        grep -v 'alphabet<s n="n"/>' |
        sed 's%<s n="n"/><s n="\([^"]*\)"/></r></p><par n="\(unc_\)*sp__n"/></e>%<n><\1><sp>$%' |
        sed 's%<s n="n"/><s n="\([^"]*\)"/></r></p><par n="\(unc_\)*pl__n"/></e>%<n><\1><pl><ind>$%' |
        sed 's%<s n="n"/><s n="\([^"]*\)"/></r></p><par n="coll__n"/></e>%<n><\1><pl><ind>$%' |
        sed 's%<s n="n"/><s n="acr"/>.*%<n><acr>$%' |
        sed 's%<s n="n"/><s n="\([^"]*\)"/>.*%<n><\1><sg><ind>$%' |
        sed 's%<s n="n"/></r></p><par n="\(sg_\)*m_RL_f__n"/></e>%<n><m><sg><ind>$%' |
        sed 's%<s n="n"/></r></p><par n="\(sg_\)*f_RL_m__n"/></e>%<n><f><sg><ind>$%' |
        sed 's%<s n="n"/></r></p><par n="\(unc_\)*m_RL_f__n"/></e>%<n><m><sg><ind>$%' |
        sed 's%<s n="n"/></r></p><par n="\(unc_\)*f_RL_m__n"/></e>%<n><f><sg><ind>$%'
}

adv () {
    rhsbidix |
        grep '<s n="adv"/>' |
        sed 's%<s n="adv"/>.*%<adv>$%'
}

adj () {
    rhsbidix |
        grep '<s n="adj"/>' |
        grep -v '<s n="adj"/><s n="pprs"/>' |
        sed 's%<s n="adj"/><s n="sint"/>.*<par n="pl__adj"/>%<adj><sint><pst><un><pl><ind>$%' |
        sed 's%<s n="adj"/>.*<par n="pl__adj"/>%<adj><pst><un><pl><ind>$%' |
        sed 's%<s n="adj"/><s n="ord"/>.*%<adj><ord><pst><mf><sg><ind>$%' |
        sed 's%<s n="adj"/><s n="sint"/>.*%<adj><sint><pst><mf><sg><ind>$%' |
        sed 's%<s n="adj"/>.*%<adj><pst><mf><sg><ind>$%'
}

pr () {
    rhsbidix |
        grep '<s n="pr"/>' |
        sed 's%<s n="pr"/>.*%<pr>$%'
}

cnjsub () {
    rhsbidix |
        grep '<s n="cnjsub"/>' |
        sed 's%<s n="cnjsub"/>.*%<cnjsub>$%'
}

cnjcoo () {
    rhsbidix |
        grep '<s n="cnjcoo"/>' |
        sed 's%<s n="cnjcoo"/><s n="clb"/>.*%<cnjcoo><clb>$%' |
        sed 's%<s n="cnjcoo"/>.*%<cnjcoo>$%'
}

np () {
    rhsbidix |
        grep '<s n="np"/>' |
        sed 's%<s n="np"/><s n="\([^"]*\)"/><s n="\([^"]*\)"/></r>.*%<np><\1><\2>$%' |
        sed 's%<s n="np"/><s n="\([^"]*\)"/></r>.*%<np><\1>$%' |
        sed 's%<s n="np"/></r>.*%<np>$%'
}

for pos in vblex n adv adj pr cnjsub cnjcoo np ; do
    if [[ $# -eq 0 ]]; then
	"${pos}" >> "${UNSORTED}"
    else
	case "${pos}" in
	     "$@") "${pos}" >> "${UNSORTED}";;
	esac
    fi
done

if generate_paste < "${UNSORTED}" | grep '^#'; then
    echo 'Uh-oh, seems like there were entries in bidix that couldn'"''"'t be generated, please fix and then commit!' >&2
    exit 1
else
    echo "sme→nob generation of bidix entries (${@:-all parts of speech}) seems testvoc clean :-)" >&2
fi
