# This file is for word sense disambiguation
# See http://wiki.apertium.org/wiki/Limited_rule-based_lexical_selection

DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST Ill = Ill ;
LIST Num = Num ;
LIST Neg = Neg ;
LIST Pers = Pers ;
LIST Qst = Qst ;
LIST @ADVL = @ADVL ;
LIST @→N = @→N ;
LIST @HAB = @HAB ;
LIST NPropMal = (N Prop Mal) ;
LIST Mal = Mal ;
LIST Fem = Fem ;
LIST Sur = Sur ;
LIST FAUXV = @+FAUXV @-FAUXV ;
LIST @SUBJ→ = @SUBJ→ ;
LIST ActioEss = (Actio Ess) ;
LIST PronPersIll = (Pron Pers Ill) ;
LIST CURRENCY = "denara" "dollár" "euro" "kruvdnu" "kr" "ru" "rubel" "ruvdno" "ruvdnu" "¢" "€" "$";
LIST Cond = (Cond) ;
LIST Inf = (Inf) ;
LIST IndPrt = (Ind Prt) ;

LIST PERSON = Mal Fem Sur Pers ;
LIST FISH = "guolli" "dorski" "luossa" ;

SECTION

# Verb rules
# ----------

# leat 0 = være, 1 = ha, 2 = måtte («ha å»)
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 @HAB) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 Neg) (-2 @HAB) ;
SUBSTITUTE ("leat:1") ("leat:2") ("leat:1" V IV) (1 Inf) ;
# mis lea cahkkehit dola
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 FAUXV) (NOT 1 ActioEss) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 IndPrt) (1 Inf) ; # Perf Cond 2 
# Jos mun ledjen dadjat sátnegeažige, de ii son lean vuolgit.
# TODO: Gávpotmuvrra vuođđogeađggit ledje<være> čiŋahuvvon 
# (unfortunately no animacy, and impers isn't until bidix...)
# TODO: ledje<ha> ovdalaččas guokte nieidda

# máksit 0 = bety, 1 = koste, 2 = betale
SUBSTITUTE ("máksit") ("máksit:1") ("máksit" V) (*-1 (@SUBJ→) LINK NOT 0 PERSON)(0* CURRENCY OR Num BARRIER Ill) ;
 ## Duhpát máksá guokte ruvnnu. # Tobakken koster to kroner.
SUBSTITUTE ("máksit") ("máksit:2") ("máksit" V) (*1 Ill LINK *1 CURRENCY OR Num) ;
 ## Son máksá munnje guokte ruvnnu. # Han betaler meg to kroner.
SUBSTITUTE ("máksit") ("máksit:2") ("máksit" V) (*-1 PERSON LINK 0 (@SUBJ→));

## Máret máksá guokte ruvnnu.
 
# mannat 0 = dra, 1 = gå
SUBSTITUTE ("mannat") ("mannat:1") ("mannat" V) (*-1 ("mo") OR ("dat"))(0 (Sg3));

# bivdit 0 = be, 1 = spørre, 2 = fiske, 3 = jakte
SUBSTITUTE ("bivdit") ("bivdit:1") ("bivdit" V)(*1 Qst);
SUBSTITUTE ("bivdit") ("bivdit:2") ("bivdit" V)(*1 FISH);


SUBSTITUTE ("orrut") ("orrut:1") ("orrut" V IV) (1 ("dego")) ;


# Other parts of speech
# ---------------------

SUBSTITUTE ("easkka") ("easkka:1") ("easkka" Adv) (-1 ("de") OR ("dál")) ;


SUBSTITUTE ("juohke") ("juohke:1") ("juohke" Pron Indef) (1 ("lágan") OR ("lágán")) ;

SUBSTITUTE ("duohta") ("duohta:1") ("duohta" A Sg Loc) (0 @ADVL) ;
# sann => virkelig

SUBSTITUTE ("miella") ("miella:1") ("miella" N Sg Loc) (-1 @→N) ;
# sinn => oppfatning (kan regelen vere meir generell?)

SUBSTITUTE ("gonagas") ("gonagas:1") ("gonagas" N Sg) (1 NPropMal) ;
# Konge Harald => Kong Harald

# Rules that are not word-specific
# --------------------------------

SUBSTITUTE (N Ess) (N Ess V) (N Ess @←SPRED) (-1 PronPersIll) ;
# In certain contexts, N.Ess might be translated with a verb
# (if bidix gives such a translation):
# itgo boađáše munnje veahkkin → kommer du ikke og hjelper meg
