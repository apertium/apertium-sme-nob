DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST @HAB = @HAB ;
LIST @+FAUXV = @+FAUXV ;

SECTION

SUBSTITUTE ("leat"ri V)    ("leat"ri V :1) ("leat"ri V IV) ; # default
SUBSTITUTE ("leat"ri V :1) ("leat"ri V :0) ("leat"ri V IV) (-1 @HAB) ;
SUBSTITUTE ("leat"ri V :1) ("leat"ri V :0) ("leat"ri V IV) (0 @+FAUXV) ;

