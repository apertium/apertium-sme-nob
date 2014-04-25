#Find words in bidix which are not in the fst or the PoS or other tags are not correct

echo "MISSING words in bidix" > $HOME/apertium/trunk/apertium-sme-nob/dev/testgen/testgenreport.txt
grep '<l>' $HOME/apertium/trunk/apertium-sme-nob/apertium-sme-nob.sme-nob.dix | egrep -v '(<l><|^\!|^<\!)' | grep -v '<par .*<p>' | sed 's/<b\/>/ /' | tr "<" ">" | cut -d ">" -f7 | $HLOOKUP $HOME/apertium/trunk/apertium-sme-nob/sme-nob.automorf.hfst | grep '+?' |cut -f1 | sort >> $HOME/apertium/trunk/apertium-sme-nob/dev/testgen/testgenreport.txt

see $HOME/apertium/trunk/apertium-sme-nob/dev/testgen/testgenreport.txt

