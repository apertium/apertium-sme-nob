DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST @ADVL = @ADVL ;
LIST @HAB = @HAB ;
LIST FAUXV = @+FAUXV @-FAUXV ;
LIST ActioEss = (Actio Ess) ;
LIST PronPersIll = (Pron Pers Ill) ;

SECTION

SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 @HAB) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 FAUXV) (NOT 1 ActioEss) ;
# være => ha
# TODO: Gávpotmuvrra vuođđogeađggit ledje<være> čiŋahuvvon 
# (unfortunately no animacy, and impers isn't until bidix...)

SUBSTITUTE ("juohke") ("juohke:1") ("juohke" Pron Indef) (1 ("lágan") OR ("lágán")) ;

SUBSTITUTE ("duohta") ("duohta:1") ("duohta" A Sg Loc) (0 @ADVL) ;
# sann => virkelig

SUBSTITUTE (N Ess) (N Ess V) (N Ess @←SPRED) (-1 PronPersIll) ;
# In certain contexts, N.Ess might be translated with a verb
# (if bidix gives such a translation):
# itgo boađáše munnje veahkkin → kommer du ikke og hjelper meg
