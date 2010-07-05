# This file is for word sense disambiguation (lexical selection)
# See http://wiki.apertium.org/wiki/Limited_rule-based_lexical_selection

DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

SETS
LIST Ill = Ill ;
LIST Loc = Loc ;
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
LIST PronPers = (Pron Pers) ;
LIST PronPersIll = (Pron Pers Ill) ;
LIST CURRENCY = "denara" "dollár" "euro" "kruvdnu" "kr" "ru" "rubel" "ruvdno" "ruvdnu" "¢" "€" "$";
LIST Cond = (Cond) ;
LIST Inf = (Inf) ;
LIST IndPrt = (Ind Prt) ;

LIST PERSON = Mal Fem Sur Pers ;
LIST FISH = "bálddis" "čuska" "dápmot" "diddi" "diksu" "dorskeguolli" "dorski" "duovvi" "gilot" "guolli" "hávga" "juksu" "luosjuolgi" "luossa" "luossaguolli" "luossanálli" "muortu" "sallit" "sáidi" "sáivaguolli" "šákšadorski" "stábbasáidi" "stáinnir" "stuorasáidi" "rutnot" "veajet" ;
LIST HUNT-ANIMAL = "ealga" "rievssat" ;
LIST NATURE-PLACE = "almennet" "ávži" "bákti" "beahcevuovdi" "borri" "buollánávži" "coagis" "čázádat" "čolpi" "darfejeaggi" "dearbmi" "duottarjávri" "duottaroassi" "eatnu"
"fielbmá" "fiervá" "gáisá" "gáisi" "gárggu" "gárgu" "gieddi" "gievajeaggi" "gohpi" "gohppi" "gorži" "guolbban" "gurra" "jávri" "jávregáddi" "jeaggi" "jiehkki" "johka" "johkagaska" "johkagáddi" "johkaleahki" "johkanjálbmi" 
"láddu" "láttu" "latnja" "lavdnjejeaggi" "leahki" "lokta" "luohkká" "luokta" "luondu" "luoppal" "luossajohka" "meahccegieddi" "mearra" "mielli" "mohkki" "muotki" "njárga" "njunni" "oaivi" "oalgejohka" "oalgi" "orda" "orrit" 
"reašši" "riddogáddi" "riddu" "riidi" "ruovttugieddi" "soahkevuovdi" "stealli" "várrevielti" "várri" "vearroduottar" "vielti" "vuohppi" "vuotnabahta" "vuotnagáddi" ;
LIST BIRD = "ákta" "báiski" "bovttáš" "cagan" "čearret" "gáddeloddi" "gáiru" "mearaloddi" "skávli" "skuolfi" "šuoršu"  "albatrossa" "alitbađuš" "alitgaccet" "alitoaigaccet" "bakku" "bastesuorsi" "bađošgaccet" "beahcebáhcatloddi" "beahceloddi" "bealdocihci" "bealdogarjá" "bealdovuorra" "bealgeloddi" "bealljeloađgu" "bealljerásttis" "bearalskuolfi" "beasterages" "beibboš" "beibbošcihci" "beibbošcizáš" "belddošvizar" "beškkoš" "beštor" "bieggafálli" "biehkan" "bigán" "bihcabasčáihni" "bihcebasgáski" "bihcebasčáihni" "bissehávka" "bižus" "boaimmáš" "boallonjukča" "boađđocivkkán" "borjjastit" "borsenjunni" "bovttáš" "bulddogas" "bumbá" "buoidegaccet" "buokčat" "buokči" "bupmálaš" "bursanjunni" "bussáskuolfi" "buvvedat" "báiski" "bákteduvvá" "bárbmofálli" "bávgoš" "cagan" "cagán" "cielláš" "cihceskuolfi" "cihrrelastavizar" "civkaleivvoš" "cizašfálli" "cizopaš" "cizot" "davvelastavizar" "davveloddi" "davvevizar" "deaggačáihni" "deaggebáiski" "deaggecihci" "dearbmerásttis" "derpmoš" "dieldá" "dielkoduvvá" "dihtti" "diksobáhppa" "dirrelihká" "doadjosuorsi" "dokta" "dovtta" "duoršu" "duottarbižus" "duottarcivkaleivvoš" "duvvá" "duvvárásttis" "dálvebeštor" "dálveruoivil" "dálvi" "dážaboaimmáš" "dážasuorsi" "fasána" "fiehta" "fiervávierru" "fierváviroš" "fiskesbeštor" "fiskescihci" "fiskescižáš" "fiskesgaccet" "fiskesjievžžan" "fiskesnjungáhkkor" "fiskesvizar" "fiŋka" "gaccepaš" "gaccet" "gahperbáiski" "gahpervizar" "garjá" "gassanjunni" "gazzaloddi" "gazzebiehtár" "geađgejorgu" "geađgerásttis" "giegabiigá" "giehka" "giehpavuonccis" "giellavealgu" "gierdoduvvá" "gierdorásttis" "gierdosuorsi" "gierdočuonjá" "gierra" "giljobaš" "gilljobaš" "gilvabeštor" "girjebáhcatloddi" "girjelivkkár" "giron" "goahcceloddi" "goahppil" "goahppilgálli" "goahtegoljaš" "goalsi" "goalsoruoššehas" "goalšovizar" "goarga" "goargaloddi" "goargŋohaŋŋá" "goaski" "goaskin" "gollaš" "gollebeibboš" "gollecihci" "gollegahpir" "golli" "golláš" "gorgeshávda" "gorgeslihkká" "govuskuolfi" "gođaloddi" "gožuvuoražas" "guoikgáhrit" "guoikgárri" "guoksa" "guolbbavierru" "guolbbaviroš" "guolbbačoavžžu" "guollefálli" "guollečearret" "guorga" "guossabáhcatloddi" "guossagaccet" "guossaruossanjunni" "guossavizar" "guovssat" "guovssoloddi" "gussagoalsi" "guškilvierru" "guškilviroš" "guškkástat" "gáddebuvvet" "gáddeskirvi" "gáddevierru" "gáddeviroš" "gáhkkor" "gáiru" "gállat" "gálli" "gállit" "gáranas" "gáranasloddi" "gárggogoalsi" "gárgogoalsi" "gávlačuonjá" "hálkaloddi" "haŋŋá" "heartavizar" "hoaššacihci" "hurrat" "hurri" "hurrigoahppil" "hurričukčá" "háigir" "háigirloddi" "hálka" "hálkagonagas" "hálkačielkkis" "háskil" "hávda" "idjaskuolfi" "jeaggefálli" "jeaggemeahkástat" "jeaggečoavžžu" "jeaggehávut" "kanárialoddi" "keaisárpingviidna" "jiekŋačielkkis" "jiesmi" "jievjaskuolfi" "jievželoddi" "jávresopmir" "leahttofálli" "leahttospálfu" "leaibeloddi" "leivvoš" "lidnu" "liidn-elláš" "liin-elláš" "litnut" "livkkár" "loađgu" "loddi" "loddegonagas" "loddejievži" "luhkkaloddi" "láfol" "láhtospálfu" "látteguoksa" "látteguovssat" "láttovuonccis" "láŋgá" "meahkástat" "mearragoaski" "mearragoaskin" "mearragáiru" "mearračuonji" "mearračuonjá" "miellespálfu" "miesttacihci" "miesttarásttis" "miesttavizar" "miesttašurrevizar" "moldecizáš" "muhkkecizáš" "muogir" "muorracivkkán" "muorragakcu" "mákreallačearret" "niehttegarjá" "niitocivkkán" "njukča" "njurggu" "njurgut" "noaideloddi" "nuortacihci" "nuortalastavizar" "nuorti" "náhkkesoadjá" "oanehisnjunčuonjá" "paradiisaloddi" "pelikanloddi" "pingviidna" "ribeskáiti" "riddocivkaleivvoš" "riddovierru" "riddoviroš" "rievssat" "rievssatcižáš" "rievssatfálli" "roavgogonagas" "rohtogaccet" "rohtovizar" "rohtočoavžu" "rohtočoavžžu" "ruksesbađoš" "ruksesbeibboš" "ruksescivkaleivvoš" "ruksesfiehta" "ruksesguškil" "ruksesjuolčoavžžu" "ruksesruivil" "ruksesruoivil" "ruksesrásttis" "ruksessoadjá" "ruksessuorrehávut" "ruoivil" "ruonábeibboš" "ruonácihci" "ruonácizáš" "ruonájuolčoavžžu" "ruonáčáihni" "ruossalasnjunni" "ruovddagas" "ruovdecihci" "ruovdecizáš" "ruođa" "ruoššaboaimmáš" "ruoššaskire" "ruoššaskirri" "ruoššaállat" "ránescihci" "ránescizáš" "ránesháigir" "ráneslivkkár" "ránesrásttis" "ránesskuolfi" "ránesskávli" "ránessnárttal" "ránesčuonjá" "ránesčáihni" "rásttis" "rávgoš" "salletgáiru" "sallitgáiru" "seallecižáš" "siessemohkki" "sieđgacivkkán" "sildegáiru" "silkebuokča" "sitronbeštor" "skierru" "skilkeskálka" "skire" "skirri" "skiŋgegaccet" "skoarra" "skuolfi" "skutnjaloddi" "skáhpeloddi" "skáiti" "skárfa" "skárfačielkkis" "skávli" "snárttal" "soadjanjálla" "sopmir" "spoađđoduoršu" "spálfu" "stoarbmaloddi" "stoarbmaspálfu" "stohkkegaccet" "stohkkerievdu" "stohkkespálfu" "stohpoháigir" "stohpospálfu" "struhcca" "struhccaloddi" "stuorrafiehta" "stuorragiljobaš" "stuorraguškil" "stuorraguškkástat" "stuorrameahkástat" "stuorraskáiti" "stuorraskávli" "stuorravuodja" "stuorravuojaš" "stuorračarkkus" "stuorračoavžu" "stuorračoavžžu" "stuorračuonjá" "stálobeibboš" "stárra" "suoidnesuorsi" "suoidnečiksa" "suolaskáiti" "suorrespálfu" "suorsi" "suotnjoliráš" "suotnjočoavžžu" "suovkacihci" "suvlá" "sáhcomeahkástat" "sáhpánboaimmáš" "sáhpánskuolfi" "sáivahávda" "sávjahávda" "sávzaloddi" "toardnagarjá" "toardnagájon" "uhcabuokča" "uhcabuvvedat" "uhcabáiski" "uhcaciellá" "uhcacihci" "uhcameahkástat" "uhcanjukča" "uhcasaddi" "uhcavierru" "uhcaviroš" "uhcačoavžžu" "uhcačáihni" "ummolcizáš" "upmolcizáš" "unduláhtta" "uvlohávut" "varraloddi" "veastareaddji" "vigláčoavžžu" "vilgesnierčuonjá" "vilgessoadjaskávli" "vilgesummolcizáš" "vilgesvierru" "vilgesviroš" "vilgesčoavžu" "vilgesčoavžžu" "vilgessealčáihni" "vintán" "vuoncáčivga" "vuoncávaris" "vizardit" "vuodja" "vuojaš" "vuoktafiehta" "vuoktagaccet" "vuoktagoalsi" "vuoktaláfol" "vuoktaskárfa" "vuonccis" "vuonccisloddi" "vuoražas" "vuorččis" "vuovdaduvvá" "vuovdecivkaleivvoš" "vuovdegaccet" "vuovdeloddi" "vuovdemeahkástat" "vuovderásttis" "vuovdevizar" "vuovdevuorččis" "vuovdečoavžu" "vuovdečoavžžu" "ábirievssat" "áhpedokta" "áhpedovtta" "áhpeháskil" "áhpehávda" "áhpelihkká" "áhpespálfu" "ákta" "állat" "čarkkus" "čearret" "čiekčá" "čielkkis" "čierggesrásttis" "čiksa" "čoađgi" "čukčá" "čuohtegielas" "čuohtegiella" "čuonji" "čuonjá" "čuonjáfálli" "čáhcebávgoš" "čáhcevuonccis" "čáhppesbađošguškil" "čáhppesbuokča" "čáhppessealbeštor" "čáhppesgaccet" "čáhppesrásttis" "čáhppesčoavji" "čáhppesčoavžu" "čáhppesčoavžžu" "čáihnecizáš" "čáihnegaccet" "čáihni" "šilljocihci" ;

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
SUBSTITUTE ("bivdit") ("bivdit:2") ("bivdit" V)(*0 FISH);
SUBSTITUTE ("bivdit") ("bivdit:3") ("bivdit" V)(*0 NATURE-PLACE OR HUNT-ANIMAL OR BIRD);

# orrut 0 = bo, 1 = synes, 2 = bli, 3 = være
SUBSTITUTE ("orrut") ("orrut:1") ("orrut" V IV) (1 ("dego") OR ActioEss) ;


# Noun rules
# ----------

SUBSTITUTE ("miella") ("miella:1") ("miella" N Sg Loc) (-1 @→N) ;
# sinn => oppfatning (kan regelen vere meir generell?)

# gonagas 0 = konge, 1 = kong
SUBSTITUTE ("gonagas") ("gonagas:1") ("gonagas" N Sg) (1 NPropMal) ;
# Konge Harald => Kong Harald

# johtu 0 = fart, 1 = bevegelse, 2 = gang
SUBSTITUTE ("johtu") ("johtu:2") ("johtu" N Sg) (0 Ill) ;
# til farten => i gang

# oktavuohta 0 = kontakt, 1 = henvendelse, 2 = forbindelse, 3 = sammenheng
SUBSTITUTE ("oktavuohta") ("oktavuohta:2") ("oktavuohta" N Sg Loc) ;
# dan oktavuođas go => i den forbindelse når
SUBSTITUTE ("oktavuohta") ("oktavuohta:3") ("oktavuohta" N Pl Loc) ;
# máŋgga oktavuođain => i mange sammenhenger


# Other parts of speech
# ---------------------

SUBSTITUTE ("easkka") ("easkka:1") ("easkka" Adv) (-1 ("de") OR ("dál")) ;


SUBSTITUTE ("juohke") ("juohke:1") ("juohke" Pron Indef) (1 ("lágan") OR ("lágán")) ;

# goabbáge 0 = begge, 1 = noe
SUBSTITUTE ("goabbáge") ("goabbáge:1") ("goabbáge" Pron Indef Sg) (*-1 Neg) ;

# duohta 0 = sann, 1 = virkelig
SUBSTITUTE ("duohta") ("duohta:1") ("duohta" A Sg Loc) (0 @ADVL) ;



# go (default)=> når
SUBSTITUTE ("go") ("go:3") ("go" CS) (-1 ("nu" Adv)) ;
# Elvenes oaččuiga Niehkostipeandda nu go leigga sávvan 

# ieš (default)=> seg
SUBSTITUTE ("ieš") ("ieš:1") ("ieš" Pron Refl) (0 (@Pron←) OR (@N←)) ;
# mun ieš:1 => meg _selv_
SUBSTITUTE ("ieš") ("ieš:2") ("ieš" Pron Refl) (0 (@-FOBJ→) OR (@-FSUBJ→)) ;
# Máhtte rábmui iežas:2 vuoitit => Máhtte skrøt at _han_ skulle vinne 
SUBSTITUTE ("ieš") ("ieš:3") ("ieš" Pron Refl) (0 (@→Pron) OR (@→N)) ;
# ieš:3 dat muitalii => han _bare_ fortalte det
SUBSTITUTE ("ieš") ("ieš:3") ("ieš" Pron Refl) (0 (@SUBJ→)) ;
# ieža:3 mun dájun => jeg _bare_ tøver
SUBSTITUTE ("ieš") ("ieš:4") ("ieš" Pron Refl) (0 (@←ADVL)) (NOT -1 PronPers) ;
# Mun jurddašin iežainan => jeg tenkte med _meg selv_

# XXX LENE CHANGE THIS RULE BELOW XXX
SUBSTITUTE ("cegget") ("cegget:1") ;
# Mun ceggen vaikke ieš filbmafestivála


# Rules that change PoS (like slr entries, the targets must exist in bidix!)
# --------------------------------------------------------------------------

SUBSTITUTE ("ruoktu" N Sg Loc) ("ruovttus" Adv) ("ruoktu" N Sg Loc);
# Áddjá lea ruovttus => Bestefar er hjemme

SUBSTITUTE (Pron Indef Gen Der1 Der_lágan A Attr) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE (Pron Indef Gen Der1 Der_lágan A Attr) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE (Pron Indef Acc Der1 Der_lágan A Attr) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE (Pron Indef Acc Der1 Der_lágan A Attr) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE (Pron Indef Gen) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE (Pron Indef Gen) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE (Pron Indef Acc) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE (Pron Indef Acc) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE (Pron Indef) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE (Pron Indef) (A Attr) ("iešguhtet" Pron Indef);
# iešguhtet/iešguđet are actually «hver sine/enhver», but are used like «forskjellig/ulik» in all contexts I've seen so far --KBU


# Rules that are not word-specific
# --------------------------------

SUBSTITUTE (N Ess) (N Ess V) (N Ess @←SPRED) (-1 PronPersIll) ;
# In certain contexts, N.Ess might be translated with a verb
# (if bidix gives such a translation):
# itgo boađáše munnje veahkkin → kommer du ikke og hjelper meg
