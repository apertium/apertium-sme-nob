# Just for fun :-) 
# nn.dix is missing some extra closed category entries used in
# sme-nob, so you'll get lots of #prpers etc.

FORMAT="txt"
NNNBSRC="/l/n"
SMENOBSRC="$(dirname $0)/.."

apertium-des${FORMAT} |\
apertium -f none -d ${SMENOBSRC} sme-nob-postchunk |\
apertium -f none -d ${NNNBSRC} nb-nn-from-transfer |\
apertium-re${FORMAT}
