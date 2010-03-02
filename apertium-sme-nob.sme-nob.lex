DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST @HAB = @HAB ;
LIST FAUXV = @+FAUXV @-FAUXV ;
LIST PronPersIll = (Pron Pers Ill) ;

SECTION

SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 @HAB) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 FAUXV) ;

SUBSTITUTE (N Ess) (N Ess V) (N Ess @←SPRED) (-1 PronPersIll) ;
# In certain contexts, N.Ess might be translated with a verb
# (if bidix gives such a translation):
# itgo boađáše munnje veahkkin → kommer du ikke og hjelper meg
