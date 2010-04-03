# This file is for word sense disambiguation
# See http://wiki.apertium.org/wiki/Limited_rule-based_lexical_selection

DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST Ill = Ill ;
LIST Neg = Neg ;
LIST @ADVL = @ADVL ;
LIST @HAB = @HAB ;
LIST FAUXV = @+FAUXV @-FAUXV ;
LIST ActioEss = (Actio Ess) ;
LIST PronPersIll = (Pron Pers Ill) ;
LIST CURRENCY = "denara" "dollár" "euro" "kruvdnu" "kr" "ru" "rubel" "ruvdno" "ruvdnu" "¢" "€" "$";
LIST Cond = (Cond) ;
LIST Inf = (Inf) ;
LIST IndPrt = (Ind Prt) ;


SECTION

# verbs.

# leat 0 = være, 1 = ha
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 @HAB) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 Neg)(-2 @HAB) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 FAUXV) (NOT 1 ActioEss) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 IndPrt) (1 Inf) ; # Perf Cond 2 
# Jos mun ledjen dadjat sátnegeažige, de ii son lean vuolgit.
# TODO: Gávpotmuvrra vuođđogeađggit ledje<være> čiŋahuvvon 
# (unfortunately no animacy, and impers isn't until bidix...)


# máksit 0 = bety, 1 = koste, 2 = betale
SUBSTITUTE ("máksit") ("máksit:2") ("máksit" V) (*1 Ill LINK *1 CURRENCY) ;
 ## Son máksá munnje guokte ruvnnu. # Han betaler meg to kroner.
SUBSTITUTE ("máksit") ("máksit:1") ("máksit" V) (0* CURRENCY BARRIER Ill) ;
 ## Duhpát máksá guokte ruvnnu. # Tobakken koster to kroner.


SUBSTITUTE ("orrut") ("orrut:1") ("orrut" V IV) (1 ("dego")) ;


SUBSTITUTE ("juohke") ("juohke:1") ("juohke" Pron Indef) (1 ("lágan") OR ("lágán")) ;

SUBSTITUTE ("duohta") ("duohta:1") ("duohta" A Sg Loc) (0 @ADVL) ;
# sann => virkelig

SUBSTITUTE (N Ess) (N Ess V) (N Ess @←SPRED) (-1 PronPersIll) ;
# In certain contexts, N.Ess might be translated with a verb
# (if bidix gives such a translation):
# itgo boađáše munnje veahkkin → kommer du ikke og hjelper meg
