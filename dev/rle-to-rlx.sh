#!/bin/bash
if [ $# -ne 1 ];
then
    echo "Usage:"
    echo "$ cp /PATH/TO/sme-dis.rle apertium-sme-nob.sme-nob.rlx"
    echo "$ dev/rle-to-rlx.rlx apertium-sme-nob.sme-nob.rlx"
    exit 0;
fi

SYNLABELS=("OBJ→" "@-FOBJ→" "@-FSUBJ→" "@-F←OBJ" "@ADVL←" "@ADVL→" "@APP-ADVL←" "@APP-Num←" "@APP-N←" "@APP-Pron←" "@APP→Pron" "@A←" "@COMP-CS←" "@Num←" "@N←" "@OBJ→" "@OBJ→SPRED" "@OPRED→" "@P←" "@SPRED→" "@SPRED←OBJ" "@SUBJ→" "@SUBJ←OBJ" "@→A" "@←ADVL" "@→ADVL" "@→N" "@→Num" "@←OBJ" "@←OPRED" "@→P" "@→Pron" "@←SPRED" "@←SUBJ" )

echo "Turning < and > into arrows in syntactic labels..."
for A in ${SYNLABELS[*]}
do
    G=`echo $A | sed 's/←/</g'  | sed 's/→/>/g'`;
    sed -i".tmp" "s/$G/$A/g" "$1"
done

UNDERSCORES=( "Der_oaivvat" "Der_t" "Der_Dimin" "Der_NuA" "Der_Pass" "Der_PassL" "Der_PassS" "Der_adda" "Der_ahtti" "Der_alla" "Der_amoš" "Der_asti" "Der_d" "Der_diibmosaš" "Der_duohkai" "Der_duohke" "Der_eaddji" "Der_eamoš" "Der_eapmi" "Der_easti" "Der_g" "Der_geahtes" "Der_gielat" "Der_goahti" "Der_h" "Der_halla" "Der_hat" "Der_heapmi" "Der_hudda" "Der_huhtti" "Der_huvva" "Der_j" "Der_jagáš" "Der_jahkásaš" "Der_keahtes" "Der_l" "Der_las" "Der_laš" "Der_lágan" "Der_lágaš" "Der_lágán" "Der_meahttun" "Der_muš" "Der_n" "Der_st" "Der_stuvva" "Der_supmi" "Der_upmi" "Der_us" "Der_veara" "Der_viđi" "Der_viđá" "Der_vuohta" "Der_vuolde" "Der_vuollai" "Der_vuolle" "Der_š" "Foc_ba" "Foc_bat" "Foc_be" "Foc_ge" "Foc_gen" "Foc_ges" "Foc_gis" "Foc_hal" "Foc_han" "Foc_naj" "Foc_so" )

echo "Turning / into _ in derivations and clitics..."
for A in ${UNDERSCORES[*]}
do
    G=`echo $A | sed 's%_%/%g'` ;
    sed -i".tmp" "s%$G%$A%g" "$1"
done

### Remove #'s from lexicalised compounds
echo "Removing # symbols from lexicalised compounds..."
SED=sed
if test x$(uname -s) = xDarwin; then
        SED=gsed
fi
# There might be several # within a word
$SED -i".tmp" -e '
:START
s/\("[^" ;()]*\)#\([^" ;()]*"\)/\1\2/
tSTART' "$1"

echo "Done. Now manually remove lines adding tags like <uttv>"
