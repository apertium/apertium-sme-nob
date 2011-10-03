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
	$(PREFIX1).t4x.bin

##
## 	SME ANALYSER DICTIONARY
##

$(LANG1).twol.hfst: $(BASENAME).$(LANG1).twol
	hfst-twolc -R -i $(BASENAME).$(LANG1).twol -o $@ # hfst3
#	hfst-twolc -r -i $(BASENAME).$(LANG1).twol -o $@ # hfst2

$(LANG1).lexc.hfst: $(BASENAME).$(LANG1).lexc
	hfst-lexc -o $@ $(BASENAME).$(LANG1).lexc

$(PREFIX2).autogen.hfst: $(LANG1).twol.hfst $(LANG1).lexc.hfst
	hfst-compose-intersect -1 $(LANG1).lexc.hfst -2 $(LANG1).twol.hfst -o $@ # hfst3
#	hfst-compose-intersect -l $(LANG1).lexc.hfst $(LANG1).twol.hfst -o $@ # hfst2

.deps/xfst2apertium.useless.twol.hfst: dev/xfst2apertium.useless.twol
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-twolc -R -i dev/xfst2apertium.useless.twol -o $@ # hfst3
#	hfst-twolc -r -i dev/xfst2apertium.useless.twol -o $@ # hfst2

.deps/xfst2apertium.hashtags.twol.hfst: dev/xfst2apertium.hashtags.twol
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-twolc -R -i dev/xfst2apertium.hashtags.twol -o $@ # hfst3
#	hfst-twolc -r -i dev/xfst2apertium.hashtags.twol -o $@ # hfst2

.deps/$(PREFIX1).automorf.inverted.hfst: $(PREFIX2).autogen.hfst
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-invert -i $(PREFIX2).autogen.hfst -o $@

.deps/$(PREFIX1).automorf.useless.hfst: .deps/$(PREFIX1).automorf.inverted.hfst .deps/xfst2apertium.useless.twol.hfst
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-compose-intersect -1 .deps/$(PREFIX1).automorf.inverted.hfst -2 .deps/xfst2apertium.useless.twol.hfst -o $@ # hfst3
#	hfst-compose-intersect -l .deps/$(PREFIX1).automorf.inverted.hfst .deps/xfst2apertium.useless.twol.hfst -o $@ # hfst2

.deps/$(PREFIX1).automorf.hashtags.hfst: .deps/$(PREFIX1).automorf.useless.hfst .deps/xfst2apertium.hashtags.twol.hfst
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-compose-intersect -1 .deps/$(PREFIX1).automorf.useless.hfst -2 .deps/xfst2apertium.hashtags.twol.hfst -o $@ # hfst3
#	hfst-compose-intersect -l .deps/$(PREFIX1).automorf.useless.hfst .deps/xfst2apertium.hashtags.twol.hfst -o $@ # hfst2

$(PREFIX1).automorf.hfst: .deps/$(PREFIX1).automorf.hashtags.hfst dev/xfst2apertium.relabel
	hfst-substitute -F dev/xfst2apertium.relabel -i .deps/$(PREFIX1).automorf.hashtags.hfst -o $@

$(PREFIX1).automorf.hfst.ol: $(PREFIX1).automorf.hfst
	hfst-fst2fst -O -i $(PREFIX1).automorf.hfst -o $@ # hfst3
#	hfst-lookup-optimize -i $(PREFIX1).automorf.hfst -o $@ # hfst2

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


# Alternative versions using vm-for-transfer-cpp:
$(PREFIX1).v1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-compiler -i $(BASENAME).$(PREFIX1).t1x -o $@

$(PREFIX1).v2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-compiler -i $(BASENAME).$(PREFIX1).t2x -o $@

$(PREFIX1).v3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t3x
	apertium-compiler -i $(BASENAME).$(PREFIX1).t3x -o $@

$(PREFIX1).v4x.bin: $(BASENAME).$(PREFIX1).t4x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t4x
	apertium-compiler -i $(BASENAME).$(PREFIX1).t4x -o $@

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
	$(BASENAME).$(PREFIX1).dix \
	$(BASENAME).$(LANG2).dix \
	$(BASENAME).$(PREFIX1).t1x \
	$(BASENAME).$(PREFIX1).t2x \
	$(BASENAME).$(PREFIX1).t3x \
	$(BASENAME).$(PREFIX1).t4x \
	modes.xml 


apertium_sme_nobdir=$(prefix)/share/apertium/$(BASENAME)/
apertium_sme_modesdir=$(prefix)/share/apertium/modes/

apertium_sme_nob_DATA=$(TARGETS_COMMON) \
                    $(PREFIX1).prob \
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


CLEANFILES= -rf $(TARGETS_COMMON) .deps modes
