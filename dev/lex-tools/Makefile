CORPUS=forvaltningsordbok
LANG1=sme
LANG2=nob
DIR=/l/s
CLEANCORPUS=$(HOME)/src/smt/mosesdecoder/scripts/training/clean-corpus-n.perl
TRAINMODEL=$(HOME)/src/smt/mosesdecoder/scripts/training/train-model.perl
GIZADIR=$(HOME)/src/smt/local/bin
LEXTOOLSDIR=$(HOME)/src/apertium/trunk/apertium-lex-tools
TESTINGPCT=5
PYTHON=python2


all: \
	        $(CORPUS).lines         $(CORPUS).tag-tok.$(LANG1)        $(CORPUS).tag-tok.$(LANG2)        $(CORPUS).biltrans-tok.$(LANG1)-$(LANG2) \
	testing/$(CORPUS).lines testing/$(CORPUS).tagged.$(LANG1) testing/$(CORPUS).tagged.$(LANG2) testing/$(CORPUS).biltrans.$(LANG1)-$(LANG2)




# Clean corpus:
$(CORPUS).clean.$(LANG2): $(CORPUS).clean.$(LANG1)

$(CORPUS).clean.$(LANG1):
	perl $(CLEANCORPUS) $(CORPUS) $(LANG1) $(LANG2) $(CORPUS).clean 1 40



# Run analysis up to pretransfer:
$(CORPUS).tagged0.$(LANG1): $(CORPUS).clean.$(LANG1)
	<$< apertium-destxt|awk '/^]./{printf(NR)} //{print}'|apertium -f none -d $(DIR) $(LANG1)-$(LANG2)-pretransfer > $@

$(CORPUS).tagged0.$(LANG2): $(CORPUS).clean.$(LANG2)
	<$< apertium-destxt|awk '/^]./{printf(NR)} //{print}'|apertium -f none -d $(DIR) $(LANG2)-$(LANG1)-pretransfer > $@

# One file might have inserted or deleted some line breaks; to find the first line number where the tagged0 files diverge:
# paste <(cut -d']' -f1 forvaltningsordbok.tagged0.nob) <(cut -d']' -f1 forvaltningsordbok.tagged0.sme) |awk -F'\t' '$1 != $2'|head

$(CORPUS).lines0: $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	@test `wc -l <$(CORPUS).tagged0.$(LANG1)` = `wc -l <$(CORPUS).tagged0.$(LANG2)` || ( echo "$^ do not line up:"; wc -l $^; exit 1; )
	seq 1 `wc -l <$(CORPUS).tagged0.$(LANG1)` >$@


# Grep out only lines that have analyses:
$(CORPUS).lines1:      $(CORPUS).lines0 $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	paste $+ | grep '<' | cut -f1 > $@
$(CORPUS).tagged1.$(LANG1): $(CORPUS).lines0 $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	paste $+ | grep '<' | cut -f2 > $@
$(CORPUS).tagged1.$(LANG2): $(CORPUS).lines0 $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	paste $+ | grep '<' | cut -f3 > $@

# Run bilingual analyses on remaining lines:
$(CORPUS).biltrans1.$(LANG1)-$(LANG2): $(CORPUS).tagged1.$(LANG1)
	<$< lt-proc -b $(DIR)/$(LANG1)-$(LANG2).autobil.bin > $@



# Split into testing and training:
testing/.d:
	if [ ! -d testing ]; then mkdir testing; fi
	touch $@
.PRECIOUS: testing/.d

testing/$(CORPUS).lines: $(CORPUS).lines1 testing/.d
	./pct-split tail $(TESTINGPCT) $< > $@
testing/$(CORPUS).tagged.$(LANG1): $(CORPUS).tagged1.$(LANG1) testing/.d
	./pct-split tail $(TESTINGPCT) $< > $@
testing/$(CORPUS).tagged.$(LANG2): $(CORPUS).tagged1.$(LANG2) testing/.d
	./pct-split tail $(TESTINGPCT) $< > $@
testing/$(CORPUS).biltrans.$(LANG1)-$(LANG2): $(CORPUS).biltrans1.$(LANG1)-$(LANG2) testing/.d
	./pct-split tail $(TESTINGPCT) $< > $@

$(CORPUS).lines: $(CORPUS).lines1
	./pct-split head $(TESTINGPCT) $< > $@
$(CORPUS).tagged.$(LANG1): $(CORPUS).tagged1.$(LANG1)
	./pct-split head $(TESTINGPCT) $< > $@
$(CORPUS).tagged.$(LANG2): $(CORPUS).tagged1.$(LANG2)
	./pct-split head $(TESTINGPCT) $< > $@
$(CORPUS).biltrans.$(LANG1)-$(LANG2): $(CORPUS).biltrans1.$(LANG1)-$(LANG2)
	./pct-split head $(TESTINGPCT) $< > $@


# Tokenise into moses format, and do some tag replacements to increase lemma-frequency a bit:
$(CORPUS).tag-tok.$(LANG1): $(CORPUS).tagged.$(LANG1)
	<$< $(PYTHON) $(LEXTOOLSDIR)/scripts/process-tagger-output.py $(LANG1) >$@ || rm $@
$(CORPUS).tag-tok.$(LANG2): $(CORPUS).tagged.$(LANG2)
	<$< $(PYTHON) $(LEXTOOLSDIR)/scripts/process-tagger-output.py $(LANG2) >$@ || rm $@
$(CORPUS).biltrans-tok.$(LANG1)-$(LANG2): $(CORPUS).biltrans.$(LANG1)-$(LANG2)
	<$< $(PYTHON) $(LEXTOOLSDIR)/scripts/process-biltrans-output.py >$@ || rm $@


# Fake lm, won't be used:
$(CORPUS).lm:
	echo "" > $@
	echo "\\data\\" >> $@
	echo "ngram 1=1" >>$@
	echo "" >> $@
	echo "\\1-grams:" >>$@
	echo "-2.701261	.	-1.861745" >>$@
	echo "" >> $@
	echo "\\end\\" >> $@

model: $(CORPUS).lm $(CORPUS).tag-tok.$(LANG1) $(CORPUS).tag-tok.$(LANG2)
	perl $(TRAINMODEL) -external-bin-dir $(GIZADIR) -root-dir . -corpus $(CORPUS).tag-tok -f $(LANG1) -e $(LANG2) -alignment grow-diag-final-and -reordering msd-bidirectional-fe -lm "0:5:`pwd`/$(CORPUS).lm:0" >trainmodel.log 2>&1
