DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST @HAB = @HAB ;
LIST FAUXV = @+FAUXV @-FAUXV ;
LIST PronPersIll = (Pron Pers Ill) ;

SECTION

SUBSTITUTE ("leat" V)    ("leat" V :1) ("leat" V IV) ; # default
SUBSTITUTE ("leat" V :1) ("leat" V :0) ("leat" V IV) (-1 @HAB) ;
SUBSTITUTE ("leat" V :1) ("leat" V :0) ("leat" V IV) (0 FAUXV) ;

SUBSTITUTE (N Ess) (N Ess V) (N Ess @←SPRED) (-1 PronPersIll) ;