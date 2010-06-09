#!/bin/bash

if [ "$#" -ne 0 ]; then echo "Usage: sh make-paste.sh\n Run after make to splice source, reference and MT"; exit 1; fi

SS=`mktemp -t WER.sme.XXXXXXXXXX`;
RR=`mktemp -t WER.nob.XXXXXXXXXX`;
MM=`mktemp -t WER.MT.XXXXXXXXXX`;

for S in *.sme; do
    R=$(echo $S | sed 's/\.sme$/.nob/')
    M=$(echo $S | sed 's/\.sme$/.MT/')
    sed 's/^/S /' $S > $SS
    sed 's/^/R /' $R > $RR
    sed 's/^/M /' $M > $MM
    # the "remove all" is just to get an empty line between each triplet:
    sed 's/.*//' $S | paste -d'\n' $SS $RR $MM -
done
