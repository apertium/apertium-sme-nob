VERSION=0.1.0
LANG1=sme
LANG2=nob
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON = \
	$(PREFIX1).twol.hfst \
	$(PREFIX1).lexc.hfst \
	$(PREFIX1).automorf.hfst \
	$(PREFIX1).autogen.hfst \
	$(PREFIX1).rlx.bin \
	$(PREFIX1).autobil.bin \
	$(PREFIX1).t1x.bin \
	$(PREFIX1).t2x.bin \
	$(PREFIX1).t3x.bin

$(PREFIX1).twol.hfst: $(BASENAME).$(LANG1).twol
	hfst-twolc -r -i $(BASENAME).$(LANG1).twol -o $@

$(PREFIX1).lexc.hfst: $(BASENAME).$(LANG1).lexc
	hfst-lexc $(BASENAME).$(LANG1).lexc -o $@

$(PREFIX1).autogen.hfst: $(PREFIX1).twol.hfst $(PREFIX1).lexc.hfst
	hfst-compose-intersect -l $(PREFIX1).lexc.hfst $(PREFIX1).twol.hfst -o $@

$(PREFIX1).automorf.hfst: $(PREFIX1).autogen.hfst
	hfst-invert $(PREFIX1).autogen.hfst -o $@

$(PREFIX1).rlx.bin: $(BASENAME).$(PREFIX1).rlx
	cg-comp $(BASENAME).$(PREFIX1).rlx $@

$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $(BASENAME).$(PREFIX1).dix
	lt-comp lr $(BASENAME).$(PREFIX1).dix $@

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@



EXTRA_DIST=\
	$(BASENAME).$(LANG1).twol \
	$(BASENAME).$(LANG1).lexc \
	$(BASENAME).$(PREFIX1).rlx \
	$(BASENAME).$(PREFIX1).dix \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x

apertium_sme_nobdir=$(prefix)/share/apertium/apertium-$(PREFIX1)/
apertium_sme_modesdir=$(prefix)/share/apertium/modes/

apertium_sme_nob_DATA=$(TARGETS_COMMON)

CLEANFILES=$(TARGETS_COMMON)
