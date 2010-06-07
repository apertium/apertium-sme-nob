# See http://wiki.apertium.org/wiki/Evaluation for apertium-eval-translator

# clear out all suffixes
.SUFFIXES:
# list only those we use
.SUFFIXES: .sme .nob .MT .res


MT := $(patsubst %.sme,%.MT,$(wildcard *.sme))

.sme.MT : 
	apertium -d .. sme-nob < $< > $@


results := $(patsubst %.sme,%.res,$(wildcard *.sme))

.MT.res :
	apertium-eval-translator -t $< -r $(patsubst %.res,%.nob,$@) > $@


all : $(results) allbeam


allbeam : $(MT)
	@echo "Beam search (n=5) on all translations"
	@echo "(use 'make allres' to eval everything with full search, takes a while)"
	@cat $(MT) > allMT
	@cat $(patsubst %.MT,%.nob,$(MT)) > allnob
	@cat $(patsubst %.MT,%.sme,$(MT)) > allsme
	apertium-eval-translator -t allMT -r allnob -b 5 > $@

allres : $(MT)
	@echo "Full evaluation of all files, this takes a while..."
	@cat $(MT) > allMT
	@cat $(patsubst %.MT,%.nob,$(MT)) > allnob
	@cat $(patsubst %.MT,%.sme,$(MT)) > allsme
	apertium-eval-translator -t allMT -r allnob > $@
