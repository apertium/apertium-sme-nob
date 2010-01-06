VERSION=0.1.0
LANG1=sme
LANG2=nob
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON = \
	$(PREFIX1).twol.bin \
	$(PREFIX1).autobil.bin

$(PREFIX1).twol.bin: $(BASENAME).$(LANG1).twol
	hfst-twolc -r -i $(BASENAME).$(LANG1).twol -o $@

$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp lr $(BASENAME).$(PREFIX1).dix $@


EXTRA_DIST=\
	$(BASENAME).$(PREFIX1).twol \
	$(BASENAME).$(PREFIX1).dix

apertium_sme_nobdir=$(prefix)/share/apertium/apertium-$(PREFIX1)/
apertium_sme_modesdir=$(prefix)/share/apertium/modes/

apertium_sme_nob_DATA=$(TARGETS_COMMON)


	
