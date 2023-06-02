###############################################################################
## Makefile for Northern Sámi--Bokmål
###############################################################################

LANG1=sme
LANG2=nob
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON =				\
	$(PREFIX1).automorf.hfst		\
	$(PREFIX1).automorf-untrimmed.hfst	\
	$(PREFIX1).mor.rlx.bin			\
	$(PREFIX1).syn.rlx.bin			\
	$(PREFIX1).lex.bin			\
	$(PREFIX1).autobil.bin			\
	$(PREFIX1).autogen.bin			\
	$(PREFIX1).t1x.bin			\
	$(PREFIX1).t2x.bin			\
	$(PREFIX1).t3x.bin			\
	$(PREFIX1).t4x.bin			\
	$(PREFIX1).rtx.bin			\
	$(PREFIX2).automorf-untrimmed.bin       \
	$(PREFIX1).autoseq.bin			\
	$(LANG2).autoseq.bin

# last one is technically nob→sme, but handy for debugging

# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

# simple make just builds sme-nob, `make nob-sme' to try nob-sme
nob-sme: $(TARGETS2)

TARGETS2 =			\
	$(PREFIX2).autogen.hfst \
	$(PREFIX2).autobil.bin	\
	$(PREFIX2).automorf.bin \
	$(PREFIX2).prob		\
	$(PREFIX2).rlx.bin      \
	$(PREFIX2).t1x.bin			\
	$(PREFIX2).automorf.bin

debug: \
	$(BASENAME).$(PREFIX1).mor.rlx \
	$(BASENAME).$(PREFIX1).syn.rlx \
	$(BASENAME).$(PREFIX2).rlx     \
	$(PREFIX1).val.bin

# Fast build – nearly everything but dictionaries:
r: modes/$(PREFIX1).mode  \
   $(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin $(PREFIX1).t4x.bin \
   $(PREFIX1).lex.bin \
   $(PREFIX1).autoseq.bin \
   $(LANG2).autoseq.bin \
   $(PREFIX1).rtx.bin

# debug/devel/temporary stuff:
nouns-nob-sme: nob-sme dev/nouns-nob-sme/$(PREFIX2).t1x.bin dev/nouns-nob-sme/$(PREFIX2).rlx.bin modes/nouns-nob-sme.mode

dev/nouns-nob-sme/$(PREFIX2).rlx.bin: dev/nouns-nob-sme/$(BASENAME).$(PREFIX2).rlx
	cg-comp $< $@

dev/nouns-nob-sme/$(PREFIX2).t1x.bin: dev/nouns-nob-sme/$(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@

###############################################################################
## Monolingual transducers
###############################################################################

# Override prefixes from ap_include, since we need the derivation-pos-changes:
.deps/%.autobil.prefixes: %.autobil.bin .deps/.d
	lt-print -H $< >.deps/$*.autobil.att
	hfst-txt2fst --disjunct -i .deps/$*.autobil.att | hfst-minimise -o .deps/$*.autobil.hfst
	hfst-project -p upper .deps/$*.autobil.hfst -o .deps/$*.autobil.upper                                   # bidix
	echo '[ "<n>" -> [ "<n>" | "<ex_n>" ] ] .o. [ "<adj>" -> [ "<adj>" | "<ex_adj>" ] ] .o. [ "<vblex>" -> [ "<vblex>" |"<ex_vblex>" ] ] .o. [ "<iv>" -> [ "<iv>" | "<ex_iv>" ] ] .o. [ "<tv>" -> [ "<tv>" | "<ex_tv>" ] ]' \
		| hfst-regexp2fst -o .deps/$*.derivpos.hfst
	hfst-compose -1 .deps/$*.autobil.upper -2 .deps/$*.derivpos.hfst -o .deps/$*.autobil-derivpos.hfst
	hfst-project -p lower .deps/$*.autobil-derivpos.hfst -o .deps/$*.autobil-derivpos.hfsa                  # bidix with n -> n|ex_n
	echo ' [ ? - %+ ]* ' | hfst-regexp2fst > .deps/$*.any-nonplus.hfst                                                        # [^+]*
	hfst-concatenate -1 .deps/$*.autobil-derivpos.hfsa -2 .deps/$*.any-nonplus.hfst -o .deps/$*.autobil.nonplussed    # bidix [^+]*
	echo ' %+ ' | hfst-regexp2fst > .deps/$*.single-plus.hfst                                                                 # +
	hfst-concatenate -1 .deps/$*.single-plus.hfst -2 .deps/$*.autobil.nonplussed -o .deps/$*.autobil.postplus # + bidix [^+]*
	hfst-repeat -f0 -t2 -i .deps/$*.autobil.postplus -o .deps/$*.autobil.postplus.0,2                      # (+ bidix [^+]*){0,2} -- gives at most two +
	hfst-concatenate -1 .deps/$*.autobil.nonplussed -2 .deps/$*.autobil.postplus.0,2 -o $@                 # bidix [^+]* (+ bidix [^+]*){0,2}

# -------------------
# Northern Saami analysis:
# -------------------

.deps/$(LANG1).automorf.hfst: $(AP_SRC1)/apertium-und.$(LANG1)-und.LR.att.gz .deps/.d
	$(ZCAT) $< | hfst-txt2fst > $@

.deps/$(PREFIX1).automorf-rmderiv-trimmed.hfst: .deps/$(LANG1).automorf-rmderiv.hfst .deps/$(PREFIX1).autobil.prefixes
	hfst-compose-intersect -1 $< -2 .deps/$(PREFIX1).autobil.prefixes -o $@

.deps/rm-deriv-cmp.hfst: rm-deriv-cmp.twol .deps/.d
	hfst-twolc -i $< -o $@

.deps/$(LANG1).automorf-rmderiv.hfst:           .deps/$(LANG1).automorf.hfst          .deps/rm-deriv-cmp.hfst
	hfst-compose-intersect -1 $< -2 .deps/rm-deriv-cmp.hfst -o $@

.deps/$(PREFIX1).automorf-rmderiv-trimmed-min.hfst: .deps/$(PREFIX1).automorf-rmderiv-trimmed.hfst
	hfst-minimize -i $< -o $@

$(PREFIX1).automorf.hfst: .deps/$(PREFIX1).automorf-rmderiv-trimmed-min.hfst
	hfst-fst2fst -w -i $< -o $@

$(PREFIX1).automorf-untrimmed.hfst: .deps/$(LANG1).automorf.hfst
	hfst-fst2fst -w -i $< -o $@

# -------------------
# Northern Saami generation:
# ---------------------

.deps/$(LANG1).autogen.hfst: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).RL.att.gz .deps/.d
	$(ZCAT) $< | hfst-txt2fst > $@

$(PREFIX2).autogen.hfst: .deps/$(LANG1).autogen.hfst
	hfst-fst2fst -O -i $< -o $@


# --------------------------
# Norwegian Bokmål analysis:
# --------------------------

$(PREFIX2).automorf-untrimmed.bin: $(AP_SRC2)/$(LANG2).automorf.bin
	cp $< $@

$(PREFIX2).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin $(PREFIX2).autobil.bin
	lt-trim $^ $@

# -------------------
# Norwegian Bokmål generation:
# ---------------------

$(PREFIX1).autogen.bin: $(AP_SRC2)/$(LANG2).autogen.bin
	cp $< $@


###############################################################################
## Disambiguation rules
###############################################################################

$(PREFIX1).mor.rlx.bin: $(AP_SRC1)/$(LANG1).mor.rlx.bin
	cp $< $@

$(PREFIX1).syn.rlx.bin: $(AP_SRC1)/$(LANG1).syn.rlx.bin
	cp $< $@

$(PREFIX2).rlx.bin: $(AP_SRC2)/$(LANG2).rlx.bin
	cp $< $@

$(PREFIX2).prob: $(AP_SRC2)/$(LANG2).prob
	cp $< $@


# Debug goals:
$(BASENAME).$(PREFIX1).mor.rlx: $(AP_SRC1)/disambiguation-mt-gt.cg3
	cp $< $@

$(BASENAME).$(PREFIX1).syn.rlx: $(AP_SRC1)/functions-mt-gt.cg3
	cp $< $@

$(BASENAME).$(PREFIX2).rlx: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).rlx
	cp $< $@


###############################################################################
## Separable / discontiguous multiwords
###############################################################################

$(PREFIX1).autoseq.bin: $(BASENAME).$(PREFIX1).lsx
	lsx-comp lr $< $@

$(PREFIX2).autoseq.bin: $(BASENAME).$(PREFIX2).lsx
	lsx-comp lr $< $@

$(LANG1).autoseq.bin: $(BASENAME).$(LANG1).lsx
	lsx-comp lr $< $@

$(LANG2).autoseq.bin: $(BASENAME).$(LANG2).lsx
	lsx-comp lr $< $@


###############################################################################
## Bilingual dictionaries
###############################################################################

$(PREFIX1).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFIX2).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

###############################################################################
## Lexical selection rules
###############################################################################

$(PREFIX1).lex.bin: $(BASENAME).$(PREFIX1).lex
	cg-comp $< $@

##
##	VALENCY
##

$(PREFIX1).val.bin: $(BASENAME).$(PREFIX1).val
	cg-comp $< $@


###############################################################################
## Structural transfer rules
###############################################################################

define ap-transfer-lint =
@( command -v apertium-preprocess-transfer-bytecode-j >/dev/null && apertium-preprocess-transfer-bytecode-j $< /dev/null ) || true
endef

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@
# Not using ap-transfer-lint for t1x yet: https://github.com/apertium/lttoolbox-java/issues/2

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $<
	$(ap-transfer-lint)
	apertium-preprocess-transfer $< $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $<
	$(ap-transfer-lint)
	apertium-preprocess-transfer $< $@

$(PREFIX1).t4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $<
	$(ap-transfer-lint)
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
EXTRA_DIST=				\
	$(BASENAME).$(PREFIX1).lex	\
	$(BASENAME).$(PREFIX1).val	\
	$(BASENAME).$(PREFIX1).dix	\
	$(BASENAME).$(PREFIX1).t1x	\
	$(BASENAME).$(PREFIX1).t2x	\
	$(BASENAME).$(PREFIX1).t3x	\
	$(BASENAME).$(PREFIX1).t4x	\
	rm-deriv-cmp.twol		\
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

test-bidix-gen:
	dev/sme-nob.inconsistency.sh

test-previous-offenders: all
	./previous-offenders

test-install: all
	DESTDIR=tmp-$@ make install
	find tmp-$@ -type f -name '*.mode' | xargs sed -i.tmp "s% '\($(prefix)\)% 'tmp-$@/\1%g"
	echo "Mus lea oahpahus gaskkal guovtti ja njealji." | apertium -d tmp-$@/$(prefix)/share/apertium sme-nob | tee tmp-$@/mt
	@echo "Jeg har undervisning mellom to og fire." > tmp-$@/ref
	@diff tmp-$@/ref tmp-$@/mt
	@rm -rf tmp-$@

# TODO: test-bidix-gen script needs fixing
test: all test-previous-offenders test-install
	apertium-regtest test
