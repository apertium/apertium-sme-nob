###############################################################################
## Makefile for Northern Sámi--Bokmål
###############################################################################

VERSION=0.5.2
LANG1=sme
LANG2=nob
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

##
##	BUILD TARGETS
##

TARGETS_COMMON = $(TARGETS1)

# simple make just builds sme-nob, `make nob-sme' to try that
nob-sme: $(TARGETS2)

TARGETS1 = \
	$(PREFIX1).automorf.hfst \
	$(PREFIX1).automorf-untrimmed.hfst \
	$(PREFIX1).mor.rlx.bin \
	$(PREFIX1).syn.rlx.bin \
	$(PREFIX1).lex.bin \
	$(PREFIX1).val.bin \
	$(PREFIX1).autobil.bin \
	$(PREFIX1).autogen.bin \
	$(PREFIX1).t1x.bin \
	$(PREFIX1).t2x.bin \
	$(PREFIX1).t3x.bin \
	$(PREFIX1).t4x.bin

TARGETS2 = \
	$(PREFIX2).autogen.hfst \
	$(PREFIX2).autobil.bin \
	$(PREFIX2).automorf.bin \
	$(PREFIX2).prob \
	$(PREFIX2).rlx.bin

# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

# TODO: these should be installed by giella-sme
debug: \
	$(BASENAME).$(PREFIX1).mor.rlx \
	$(BASENAME).$(PREFIX1).syn.rlx \
	$(BASENAME).$(PREFIX2).rlx

###############################################################################
## Transducers, disambiguation rules, transfer
###############################################################################

##
## 	SME ANALYSER DICTIONARY
##

.deps/$(PREFIX1).autobil.prefixes: $(PREFIX1).autobil.bin .deps/.d
	lt-print $< | sed 's/ /@_SPACE_@/g' > .deps/$(PREFIX1).autobil.att
	hfst-txt2fst -e ε <  .deps/$(PREFIX1).autobil.att > .deps/$(PREFIX1).autobil.hfst
	hfst-project -p upper .deps/$(PREFIX1).autobil.hfst > .deps/$(PREFIX1).autobil.upper                                   # bidix
	echo ' [ ? - %+ ]* ' | hfst-regexp2fst > .deps/$(PREFIX1).any-nonplus.hfst                                                        # [^+]*
	hfst-concatenate -1 .deps/$(PREFIX1).autobil.upper -2 .deps/$(PREFIX1).any-nonplus.hfst -o .deps/$(PREFIX1).autobil.nonplussed    # bidix [^+]*
	echo ' %+ ' | hfst-regexp2fst > .deps/single-plus.hfst                                                                 # +
	hfst-concatenate -1 .deps/single-plus.hfst -2 .deps/$(PREFIX1).autobil.nonplussed -o .deps/$(PREFIX1).autobil.postplus # + bidix [^+]*
	hfst-repeat -f0 -t1 -i .deps/$(PREFIX1).autobil.postplus -o .deps/$(PREFIX1).autobil.postplus.0,1                      # (+ bidix [^+]*){0,1} -- gives at most one +
	hfst-concatenate -1 .deps/$(PREFIX1).autobil.nonplussed -2 .deps/$(PREFIX1).autobil.postplus.0,1 -o $@                 # bidix [^+]* (+ bidix [^+]*){0,1}

.deps/$(LANG1).automorf.hfst: $(AP_SRC1)/$(BASENAME).$(PREFIX1).LR.att.gz .deps/.d
	$(ZCAT) $< | hfst-txt2fst > $@

.deps/$(LANG1).autogen.hfst: .deps/$(LANG1).automorf.hfst
	hfst-invert -i $< -o $@

.deps/$(PREFIX1).automorf-trimmed.hfst: .deps/$(LANG1).automorf.hfst .deps/$(PREFIX1).autobil.prefixes
	hfst-compose-intersect -1 $< -2 .deps/$(PREFIX1).autobil.prefixes -o $@

.deps/rm-deriv-cmp.hfst: rm-deriv-cmp.twol .deps/.d
	hfst-twolc -i $< -o $@

.deps/$(PREFIX1).automorf-trimmed-nocmp.hfst: .deps/$(PREFIX1).automorf-trimmed.hfst .deps/rm-deriv-cmp.hfst
	hfst-compose-intersect -1 $< -2 .deps/rm-deriv-cmp.hfst -o $@

$(PREFIX1).automorf.hfst: .deps/$(PREFIX1).automorf-trimmed-nocmp.hfst
	hfst-fst2fst -O -i $< -o $@

$(PREFIX1).automorf-untrimmed.hfst: .deps/$(LANG1).automorf.hfst
	hfst-fst2fst -O -i $< -o $@


$(PREFIX2).autogen.hfst: .deps/$(LANG1).autogen.hfst
	hfst-fst2fst -O -i $< -o $@


##
## 	BILINGUAL DICTIONARY
###
#.deps/$(BASENAME).$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix lexchoicebil.xsl .deps/.d
#	apertium-validate-dictionary $<
#	xsltproc lexchoicebil.xsl $(BASENAME).$(PREFIX1).dix > $@

#$(PREFIX1).autobil.bin: .deps/$(BASENAME).$(PREFIX1).dix
$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

#$(PREFIX2).autobil.bin: .deps/$(BASENAME).$(PREFIX1).dix
$(PREFIX2).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@


##
## 	NOB GENERATOR DICTIONARY
##
$(PREFIX1).autogen.bin: $(AP_SRC2)/$(LANG2).autogen.bin
	cp $< $@


$(PREFIX2).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin $(PREFIX2).autobil.bin
	lt-trim $^ $@

##
##	PRE-TAGGING
##

$(PREFIX1).mor.rlx.bin: $(BASENAME).$(PREFIX1).mor.rlx gt2apertium.cg3r .deps/.d
	grep -ve ^SUBSTITUTE -e ^COPY -e RemoveFromApertium $< >.deps/$<.grepd
	cg-relabel .deps/$<.grepd gt2apertium.cg3r .deps/$<.reld
	cg-comp .deps/$<.reld $@

$(PREFIX1).syn.rlx.bin: $(BASENAME).$(PREFIX1).syn.rlx gt2apertium.cg3r .deps/.d
	grep -ve ^SUBSTITUTE -e ^COPY -e RemoveFromApertium $< >.deps/$<.grepd
	cg-relabel .deps/$<.grepd gt2apertium.cg3r .deps/$<.reld
	echo 'SUBSTITUTE (<ext>) (*) (<ext>);SUBSTITUTE (<hab>) (*) (<hab>); SUBSTITUTE (<sme>) (*) (<sme>);' >> .deps/$<.reld
	cg-comp .deps/$<.reld $@

$(PREFIX2).rlx.bin: $(AP_SRC2)/$(LANG2).rlx.bin
	cp $< $@

$(PREFIX2).prob: $(AP_SRC2)/$(LANG2).prob
	cp $< $@


$(BASENAME).$(PREFIX1).mor.rlx: $(AP_SRC1)/disambiguation-mt-gt.cg3
	cp $< $@

$(BASENAME).$(PREFIX1).syn.rlx: $(AP_SRC1)/functions-mt-gt.cg3
	cp $< $@

$(BASENAME).$(PREFIX2).rlx: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).rlx
	cp $< $@



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
	apertium-compile-transfer -i $< -o $@

$(PREFIX1).v2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $<
	apertium-compile-transfer -i $< -o $@

$(PREFIX1).v3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $<
	apertium-compile-transfer -i $< -o $@

$(PREFIX1).v4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $<
	apertium-compile-transfer -i $< -o $@

vm-transfer: $(PREFIX1).v1x.bin \
             $(PREFIX1).v2x.bin \
             $(PREFIX1).v3x.bin \
             $(PREFIX1).v4x.bin

###############################################################################
## Distribution
###############################################################################

# Files which aren't built, but are distributed:
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
	lexchoicebil.xsl \
	modes.xml

###############################################################################
## Installation
###############################################################################

apertium_sme_nobdir=$(prefix)/share/apertium/$(BASENAME)/

# Files which should be installed to $(prefix)/share/apertium/$(BASENAME)/:
apertium_sme_nob_DATA=$(TARGETS_COMMON) \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x \
	$(BASENAME).$(PREFIX1).t4x

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode

install-data-local: install-modes


###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

###############################################################################
## Test
###############################################################################

test: all
	echo "Mus lea oahpahus gaskkal guovtti ja njealji." | apertium -d . sme-nob | tee .test-mt
	@echo "Jeg har undervisninga mellom to og fire." > .test-ref
	@diff .test-ref .test-mt
	@rm .test-ref .test-mt
