VERSION=0.1.0
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
	$(PREFIX1).autobil.bin \
	$(PREFIX1).autogen.bin \
	$(PREFIX1).t1x.bin \
	$(PREFIX1).t2x.bin \
	$(PREFIX1).t3x.bin \
	$(PREFIX1).t4x.bin \
	$(PREFIX1).mode

##
## 	SME ANALYSER DICTIONARY
##

$(LANG1).twol.hfst: $(BASENAME).$(LANG1).twol
	hfst-twolc -r -i $(BASENAME).$(LANG1).twol -o $@

$(LANG1).lexc.hfst: $(BASENAME).$(LANG1).lexc
	hfst-lexc $(BASENAME).$(LANG1).lexc -o $@

.deps/uppercase-first.twol.hfst: dev/uppercase-first.twol
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-twolc -r -i dev/uppercase-first.twol -o $@

$(PREFIX2).autogen.hfst: $(LANG1).twol.hfst $(LANG1).lexc.hfst .deps/uppercase-first.twol.hfst
	hfst-compose-intersect -l $(LANG1).lexc.hfst $(LANG1).twol.hfst -o $@.tmp
	hfst-compose-intersect -l $@.tmp .deps/uppercase-first.twol.hfst -o $@
	@rm $@.tmp

.deps/xfst2apertium.useless.twol.hfst: dev/xfst2apertium.useless.twol
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-twolc -r -i dev/xfst2apertium.useless.twol -o $@

.deps/xfst2apertium.hashtags.twol.hfst: dev/xfst2apertium.hashtags.twol
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-twolc -r -i dev/xfst2apertium.hashtags.twol -o $@

$(PREFIX1).automorf.hfst: $(PREFIX2).autogen.hfst dev/xfst2apertium.relabel .deps/xfst2apertium.useless.twol.hfst .deps/xfst2apertium.hashtags.twol.hfst
	hfst-invert $(PREFIX2).autogen.hfst -o $@.1.tmp
	hfst-compose-intersect -l $@.1.tmp .deps/xfst2apertium.useless.twol.hfst -o $@.2.tmp
	hfst-compose-intersect -l $@.2.tmp .deps/xfst2apertium.hashtags.twol.hfst -o $@.3.tmp
	hfst-substitute -F dev/xfst2apertium.relabel -i $@.3.tmp -o $@
	@rm $@.1.tmp $@.2.tmp $@.3.tmp

$(PREFIX1).automorf.hfst.ol: $(PREFIX1).automorf.hfst
	hfst-lookup-optimize -i $(PREFIX1).automorf.hfst -o $@

##
## 	BILINGUAL DICTIONARY
##
.deps/$(BASENAME).$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix lexchoicebil.xsl
	if [ ! -d .deps ]; then mkdir .deps; fi
	xsltproc lexchoicebil.xsl $(BASENAME).$(PREFIX1).dix > $@

$(PREFIX1).autobil.bin: .deps/$(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary .deps/$(BASENAME).$(PREFIX1).dix
	lt-comp lr .deps/$(BASENAME).$(PREFIX1).dix $@

##
## 	NOB GENERATOR DICTIONARY
##
$(PREFIX1).autogen.bin: $(BASENAME).$(LANG2).dix
	apertium-validate-dictionary $(BASENAME).$(LANG2).dix
	lt-comp rl $(BASENAME).$(LANG2).dix $@

##
##	PRE-TAGGING
##

$(PREFIX1).rlx.bin: $(BASENAME).$(PREFIX1).rlx
	cg-comp $(BASENAME).$(PREFIX1).rlx $@

##
##	LEXICAL SELECTION
##

$(PREFIX1).lex.bin: $(BASENAME).$(PREFIX1).lex
	cg-comp $(BASENAME).$(PREFIX1).lex $@

##
##	TRANSFER RULES
##

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@

$(PREFIX1).t4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t4x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t4x $@


#
#	MODE FILE(S)
#

$(PREFIX1).mode: modes.xml
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
	$(BASENAME).$(PREFIX1).dix \
	$(BASENAME).$(LANG2).dix \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x \
	$(BASENAME).$(PREFIX1).t4x \
	modes.xml 


apertium_sme_nobdir=$(prefix)/share/apertium/$(BASENAME)/
apertium_sme_modesdir=$(prefix)/share/apertium/modes/

apertium_sme_nob_DATA=$(TARGETS_COMMON)


CLEANFILES= -rf $(TARGETS_COMMON) .deps modes
