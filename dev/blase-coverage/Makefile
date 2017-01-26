all: \
     free_facta.cmp free_facta.unk free_facta.amb.excluded \
     translations-test.cmp translations-test.unk translations-test.amb.excluded \
     tmx.cmp tmx.unk tmx.amb.excluded

# Two tabs: compound
%.cmp: %.hitparade
	grep '		' $< >$@

%.unk: %.hitparade
	grep -e '-"[*]' $< >$@

%.amb: %.hitparade
	grep -ve '-"[*]' -e '		' $< >$@

%.amb.have: %.amb
	cut -f2 $< |sed 's/ "<//; s/>"//'|sort -u|apertium -d ../.. sme-nob-morph >$@
%.amb.want: %.amb
	grep -o '	+"[^	]*' $< | sed 's,^	+",/,; s/" /</; s/$$/>/'|sort -u >$@
%.amb.exclude: %.amb.want %.amb.have
	grep -oFf $^ | sort -u | sed 's,^/,+",; s/</" /; s/>$$//' >$@
%.amb.excluded: %.amb.exclude %.amb
	grep -vFf $^ >$@

# Note: literal tabs!
%.hitparade: %.diff
	sort $< | uniq -c | sort -nr | sed 's/^ *//; s/ /	/; s/\([+-]\)	/\1/g' | grep -v '^1	' >$@

%.diff: %.trimmed %.untrimmed
	./make-diff $^ >$@

%.trimmed: %.txt select-sem.cg3b
	./run-sme-nob-until-disam trimmed <$< >$@

%.untrimmed: %.txt select-sem.cg3b
	./run-sme-nob-until-disam untrimmed <$< >$@

%.cg3b: %.cg3
	cg-comp $< $@

tmx.txt:
	xmlstarlet sel -t -m '//tuv[@lang="sme"]/seg' -c 'text()' -n ../../*tmx_data/*.tmx >$@

translations-test.txt: ../../translations-test.html
	grep tg-sme $< | sed 's/<th class="tg-sme" colspan="2">//;s%</th>%%' >$@


# Keep all intermediates:
.SECONDARY:
