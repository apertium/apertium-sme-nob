#!/bin/bash

# Usage: put comment lines with the the string PPP in them in two
# places in bidix, and run this script. The script outputs nob.dix
# entries for any proper nouns between those two PPP marks, 
# paste the entries into the section with id="not_in_nn-nb"
# (or the main section if you plan on updating apertium-nn-nb)

DEV=$(dirname $0)
BIDIX=${DEV}/../apertium-sme-nob.sme-nob.dix

NPPP=$(grep -c PPP ${BIDIX})
if [ ${NPPP} -ne 2 ]; then
    echo "This script extracts Prop's from between the two PPP marks in bidix"
    echo "(expects the string PPP in two places), but found $NPPP PPP mark(s)"
    grep PPP ${BIDIX}
    exit 1
fi

if ( cd ${DEV}/..; ! make -q sme-nob.autogen.bin ); then 
    echo "sme-nob.autogen.bin needs compiling. Run"
    echo "    make sme-nob.autogen.bin"
    echo "and then re-run $0"
    exit 1
fi
GEN=${DEV}/../sme-nob.autogen.bin

ANALYSES=`mktemp /tmp/ana.XXXXX`;
SURFACES=`mktemp /tmp/surf.XXXXX`;
RHS=`mktemp /tmp/rhs.XXXXX`;
LM=`mktemp /tmp/lm.XXXXX`;
ENTRY=`mktemp /tmp/entry.XXXXX`;

# mac sed is horribly slow for certain operations
GSED=sed; 
if test x$(uname -s) = xDarwin; then 
    type -P gsed &>/dev/null || { echo "This script requires gsed (or a real GNU/Linux machine) but it's not installed.  Aborting." >&2; exit 1; }
    GSED=gsed; 
fi


FROM=$(grep -n PPP ${BIDIX}|sed 's/:.*//'|head -n1) 
TO=$(grep -n PPP ${BIDIX}|sed 's/:.*//'|tail -n1)

N="-n"
if test x$(uname -s) = xDarwin; then N=""; fi
tail "$N" +$FROM ${BIDIX}|head -n `expr $TO - $FROM` |\

grep '<s n="Prop"/>' |\
sed 's/.*<r>//'|sed 's%</r>.*%%' | tee ${RHS} |\
# change dix format to stream format
sed 's%<s n="np"/>%<np>%' |\
sed 's%<s n="top"/>%<top>%' |\
sed 's%<s n="attr"/>%<attr>%' |\
sed 's%<s n="f"/>%<f>%' |\
sed 's%<s n="m"/>%<m>%' |\
sed 's%<s n="nt"/>%<nt>%' | tee ${ANALYSES} |\
# now to add pardefs
sed 's%\([szcx]\)<np><f>$%\1<par n="Doris__np"/>%' |\
sed 's%<np><f>$%<par n="Eva__np"/>%' |\
sed 's%\([szcx]\)<np><m>$%\1<par n="Jens__np"/>%' |\
sed 's%<np><m>$%<par n="Jo__np"/>%' |\
sed 's%<np><nt>$%<par n="Lagtinget__np"/>%' |\
sed 's%<np><top><f>$%<par n="Andøya__np"/>%' |\
sed 's%<np><top><m>$%<par n="Osen__np"/>%' |\
sed 's%<np><top><nt>$%<par n="Midhavet__np"/>%' |\
sed 's%\([szcx]\)<np><top>$%\1<par n="Ås__np"/>%' |\
sed 's%<np><top>$%<par n="Norge__np"/>%' |\
sed 's%<np><attr>$%<par n="Store__np"/>%' |\
sed 's%\([szcx]\)<np>$%\1<par n="Findus__np"/>%' |\
sed 's%<np>$%<par n="Ibsen__np"/>%' |\
${GSED} 's%^\(.*\)\(<par n=".*\)$%<i>\1</i>\2</e>%' > ${ENTRY}

# lm's shouldn't have tags in them
cat ${RHS} | sed 's%<s n="np"/>.*%%' | sed 's%<b/>% %g' |\
sed 's%\(.*\)%<e lm="\1">%' > ${LM}

# add ^, $ and change <b/> to space and &amp; to & so we see what's in the generator
cat ${ANALYSES} |\
sed 's/^/^/' | sed 's/$/$/' | sed 's%<b/>% %g' | sed 's%&amp;%\&%g'|\
lt-proc -g ${GEN} > ${SURFACES}


paste -d ': ' ${SURFACES} ${LM} ${ENTRY} |\
# remove the ones that are in the generator already
grep '^#' | sed 's%^.*:<e lm="%<e lm="%' |\
sort -u


rm -f ${ANALYSES} ${SURFACES} ${RHS} ${LM} ${ENTRY}
