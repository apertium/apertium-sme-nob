#!/bin/bash

## The sme-dis.rle CG, which turns into our rlx file, can turn
## arbitrary Plc tagged proper nouns into Sur tagged proper nouns, so
## we need to have a Sur entry for each Plc entry in bidix. We do this
## with a bidix pardef for the Plc entries, but some of these lemmas
## already have Sur entries -- so we need to make sure bidix doesn't
## leave any ambiguity.

## This script looks for PlcSur__np entries for which there exists a
## Sur entry with the same lemma, and then changes the PlcSur__np
## entry into a simple Plc entry.

if [ $# -ne 1 ];
then
    echo "Usage:"
    echo "\$ $0 apertium-sme-nob.sme-nob.dix > new-bidix.dix"
    exit 0;
fi

PLC=`mktemp /tmp/PLC.XXXXX`;
SUR=`mktemp /tmp/SUR.XXXXX`;
COMM=`mktemp /tmp/COMM.XXXXX`;
SEDS=`mktemp /tmp/SED.XXXXX`;

cat "$1" | grep '<s n="N"/><s n="Prop"/></l>.*<par n="PlcSur__np"/>' | sed 's/.*<l>/<l>/' | sed 's%</l>.*%%' | sort > ${PLC}
cat "$1" | grep '<s n="N"/><s n="Prop"/><s n="Sur"/></l>' | sed 's/.*<l>/<l>/' | sed 's%<s n="Sur"/></l>.*%%' | sort > ${SUR}

comm -1 -2 ${PLC} ${SUR} > ${COMM}

cat ${COMM} |\
sed 's@\(.*\)@s%\1</l>\\(.*\\)<par n="PlcSur__np"/>%\1<s n="Plc"/></l>\\1<par n="__np"/>%@' > ${SEDS}

cat "$1" | sed -f ${SEDS}

rm -f ${PLC} ${SUR} ${COMM} ${SEDS}
