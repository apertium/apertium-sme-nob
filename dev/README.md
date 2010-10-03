README for apertium-sme-nob/dev
===============================

The files in this directory are used for development purposes, with
three exceptions.

The following files are all needed for compilation:
---------------------------------------------------

- `xfst2apertium.hashtags.twol`
- `xfst2apertium.relabel`
- `xfst2apertium.useless.twol`

(TODO: move into main dir maybe?)

The rest of the files in dev/ are "development files".


Scripts for keeping up-to-date with the Giellatekno resources:
--------------------------------------------------------------

- `update-lexc.py` updates the analyser with with words from
  Giellatekno, only adding those that are in bidix.
- `langs.cfg.in` is a default configuration file for `update-lexc.py`,
  copy it to `langs.cfg` and edit it to use `update-lexc.py`.
- `full-lexc.sh` is used if you want the analyser to have the full
  Giellatekno lexicon (including words not found in bidix). You could
  achieve the same effect by editing `langs.cfg` though.
- `rle-to-rlx.sh` is used to update the CG disambiguator.


Other scripts:
--------------

- `sme-nob.inconsistency.sh` tries to use the nob generator to
  generate all the nob words that are in bidix, useful for checking
  which bidix lemmas are missing from the generator
- `generation-test.sh` tries to use the nob generator on a corpus
  (after running it through the rest of the pipeline), also useful for
  checking which real live word forms are missing from the generator
- `lookup-transitivity.sh` is used on a list of verb bidix-entries to
  find their transitivity tag (on the sme side)
- `props-from-bidix-to-nob.sh` creates proper noun entries for that
  can be pasted straight into nob.dix, for np's in bidix that aren't
  in (the compiled) nob.dix
- `plc-props-from-bidix-to-sur.sh` ensures there are no PlcSur__np
  entries in bidix that already have plain Sur entries (PlcSur is
  needed since the CG can change any Plc entry into a Sur entry...)
- `sme-nno.sh` is a translation script that runs the apertium-nn-nb
  nb->nn transfer instead of generating nob, thus outputting Nynorsk
  instead of Bokmål

Also, `just-bidix.t1x` is useful to debug bidix lookup without
transfer rules messing things up. Usage:

    $ apertium-preprocess-transfer dev/just-bidix.t1x dev/just-bidix.t1x.bin
    $ echo leat|apertium -d . sme-nob-pretransfer |apertium-transfer dev/just-bidix.t1x dev/just-bidix.t1x.bin sme-nob.autobil.bin 
    ^være<vblex><impers><pres><pl><p3><@+FMAINV>$^.<sent><clb>$


Note that this output cannot just be sent into the generator; bidix
adds certain tags (e.g. `unc`, uncountable) that the normal transfer
removes before sending to the generator.


Texts:
------

The files with names like `about-*.txt` document various linguistics
issues.


Lists of missing bidix entries, work-in-progress:
-------------------------------------------------

The files with names like `bidix-*.dix` and `inc-*.txt` contain
work-in-progress bidix entries, most likely missing from the
nob.generator (and possibly containing mistaggings or duplicates).

`sme.hitparade.txt` is just a corpus frequency count of sme analyses
(using the full Giellatekno analyser)

`MoreNewLemmas`: what is this? Seems like these entries are already in
bidix?
