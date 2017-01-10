# You *need* to supply a file name to use this Makefile,
# e.g. "make -f t/translate.make .cache/foobar.dgen"

all: .cache/.d


.PRECIOUS: .cache/.d
.cache/.d:
	test -d .cache || mkdir .cache
	touch $@

.cache/%.input: .cache/.d
	touch $@


# TODO: generate from modes.xml:

.cache/%.destxt: .cache/%.input
	apertium-destxt <$< >$@

.cache/%.morph: .cache/%.destxt sme-nob.automorf.hfst
	hfst-proc --weight-classes 1 -w -p 'sme-nob.automorf.hfst' <$< >$@

.cache/%.disam: .cache/%.morph sme-nob.mor.rlx.bin
	cg-proc 'sme-nob.mor.rlx.bin' <$< >$@

.cache/%.syntax: .cache/%.disam sme-nob.syn.rlx.bin
	cg-proc -1 -n -w 'sme-nob.syn.rlx.bin' <$< >$@

.cache/%.pretransfer: .cache/%.syntax
	apertium-pretransfer <$< >$@

.cache/%.biltrans: .cache/%.pretransfer sme-nob.autobil.bin
	lt-proc -b 'sme-nob.autobil.bin' <$< >$@

.cache/%.lex: .cache/%.biltrans sme-nob.lex.bin
	cg-proc 'sme-nob.lex.bin' <$< >$@

.cache/%.chunker: .cache/%.lex apertium-sme-nob.sme-nob.t1x sme-nob.t1x.bin
	apertium-transfer -b 'apertium-sme-nob.sme-nob.t1x'  'sme-nob.t1x.bin' <$< >$@

.cache/%.interchunk1: .cache/%.chunker apertium-sme-nob.sme-nob.t2x sme-nob.t2x.bin
	apertium-interchunk 'apertium-sme-nob.sme-nob.t2x'  'sme-nob.t2x.bin' <$< >$@

.cache/%.interchunk2: .cache/%.interchunk1 apertium-sme-nob.sme-nob.t3x sme-nob.t3x.bin
	apertium-interchunk 'apertium-sme-nob.sme-nob.t3x'  'sme-nob.t3x.bin' <$< >$@

.cache/%.postchunk: .cache/%.interchunk2 apertium-sme-nob.sme-nob.t4x sme-nob.t4x.bin
	apertium-postchunk 'apertium-sme-nob.sme-nob.t4x'  'sme-nob.t4x.bin' <$< >$@

.cache/%.dgen: .cache/%.postchunk sme-nob.autogen.bin
	lt-proc -d 'sme-nob.autogen.bin' <$< >$@

.cache/%.output: .cache/%.dgen
	apertium-retxt <$< >$@

# If make deletes intermediates, we lose out on fast rebuilds:
.PRECIOUS:			\
	.cache/%.input		\
	.cache/%.morph		\
	.cache/%.disam		\
	.cache/%.syntax		\
	.cache/%.pretransfer	\
	.cache/%.biltrans	\
	.cache/%.lex		\
	.cache/%.chunker	\
	.cache/%.interchunk1	\
	.cache/%.interchunk2	\
	.cache/%.postchunk	\
	.cache/%.dgen		\
