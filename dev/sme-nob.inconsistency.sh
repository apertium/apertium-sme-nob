#!/bin/sh

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

DEV=`dirname $0`
BIDIX=${DEV}/../apertium-sme-nob.sme-nob.dix
UNSORTED=`mktemp /tmp/unsorted.XXXXX`
ANALYSES=`mktemp /tmp/analyses.XXXXX`
SURFACES=`mktemp /tmp/surfaces.XXXXX`

makepaste () {
    # given analyses, one per line, remove duplicates and output lines
    # of surfaceform:analysis
    sed 's%<g>\(.*\)</g>\(.*\)%\2#\1%' |\
sed 's%<b/>% %g' |\
sort | uniq |\
tee ${ANALYSES} |\
lt-proc -g ${DEV}/../sme-nob.autogen.bin > ${SURFACES} ;
    paste -d : ${SURFACES} ${ANALYSES}
}    

rhsbidix () {
    cat ${BIDIX} | sed 's%.*<r>%^%'
}
vblex () {
    rhsbidix |\
grep -v '"pstv__verb"' |\
grep '<s n="vblex"/>' |\
sed 's%<s n="vblex"/>.*%<vblex><inf>$%'
}

n () {
    rhsbidix |\
grep '<s n="n"/>' |\
sed 's%<s n="n"/><s n="\([^"]*\)"/>.*%<n><\1><sg><ind>$%' |\
sed 's%<s n="n"/></r></p><par n="\(unc_\)*m_RL_f__n"/></e>%<n><m><sg><ind>$%' |\
sed 's%<s n="n"/></r></p><par n="\(unc_\)*f_RL_m__n"/></e>%<n><f><sg><ind>$%'
}

adv () {
    rhsbidix |\
grep '<s n="adv"/>' |\
sed 's%<s n="adv"/>.*%<adv>$%'
}

adj () {
    rhsbidix |\
grep '<s n="adj"/>' |\
sed 's%<s n="adj"/>.*%<adj><posi><mf><sg><ind>$%'
}

pr () {
    rhsbidix |\
grep '<s n="pr"/>' |\
sed 's%<s n="pr"/>.*%<pr>$%'
}

np () {
    rhsbidix |\
grep '<s n="np"/>' |\
sed 's%<s n="np"/><s n="\([^"]*\)"/><s n="\([^"]*\)"/></r>.*%<np><\1><\2>$%' |\
sed 's%<s n="np"/><s n="\([^"]*\)"/></r>.*%<np><\1>$%' |\
sed 's%<s n="np"/></r>.*%<np>$%'
}

for pos in vblex n adv adj pr np ; do
    if [ $# -eq 0 ]; then
	${pos} >> ${UNSORTED}
    else
	case "${pos}" in
	     "$@" ) ${pos} >> ${UNSORTED} ;;
	esac
    fi
done

makepaste < ${UNSORTED}


rm ${SURFACES} ${ANALYSES} ${UNSORTED}
