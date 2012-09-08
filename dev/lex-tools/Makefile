CORPUS=forvaltningsordbok
LANG1=sme
LANG2=nob
DIR=/l/s
CLEANCORPUS=$(HOME)/src/smt/mosesdecoder/scripts/training/clean-corpus-n.perl
TESTINGPCT=5


all: \
	$(CORPUS).lines $(CORPUS).tagged.$(LANG1) $(CORPUS).tagged.$(LANG2) \
	testing/$(CORPUS).lines testing/$(CORPUS).tagged.$(LANG1) testing/$(CORPUS).tagged.$(LANG2) \
	$(CORPUS).biltrans.$(LANG1)-$(LANG2)


$(CORPUS).clean.$(LANG2): $(CORPUS).clean.$(LANG1)

$(CORPUS).clean.$(LANG1):
	perl $(CLEANCORPUS) $(CORPUS) $(LANG1) $(LANG2) $(CORPUS).clean 1 40

$(CORPUS).tagged0.$(LANG1): $(CORPUS).clean.$(LANG1)
	<$< apertium-destxt|awk '/^]./{printf(NR)} //{print}'|apertium -f none -d $(DIR) $(LANG1)-$(LANG2)-pretransfer > $@

$(CORPUS).tagged0.$(LANG2): $(CORPUS).clean.$(LANG2)
	<$< apertium-destxt|awk '/^]./{printf(NR)} //{print}'|apertium -f none -d $(DIR) $(LANG2)-$(LANG1)-pretransfer > $@

# To find the first line number where the tagged0 files diverge:
# paste <(cut -d']' -f1 forvaltningsordbok.tagged0.nob) <(cut -d']' -f1 forvaltningsordbok.tagged0.sme) |awk -F'\t' '$1 != $2'|head

$(CORPUS).lines0: $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	@test `wc -l <$(CORPUS).tagged0.$(LANG1)` = `wc -l <$(CORPUS).tagged0.$(LANG2)` || ( echo "$^ do not line up:"; wc -l $^; exit 1; )
	seq 1 `wc -l <$(CORPUS).tagged0.$(LANG1)` >$@

$(CORPUS).lines1:      $(CORPUS).lines0 $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	paste $+ | grep '<' | cut -f1 > $@

$(CORPUS).tagged1.$(LANG1): $(CORPUS).lines0 $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	paste $+ | grep '<' | cut -f2 > $@

$(CORPUS).tagged1.$(LANG2): $(CORPUS).lines0 $(CORPUS).tagged0.$(LANG1) $(CORPUS).tagged0.$(LANG2)
	paste $+ | grep '<' | cut -f3 > $@


$(CORPUS).biltrans.$(LANG1)-$(LANG2): $(CORPUS).tagged1.$(LANG1)
	<$< lt-proc -b $(DIR)/$(LANG1)-$(LANG2).autobil.bin > $@

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

$(CORPUS).lines: $(CORPUS).lines1 testing/.d
	./pct-split head $(TESTINGPCT) $< > $@
$(CORPUS).tagged.$(LANG1): $(CORPUS).tagged1.$(LANG1) testing/.d
	./pct-split head $(TESTINGPCT) $< > $@
$(CORPUS).tagged.$(LANG2): $(CORPUS).tagged1.$(LANG2) testing/.d
	./pct-split head $(TESTINGPCT) $< > $@
