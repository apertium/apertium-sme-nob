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
LIST ActioLoc = (Actio Loc) ;
LIST PronPers = (Pron Pers) ;
LIST PronPersIll = (Pron Pers Ill) ;
LIST CURRENCY = "denara" "dollár" "euro" "kruvdnu" "kr" "ru" "rubel" "ruvdno" "ruvdnu" "¢" "€" "$";
LIST Cond = (Cond) ;
LIST ConNeg = (ConNeg) ;
LIST Inf = (Inf) ;
LIST PrfPrc = (PrfPrc) ;
LIST IndPrt = (Ind Prt) ;
LIST Comp = Comp ;
LIST Adv = Adv ;
LIST V = V ;
LIST A = A ;

LIST COPULAS = "dáidit" "gártat" "leahkit" "leat" "orrut" "soaitit" "šaddat" "veadjit" ;

LIST MO-MANge = "goas" "gokko" "gos" "gosa" "govt" "makkár" "man" "manne" "mo" "mot" "mov" "movt" ("nugo" @CVP) (V Qst);
SET MO = MO-MANge - ("man" Foc/ge) ; 
SET S-BOUNDARY = (Pron Interr) OR (Pron Rel) OR ("muhto") OR ("de" CC) OR MO OR ("\;") OR (":") OR ("-") OR ("–") OR (@CVP) ;

SET VERB = V - (V N);



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

# beassat 0 = få, 1 = slippe, 2 = komme Refl til
	## Sii leat beassan eallit dego gonagasat.

SUBSTITUTE ("beassat") ("beassat:1") ("beassat" V) (1 (Der_n Loc) OR (Actio Loc) OR ("olggos") OR ("sisa")) ;
	## Mun bessen vuolgimis.
SUBSTITUTE ("beassat") ("beassat:2") ("beassat" V) (1 Ill) ;
	## In beassan skuvlii dan beaivve.  Jeg kom meg ikke på skolen den dagen.
	## Maiddái Ranghild Nystad beassá Sámediggái. Også RN kommer seg inn på Sametinget.
	## Sii ledje gáibidan ahte son galgá beassat riikastivrii. Du hadde krevd at han skulle komme seg inn i landsstyret.
	## Mun nu illudan beassat duoddarii. Jeg gleder meg så til å komme meg på vidda.
	## Nuoraidklubba nuorat besset dál Internehttii. Ungdomssklubbens ungdommer kommer seg nå på Internett.


# leat 0 = være, 1 = ha, 2 = måtte («ha å»)
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 @HAB) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 Neg) (-2 @HAB) ;
SUBSTITUTE ("leat:1") ("leat:2") ("leat:1" V IV) (1 Inf) ;
# mis lea cahkkehit dola
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 FAUXV) (NOT 1 ActioEss) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 IndPrt) (1 Inf) ;
# Jos mun ledjen dadjat sátnegeažige, de ii son lean vuolgit.
# (Perf Cond 2)
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
SUBSTITUTE ("bivdit") ("bivdit:3") ("bivdit" V)((*0 NATURE-PLACE OR HUNT-ANIMAL OR BIRD) OR (0 (Actor)));

# orrut 0 = bo, 1 = synes, 2 = bli, 3 = være
SUBSTITUTE ("orrut") ("orrut:1") ("orrut" V IV) (1 ("dego") OR ActioEss) ;

# šaddat 0 = bli, 1 = vokse
SUBSTITUTE ("šaddat") ("šaddat:1") ("šaddat" V IV) (1 ("bajás")) ;


# guorrassit 0 = slutte seg, 1 = tilslutte seg
SUBSTITUTE ("guorrasit") ("guorrasit:1") ("guorrasit" V IV) (NOT *0 Ill) ;
# Ráđđehus guorrasii Gonagasa oaivilii => Regjeringen sluttet seg til Kongens mening

# Noun rules
# ----------

# miella 0 = sinn, 1 = oppfatning, 2 = behag
SUBSTITUTE ("miella") ("miella:1") ("miella" N Sg Loc) (-1 @→N) ;
# sinn => oppfatning (kan regelen vere meir generell?)
SUBSTITUTE ("miella") ("miella:2") ("miella" N) (1 ("mielde")) ;

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
# máŋgga oktavuođas => i mange sammenhenger
# máŋggain oktavuođain => i mange sammenhenger

SUBSTITUTE ("olmmoš") ("olmmoš:1") ("olmmoš" N Pl) ;
# olbmot leat čoagganan => folk har samlet seg

# johtu 0 = fart, 1 = bevegelse, 2 = gang
SUBSTITUTE ("johtu") ("johtu:2") ("johtu" N Sg) (0 Ill) ;
# til farten => i gang

# stuibmi 0 = bråk, 1 = konflikt
SUBSTITUTE ("stuibmi") ("stuibmi:1") ("stuibmi" N Sg) (-1 ("Álta") OR ("Álaheadju")) ;
# til farten => i gang

# goddi 0 = villrein, 1 = komite
SUBSTITUTE (+goddi) (+goddi:1) (+goddi) ; # as a compound part

# Other parts of speech
# ---------------------
# ge 0 = også, 1 = heller
SUBSTITUTE ("go") ("go:1") ("go" Pcle) (*-1 Neg BARRIER S-BOUNDARY) ;
## In mun ge háliidivčče. In munge háliidivčče.


SUBSTITUTE ("juohke") ("juohke:1") ("juohke" Pron Indef) (1 ("lágan") OR ("lágán")) ;

# goabbáge 0 = begge, 1 = noe
SUBSTITUTE ("goabbáge") ("goabbáge:1") ("goabbáge" Pron Indef Sg) (*-1 Neg) ;

# duohta 0 = sann, 1 = virkelig
SUBSTITUTE ("duohta") ("duohta:1") ("duohta" A Sg Loc) (0 @ADVL) ;



# go (default)=> når
# go:1 => at, go:2 => enn, go:3 => som, go:4 => da, go:5 => fordi


SUBSTITUTE ("go") ("go:1") ("go" CS) (-1 ("maŋŋil" Adv) OR ("maŋŋel" Adv) OR ("ovdal" Adv)) ;
SUBSTITUTE ("go") ("go:1") ("go" CS) (-1 COPULAS LINK -1 (A Nom)) ;
## Son bijai vuosttaš spáppa mollii 22 minuvtta maŋŋel go čiekčamat ledje álgán.
## Buorre lei go bohtet.

SUBSTITUTE ("go") ("go:2") ("go" CS) (1 (@COMP-CS←)) ;
SUBSTITUTE ("go") ("go:2") ("go" CS) (-1 ("veara")) ;
SUBSTITUTE ("go") ("go:2") ("go" CS) (*-1 ("ovdal" Adv) BARRIER S-BOUNDARY) ;
SUBSTITUTE ("go") ("go:2") ("go" CS) (*-1 Comp BARRIER VERB OR S-BOUNDARY) ;
## Son lea viššaleabbo go mun.
## Dat dáidá riggát go mii jáhkkit.
## Dii han lehpet eanet veara go ollu cizážat.
## Viššalat ohppet eanet go láikkit.
## Ovdal buorida son dálkkiidis go neavrres olmmoš dábiidis.

SUBSTITUTE ("go") ("go:3") ("go" CS) ((-1 ("nu" Adv) OR ("seamma") OR ("seammá")) OR (-1 Adv OR A LINK -1 ("nu" Adv))) ;
# Elvenes oaččui Niehkostipeandda nu go lei sávvan 

SUBSTITUTE ("go") ("go:4") ("go" CS) (*1 (V Prt) BARRIER (@HAB) OR (@ADVL→)) ;

SUBSTITUTE ("go") ("go:5") ("go" CS) (1 (@ADVL→) OR (@HAB) LINK 1 COPULAS) ;
# Olbmot leat čoagganan Kárášjoga márkanii, go márkanis leat beassášdoalut.


# The 'default' translation of ieš depends on the case, see bidix.
# Nominative: 
# ----------- selv (ieš, handled in bidix)
# Accusative: 
# ----------- seg selv (ieš, handled in bidix)
#             seg (ieš) could be possible too, which contexts though?
# Accusative @-FSUBJ + Actio Ess/Inf: 
# ----------- prpers (ieš:2)
# Genitive: 
# ----------- sin (ieš, handled in bidix, mapping PxSg1 to jeg.prn.gen, etc)
#             (may turn into regular pronoun if genitiv was selected by adposition)
# Genitive after Pron.Pers: 
# ----------- egen (ieš:5)
# Komitativ: 
# ----------- seg selv (ieš, handled in bidix)
# Illativ: 
# ----------- seg selv (ieš, handled in bidix)
# Lokativ: 
# ----------- selv (ieš, handled in bidix)
# Essiv: 
# ----------- på egen hånd (ieš, handled in bidix)
# 
# There is a transfer rule for "Pron.Pers Pron.Refl.@Pron←" => prpers.acc selv
# (that turns the Pron.Pers into accusative)

SUBSTITUTE ("ieš") ("ieš:1") ("ieš" Pron Refl) (0 (@-FOBJ→) OR (@-FSUBJ→)) ;
# Máhtte rábmui iežas:1 vuoitit => Máhtte skrøt at _han_ skulle vinne 
SUBSTITUTE ("ieš") ("ieš:2") ("ieš" Pron Refl Gen) (-1 (Pron Pers Gen)) ;
# Dá lea mu iežan:2 girji => Her er min _egen_ bok

SUBSTITUTE ("iehčanassii") ("iehčanassii:1") ("iehčanassii" Adv) (-1 ("leat")) ;

# Po: mielde => med, mielde:1 => langs, mielde:2 => i følge, mielde:3 => etter
SUBSTITUTE ("mielde") ("mielde:3") ("mielde" Po) (-1 ("dárbu") OR ("miella")) ;
# Don vieččat boaldinmuoraid dárbbu mielde.


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

# Cond = kunne, Cond2 = skulle, Cond3 = skal
SUBSTITUTE (Cond) (Cond2) (Cond) (*-1 ("vaikko") OR ("vare")) ;
# Vaikko suhtašitge => Selv om du skulle bli sint 
SUBSTITUTE (Cond) (Cond2) (Cond) (*-1 ("jos") LINK 1 ("vel")) ;
# Jos vel boađášitge => Hvis enn du skulle komme
SUBSTITUTE (Cond) (Cond3) (Cond) (*-1 ("vai")) ;
# Dan mun dutnje muitalan, vai oahpašit => Den forteller jeg til deg for at du skal lære

