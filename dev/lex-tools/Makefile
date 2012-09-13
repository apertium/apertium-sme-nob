CORPUS=forvaltningsordbok
LANG1=sme
LANG2=nob
DIR=/l/s
CLEANCORPUS=$(HOME)/src/smt/mosesdecoder/scripts/training/clean-corpus-n.perl
TRAINMODEL=$(HOME)/src/smt/mosesdecoder/scripts/training/train-model.perl
GIZADIR=$(HOME)/src/smt/local/bin
LEXTOOLSDIR=$(HOME)/src/apertium/trunk/apertium-lex-tools
TESTINGPCT=5
PYTHON2=python2
PYTHON3=python3


all:    $(CORPUS).ngrams.$(LANG1)-$(LANG2).lrx \
	model/moses.ini $(CORPUS).phrasetable.$(LANG1)-$(LANG2) \
	        $(CORPUS).lines         $(CORPUS).tag-tok.$(LANG1)        $(CORPUS).tag-tok.$(LANG2)        $(CORPUS).biltrans-tok.$(LANG1)-$(LANG2) \
	testing/$(CORPUS).lines testing/$(CORPUS).tagged.$(LANG1) testing/$(CORPUS).tagged.$(LANG2) testing/$(CORPUS).biltrans.$(LANG1)-$(LANG2)




# Clean corpus:
$(CORPUS).clean.$(LANG2): $(CORPUS).clean.$(LANG1)
# (below goal creates above goal too)
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
	<$< $(PYTHON2) $(LEXTOOLSDIR)/scripts/process-tagger-output.py $(LANG1) >$@ || rm $@
$(CORPUS).tag-tok.$(LANG2): $(CORPUS).tagged.$(LANG2)
	<$< $(PYTHON2) $(LEXTOOLSDIR)/scripts/process-tagger-output.py $(LANG2) >$@ || rm $@
$(CORPUS).biltrans-tok.$(LANG1)-$(LANG2): $(CORPUS).biltrans.$(LANG1)-$(LANG2)
	<$< $(PYTHON2) $(LEXTOOLSDIR)/scripts/process-biltrans-output.py >$@ || rm $@

# Clean corpus yet again before trainmodel:
$(CORPUS).tag-tok-clean.lines: $(CORPUS).tag-tok-clean.$(LANG1)
$(CORPUS).tag-tok-clean.$(LANG2): $(CORPUS).tag-tok-clean.$(LANG1)
# (below goal creates above goal too)
$(CORPUS).tag-tok-clean.$(LANG1): $(CORPUS).tag-tok.$(LANG1) $(CORPUS).tag-tok.$(LANG2)
	perl $(CLEANCORPUS) $(CORPUS).tag-tok $(LANG1) $(LANG2) $(CORPUS).tag-tok-clean 1 40 $(CORPUS).tag-tok-clean.lines

$(CORPUS).biltrans-tok-clean.$(LANG1)-$(LANG2): $(CORPUS).biltrans-tok.$(LANG1)-$(LANG2) $(CORPUS).tag-tok-clean.lines
	$(PYTHON3) $(LEXTOOLSDIR)/scripts/biltrans-only-retained.py $+ >$@ || rm $@


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

model/moses.ini: $(CORPUS).lm $(CORPUS).tag-tok-clean.$(LANG1) $(CORPUS).tag-tok-clean.$(LANG2)
	perl $(TRAINMODEL) -external-bin-dir $(GIZADIR) -root-dir . -corpus $(CORPUS).tag-tok-clean -f $(LANG1) -e $(LANG2) -alignment grow-diag-final-and -reordering msd-bidirectional-fe -lm "0:5:`pwd`/$(CORPUS).lm:0" >trainmodel.log 2>&1


$(CORPUS).phrasetable.$(LANG1)-$(LANG2): giza.$(LANG1)-$(LANG2)/$(LANG1)-$(LANG2).A3.final.gz
	zcat $< | $(LEXTOOLSDIR)/scripts/giza-to-moses.awk > $@
# should be the same number of lines as *tok-clean


# Then we want to extract the sentences where the target language word aligned to a source language word is a possible translation in the bilingual dictionary:

$(CORPUS).candidates.$(LANG1)-$(LANG2): $(CORPUS).phrasetable.$(LANG1)-$(LANG2) $(CORPUS).biltrans-tok-clean.$(LANG1)-$(LANG2) 
	$(PYTHON3) $(LEXTOOLSDIR)/scripts/extract-sentences.py $+ >$@ 2>$@.err || rm $@


# These are basically sentences that we can hope that Apertium might be able to generate.
# [endre] Extract frequency lexicon

# The next step is to extract the frequency lexicon.

$(CORPUS).lex.$(LANG1)-$(LANG2): $(CORPUS).candidates.$(LANG1)-$(LANG2)
	$(PYTHON2) $(LEXTOOLSDIR)/scripts/extract-freq-lexicon.py $< > $@

# This file should look like:

# $ cat europarl.lex.en-es  | head 
# 31381 union<n> unión<n> @
# 101 union<n> sindicato<n>
# 1 union<n> situación<n>
# 1 union<n> monetario<adj>
# 4 slope<n> pendiente<n> @
# 1 slope<n> ladera<n>

# Where the highest frequency translation is marked with an @.

# Note: This frequency lexicon can be used as a substitute for "choosing the most general translation" in your bilingual dictionary.


# Now we generate the ngrams that we are going to generate the rules from.
$(CORPUS).ngrams.$(LANG1)-$(LANG2): $(CORPUS).lex.$(LANG1)-$(LANG2) $(CORPUS).candidates.$(LANG1)-$(LANG2)
	$(PYTHON2) $(LEXTOOLSDIR)/scripts/ngram-count-patterns.py $+ >$@ 2>$@.err

# This script outputs lines in the following format:

# -language<n>	and<cnjcoo> language<n> ,<cm>	lengua<n>	2
# +language<n>	plain<adj> language<n> ,<cm>	lenguaje<n>	3
# -language<n>	language<n> knowledge<n>	lengua<n>	4
# -language<n>	language<n> of<pr> communication<n>	lengua<n>	3
# -language<n>	Community<adj> language<n> .<sent>	lengua<n>	5
# -language<n>	language<n> in~addition~to<pr> their<det><pos>	lengua<n>	2
# -language<n>	every<det><ind> language<n>	lengua<n>	2
# +language<n>	and<cnjcoo> *understandable language<n>	lenguaje<n>	2
# -language<n>	two<num> language<n>	lengua<n>	8
# -language<n>	only<adj> official<adj> language<n>	lengua<n>	2

# The + and - indicate if this line chooses the most frequent transation (-) or a translation which is not the most frequent (+). The pattern selecting the translation is then shown, followed by the translation and then the frequency.


# You can, optionally, manually filter
# $(CORPUS).ngrams.$(LANG1)-$(LANG2), for example by removing rules
# with conjunctions, or removing rules with unknown words.


# The final stage is to generate the rules,

$(CORPUS).ngrams.$(LANG1)-$(LANG2).lrx: $(CORPUS).ngrams.$(LANG1)-$(LANG2)
	<$< $(PYTHON2) $(LEXTOOLSDIR)/scripts/ngrams-to-rules.py+ >$@
