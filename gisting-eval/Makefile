all: gists.php

apertium-cleanstream: apertium-cleanstream.cc
	g++ $< -o $@

nob-sme.automorf.bin: ../apertium-sme-nob.nob.dix
	lt-comp lr $< $@

laws.nob.analyses: laws.nob nob-sme.automorf.bin apertium-cleanstream
	apertium-destxt < $< | lt-proc -zwe nob-sme.automorf.bin | ./apertium-cleanstream -n | grep -F '^' > $@

laws.MT: laws.nobsme
	cut -f2 $< | apertium -u -d .. sme-nob > $@

laws.nob: laws.nobsme
	cut -f1 $< > $@

laws.sme: laws.nobsme
	cut -f2 $< > $@

gists.php:      randomise-create-phpgists.py laws.nob.analyses laws.nob laws.sme laws.MT
	python2 randomise-create-phpgists.py laws.nob.analyses laws.nob laws.sme laws.MT > $@
