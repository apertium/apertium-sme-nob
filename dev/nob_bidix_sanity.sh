# kjøres i dev-mappa:
# sh sme_bidix_sanity.sh


cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep vblex |grep '"tv"' |cut -d '>' -f7 | sort -u > tvverbs 
cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep vblex |grep '"iv"' |cut -d '>' -f7 | sort -u > ivverbs
cat tvverbs |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+TV' | cut -f2 | cut -d '+' -f1 |sort -u > gentv 
cat ivverbs |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+IV' | cut -f2 | cut -d '+' -f1 |sort -u > geniv 
echo 'The verb is not in the sme-FST or has wrong transitivity in dix:' > missingsme.txt
echo '' >> missingsme.txt
comm -23 tvverbs gentv | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt
comm -23 ivverbs geniv | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"n"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > nouns 
cat nouns |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+N+' | cut -f2 | cut -d '+' -f1 |sort -u > gennouns 
echo '' >> missingsme.txt
echo 'Nouns:' >> missingsme.txt
comm -23 nouns gennouns | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"adv"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 |grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > advs 
cat advs |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Adv' | cut -f2 | cut -d '+' -f1 |sort -u > genadvs 
echo '' >> missingsme.txt
echo 'Adverbs:' >> missingsme.txt
comm -23 advs genadvs | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt


cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"adj"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > adjs 
cat adjs |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+A+' | cut -f2 | cut -d '+' -f1 |sort -u > genadjs 
echo '' >> missingsme.txt
echo 'Adjectives:' >> missingsme.txt
comm -23 adjs genadjs | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"post"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > post 
cat post |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Po' | cut -f2 | cut -d '+' -f1 |sort -u > genpost 
echo '' >> missingsme.txt
echo 'Post:' >> missingsme.txt
comm -23 post genpost | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"pr"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > pre 
cat pre |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Pr' | cut -f2 | cut -d '+' -f1 |sort -u > genpre 
echo '' >> missingsme.txt
echo 'Prep:' >> missingsme.txt
comm -23 pre genpre | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"num"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > num 
cat num |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Num' | cut -f2 | cut -d '+' -f1 |sort -u > gennum 
echo '' >> missingsme.txt
echo 'Num:' >> missingsme.txt
comm -23 num gennum | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"prn"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > prn 
cat prn |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Pron' | cut -f2 | cut -d '+' -f1 |sort -u > genprn 
echo '' >> missingsme.txt
echo 'Pronouns:' >> missingsme.txt
comm -23 prn genprn | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"cnjcoo"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > cnjcoo 
cat cnjcoo |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+CC' | cut -f2 | cut -d '+' -f1 |sort -u > gencnjcoo 
echo '' >> missingsme.txt
echo 'cnjcoo:' >> missingsme.txt
comm -23 cnjcoo gencnjcoo | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"cnjsub"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > cnjsub 
cat cnjsub |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+CS' | cut -f2 | cut -d '+' -f1 |sort -u > gencnjsub 
echo '' >> missingsme.txt
echo 'cnjsub:' >> missingsme.txt
comm -23 cnjsub gencnjsub | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"pcle"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > pcle 
cat pcle |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Pcle' | cut -f2 | cut -d '+' -f1 |sort -u > genpcle 
echo '' >> missingsme.txt
echo 'Particles:' >> missingsme.txt
comm -23 pcle genpcle | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt

cat ../apertium-sme-nob.sme-nob.dix | tr '<' '>' | cut -d '>' -f1-10 |grep '"np"' |sed 's/>b\/>/%/g' |cut -d '>' -f7 | grep '[a-zščá][a-zščá]' |tr '%' ' ' | sort -u > proper 
cat proper |$LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst |grep '+Prop' | cut -f2 | cut -d '+' -f1 |sort -u > genproper 
echo '' >> missingsme.txt
echo 'Propernouns:' >> missingsme.txt
comm -23 proper genproper | LOOKUP -flags mbTT $GTHOME/langs/sme/src/analyser-gt-desc.xfst >> missingsme.txt
rm  tvverbs ivverbs  gentv geniv nouns gennouns advs genadvs adjs genadjs post genpost pre genpre num gennum prn genprn cnjcoo gencnjcoo cnjsub gencnjsub pcle genpcle proper genproper  

open missingsme.txt

