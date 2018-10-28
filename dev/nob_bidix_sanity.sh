echo '\n'
echo "Script for å sjekke om norske lemma i bidix manglar i apertium-nob\n"
echo "Vi lagrar dei som ikkje får korrekt analyse i tmp_nob_missing_POS\n"
echo '\n'

echo "Først verba\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"vblex"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<vblex><inf>'|grep -v '<vblex><pstv><inf>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_verbs 

echo "så substantiva\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"n"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |egrep -v '<n><(m|f|nt)><sg><ind>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_nouns

echo "så numerala\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"num"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<num>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_nums
	
echo "så konjunksjonane\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"cnjcoo"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<cnjcoo>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_cnjcoos
	
echo "så subjunksjonane\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"cnjsub"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<cnjsub>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_cnjsubs
	
echo "så pronomena\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"prn"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<prn>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_prns
	
echo "så preposisjonane\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"pr"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<pr>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_preps
	
echo "så partiklane\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"pcle"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<pcle>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_pcles

echo "så adjektiva\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"adj"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<adj><sint><pst>'|grep -v '<adj><pst>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_adjs
	
echo "så adverba\n"
cat ../apertium-sme-nob.sme-nob.dix |grep '<r>.*"adv"'|sed 's/<r>/£/'|cut -d"£" -f2|sed 's/<b\/>/ /g;'|cut -d"<" -f1|lt-proc ../../apertium-nob/nob.automorf.bin |grep -v '<adv>'|cut -c2-|cut -d"/" -f1|rev|sort|rev|uniq > tmp_nob_missing_advs
	
	
echo '\n'
echo "Og så var vi ferdig. Kommando for leksikon:\n"


