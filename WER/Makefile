# See https://wiki.apertium.org/wiki/Evaluation for apertium-eval-translator
# Requires GNU Make (uses pattern rules)

LANG1=sme
LANG2=nob
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

# Redo the WER test if any of these files change: 
# (is there a simpler way to test if a Makefile.am has run?)
TRANSLATOR = \
	../$(PREFIX1).automorf.hfst.ol \
	../$(PREFIX1).rlx.bin \
	../$(PREFIX1).prob \
	../$(PREFIX1).lex.bin \
	../$(PREFIX1).autobil.bin \
	../apertium-$(PREFIX1).$(PREFIX1).t1x \
	../apertium-$(PREFIX1).$(PREFIX1).t2x \
	../apertium-$(PREFIX1).$(PREFIX1).t3x \
	../apertium-$(PREFIX1).$(PREFIX1).t4x \
	../$(PREFIX1).t1x.bin \
	../$(PREFIX1).t2x.bin \
	../$(PREFIX1).t3x.bin \
	../$(PREFIX1).t4x.bin \
	../$(PREFIX1).autogen.bin \
	../$(PREFIX1).mode

MT := $(patsubst %.$(LANG1),%.MT,$(wildcard *.$(LANG1)))

%.MT : %.$(LANG1) $(TRANSLATOR)
	apertium -d .. $(PREFIX1) < $< > $@

results := $(patsubst %.$(LANG1),%.res,$(wildcard *.$(LANG1)))

%.res : %.MT
	apertium-eval-translator -t $< -r $(patsubst %.res,%.$(LANG2),$@) > $@


all : $(results) allbeam


allMT : $(MT)
	@cat $(MT) > allMT

allbeam : allMT $(MT)
	@echo ""
	@echo "Running beam search (n=5) on all translations"
	@echo "(use 'make allres' to eval everything with full search, takes a while)"
	@cat $(patsubst %.MT,%.$(LANG2),$(MT)) > all$(LANG2)
	@cat $(patsubst %.MT,%.$(LANG1),$(MT)) > all$(LANG1)
	apertium-eval-translator -t allMT -r all$(LANG2) -b 5 > $@

allres : allMT $(MT)
	@echo "Full evaluation of all files, this takes a while..."
	@cat $(patsubst %.MT,%.$(LANG2),$(MT)) > all$(LANG2)
	@cat $(patsubst %.MT,%.$(LANG1),$(MT)) > all$(LANG1)
	apertium-eval-translator -t allMT -r all$(LANG2) > $@
