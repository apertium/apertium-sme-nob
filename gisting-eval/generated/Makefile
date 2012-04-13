CORPUS=laws

all: gists.php

apertium-cleanstream: apertium-cleanstream.cc
	g++ $< -o $@

nob-sme.automorf.bin: ../../apertium-sme-nob.nob.dix
	lt-comp lr $< $@

$(CORPUS).nob.analyses: $(CORPUS).nob nob-sme.automorf.bin apertium-cleanstream
	apertium-destxt < $< | lt-proc -zwe nob-sme.automorf.bin | ./apertium-cleanstream -n | grep -F '^' > $@

$(CORPUS).MT: $(CORPUS).nobsme
	cut -f2 $< | apertium -u -d ../.. sme-nob > $@

$(CORPUS).nob: $(CORPUS).nobsme
	cut -f1 $< > $@

$(CORPUS).sme: $(CORPUS).nobsme
	cut -f2 $< > $@

gists.php:      randomise-create-phpgists.py $(CORPUS).nob.analyses $(CORPUS).nob $(CORPUS).sme $(CORPUS).MT
	python2 randomise-create-phpgists.py $(CORPUS).nob.analyses $(CORPUS).nob $(CORPUS).sme $(CORPUS).MT > $@
