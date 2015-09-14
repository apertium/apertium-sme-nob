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

GSED=sed; 
if test x$(uname -s) = xDarwin; then 
    type -P gsed &>/dev/null || { echo "This script requires gsed (or a real GNU/Linux machine) but it's not installed.  Aborting." >&2; exit 1; }
    GSED=gsed; 
fi

grep '<!--.*<!--' ${BIDIX} >&2 && echo '^^^ several comments on one line, may lead to false negatives' >&2


makepaste () {
    # given analyses, one per line, remove duplicates and output lines
    # of surfaceform:analysis
    sed 's%<g>\(.*\)</g>\(.*\)\$%\2#\1$%' |\
sed 's%<b/>% %g' |\
sort | uniq |\
tee ${ANALYSES} |\
lt-proc -g ${DEV}/../sme-nob.autogen.bin > ${SURFACES} ;
    paste -d : ${SURFACES} ${ANALYSES}
}    

rhsbidix () {
    <${BIDIX} sed 's%<!--.*-->%%' | sed 's%.*<r>%^%' | sed 's%\&amp;%\&%g'
}
vblex () {
    rhsbidix |\
grep '<s n="vblex"/>' |\
sed 's%<s n="vblex"/>.*<par n="pstv__verb"/>.*%<vblex><pstv><inf>$%' |\
sed 's%<s n="vblex"/>.*%<vblex><inf>$%' |\
# output vblex lemq's on their own too, since they may be moved by transfer:
$GSED 's%\(<g>.*</g>\)\(.*\)%\1\2\n^\1$%'
}

n () {
    rhsbidix |\
grep '<s n="n"/>' |\
grep -v 'alphabet<s n="n"/>' |\
sed 's%<s n="n"/><s n="\([^"]*\)"/></r></p><par n="\(unc_\)*sp__n"/></e>%<n><\1><sp>$%' |\
sed 's%<s n="n"/><s n="\([^"]*\)"/></r></p><par n="\(unc_\)*pl__n"/></e>%<n><\1><pl><ind>$%' |\
sed 's%<s n="n"/><s n="\([^"]*\)"/></r></p><par n="coll__n"/></e>%<n><\1><pl><ind>$%' |\
sed 's%<s n="n"/><s n="acr"/>.*%<n><acr>$%' |\
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
grep -v '<s n="adj"/><s n="pprs"/>' |\
sed 's%<s n="adj"/><s n="sint"/>.*<par n="pl__adj"/>%<adj><sint><pst><pl>$%' |\
sed 's%<s n="adj"/>.*<par n="pl__adj"/>%<adj><pst><pl>$%' |\
sed 's%<s n="adj"/><s n="ord"/>.*%<adj><ord><pst><mf><sg><ind>$%' |\
sed 's%<s n="adj"/><s n="sint"/>.*%<adj><sint><pst><mf><sg><ind>$%' |\
sed 's%<s n="adj"/>.*%<adj><pst><mf><sg><ind>$%'
}

pr () {
    rhsbidix |\
grep '<s n="pr"/>' |\
sed 's%<s n="pr"/>.*%<pr>$%'
}

cnjsub () {
    rhsbidix |\
grep '<s n="cnjsub"/>' |\
sed 's%<s n="cnjsub"/>.*%<cnjsub>$%'
}

cnjcoo () {
    rhsbidix |\
grep '<s n="cnjcoo"/>' |\
sed 's%<s n="cnjcoo"/><s n="clb"/>.*%<cnjcoo><clb>$%' |\
sed 's%<s n="cnjcoo"/>.*%<cnjcoo>$%'
}

np () {
    rhsbidix |\
grep '<s n="np"/>' |\
sed 's%<s n="np"/><s n="\([^"]*\)"/><s n="\([^"]*\)"/></r>.*%<np><\1><\2>$%' |\
sed 's%<s n="np"/><s n="\([^"]*\)"/></r>.*%<np><\1>$%' |\
sed 's%<s n="np"/></r>.*%<np>$%'
}

for pos in vblex n adv adj pr cnjsub cnjcoo np ; do
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


### TODO: entries missing from bidix:
# alias s5b='apertium-transfer /l/s/dev/just-bidix.t1x /l/s/dev/just-bidix.t1x.bin /l/s/sme-nob.autobil.bin'
# $ cat sme/src/subjunction-sme-lex.txt |sed 's/ *!.*//'|grep '\(Cs\) *; *$'|sed 's%+Use/Sub%%'|sed 's/^ *//'|sed 's/^\(.*\):\1\(9\)* /\1 /'|sed 's/:[^ ]*//'|sed 's/ *Cs *; *//'|sed 's/% / /g'|sed 's/^/^/'|sed 's/$/<CS><@X>$/'|s5b|grep '^\^@'|sed 's%^\^@%<e><p><l>%'|sed 's/<CS>.*//'|sed 's/ /<b\/>/g'|sed 's%$%<s n="CS"/></l><r>TODO<s n="cnjsub"/></r></p></e>%' 
# $ cat sme/src/conjunction-sme-lex.txt |sed 's/ *!.*//'|grep '\(Cc\) *; *$'|sed 's%+Use/Sub%%'|sed 's/^ *//'|sed 's/^\(.*\):\1\(9\)* /\1 /'|sed 's/:[^ ]*//'|sed 's/ *Cc *; *//'|sed 's/% / /g'|sed 's/^/^/'|sed 's/$/<CC><@X>$/'|s5b|grep '^\^@'|sed 's%^\^@%<e><p><l>%'|sed 's/<CC>.*//'|sed 's/ /<b\/>/g'|sed 's%$%<s n="CC"/></l><r>TODO<s n="cnjcoo"/></r></p></e>%' 
# $ cat sme/src/pp-sme-lex.txt |sed 's/ *!.*//'|grep '\(Pp\|Postp\|Prep\) *; *$'|sed 's%+Use/Sub%%'|sed 's/^ *//'|sed 's/^\(.*\):\1\(9\)* /\1 /'|sed 's/:[^ ]*//'|sed 's/% / /g'|sed 's/#//g'| sed 's/ *Pp *; */<PP>/'|sed 's/ *Postp *; */<Po>/'|sed 's/ *Prep *; */<Pr>/'|gsed 's%\(.*\)<PP>%\1<Pr>\n\1<Po>%'|sed 's/^/^/'|sed 's/$/<@X>$/'|s5b|grep '^\^@'|sed 's%^\^@%<e><p><l>%'|sed 's/ /<b\/>/g'| sed 's%<Po><@X>\$$%<s n="Po"/></l><r>TODO<s n="pr"/></r></p></e>%'|sed 's%<Pr><@X>\$$%<s n="Pr"/></l><r>TODO<s n="pr"/></r></p></e>%' 
