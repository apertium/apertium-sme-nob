VERSION=0.5.0
LANG1=sme
LANG2=nob
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

##
##	BUILD TARGETS
##

TARGETS_COMMON = \
	$(LANG1).twol.hfst \
	$(LANG1).lexc.hfst \
	$(PREFIX1).automorf.hfst \
	$(PREFIX1).automorf.hfst.ol \
	$(PREFIX2).autogen.hfst \
	$(PREFIX1).rlx.bin \
	$(PREFIX1).lex.bin \
	$(PREFIX1).val.bin \
	$(PREFIX1).autobil.bin \
	$(PREFIX1).autogen.bin \
	$(PREFIX1).t1x.bin \
	$(PREFIX1).t2x.bin \
	$(PREFIX1).t3x.bin \
	$(PREFIX1).t4x.bin \
	$(PREFIX2).automorf.bin \
	$(PREFIX2).rlx.bin 

# Use this goal for creating .deps, otherwise make -j2 will give problems:
.deps/.d:
	if [ ! -d .deps ]; then mkdir .deps; fi
	touch $@

# Prevent the .d file from being removed automatically:
.PRECIOUS: .deps/.d


##
## 	SME ANALYSER DICTIONARY
##

$(BASENAME).$(LANG1).lexc: $(PREFIX1).autobil.bin
	@if ! test -f update-morph/langs.cfg; then \
		echo "(update-morph/langs.cfg does not exist, not re-generating the lexc)"; \
	elif test $(PYTHON) != :; then \
		$(PYTHON) update-morph/update-lexc.py --config=update-morph/langs.cfg; \
	else \
		echo ""; \
		echo "PYTHON not set. Re-run with \"autogen.sh PYTHON=/PATH/TO/python2\" if you wish to re-generate the lexc"; \
		echo ""; \
	fi;


$(LANG1).twol.hfst: $(BASENAME).$(LANG1).twol
	hfst-twolc -R -i $< -o $@

$(LANG1).lexc.hfst: $(BASENAME).$(LANG1).lexc
	hfst-lexc --format=foma -o $@ $<

$(PREFIX2).autogen.hfst: $(LANG1).twol.hfst $(LANG1).lexc.hfst
	hfst-compose-intersect -1 $(LANG1).lexc.hfst -2 $(LANG1).twol.hfst -o $@

.deps/xfst2apertium.useless.twol.hfst: xfst2apertium.useless.twol .deps/.d
	hfst-twolc -R -i $< -o $@

.deps/xfst2apertium.hashtags.twol.hfst: xfst2apertium.hashtags.twol .deps/.d
	hfst-twolc -R -i $< -o $@

.deps/$(PREFIX1).automorf.inverted.hfst: $(PREFIX2).autogen.hfst .deps/.d
	hfst-invert -i $< -o $@

.deps/$(PREFIX1).automorf.useless.hfst: .deps/$(PREFIX1).automorf.inverted.hfst .deps/xfst2apertium.useless.twol.hfst
	hfst-compose-intersect -1 .deps/$(PREFIX1).automorf.inverted.hfst -2 .deps/xfst2apertium.useless.twol.hfst -o $@

.deps/$(PREFIX1).automorf.hashtags.hfst: .deps/$(PREFIX1).automorf.useless.hfst .deps/xfst2apertium.hashtags.twol.hfst
	hfst-compose-intersect -1 .deps/$(PREFIX1).automorf.useless.hfst -2 .deps/xfst2apertium.hashtags.twol.hfst -o $@

$(PREFIX1).automorf.hfst: .deps/$(PREFIX1).automorf.hashtags.hfst xfst2apertium.relabel
	hfst-substitute -F xfst2apertium.relabel -i .deps/$(PREFIX1).automorf.hashtags.hfst -o $@

$(PREFIX1).automorf.hfst.ol: $(PREFIX1).automorf.hfst
	hfst-fst2fst -O -i $< -o $@


# Debug/development goals for testing before/after the various twol's:
.deps/$(PREFIX1).automorf.inverted.hfst.ol: .deps/$(PREFIX1).automorf.inverted.hfst
	hfst-fst2fst -O -i $< -o $@
.deps/$(PREFIX1).automorf.useless.hfst.ol: .deps/$(PREFIX1).automorf.useless.hfst
	hfst-fst2fst -O -i $< -o $@
.deps/$(PREFIX1).automorf.hashtags.hfst.ol: .deps/$(PREFIX1).automorf.hashtags.hfst
	hfst-fst2fst -O -i $< -o $@



##
## 	BILINGUAL DICTIONARY
##
.deps/$(BASENAME).$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix lexchoicebil.xsl .deps/.d
	apertium-validate-dictionary $<
	xsltproc lexchoicebil.xsl $(BASENAME).$(PREFIX1).dix > $@

$(PREFIX1).autobil.bin: .deps/$(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

##
## 	NOB GENERATOR DICTIONARY
##
$(PREFIX1).autogen.bin: $(BASENAME).$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@


$(PREFIX2).automorf.bin: $(BASENAME).$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

##
##	PRE-TAGGING
##

$(PREFIX1).rlx.bin: $(BASENAME).$(PREFIX1).rlx
	cg-comp $< $@

$(PREFIX2).rlx.bin: $(BASENAME).$(PREFIX2).rlx
	cg-comp $< $@


##
##	LEXICAL SELECTION
##

$(PREFIX1).lex.bin: $(BASENAME).$(PREFIX1).lex
	cg-comp $< $@

##
##	VALENCY
##

$(PREFIX1).val.bin: $(BASENAME).$(PREFIX1).val
	cg-comp $< $@


##
##	TRANSFER RULES
##

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $<
	apertium-preprocess-transfer $< $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $<
	apertium-preprocess-transfer $< $@

$(PREFIX1).t4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $<
	apertium-preprocess-transfer $< $@


# Alternative versions using vm-for-transfer-cpp:
$(PREFIX1).v1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $<
	apertium-transfervm-compiler -i $< -o $@

$(PREFIX1).v2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $<
	apertium-transfervm-compiler -i $< -o $@

$(PREFIX1).v3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $<
	apertium-transfervm-compiler -i $< -o $@

$(PREFIX1).v4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $<
	apertium-transfervm-compiler -i $< -o $@

vm-transfer: $(PREFIX1).v1x.bin \
             $(PREFIX1).v2x.bin \
             $(PREFIX1).v3x.bin \
             $(PREFIX1).v4x.bin

#
#	MODE FILE(S)
#

modes/$(PREFIX1).mode: modes.xml
	apertium-validate-modes modes.xml
	apertium-gen-modes modes.xml
	cp *.mode modes/

## 
##	FILES WHICH AREN'T BUILD BUT ARE DISTRIBUTED
## 

EXTRA_DIST=\
	$(BASENAME).$(LANG1).twol \
	$(BASENAME).$(LANG1).lexc \
	$(BASENAME).$(PREFIX1).rlx \
	$(BASENAME).$(PREFIX1).lex \
	$(BASENAME).$(PREFIX1).val \
	$(BASENAME).$(PREFIX1).dix \
	$(BASENAME).$(LANG2).dix \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x \
	$(BASENAME).$(PREFIX1).t4x \
	xfst2apertium.useless.twol \
	xfst2apertium.hashtags.twol \
	xfst2apertium.relabel \
	lexchoicebil.xsl \
	modes.xml 


apertium_sme_nobdir=$(prefix)/share/apertium/$(BASENAME)/
apertium_sme_modesdir=$(prefix)/share/apertium/modes/

apertium_sme_nob_DATA=$(TARGETS_COMMON) \
		    modes.xml

noinst_DATA=modes/$(PREFIX1).mode 

install-data-local:
	mv modes modes.bak
	apertium-gen-modes modes.xml $(BASENAME)
	rm -rf modes
	mv modes.bak modes
	test -d $(DESTDIR)$(apertium_sme_modesdir) || mkdir $(DESTDIR)$(apertium_sme_modesdir)
	$(INSTALL_DATA) $(PREFIX1).mode $(DESTDIR)$(apertium_sme_modesdir)
	rm $(PREFIX1).mode
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t1x $(DESTDIR)$(apertium_sme_nobdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t2x $(DESTDIR)$(apertium_sme_nobdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t3x $(DESTDIR)$(apertium_sme_nobdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t4x $(DESTDIR)$(apertium_sme_nobdir)


CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes
