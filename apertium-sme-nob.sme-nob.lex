# -*- cg-pre-pipe: "apertium -d . sme-nob-biltrans | cg-conv -a 2>/dev/null" -*-

SOFT-DELIMITERS = "<,>" cm ;
DELIMITERS = "<.>" "<:>" "<!>" "<?>" "<...>" "<|>" "<$.>" "<$:>" "<$!>" "<$?>" "<$|>" sent ;

SETS




# I define end of clause and beginning of clause in a way so that the file
# may be read both by the CG-2 and the vislcg formalisms.

LIST BOS = (>>>) (<s>);
LIST EOS = (<<<) (</s>);

# CG3 doesn´t function without >>> and <<< !

# Tags declared as single-membered LISTs
# ======================================

# Parts of speech
# ---------------

LIST n = n ;
LIST a = adj ;
LIST adv = adv ;
LIST v = vblex ;
LIST pron = prn ;

LIST cs = cnjsub ;
LIST cc = cnjcoo ;
LIST po = po ;
LIST pr = pr ;
LIST pcle = pcle ;
LIST num = num ;
LIST interj = ij ;
LIST abbr = abbr ;
LIST acr = acr ;

LIST clb = clb ;
LIST left = left ;
LIST right = right ;
LIST web = web ;
LIST punct = punct ;

LIST COMMA = "," ;
LIST ¶ = ¶;

#LIST V* = V* ;

#!! * Sets for POS sub-categories
# ------------------

LIST pers = pers ;
LIST dem = dem ;
LIST interr = itg ;
LIST indef = ind ;

LIST recipr = res ;
LIST refl = ref ;
LIST rel = rel ;

LIST coll = coll ;
LIST nomag = nomag ;
LIST g3 = g3 ;
LIST prop = prop ;

#!! * Sets for Semantic tags
# -------------

LIST sem_ani = sem_ani ;
LIST sem_date = sem_date ;
LIST sem_fem = sem_fem ;
LIST sem_clth = sem_clth ;
LIST sem_group = sem_group ;
LIST sem_hum = sem_hum ;
LIST sem_mal = sem_mal ;
LIST sem_measr = sem_measr ;
LIST sem_money = sem_money ;
LIST sem_obj = sem_obj ;
LIST sem_org = sem_org ;
LIST sem_plc = sem_plc ;
LIST sem_sur = sem_sur ;
LIST sem_time = sem_time ;
LIST sem_year = sem_year ;
LIST sem_txt = sem_txt ;

SET FIRSTNAME = (prop sem_fem) OR (prop sem_mal) ;

LIST TIME-N-SET = (n sem_time) ;
LIST NOT-TIME = "<dulvi>" "<lohpi>" "<vuorru>" ;
SET TIME-N = TIME-N-SET - NOT-TIME ;


LIST HUMAN = sem_hum sem_mal sem_fem sem_sur pers numag der_numag ;

LIST LANGUAGE = ("<.*giella>"ri n) ("<.*giel>"ri n) ("<.*giel>"ri a) "<dárrolaš>"i "<nuortalaš>"i "<oarjelsámegiel>"i "<sámegiel>"i "<sápmelaš>"i "<ubmisámegiel>"i ;

#!! * Sets for Morphosyntactic properties
# --------------------------

LIST nom = nom ;
LIST acc = acc ;
LIST gen = gen ;
LIST ill = ill ;
LIST loc = loc ;
LIST com = com ;
LIST ess = ess ;

LIST sg = sg ;
LIST du = du ;
LIST pl = pl ;

LIST rcmpnd = rcmpnd ;

LIST cmpnd = cmp ;

LIST sgnomcmp = sgnomcmp ;

LIST sggencmp = sggencmp ;

LIST shcmp = shcmp ;

LIST pxsg1 = pxsg1 ;
LIST pxsg2 = pxsg2 ;
LIST pxsg3 = pxsg3 ;

LIST pxdu1 = pxdu1 ;
LIST pxdu2 = pxdu2 ;
LIST pxdu3 = pxdu3 ;

LIST pxpl1 = pxpl1 ;
LIST pxpl2 = pxpl2 ;
LIST pxpl3 = pxpl3 ;

LIST comp = comp ;
LIST superl = sup ;

LIST attr = attr ;
LIST ord = ord ;

LIST qst = qst ;

# The ("ge" pcle) etc. are used in Apertium
LIST Foc_ge = foc_ge ("<ge>" pcle) ;
LIST Foc_gen = foc_gen ("<gen>" pcle) ;
LIST Foc_ges = foc_ges ("<ges>" pcle) ;
LIST Foc_gis = foc_gis ("<gis>" pcle) ;
LIST Foc_naj = foc_naj ("<naj>" pcle) ;
LIST Foc_ba = foc_ba ("<ba>" pcle) ;
LIST Foc_be = foc_be ("<be>" pcle) ;
LIST Foc_hal = foc_hal ("<hal>" pcle) ;
LIST Foc_han = foc_han ("<han>" pcle) ;
LIST Foc_bat = foc_bat ("<bat>" pcle) ;
LIST Foc_son = foc_son ("<son>" pcle) ;

LIST iv = iv ;
LIST tv = tv ;

LIST pass = pass ;              # bidix-added
LIST der_pass = der_passl der_passs ;

LIST prt = pret;
LIST prs = pres ;


LIST ind = indic ;
LIST pot = pot ;
LIST cond = cond ;

LIST imprt = imprt ;

LIST sg1 = sg1 ;
LIST sg2 = sg2 ;
LIST sg3 = sg3 ;

LIST du1 = du1 ;
LIST du2 = du2 ;
LIST du3 = du3 ;

LIST pl1 = pl1 ;
LIST pl2 = pl2 ;
LIST pl3 = pl3 ;

LIST inf = inf ;
LIST conneg = conneg ;
LIST neg = neg ;

LIST prfprc = prfprc ;
LIST vgen = vgen ;

LIST prsprc = prsprc ;


LIST ger = ger ;
LIST sup = supn ;
LIST actio = actio ;

LIST der_passl = der_passl ;
LIST der_nomag = der_nomag ;
LIST Actor = nomag der_nomag ;
LIST vabess = vabess ;

# Derivation
# ----------

LIST der_adda = der_adda ;
LIST der_ahtti = der_ahtti ;
LIST der_alla = der_alla ;
LIST der_asti = der_asti ;
LIST der_easti = der_easti ;
LIST der_d = der_d ;
LIST der_nomact = der_nomact ;
LIST der_eamoš = der_eamoš ;
LIST der_amoš = der_amoš ;
LIST der_eapmi = der_eapmi ;
LIST der_geahtes = der_geahtes ;
LIST der_gielat = der_gielat ;
LIST !better: = !better: ;

LIST der_h = der_h ;
LIST der_heapmi = der_heapmi ;
LIST der_hudda = der_hudda ;
LIST der_huhtti = der_huhtti ;
LIST der_huvva = der_huvva ;
LIST der_halla = der_halla ;
LIST der_j = der_j ;
LIST der_l = der_l ;
LIST der_laš = der_laš ;
LIST der_las = der_las ;
LIST der_hat = der_hat ;

LIST der_meahttun = der_meahttun ;
LIST der_muš = der_muš ;
LIST der_n = der_n ;
LIST der_st = der_st ;
LIST der_stuvva = der_stuvva ;
LIST der_upmi = der_upmi ;
LIST der_supmi = der_supmi ;
LIST der_vuohta = der_vuohta ;
LIST der_goahti = der_goahti ;

LIST der_lágan = der_lágan ;
LIST der_lágán = der_lágán ;
LIST der_lágaš = der_lágaš ;
LIST der_jagáš = der_jagáš ;
LIST der_jahkásaš = der_jahkásaš ;
LIST der_diibmosaš = der_diibmosaš ;

LIST der_Dimin = der_dimin ;
LIST der_viđá = der_viđá ;
LIST der_viđi = der_viđi ;
LIST der_veara = der_veara ;
LIST der_duohke = der_duohke ;
LIST der_duohkai = der_duohkai ;
LIST der_vuolle = der_vuolle ;
LIST der_vuollai = der_vuollai ;
LIST der_vuolde = der_vuolde ;

# Syntactic tags
# --------------

LIST @+FAUXV = @+FAUXV ;
LIST @+FMAINV = @+FMAINV ;
LIST @-FAUXV = @-FAUXV ;

LIST @-FMAINV = @-FMAINV ;
LIST @-FSUBJ→ = @-FSUBJ→ ;
LIST @-F←OBJ = @-F←OBJ ;
LIST @-FOBJ→ = @-FOBJ→ ;
LIST @SPRED←OBJ = @SPRED←OBJ ;
LIST @-FADVL = @-FADVL ;

SET FOBJ = @-F←OBJ OR @-FOBJ→ ;
SET FMAINV = @-FMAINV OR @+FMAINV OR (vblex @←OBJ) OR (vblex @N←) OR (vblex @A←) OR (vblex @←SUBJ) OR (vblex @←ADVL) ;
SET FAUXV = @-FAUXV OR @+FAUXV ;

LIST @ADVL = @ADVL @ADVL→ @ADVL← @←ADVL @→ADVL @-F←ADVL ;
LIST @→ADVL = @→ADVL ;
LIST @ADVL← = @ADVL← ;
LIST @←ADVL = @←ADVL ;
LIST @ADVL→ = @ADVL→ ;
LIST @ADVL→CS = @ADVL→CS ;

LIST ←hab→ = ←hab→ (@ADVL→ prn loc) (@←ADVL prn loc);
LIST ←ext→ = ←ext→ ;


LIST HAB-V-TAGS = pl3 sg3 conneg prfprc inf ;

LIST @→N = @→N ;

LIST @N← = @N← ;


LIST @→A = @→A ;

LIST @P← = @P← ;

LIST @→P = @→P ;

LIST @HNOUN = @HNOUN ;
LIST @INTERJ = @INTERJ ;

LIST @→Num = @→Num;

LIST @Pron← = @Pron← ;
LIST @→Pron = @→Pron ;

LIST @Num← = @Num← ;

LIST @OBJ = @OBJ ;
LIST @←OBJ = @←OBJ ;
LIST @OBJ→ = @OBJ→ ;
LIST @OPRED = @OPRED ;
LIST @←OPRED = @←OPRED ;
LIST @OPRED→ = @OPRED→ ;
LIST @PCLE = @PCLE ;
LIST @COMP-CS← = @COMP-CS← ;

LIST @SPRED = @SPRED ;
LIST @←SPRED = @←SPRED ;
LIST @SPRED→ = @SPRED→ ;
LIST @SUBJ = @SUBJ ;
LIST @←SUBJ = @←SUBJ ;
LIST @SUBJ→ = @SUBJ→ ;
SET SUBJ = @←SUBJ OR @SUBJ→ OR @SUBJ ;
SET SPRED = @←SPRED OR @SPRED→ OR @SPRED ;
SET OPRED = @←OPRED OR @OPRED→ OR @OPRED ;

LIST @PPRED = @PPRED ;

LIST @APP = @APP ;
LIST @APP-N← = @APP-N← ;
LIST @APP-Pron← = @APP-Pron← ;
LIST @APP→Pron = @APP→Pron ;
LIST @APP-Num← = @APP-Num← ;
LIST @APP-ADVL← = @APP-ADVL← ;
LIST @VOC = @VOC ;

LIST @CVP = @CVP ;
LIST @CNP = @CNP ;

SET OBJ = (@←OBJ) OR (@OBJ→) OR (@OBJ) OR (@-F←OBJ) OR (@-FOBJ→) ;
LIST ←OBJ = @-F←OBJ @←OBJ ;
LIST OBJ→ = @OBJ→ @-FOBJ→ ;

SET ←OBJ-OTHERS = ←OBJ OR gen OR nom OR ess OR loc OR adv ;
SET OBJ→-OTHERS = OBJ→ OR gen OR nom OR ess OR loc OR adv  ;

SET SYN-V = v + SUBJ OR OBJ + v OR @ADVL + v OR (vblex @N←) OR (vblex @A←) OR v + SPRED OR (vblex @COMP-CS←) ;


LIST @X = @X ;


LIST OKTA = "<akta>" "<okta>";
LIST go = "<go>" ;


# Initials
# --------

LIST INITIAL = "adj" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m"
"n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
"á" "æ" "ø" "å" "ö" "ä" ;

LIST CAP-INITIAL = "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M"
"N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
"Á" "Æ" "Ø" "Å" "Ö" "Ä" ;

# Tag sets
# ========
  SETS
# ========


# Word or not
# -----------
LIST WORD = n adj adv vblex prn cnjsub cnjcoo po pr ij pcle num abbr acr \? ;
# any word

SET REALWORD = WORD - num - ord ;

SET REALWORD-NOTABBR = WORD - num - ord - abbr ;

SET WORD-NOTDE = WORD - ("<de>") ;

# Verb sets
# ---------

# Verbs and their complements
# - - - - - - - - - - - - - -

SET NOT-VERB = WORD - v ;

# Finiteness and mood
# - - - - - - - - - -

SET V-IND-FIN = prs OR prt ;
# Problem: "In boahtán" is an invisible indicative

SET V-MOOD = ind OR pot OR imprt OR cond OR (neg sup) ;

LIST GC = ("<gč>") ;

SET VFIN = GC OR V-MOOD - conneg ;

SET VFIN-POS = V-MOOD - conneg - neg ;

SET VFIN-NOT-IMP = VFIN - imprt ;

SET VFIN-NOT-NEG = VFIN - neg ;
# this might be to strict, besides, "iige" can be written "ii ge"

SET NOT-PRFPRC = WORD - prfprc ;

# Person
# - - - -

LIST V-SG1 = (vblex sg1) ;

LIST V-SG2 = (vblex sg2) ;

LIST V-SG3 = (vblex sg3) ;

LIST V-DU1 = (vblex du1) ;

LIST V-DU2 = (vblex du2) ;

LIST V-DU3 = (vblex du3) ;

LIST V-PL1 = (vblex pl1) ;

LIST V-PL2 = (vblex pl2) ;

LIST V-PL3 = (vblex pl3) ;


# Note that imperative verbs are not included in these sets!

# Some subsets of the VFIN sets
# - - - - - - - - - - - - - - -
SET V-SG = V-SG1 OR V-SG2 OR V-SG3 ;
SET V-DU = V-DU1 OR V-DU2 OR V-DU3 ;
SET V-PL = V-PL1 OR V-PL2 OR V-PL3 ;

SET V-DU-PL = V-DU1 OR V-DU2 OR V-DU3 OR V-PL1 OR V-PL2 OR V-PL3 ;

SET V-NOT-SG1 = VFIN-NOT-IMP - V-SG1 ;
SET V-NOT-SG2 = VFIN-NOT-IMP - V-SG2 ;
SET V-NOT-SG3 = VFIN-NOT-IMP - V-SG3 ;
SET V-NOT-DU1 = VFIN-NOT-IMP - V-DU1 ;
SET V-NOT-DU2 = VFIN-NOT-IMP - V-DU2 ;
SET V-NOT-DU3 = VFIN-NOT-IMP - V-DU3 ;
SET V-NOT-PL1 = VFIN-NOT-IMP - V-PL1 ;
SET V-NOT-PL2 = VFIN-NOT-IMP - V-PL2 ;
SET V-NOT-PL3 = VFIN-NOT-IMP - V-PL3 ;


SET V-1-2 = V-SG1 OR V-SG2 OR V-DU1 OR V-DU2 OR V-PL1 OR V-PL2 ;
SET V-3 = V-SG3 OR V-DU3 OR V-PL3 ;

# Sets consisting of LEAT
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
LIST LEAT = "<leat>"i ;

SET LEAT-FIN-NOT-IMP = LEAT - imprt;

LIST VPRFPRC = (vblex prfprc) ;
LIST LEATPRFPRC = ("<leat>"i prfprc) ;
SET PRC-NOT-LEAT = VPRFPRC - LEATPRFPRC ;
# In order to distinguish between real leat-constructions and participles of other verbs
LIST HABEO-SG3 = ("<leat>"i sg3) (vblex neg sg3) ("<šaddat>" sg3) ;

LIST HABEO-PL3 = ("<leat>"i pl3) (vblex neg pl3) ("<šadda>t" pl3)  ;

SET HABEO-3 = HABEO-SG3 OR HABEO-PL3 ;

# Pronoun sets
# ------------

LIST MUN = (prn pers sg1 nom) ;
LIST DON = (prn pers sg2 nom) ;
LIST SON = ("son" pron pers sg3 nom) ;
LIST MOAI = (prn pers du1 nom) ;
LIST DOAI = (prn pers du2 nom) ;
LIST SOAI = (prn pers du3 nom) ;
LIST MII-PERS = (prn pers pl1 nom) ;
LIST DII = (prn pers pl2 nom) ;
LIST SII = ("son" pron pers pl3 nom) ;

SET PPRON-NOM-NOT-DAT = MUN OR DON OR SON OR MOAI OR DOAI OR SOAI OR MII-PERS OR DII OR SII ;

SET PPRON-NOT-DAT = (prn pers) - ("<dat>") ;

SET PPRON-DU-PL = MOAI OR DOAI OR SOAI OR MII-PERS OR DII OR SII ;
SET PPRON-PL = MII-PERS OR DII OR SII ;

SET PRON-DU = MOAI OR DOAI OR SOAI ;

SET PPRON-NOT-SII = MUN OR DON OR SON OR MOAI OR DOAI OR SOAI OR MII-PERS OR DII ;

LIST PPRON-GEN = (sg1 gen) (sg2 gen) (sg3 gen) (du1 gen) (du2 gen) (du3 gen)
	 (pl1 gen) (pl2 gen) (pl3 gen) ;

SET PPRON-NOT-GEN = (prn pers) - PPRON-GEN ;

LIST DEM-SG = (prn dem sg nom) ;
LIST DEM-PL = (prn dem pl nom) ;
SET NOT-DEM = WORD - dem ;

LIST SGPRON = (prn sg1) (prn sg2) (prn sg3) (prn sg) (prn pxsg1) (prn pxsg2) (prn pxsg3) ;
LIST DUPRON = (prn du1) (prn du2) (prn du3) (prn pxdu1) (prn pxdu2) (prn pxdu3) ;
LIST PLPRON = (prn pl1) (prn pl2) (prn pl3) (prn pl) (prn pxpl1) (prn pxpl2) (prn pxpl3) ;
LIST DUPRON-NOTPX = (prn du1) (prn du2) (prn du3) ;

SET PRON-NOT-SG = DUPRON OR PLPRON ;

LIST DAT-PRON = ("<dat>") ("<dát>") ("<diet>") ("<duot>") ("<dot>") ;

LIST QUANT-PRON = "<ollu>" "<olu>" "<unnán>" "<váháš>" "<veaháš>" "<veháš>" ;
# This set is for choosing between Adv and Pron Indef.

# Adjectival sets and their complements
# -------------------------------------

SET NOT-A = WORD - a ;
SET NOT-A-COMMA = WORD - a - COMMA ;
SET NOT-Attr = WORD - attr ;
SET NOT-A-PCLE = WORD - a - pcle ;

SET NOT-A-ADV = WORD - a - adv OR ("<maid>") ;

LIST NOMINAL-ADJ = "<guoktilaš>" "<lámis>" "<oasálaš>" ("<suddu>" der_laš) "<viissis>";

# and many others

# Adverbial sets and their complements
# ------------------------------------
SET LEX-ADV = adv - (a*) ;

SET NOT-ADV-DE = WORD - adv ;
SET NOT-ADV = NOT-ADV-DE OR ("<de>" adv) OR clb ;
SET NOT-ADV-N = NOT-ADV - n ;
SET NOT-ADV-PCLE = NOT-ADV - pcle ;
SET NOT-ADV-INDEF = NOT-ADV - indef ;
SET NOT-ADV-PCLE-ILL = WORD - adv - pcle - ill ;
SET NOT-ADV-PCLE-Refl = WORD - adv - pcle - refl ;
SET NOT-ADV-PCLE-INDEF = WORD - adv - pcle - indef ;
SET NOT-ADV-PCLE-NEG = WORD - adv - pcle - neg ;
SET NOT-ADVL-PCLE-NEG = WORD - @ADVL - @P← - pcle - neg ;


LIST MO-MANge = "<goas>" "<gokko>" "<gos>" "<gosa>" "<govt>" "<makkár>" "<man>" "<manne>" ("<manin>" adv) "<mo>" "<mot>" "<movt>" ("<nugo>" @CVP) (vblex qst) ;

SET MO = MO-MANge - ("man" foc_ge) ;

# Introduce finite clauses.

LIST PLACE-ADV = (sem_plc adv) ;
# There will usually be a Gen in front.

LIST TIME-ADVL = (sem_time gen) (sem_time loc) ;

LIST TIME-ADV = (adv sem_time) ;


LIST DOPPE = "<badjin>"i "<bajil>"i "<dakko>"i "<dá>"i "<dákko>"i "<dáppe>"i "<diekko>"i "<dieppe>"i "<do>"i "<dokko>"i "<doppe>"i "<duo>"i "<duokko>"i "<duoppe>"i "<olgun>"i ;
# Adverbs with a locativic form, but don´t get Loc as a tag.

LIST DOHKO = "<bajás>" "<deike>" "<diehke>" "<diehko>" "<dohko>" "<duohko>" "<lulás>" "<olggos>" "<ruoktot>" "<sisa>" "<vuovdimassii>" ;
# Adverbs with a illativic form, but they don´t get Ill as a tag.


# Coordinators
# ------------
LIST Foc = Foc_ge Foc_gen Foc_ges Foc_gis Foc_naj Foc_ba Foc_be Foc_hal Foc_han Foc_bat Foc_son ;

LIST NEGFOC = (neg foc_ge) ;

LIST XGO = "<dego>" "<dugo>" "<nugo>" "<seammaládjego>" "<seammaláhkaigo>" ;
# Compounds
LIST SEAMMAX = "<seamma ládje>" "<seamma láhkai>" ;
# Those combine with go

LIST MADE = "<mađe>" "<mađi>" ;
LIST DADE = "<dađe>" "<dađi>" ;


SET CRD = (@CNP) OR COMMA OR NEGFOC OR XGO OR ("_") OR ("-") OR DADE ;
# AFTER LCRD vs. GCRD disambiguation

LIST HAB-CASE = loc (←smj→ ine) (←sma→ gen) ;
LIST HAB-ACTOR-ALL = sem_hum sem_mal sem_sur sem_fem sem_ani pers ("<gii>") indef coll ;
SET HAB-ACTOR = HAB-ACTOR-ALL - ("<cihca>") ;
SET HAB-ACTOR-NOT-HUMAN = sem_org ;

# Sets of elements with common syntactic behaviour
# ================================================

SETS

#!! * Sets for verbs
# -----

LIST NOT-REAL-V = (actio nom) (actio gen) (actio loc) (actio com) prsprc ;

SET REAL-V = v - NOT-REAL-V ;
#!! ** V is all readings with a V tag in them, REAL-V should
#!! be the ones without an N tag following the V.
#!! The REAL-V set thus awaits a fix to the preprocess V ... N bug.


# The set REAL is smaller than COPULAS, made for verbs with PrfPrc complements: Seammás REAL-COPULAS son dovdan iežas...
LIST REAL-COPULAS = "<dáidit>" "<leat>"i "<soaitit>" "<veadjit>" ;

#!! * The set COPULAS is for predicative constructions
LIST COPULAS = "<dáidit>" "<gártat>" "<leat>"i "<soaitit>" "<šaddat>" "<orrut>" "<veadjit>"  ;
#  "bissut" ?
# 'Dáidit' can appear without 'leat'.

SET NOT-COP-V = v - COPULAS ;

SET MAIN-V = v - FAUXV ;

# All active verbs with a TV tag, including AUX-OR-MAIN.

LIST V-TRANS = (vblex tv) (iv der_ahtti) (iv der_h) ;


SET TRANS-V = V-TRANS - der_pass + REAL-V ;

#!! * NP sets defined according to their morphosyntactic features
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


LIST N-SG-NOM = (n sg nom) ;

SET HEAD-N = n - rcmpnd ;

SET HEAD-N-NOM = (n nom) - rcmpnd ;

SET SUBJECTHEAD = n OR a OR pron - refl ; # These, can be subject heads

SET NP = n OR a ; # anything that can take except numerals
SET NP-HEAD = pron OR HEAD-N - ("<buorre>") ;
SET NP-HEAD-SG = SGPRON OR (n sg) OR (a sg) - rcmpnd - dem - ("<buorre>") ;
SET NP-HEAD-PL = PLPRON OR (n pl) OR (a pl) - rcmpnd - dem - ("<buorre>") ;
SET NP-HEAD-SG-NOM = SGPRON + nom OR (n sg nom) OR (a sg nom) - ("<buorre>") - rcmpnd ;
SET NP-HEAD-PL-NOM = PLPRON + nom OR (n pl nom) OR (a pl nom) - rcmpnd - ("<buorre>") ;
SET NP-HEAD-NOM = NP-HEAD-SG-NOM OR NP-HEAD-PL-NOM ;
SET NP-HEAD-ACC = (prn acc) OR (n acc) OR (a acc) - rcmpnd - (dem attr) - ("<buorre>") ;
SET NP-HEAD-GEN = (prn gen) OR (n gen) OR (a gen) - der_nomact - rcmpnd - (dem attr) - ("<buorre>") ;

#!! * The PRE-NP-HEAD family of sets

#!! These sets model noun phrases (NPs). The idea is to first define whatever can
#!! occur in front of the head of the NP, and thereafter negate that with the
#!! expression __WORD - premodifiers__.


SET PRE-NP-HEAD = (prop attr) OR (prop @→N) OR (a attr) OR (abbr attr) OR ("<buorre>")
OR (prn pers gen) OR (n gen) OR (a gen) OR ("<buot>") OR
num OR rcmpnd OR cc OR (prn dem) OR (prn ref gen) OR (ind attr) OR
(prfprc @→N) OR prsprc OR (a ord) OR (num @→N) OR (a @→N) OR @→N OR @→A OR @→Pron OR @Num← OR (cc @CNP) OR (@→CC) OR (action gen) OR (@Pron←) ;
# The strict version of items that can only be premodifiers, not parts of the predicate

#LIST PRE-NP-HEAD = @>N @>A @>Pron @Num< @CNP ;

SET PRE-NP-V = prfprc OR prsprc OR der_nomag OR actio OR der_nomact OR (vblex a) OR (pres sg3) + ind OR (pres sg1) + ind OR (imprt du2) ;
# to be used together with PRE-NP-HEAD before @>N is disambiguated

SET NP-MEMBER = PRE-NP-HEAD OR n ;

SET PRE-A-N = (prn pers gen) OR (prn pers acc) OR (prn ind) OR num OR (a ord) OR (prn dem) OR (prn ref gen) OR (prn ref acc) ; # Acc pga av manglende disambiguering tidlig i fila

SET NOT-PRE-A-N = WORD - PRE-A-N ;

LIST PUNCT-LEFT = (punct left) ;
LIST PUNCT-RIGHT = (punct right) ;

SET PRE-APP = COMMA OR PUNCT-LEFT OR PRE-NP-HEAD ;
# This set ist not only for what can
# stand in front of appositions but also
# postmodifiers.



#!! The set __NOT-NPMOD__ is used to find barriers between NPs.
#!! Typical usage: ... (*1 N BARRIER NPT-NPMOD) ...
#!! meaning: Scan to the first noun, ignoring anything that can be
#!! part of the noun phrase of that noun (i.e., "scan to the next NP head")

SET NOT-NPMOD = WORD - PRE-NP-HEAD OR abbr ;
# This is the previous NPNH (npnh) set.
# NOT-NPMOD  = "NOT-PRE-NP-HEAD"

SET NOT-NPMOD-ACC = NOT-NPMOD - acc OR abbr ;
SET NOT-NPMOD-ACC-ADV = NOT-NPMOD - acc - adv OR abbr ;
# To be used in mappingrules, before the disambuation of Acc and Gen.

SET NOT-NPMODADV = WORD - PRE-NP-HEAD - adv ;
# NOT-NPMODADV = "NOT-PRE-NP-HEAD-OR-ADV"
SET NOT-NPMODADV-INDEF = WORD - PRE-NP-HEAD - adv - indef ;
## NOT-NPMODADVI = "     ...-OR-INDEF"
SET NOT-NPMODADVII = WORD - PRE-NP-HEAD - adv - indef - ill ;
# Illative indir.obj.
SET NOT-NPMODADVIIP = WORD - PRE-NP-HEAD - adv - indef - ill - pcle ;
# <== is this our NOT-NPMOD set?
SET NOT-NPMODCC = WORD - PRE-NP-HEAD - COMMA - @CNP ;
SET NAPP = WORD - PRE-APP ;



#!! * Miscellaneous sets
# ------------------
LIST Px = pxsg1 pxsg2 pxsg3 pxdu1 pxdu2 pxdu3 pxpl1 pxpl2 pxpl3 ;

LIST GASKAL = "<gaskal>" "<gaskkal>" "<gaskii>" "<gaskka>" "<gaskkas>" ;

# p-positions that like coordination

LIST TIME-PP = "<badjel>" "<čađa>" "<earret>" "<gaskkal>" "<guovddáš>" "<maŋŋel>" "<maŋŋil>" "<maŋŋá>" "<miehtá>" "<ovdal>" ;


SET NUM = num - OKTA ;

# this set does not contain ordinals, I am not sure if that is necessary.

SET NOT-NUM = WORD - num ;

LIST MANGA = "<máŋga>" "<galle>" ;
# Not referred to by any rule.

SET CARDINALS = num - ord - MANGA ;

SET NOT-CC = WORD - cc ;

SET NOT-PCLE = WORD - pcle ;

LIST COMPAR = "<dávji>" "<eanet>" "<earalágan>" "<eará>" "<earret>" "<seammás>" "<seammalágan>" "<seamma láhkái>" ;

# These combine with "go" Pcle, but COMPAR stands for 'comparison' rather than
# 'comparative'.

LIST CONTRA = "<muhto>" ;
# In lean muitalan, muhto dál muitalan.

LIST PROSEANTA = "<proseanta>" "<%>" ;

SET REAL-CLB = clb - COMMA ;


SET NOT-INITIAL-CC = WORD - INITIAL - cc ;



#!! * Border sets and their complements
# ---------------------------------

SET CP = (prn itg) OR (prn rel) OR MO ;

LIST BOUNDARYSYMBOLS = "<\;>" "<:>" "<->" "<–>" ;

SET S-BOUNDARY = CP OR BOUNDARYSYMBOLS OR ("<muhto>") OR ("<de>" adv) OR (neg sup) OR @CVP OR ("<vel>" adv qst) ;
# does not include CS, because of "go" in questions, before it is disambugated.
# includes CP
# this one includes @CVP, the conjunction which actually connects two sentences (each with a finite verb) to each other,
# and not @CNP, which coordinates internal NP-/AdvP-/AP ... coordination
# To be used only AFTER the disambiguation of @CVP and @CNP taking place in the chapter right before "Disambiguating pronouns"


SET BOC = S-BOUNDARY OR BOS ;
SET BOC-PUNCT = BOC - ("-") - ("–") ;
SET EOC = S-BOUNDARY OR EOS ;

SET NP-BOUNDARY = BOS OR EOS OR REAL-CLB OR VFIN OR inf OR (actio ess) OR conneg OR vgen OR sup OR PPRON-NOT-GEN OR recipr OR po OR pr OR pcle OR interj OR cs OR  @CVP ;

SET APP-BOUNDARY = REAL-CLB OR VFIN OR inf OR (actio ess) OR conneg OR vgen OR sup OR recipr OR po OR pr OR pcle OR interj OR cs OR prfprc - @→N ;
# A special barrier used with mapping of appositions.

# This set contains FMAINV with @, which means that it functions for all kind of mainverbs after the verb-mapping rules
SET SV-BOUNDARY = S-BOUNDARY OR inf - FAUXV OR sup OR FMAINV ;
# VFIN-NOT-AUX ;
# should be MAIN-V linked to VFIN-aux to the left. (cg-3)
# This set is ment to use in rules for disambiguating due to verbs or verbsets. It contents @.

SET SVF-BOUNDARY = S-BOUNDARY OR VFIN ;

# This set is ment to use in rules for disambiguating due to verbs or verbsets.
# Here we search for either an S-BOUNDARY or a finite verb, either aux or main.

LIST ADVLCASE = ill loc com ess ine ela ;
LIST CASE = nom acc gen ill loc com ess ine ela ;


#!! * Syntactic sets
# --------------

LIST HEAD = @SUBJ→ @←SUBJ @SUBJ @OBJ @OBJ→ @←OBJ @ADVL @ADVL→ @←ADVL @SPRED→ @←SPRED @SPRED @OPRED→ @←OPRED @OPRED @-FSUBJ→ @-FOBJ→ @-FADVL→ @-FSPRED→ @-F←SUBJ @-F←OBJ @-F←ADVL @-F←SPRED ;

#!! These were the set types.



#           Then come the rules
#           Then come the rules
#           Then come the rules
#           Then come the rules
#           Then come the rules
#           Then come the rules


SECTION

REMOVE (cmp) (0 prop) ;



# go (default)=> når
# go:1 => at, go:2 => enn, go:3 => som, go:4 => da, go:5 => fordi


SELECT:så-langt-som ("som"i) (0 ("<go>"i)) (-2 ("så" "<nu>")) (-1 a OR adv) (0 cs) ;

SELECT ("at"i) (0 ("<go>"i))(0 cs) (-1 ("<maŋŋel>"i) OR ("<ovdal>"i) LINK 0 adv) ;
SELECT ("at"i) (0 ("<go>"i))(0 cs) (-1 COPULAS LINK -1 (a nom)) ;
SELECT ("at"i) (0 ("<go>"i))(0 cs) (-1 a) ;
## Son bijai vuosttaš spáppa mollii 22 minuvtta maŋŋel go čiekčamat ledje álgán.
## Buorre lei go bohtet.
## Gummá go ii boahtán.



SELECT ("enn"i) (0 ("<go>"i))(0 @CNP LINK 1 (@COMP-CS←)) ;
SELECT ("enn"i) (0 ("<go>"i))(0 @CNP) (-1 ("<veara>"i)) ;
SELECT ("enn"i) (0 ("<go>"i))(0 @CNP) (*-1 ("<ovdal>"i) BARRIER S-BOUNDARY LINK 0 adv) ;
SELECT ("enn"i) (0 ("<go>"i))(0 @CNP) (*-1 comp BARRIER v OR S-BOUNDARY) ;
## Son lea viššaleabbo go mun.
## Dat dáidá riggát go mii jáhkkit.
## Dii han lehpet eanet veara go ollu cizážat.
## Viššalat ohppet eanet go láikkit.
## Ovdal buorida son dálkkiidis go neavrres olmmoš dábiidis.

SELECT ("som"i) (0 ("<go>"i))(0 cs) ((-1 ("<nu>"i) OR ("<seammá>"i) LINK 0 adv) OR (-1 adv OR a LINK -1 ("<nu>"i))) ;
## Elvenes oaččui Niehkostipeandda nu go lei sávvan.

SELECT ("da"i) (0 ("<go>"i)) (0 cs) (*1 (vblex pret) BARRIER (←hab→) OR (@ADVL→)) ;

SELECT ("fordi"i) (0 ("<go>"i))(0 cs) (1 (@ADVL→) OR (←hab→) LINK 1 COPULAS) ;
## Olbmot leat čoagganan Kárášjoga márkanii, go márkanis leat beassášdoalut.

SELECT ("når"i) (0 ("<go>"i)) (0 cs) ;

SELECT ("alene") (0 ("<iehčanassii>"i)) (-1 ("leat")) ;

# Po: mielde => med, mielde:1 => langs, mielde:2 => i følge, mielde:3 => etter
SELECT ("etter") (0 ("<mielde>"i)) (0 po) (-1 ("<dárbu>"i) OR ("<miella>"i)) ;
## Don vieččat boaldinmuoraid dárbbu mielde.

SELECT ("for at"i) IF (0 ("<vai>"i)) (NOT 1 inf) ;

SELECT ("for å"i) IF (0 ("<vai>"i)) (1 inf) ;

SELECT ("all"i) IF (0 ("<juohke>"i) LINK 1 ("<lágan>")) ;
#$ juohke lágán geđggiiguin

SELECT ("mens"i) IF (0 ("<bodda>"i) LINK -1 ("<dat>") LINK 0 gen) ;



# Verbs
# =====

#leat

# leat 0 = være, 1 = ha, 2 = måtte («ha å»)
SELECT ("måtte"i) IF (0 ("<leat>"i) LINK -1 loc + HUMAN) (1 inf) ;
# mis lea cahkkehit dola
SELECT:hab-ha ("ha"i) IF (0 ("<leat>"i)) (*-1 ←hab→ - dem BARRIER NOT-ADV) ;
SELECT:neg-ha ("ha"i) IF (0 ("<leat>"i)) (-1 neg) (*-2 ←hab→ BARRIER NOT-ADV) ;
SELECT:ha-NOT-actio ("ha"i) IF (0 ("<leat>"i)) (0 FAUXV) (NEGATE *1 actio + ess BARRIER S-BOUNDARY) (NOT 1 (der_passl prfprc)) ;
# sin giella lea<er> áitojuvvon ja sáhttá jávkat; … sii leat<er> dál<Adv> guorahallamin<Actio> …
# Dat leat šaddan nu stuorat ahte dat šaddá nu váivi ja lossat dan oahpat dan dáfus go sii leat massán dan interessa mii sis lei go sii ledje unnibut
# Leat go Ibsenii sáddemin dieđu?
SELECT ("ha"i) IF (0 ("<leat>"i)) (0 (indic pret)) (1 inf) ;
# Jos mun ledjen dadjat sátnegeažige, de ii son lean vuolgit.
# (Perf Cond 2)
# TODO: Gávpotmuvrra vuođđogeađggit ledje<være> čiŋahuvvon
# (unfortunately no animacy, and impers isn't until bidix...)
# TODO: ledje<ha> ovdalaččas guokte nieidda

SELECT:Det-er ("være"i) IF (0 ("<leat>"i)) (-1 ("<Dat>") + @SUBJ→) ; # Dat lea …

SELECT:alle-hadde-samisk ("ha"i) IF (0 ("<leat>"i)) (-1 loc + @ADVL→ - dem) (*1 @←SUBJ - inf) ;
# Buohkain lei sámegiella eatnigiella
# … ahte mis lea juo Guovdageainnus juo ovddit jagi …
# Sis ledje olusat sápmelaččat ja sii oahpahedje sámegillii.
# Bohccot mis ledje Árdnisullos.
# Sámiid oahpaheamis lei prinsihpalaččat seammá mihttomearri go dážaid oahpaheamis.
SELECT:som-jeg-har. ("ha"i) IF (0 ("<leat>"i)) (-1 loc + @ADVL→ - dem) (NOT *1 inf) ; # Dat lea buot mii mus lea
# Exceptions:
# dikki mielas livččii dehálaš oččodit olbmuide diđolašvuođa ahte …
# TODO-exceptions:
# Sámedikki váldovuoruheamit oahppoplánabargguin ledje departemeantta iežas vuođđojurdagiid mielde.
# Skuvla eanas sámi guovlluin leai duššefal dábálaš dáčča skuvlla kopiija
# Ráissas lei maiddái buorre dilli mánáid gaskkas.
# Boarráseamos dovddus instruksa álbmotseađu oahpahusa olis lea Kristian 3. girkoordinánsa.
# Das lea máhppa masa lei čállon «Kautokeino flyttsamelag»
# Áidna fálaldat maid ožžo Guovdageainnus lei boazodoallu válljenfágan

SELECT:fallback ("være"i) IF  (0 ("<leat>"i)) ;

SELECT:fallback ("by# på"i) IF  (0 ("<guossohit>"i)) ;

SELECT ("ære"i) IF  (0 ("<gudnejahttit>"i)) (0* ("forelder"i) OR ("far"i) OR ("mor"i) OR ("<Ipmil>"i)) ;
SELECT:fallback ("respektere"i) IF  (0 ("<gudnejahttit>"i)) ;

SELECT ("barbere"i) IF  (0 ("<beaskidit>"i)) (0* ("oaivi"i)) ;
SELECT:fallback ("klippe"i) IF  (0 ("<beaskidit>"i)) ;

SELECT ("legge# til rette for"i) IF  (0 ("<láhčit>"i)) (1 cs) ;
SELECT ("legge# opp"i) IF  (0 ("<láhčit>"i)) (1 ill) ;
SELECT ("legge# til rette for"i) IF  (0 ("<láhčit>"i)) (-1 @OBJ→ + acc) ;
SELECT ("legge# til rette for"i) IF  (0 ("<láhčit>"i)) (1 @←OBJ + acc) ;
SELECT:fallback ("legge# opp til"i) IF  (0 ("<láhčit>"i)) ;


# orrut 0 = synes, 1 = bo, 2 = bli, 3 = være
SELECT:dego ("synes"i) (0 ("<orrut>"i)) (1 ("<dego>"i) OR (actio ess)) ;
SELECT:jaska ("være"i) (0 ("<orrut>"i)) (1 ("<jaska>"i)) ;
SELECT:orron-doppe ("bo"i) (0 ("<orrut>"i)) (*1 loc OR DOPPE BARRIER (*) - TIME-ADV) ;
#This rule should have another barrier, a set of all words except TIME-ADV.
#For sentences like: Mun orron diibmá Romssas.
#Check SET ORRUT-BO
SELECT:doppe-son-orui ("bo"i) (0 ("<orrut>"i)) (-1 @SUBJ→) (-2 loc OR DOPPE) ;

SELECT:fallback ("synes"i) (0 ("<orrut>"i)); # says parallel corpus

## Sii orrot goit čeahpit hutkat vugiid movt ávkkástallat sin sámegielmáhtuin, čilge son.
## Mun orun Romssas.
## Oro jaska.

# šaddat 0 = bli, 1 = vokse, 2 = komme til å, 3 = vokse, 4 = bli, 5 = få, 6 = føde

SELECT ("vokse"i) (0 ("<šaddat>"i)) (1 ("<bajás>"i)) ;
SELECT ("få"i) (0 ("<šaddat>"i)) (*-1 HUMAN + ill OR HUMAN + loc BARRIER NOT-ADV) ;
# Sutnje šattai hoahppu.
# Sutnje šattai álo nu hoahppu.
SELECT ("få"i) (0 ("<šaddat>"i)) (-1 neg) (*-2 ←hab→ BARRIER NOT-ADV) ;

# «føde» sounds much worse when it's wrong than «bli», need to work on this:
SELECT ("føde"i) (0 ("<šaddat>"i)) (1 sem_plc) (NEGATE *0 SPRED) ;
# Mun lean šaddan Kárášjogas.
# Kárášjogas mun lean šaddan.

SELECT:fallback ("bli"i) (0 ("<šaddat>"i)) ;

# bargat 0 = arbeide, 1 = gjøre
SELECT ("gjøre"i) (0 ("<bargat>"i)) (*-1 ("<mii>"i prn acc) BARRIER V-IND-FIN) ;
SELECT ("arbeide"i) (0 ("<bargat>"i)) (*0 com OR ("<dainna>"i)) ;
SELECT:fallback ("arbeide"i) (0 ("<bargat>"i));

# beassat 0 = få, 1 = slippe, 2 = komme Refl til
## Sii leat beassan eallit dego gonagasat.

#SELECT ("slippe") (0 ("<beassat>"i)) (1 ill) ; # (1 (der_nomact loc) OR (actio loc) OR ("<olggos>"i)) ;
## Mun bessen vuolgimis.
SELECT ("komme") (0 ("<beassat>"i)) (1 ill OR DOHKO) ;
## In beassan skuvlii dan beaivve.  Jeg kom meg ikke på skolen den dagen.
## Maiddái Ranghild Nystad beassá Sámediggái. Også RN kommer seg inn på Sametinget.
## Sii ledje gáibidan ahte son galgá beassat riikastivrii. Du hadde krevd at han skulle komme seg inn i landsstyret.
## Mun nu illudan beassat duoddarii. Jeg gleder meg så til å komme meg på vidda.
## Nuoraidklubba nuorat besset dál Internehttii. Ungdomssklubbens ungdommer kommer seg nå på Internett.
SELECT:fallback ("få"i) (0 ("<beassat>"i));

# bivdit 0 = be, 1 = spørre, 2 = fiske, 3 = jakte
SELECT ("spørre"i) (0 ("<bivdit>"i) LINK *1 qst);
SELECT ("fiske"i) (0 ("<bivdit>"i))(*0 ("<.*mearra>"r) OR ("<.*johka>"r) OR ("<.*jávri>"r));
SELECT ("jakte"i) (0 ("<bivdit>"i)) ;
## Gonagas Harald liiko návddašit luonddu, dan dahká go bivdá.
## Gonagas Harald liiko návddašit luonddu, dan dahká go bivdá mearas.
SELECT:fallback ("be"i) (0 ("<bivdit>"i));

SELECT ("ta# hensyn") (0 ("<váldit>")) (*1 ("<vuhtii>")) ;

# borahit 0 = mate, 1 = fôre
SELECT ("fôre"i) (0 ("<borahit>"i))(*0 sem_ani);
SELECT ("mate"i) (0 ("<borahit>"i))(NOT *0 sem_ani);
## Son borahii máná. Son borahii spiinniid.
SELECT:fallback ("mate"i) (0 ("<borahit>"i));


# čuohppat: skjære vs klippe
SELECT ("klippe"i) (0 ("<čuohppat>"i))(*0 ("<vuokta>"i) OR ("<liidni>"i));
SELECT ("skjære"i) (0 ("<čuohppat>"i)) ;

# Sámediggi ja Sámi oahpahusráđđi gárttaiga čilget máŋgii vuođđojurdagiid man vuođul gáibideimmet ollislaš sámi oahppoplána
SELECT ("utgreie"i) (0 ("<čilget>"i)) (NOT 1 ("<.*skuvla>"ri) OR ("<ossodat>"i)) ;

SELECT ("oversette"i) (0 ("<jorgalit>"i)) (NOT *0 ("fisk"i)) ;

SELECT ("starte"i) (0 ("<álggahit>"i)) ;

SELECT ("legge"i) (0 ("<lágidit>"i)) (1 ("forhold")) (2 ("til rette for")) ;
SELECT ("ordne"i) (0 ("<lágidit>"i)) (*1 ill BARRIER v OR S-BOUNDARY) ; # lágidit sáhtu buohccivissui
SELECT ("arrangere"i) (0 ("<lágidit>"i)) ; # passar i fleire kontekstar enn «ordne»


LIST CURRENCY = "<denara>" "<dollár>" "<euro>" "<kruvdnu>" "<kr>" "<ru>" "<rubel>" "<ruvdno>" "<ruvdnu>" "<¢>" "<€>" "<$>" ;


# lohkat 0 = lese, 1 = si, 2 = telle

SELECT ("si"i) (0 ("<lohkat>"i))(1 ("<ahte>"i) OR (ref acc) OR (ref loc) OR prfprc or COMMA) ;

SELECT ("lese"i) (0 ("<lohkat>"i)) (1 sem_txt LINK 0 acc OR loc) ;
# Son lohká ahte lea buorre doppe.

SELECT:lese-samisk ("lese"i) (0 ("<lohkat>"i)) (1 LANGUAGE LINK 0 acc OR loc) ;
# Ruth Larsena mielas dát vuoseha ahte lea vejolaš lohkagoahtit sámegiela easkka joatkkaskuvllas

SELECT ("si"i) (0 ("<lohkat>"i)) (*1 FMAINV OR actio OR prfprc OR inf BARRIER S-BOUNDARY OR ("<galle>"i) OR ("<man>"i)) (NEGATE *0 acc + sem_txt BARRIER S-BOUNDARY)   ;
## Ovddeš bargi Yle Sámi Radios, Ánne Risten Juuso, lohká ahte Gárasavvonis livčče eará latnja leamaš Yle Sámi radio doaimmahussii. -  Den tidligere arbeideren Yle på Samelands Radio, Ánne Risten Juuso, hun sier at ...
## Son lohká máddin Sámis lea sámit garrasabbot deddon dahje vealahuvvon go davvin. - Han sier sørfra har Sameland samer hardere trykt eller berøvd nordpå.
## Lars Anders Baer ii eahpit ii veahášge go lohká dákkáraš álbmotsirren lea lága ja álbmotrievtti vuostá. - Lars Anders Baer tviler ikke ikke *veahášge når han sier *dákkáraš en folkeisolering er loven og folkeretten mot.
## Son lohká ádjá boahtit. - Han sier at bestefar skulle komme.
## Soai siđaiga dávjá Liná lohkat jitnosit go sis lei lohkan-hárjehallan.


SELECT ("si"i) (0 ("<lohkat>"i))(-1 COMMA)(*1 (@←SUBJ) BARRIER VFIN);
## Dat lea duohta, lohká Trond.

SELECT ("telle"i) (0 ("<lohkat>"i))
	(1 acc OR ("<galle>"i) OR ("<man>"i) LINK NOT 0 sem_txt);
## Son lohká ruđaid.
## Son lohká galle girjji mis leat.
SELECT:fallback ("lese"i) (0 ("<lohkat>"i));




# mannat 0 = dra, 1 = gå
SELECT ("gå"i) IF (0 ("<mannat>"i)) (*-1 ("<mo>"i) OR ("<dat>"i))(0 sg3);
## Mo manná dál?
#SELECT ("dra"i) IF (0 ("<mannat>"i)) (NEGATE 0 sg3 LINK *-1 ("<mo>"i) OR ("<dat>"i));
## Mun manan dál.
SELECT:fallback ("dra"i) (0 ("<mannat>"i));

SELECT ("betale"i) IF (0 ("<máksit>"i) )(*-1 HUMAN OR sem_org LINK 0 (@SUBJ→)) ;
## Máhtte máksá guokte ruvnnu.

SELECT ("koste"i) IF (0 ("<máksit>"i) )(*-1 (@SUBJ→) LINK NOT 0 HUMAN)(0* CURRENCY OR QUANT-PRON OR num BARRIER ill OR S-BOUNDARY) ;
## Girji máksá guokte ruvnnu.

# vuodjit - vuodján kjørt / vuodjat - vuodján svømt
REMOVE ("<vuodjat>"i) IF (0 ("<vuodjit>"i) LINK 0 prfprc);#(NOT 0* ("<čáhci>"i) OR ("<basseaŋga>"i));

SELECT ("tilsøle"i) (0 ("<durdut>"i)) ;

SELECT:fallback ("skje"i) (0 ("<dáhpáhuvvat>"i));

# Verbs that were 0-marked in the dix:
SELECT:fallback ("bruke"i) (0 ("<atnit>"i));
SELECT:fallback ("sette"i) (0 ("<bidjat>"i));
SELECT:fallback ("avslå"i) (0 ("<biehttalit>"i));
SELECT:fallback ("påvirke"i) (0 ("<báidnit>"i));
SELECT:fallback ("klare"i) (0 ("<ceavzit>"i));
SELECT:fallback ("kvitre"i) (0 ("<civkkádit>"i));
SELECT:fallback ("forårsake"i) (0 ("<dagahit>"i));
SELECT:fallback ("overdra"i) (0 ("<daguhit>"i));
SELECT:fallback ("respektere"i) (0 ("<doahttalit>"i));
SELECT:fallback ("tro"i) (0 ("<doaivut>"i));
SELECT:fallback ("føre"i) (0 ("<doalvut>"i));
SELECT:fallback ("stole"i) (0 ("<dorvvastit>"i));
SELECT:fallback ("omkomme"i) (0 ("<duššat>"i));
SELECT:fallback ("bekrefte"i) (0 ("<dáhkidit>"i));
SELECT:fallback ("besøke"i) (0 ("<finadit>"i));
SELECT:fallback ("være"i) (0 ("<fitnat>"i));
SELECT:fallback ("tilby"i) (0 ("<fállat>"i));
SELECT:fallback ("dra"i) (0 ("<geassit>"i));
SELECT:fallback ("grave"i) (0 ("<goaivut>"i));
SELECT:fallback ("lenke"i) (0 ("<goallostit>"i));
SELECT:fallback ("gløde"i) (0 ("<goarddašit>"i));
SELECT:fallback ("svette"i) (0 ("<golggahit>"i));
SELECT:fallback ("slutte"i) (0 ("<guorrasit>"i));
SELECT:fallback ("sky"i) (0 ("<hirrut>"i));
SELECT:fallback ("designe"i) (0 ("<hábmet>"i));
SELECT:fallback ("trene"i) (0 ("<hárjehit>"i));
SELECT:fallback ("forstå"i) (0 ("<ipmirdit>"i));
SELECT:fallback ("fryde"i) (0 ("<jierásmuvvat>"i));
SELECT:fallback ("nervøs"i) (0 ("<jierásmuvvat>"i));
SELECT:fallback ("fortsette"i) (0 ("<joatkit>"i));
SELECT:fallback ("forlenge"i) (0 ("<joatkkašit>"i));
SELECT:fallback ("slarke"i) (0 ("<johtalit>"i));
SELECT:fallback ("snu"i) (0 ("<jorahit>"i));
SELECT:fallback ("få"i) (0 ("<juollut>"i));
SELECT:fallback ("fortrenge"i) (0 ("<jávkadit>"i));
SELECT:fallback ("avslutte"i) (0 ("<loahpahit>"i));
SELECT:fallback ("lese"i) (0 ("<lohkalit>"i));
SELECT:fallback ("skifte"i) (0 ("<lonohallat>"i));
SELECT:fallback ("stole"i) (0 ("<luohttit>"i));
SELECT:fallback ("gå"i) (0 ("<luoitádit>"i));
SELECT:fallback ("stige"i) (0 ("<luoitádit>"i));
SELECT:fallback ("bemerke"i) (0 ("<mearkkašit>"i));
SELECT:fallback ("bestemme"i) (0 ("<mearridit>"i));
SELECT:fallback ("styrke"i) (0 ("<nannet>"i));
SELECT:fallback ("slutte"i) (0 ("<nohkat>"i));
SELECT:fallback ("sove"i) (0 ("<nohkkat>"i));
SELECT:fallback ("berolige"i) (0 ("<oadjudit>"i));
SELECT:fallback ("undervise"i) (0 ("<oahpahit>"i));
SELECT:fallback ("søke"i) (0 ("<ohcat>"i));
SELECT:fallback ("oppholde"i) (0 ("<orostaddat>"i));
SELECT:fallback ("skaffe"i) (0 ("<rabbat>"i));
SELECT:fallback ("åpne"i) (0 ("<rabestit>"i));
SELECT:fallback ("forandre"i) (0 ("<rievdat>"i));
SELECT:fallback ("skryte"i) (0 ("<rábmot>"i));
SELECT:fallback ("forberede"i) (0 ("<ráhkkanahttit>"i));
SELECT:fallback ("bevare"i) (0 ("<seailut>"i));
SELECT:fallback ("fjerne"i) (0 ("<sihkkut>"i));
SELECT:fallback ("slette"i) (0 ("<sihkkut>"i));
SELECT:fallback ("hente"i) (0 ("<viežžat>"i));
SELECT:fallback ("passe"i) (0 ("<váruhit>"i));
SELECT:fallback ("ordne"i) (0 ("<ásahit>"i));
SELECT:fallback ("gjemme"i) (0 ("<čiehkádit>"i));
SELECT:fallback ("spille"i) (0 ("<čuojahit>"i));
SELECT:fallback ("følge"i) (0 ("<čuovvolit>"i));
SELECT:fallback ("følge"i) (0 ("<čuovvulit>"i));
SELECT:fallback ("pynte"i) (0 ("<čábbudit>"i));
SELECT:fallback ("dyrke"i) (0 ("<šaddadit>"i));
SELECT:fallback ("gå"i) (0 ("<mannat>"i));

# Based on frequency in parallel text:
SELECT ("slåss"i) (0 ("<doarrut>"i)) ;
SELECT ("skille"i) (0 ("<earuhit>"i)) ;
SELECT ("forsvare"i) (0 ("<bealuštit>"i)) ;
SELECT ("vise# til"i) (0 ("<čujuhit>"i)) ;

# Nouns
# ============


SELECT ("grunn"i) (0 ("<vuođđu>"i)) (0 ess);
SELECT:fallback ("grunnlag"i) (0 ("<vuođđu>"i));

SELECT ("avdeling"i) (0 ("<ossodat>"i)); # parkorp har masse «avdeling»-døme, ingen «andel»

SELECT ("grad"i) (0 ("<muddu>"i)) (NOT -1 ord) ;

SELECT ("forhold"i) (0 ("<dilálašvuohta>")) (NOT -1 ("<virggálaš>")) (NOT -2 ("<virggálaš>"));

# áddjá: bestefar vs gamling
SELECT ("gamling"i) (0 ("<áddjá>"i) LINK -1 num LINK NOT *-1 ←hab→);
SELECT ("bestefar"i) (0 ("<áddjá>"i));
## Mus leat guokte ádjá.
## Doppe čohkkába guokte ádjá.


SELECT ("fattigdom"i) (0 ("<geafi>"i) + n);

# áhkku: bestemor vs eldre kvinne
REMOVE ("bestemor"i) (0 ("<áhkku>"i) LINK -1 num LINK NOT *-1 ←hab→);
SELECT ("bestemor"i) (0 ("<áhkku>"i));
## Mus leat šiega áhkku.
## Doppe čohkkába guokte áhkku.


# beaivi 0 = dag, 1 = sol
SELECT ("sol"i) (0 ("<beaivi>"i) LINK 0* ("<báitit>"i) OR ("<luoitádit>"i) OR ("<goardit>"i) OR ("<ligget>"i));
## Beaivi báitá.
SELECT:fallback ("dag"i) (0 ("<beaivi>"i));

SELECT ("mat"i) IF (0 ("<biebmu>"i)) ;

# luohkká 0 = bakke, 1 = klasse
SELECT ("klasse"i) (0 ("<luohkká>"i) LINK 1 ("<oahpaheaddji>"i));

#SUBSTITUTE ("luohkká") ("luohkká:1") ("luohkká" N) (-1 gen LINK 0 pers OR refl);
## Earát su luohkás ledje juo vissa njeallje siiddu su ovdalis matematihkka-girjjis.

SELECT ("klasse"i) (0 ("<luohkká>"i) LINK -1 num OR ord OR @→N);
# Son lea vuosttaš luohkás.
# Son lea 1A luohkás.
# Biera vázzá sámi luohkás.
# Biera vázzá sámegiel luohkás.
# Bireha luohkás leat eanaš nieiddat.
# Mu luohkás leat vihtta nieidda ja golbma bártni.
SELECT:fallback ("klasse"i) (0 ("<luohkká>"i));

# diibmu 0 = time, 1 = klokke
SELECT ("klokke"i) (0 ("<diibmu>"i) LINK 1 num OR ord) ;
# Boahtte gaskavahku diibmu 11.00 rahpá kurdarbearaš Mehidi Kárášjohkii ođđa kaféa.
# Ord because of possible incorrect analysis of Num + punctuation.
SELECT ("klokke"i) (0 ("<diibmu>"i) LINK *0 ("<ollu>"i)) ;
# Ollugo diibmu lea.
SELECT ("klokke"i) (0 ("<diibmu>"i) LINK 1 COPULAS LINK *1 num) ;
# Dál diibmu lea fargga vihtta.
SELECT:fallback ("time"i) (0 ("<diibmu>"i));

# hávvi gen as sår is the exceptional/rare case:
SELECT ("sår"i) (0 ("<hávvi>"i) + gen) (1 ("<vuostá>"));
SELECT ("gang"i) (0 ("<hávvi>"i) + gen);
SELECT ("sår"i) (0 ("<hávvi>"i) - gen);
# genitive háve is always gang in corpus, and much more frequent than «sår»

# miella 0 = sinn, 1 = oppfatning, 2 = behag
SELECT ("oppfatning"i) (0 ("<miella>"i) LINK 0 loc LINK -1 @→N) ;
# sinn => oppfatning (kan regelen vere meir generell?)
SELECT:fallback ("sinn"i) (0 ("<miella>"i));


# giella 0 = språk, 1 = snare
SELECT:fallback ("språk"i) (0 ("<giella>"i));


SELECT:fallback ("forfatter"i) (0 ("<čálli>"i));



# gonagas 0 = konge, 1 = kong
SELECT ("kong"i) (0 ("<gonagas>"i) LINK 1 sem_mal) ;
# Konge Harald => Kong Harald
SELECT:fallback ("konge"i) (0 ("<gonagas>"i));


# johtu 0 = fart, 1 = bevegelse, 2 = gang
SELECT ("gang"i) (0 ("<johtu>"i) LINK 0 ill) ;
# til farten => i gang
SELECT:fallback ("fart"i) (0 ("<johtu>"i));

# oktavuohta 0 = kontakt, 1 = henvendelse, 2 = forbindelse, 3 = sammenheng
SELECT ("forbindelse"i) (0 ("<oktavuohta>"i) LINK 1 (sg loc)) ;
SELECT ("forbindelse"i) (0 ("<oktavuohta>"i @←ADVL sg)) ;
# dan oktavuođas go => i den forbindelse når
SELECT ("sammenheng"i) (0 ("<oktavuohta>"i) LINK 1 (pl loc)) ;
# máŋgga oktavuođas => i mange sammenhenger
# máŋggain oktavuođain => i mange sammenhenger
SELECT:fallback ("kontakt"i) (0 ("<oktavuohta>"i));

SELECT ("folk") (0 ("<olmmoš>"i) LINK 0 pl) ;
# olbmot leat čoagganan => folk har samlet seg

SELECT ("husdyr"i) IF (0 ("<šibit>"i)) ;

# soadji 0 = vinge, 1 = skovl, 2 = fløy, 3 = erme
SELECT ("fløy"i) (0 ("<soadji>")) (0* sem_org);
# Bellodaga radikála soajis bođii garra proteasta.

SELECT ("erme"i) (0 ("<soadji>"i)) (0* sem_clth);
# Mu báiddi soajis lea ráigi.
SELECT:fallback ("vinge"i) (0 ("<soadji>"i));

# searvi 0 = forening, 1 = selskap
SELECT ("forening"i) (0 ("<searvi>"i))(-1 ("<sápmi>"i));
SELECT:fallback ("forening"i) (0 ("<searvi>"i));

# stuibmi 0 = bråk, 1 = konflikt
SELECT ("bråk"i) (0 ("<stuibmi>"i) LINK -1 prop) ;
SELECT:fallback ("bråk"i) (0 ("<stuibmi>"i));

# goddi 0 = komite, 1 = villrein
#SELECT ("goddi") ("goddi:1") ("goddi") (NOT 0/1 (*)) ;
SELECT:fallback ("komite"i) (0 ("<goddi>"i));

# diehtu 0 = informasjon, 1 = kunnskap, 2 = viten, 3 = beskjed
SELECT ("beskjed"i) (0 ("<diehtu>"i) LINK 0 nom OR acc) (*0 ("<mobiilatelefuvdna>"i) OR ("<mobiila>"i)) ;
SELECT ("beskjed"i) (0 ("<diehtu>"i) LINK 0 acc)(*0 ("<sáddet>"i) OR ("<čállit>"i) OR ("<lohkat>"i)) ;
## Lihkus juste de civkkádii mobiltelefuvnnas sutnje diehtu.
## Lei Ájlin gii sáddii dieđu.
SELECT:fallback ("informasjon"i) (0 ("<diehtu>"i));

# lávki 0 = skritt, 1 = løk
SELECT ("løk"i) (0 ("<lávki>"i))  (*1 ("<leat>"i) LINK 0 VFIN LINK *1 ("<čuohppat>"i) OR ("<čuohpadit>"i) LINK 0 prfprc) ;
## 	Danne go 	lávki 	lea antiseptalaš , de dat veahkeha go lea čuohpadan , gaskkahallan dahje go leat nárážat .
##  Lilja 	lávkkit 	vuovdit !
SELECT ("skritt"i) (0 ("<lávki>"i)) ;
## Sámi vuođđoskuvlaoahpaheaddjioahpu láhkaásahus lea 	lávkin 	dan guvlui , mainna sámiid iešmearrideapmi dahkko duohtan ja čalmmustahttojuvvo Norggas ja eará Davviriikkain .
## Joavkku bealis deattuhuvvo ahte raporta lea vuosttaš 	lávki 	stuorát ovddidanbarggus .
SELECT:fallback ("skritt"i) (0 ("<lávki>"i));


# gorka 0 = kork (badekar, flaske etc.), 1 = dupp, 2 = kjeft
SELECT ("kjeft"i) (0 ("<gorka>"i) OR ("<goarka>"i))  (*-1 ("<doallat>"i))(*1 ("<gitta>"i)) ;
## 	Go ain rádjá ja garruda, de Vállán meron rogáda: «Doala gorkkat gitta!» Gohčui orrut jaska billa vuolin.
SELECT ("kjeft"i) (0 ("<gorka>"i) OR ("<goarka>"i))  (-1 ("<gallji>"i)) ;
## Mannan ija don leat mu buoremus vuojána gaikkodan , biro , beargalat , helveha sáhtánas , galjes 	gorka 	, guhkes bátni !
#SELECT ("kjeft"i) (0 ("<gorka>"i))  (-1 (Sem/Hum) LINK 0 Gen) ;
#SEMTAG rule: Hum
SELECT ("dupp"i) (0 ("<gorka>"i) OR ("<goarka>"i)) (*-1 ("<siibma>"i)) ;
##	Siimma giddejedje erenoamáš 	korkii.
#SEMTAG rule: Tool-catch
	SELECT ("kork"i) (0 ("<gorka>"i) OR ("<goarka>"i)) ;
## Son sruvii 	goarkka 	boahtalii ja rájai loahpa boahtte háve várás . - kork.
## Olmmoš oppaáigge guoraha 	goarkkaid 	čázis.
SELECT:fallback ("kork"i) (0 ("<gorka>"i));

# johtolat 0 = trafikk, 1 = flyttevei
SELECT ("trafikk"i) (0 ("<johtolat>"i) LINK NOT 0 pl)(-1 ("<ollu>"i) OR ("<eanet>"i));
## 1938 rádjái lei Porsáŋggu-Kárášjoga máđija ráigge eanemus 	johtolat 	, go Kárášjoga ja Suoma gaskka vudje eanas dálvet , muhto maŋŋel go Kárášjohgeaidnu gárvánii.
SELECT ("flyttevei"i) (0 ("<johtolat>"i) LINK 0 pl) ;
## 	Ii leat dasto čielggas ledje go dát vuotnasápmelaččat dalle juo álggahan guhkit 	johtolagaid.
SELECT ("flyttevei"i) (0 ("<johtolat>"i)) ;
## Oallugat deattuhedje man deaŧalaš 	johtolat 	lei boazodollui . ???
## Dákkár johtin ja 	johtolat 	gaskal dálveorohagaid siseatnamis ja geasseorohagaid mearragátteváriin lea ekologalaš heiveheapmi mii gottiin lei ja masa boazobargi lea iežas eallima heivehan .
## lea šaddan nu ahte hámmandilálašvuođat ja guollebivdohámmana guovddáš sajádat riddoruvttu985 johtolaga ektui lea deaŧalaččat go lagamus 	johtolat 	guollebáikái .
SELECT:fallback ("trafikk"i) (0 ("<johtolat>"i));


# vealgi 0 = gjeld, 1 = lån
SELECT ("lån"i) (0 ("<vealgi>"i) LINK 0 pl)(*-1 ("<dárbbašit>"i)) ;
## Gáivuona suohkan áigo nannet ruhtadeamiid dakkár biergasiidda , jos olbmot dárbbašit 	velggiid 	go galget ruhtadit oastimiid .
SELECT ("lån"i) (0 ("<vealgi>"i) LINK 0 pl)(*1 ("<guhkesáiggivealgi>"i)) ;
## Dat 	vealgi 	lea guhkesáiggivealgi , nu ahte dat gal mákso dál ruovttoluotta nu movt galgá .
## Fylkkagieldda guhkesáiggi 	vealgi 	lea lassánan 289,3 miljovnnain ruvnnuin 2009 rájes 2010 rádjái .
## Vealggit lassánedje sullii 8 mill kr , mas oanehisáiggi 	vealgi 	lassánii sullii 4 mill kr.
## Mii mihtidit likviditehta go geahččat differánssa gaskal johtoomiid ( kássa // báŋkui sisabidju ja oanehisáigge bearramat ) ja oanehisáigge 	velggiid 	, man gohčoda bargokapitálan .
SELECT:fallback ("gjeld"i) (0 ("<vealgi>"i));

# goansta 0 = kunst, 1 = triks, 2 = ferdighet, 3 = påfunn

SELECT ("påfunn"i) (0 ("<goansta>"i))(-1 ("<buorre>"i)) ;
## Juste dál hálidivččet atnit eambbo áiggi iežat guoibmái , muhto dat liikká ii leat nu buorre 	goansta.
## Ii lean várra šat nu buorre 	goansta 	vuodjit , go eaiggát lei sihkkarit lensmánnái dieđihan .  ---påfunn

SELECT ("ferdighet"i) (0 ("<goansta>"i) LINK 0 pl)(*-1 ("<ieš>"i)) ;
## Fuobmájin iežan 	goansttaid 	ja álgen hárjehallat viesus .

SELECT ("triks"i) (0 ("<goansta>"i))(*-1 ("<fuobmát>"i) OR ("<dahkat>"i)) ;
## Áltálaš Jon Røkenes lea fuobmán álkit 	goansttaid 	ráhkadit dola . ---triks (måtene)
## De jearrá rieban bussás : – Galle 	goanstta 	leat dus ?
## Muhto go son manná vuostebiggii , dahje go son diehtá , gosa dan báikkis háliida boazu , de son manná ja guldala ja dainna 	goansttain 	gávdná ealu .
## Filbmemis dahket ollu 	goansttaid 	, nugohčoduvvon filmtriks ja muhtomin eai sáhte diktit neavttáriid neaktit jus ballet sin lápmahuvvat .

SELECT ("kunst"i) (0 ("<goansta>"i)) ;
## Dalle ii leat mihkke ge 	goansttaid 	jeakki rasttildit . (maybe translated in singular?)
## – Rektor doppe lei hui mielas ja oahpaheaddjit maiddái , ja go álggiimet hupmat dan birra , de ii orron goanstage 	.
SELECT:fallback ("kunst"i) (0 ("<goansta>"i));

# jietna 0 = stemme, 1 = lyd

SELECT ("lyd"i) (0 ("<jietna>"i))(1 cc OR COMMA LINK 1 ("<govva>"i)) ;
## Ođđaáigásaš servodagas lea dárbbašlaš máhttit hálddašit iešguđet mediaid ja teavsttaid main leat ollu iešguđetlágan oasit biddjon oktii , nugo čála , 	jietna 	ja govva ja seammás oaidnit oktavuođaid giela ja árbemáhtu gaskkas .
## Multifunkšunála oahpponeavvuin sáhttet leat olu iešguđetlágán komponeanttat ja heivehuvvon oasit, nugo jienat, govat ja teavsttat , eaige dat dárbbaš leat dušše ovtta vásedin ulbmila váste ráhkaduvvon .
SELECT ("lyd"i) (0 ("<jietna>"i))(-1 gen LINK 0 ("<luondu>"i) OR ("<skuter>"i));
## Go gullá luonddu jienaid, go oaidná - de sáhttá maid bidjat sániid sihke jienaide ja dasa maid oaidná luonddus .
#Sem/Plc OR Sem/Veh

SELECT ("lyd"i) (0 ("<jietna>"i))(-1 ("<geaidut>"i) OR ("<ráhkadit>"i));
## Skutera 	jietna 	juoga sajis gullo .
## Nils Petter Molvær geaidu 	jienaid 	iežas trompehtain .
## Eará ii ávkkut , nugo čuoikabalddonasat mat ráhkadit jiena, lohká divredutki Preben Ottesen .
## De soai gullaba issoras ártegis 	jiena 	.

SELECT ("stemme"i) (0 ("<jietna>"i));
## - Sámediggi cealká earret eará ahte dat stuora erohusat mat leat dan ektui galle 	jiena 	leat juohke áirasa duohken geanohuhttet Sámedikki lobálašvuođa sihke sámi servodagas ja eará eisseválddiid ektui .
## ( 1 ) Jus jienasteaddji ii goastta válgalatnjii , de sáhttá son addit 	jiena 	guovtti jietnavuostáváldái dastán válgalanja olggobealde .
SELECT:fallback ("stemme"i) (0 ("<jietna>"i));


# vuoján 0 = kjøretøy, 1 = kjørerein

LIST VUOJAN-ANI-WORDS = ("<čearpmat>"i) ("<varit>"i) ("<vuoitit>"i) ("<boazu>"i) ("<gabba>"i) ("<reahka>"i) ("<juovlanigá>"i) ("<juovlastállu>"i) ("<heargi>"i) ("<sprinta>"i) ("<eallu>"i) ("<SHL-#máilmmicup"i) ("<reahkavuodjin>"i) ("<gonagasgilvu>"i) ("<SVL-hearge#cup>"i) ("<heargevuodjingilvu>"i) ;
#possibly semantic category Ani-reindeer usefull?
LIST VUOJAN-ANI-ADJ = ("<sávri>"i) ("<buorre>"i) ("<sápmi>"i) ("<falli>"i) ("<nuorra>"i) ("<beakkán>"i) ;
LIST VUOJAN-ANI-V = ("<biebmat>"i) ("<hárjehahttit>"i) ("<njuovvat>"i) ("<ruohttat>"i) ("<vuoitit>"i);

SELECT ("kjørerein"i) (0 ("<vuoján>"i))(*0 VUOJAN-ANI-WORDS OR VUOJAN-ANI-V) ;
SELECT ("kjørerein"i) (0 ("<vuoján>"i) LINK 0 ess) ;
SELECT ("kjørerein"i) (0 ("<vuoján>"i)) (-1 VUOJAN-ANI-ADJ + attr) ;
## Bikko Máhte luohti lea dovddus Sančuari hámis “ Stállangazza ” , mii lei beakkán vuoján 	Bikko Máhtes . #disambiguation rule needs to fix beakkán analysis
## Dat lei erenoamáš fales vuoján , dadjá Eira , dan botta go njuovvá iežas 	vuojána 	máid massii .
SELECT ("kjørerein"i) (0 ("<vuoján>"i))(1 COMMA LINK 1 ("«^.*"r));
## Vuosttaš máilmmiolahus John Inge Eiras dán dálvvi iežas vuojániin, «Limoin».
## Máhtte Niillas Gaup 	vuoján 	Ieš vuittii reahkavuodjima ja Máret Áile Sara vuoján Dolgii vuittii ges sabetvuodjimiid Sámi Grand Prix gilvvuin  beassášlávvordaga Guovdageainnus .
## Nils Henrik Eira 	vuojániin 	Summitiin , mas lei buoremus áigi olles gilvvuin ja oaččui ge Máze Gilisearvvis dan ovddas  dan stuorámus pokála .
## Sara vuot čájehii ahte son lea okta Sámi buoremus vuddjiin ja sus leat buorre 	vuoján, go mannan vahkkoloahpa vuittii SVL-heargecupa maŋemus vuodjima Mázes .
## Dát ledje várra 	vuojánat 	ja geahččobohccot .
## Ámtta 1866-70 viđajagidieđáhusas muitaluvvo boazodoalu birra ahte riddosuohkaniin ledje olbmuin bohccot 	vuojánin 	, dahje mearrasápmelaččat ledje árben bohccuid boazosáminieiddaiguin náitalemiid bokte .
SELECT ("kjøretøy"i) (0 ("<vuoján>"i));
## Guhkes gaskkaid ii leat gánnáhahtti dákkar 	vuojániiguin 	vuodjit .  - fartøy
## Diesel 	vuojánat 	main ollislaš deaddu lea 3500 gilus gitta 12000 gilui 990,- ru. .
## Njealjejuvllat 	vuoján 	roasmmohuvai vehá .
## Registrerekeahtes 	vuojániid 	lea muđui váttis doalvut tuollu meattá , Nieminen muitala .
## – Dát lei baicce somá , láhttestii Vicky Tauli-Corpus , ja leaikkastalai go lei sihke beassan vuodjit Juovlastálu 	vuojániin 	ja borrat bohccobierggu . ???
SELECT:fallback ("kjøretøy"i) (0 ("<vuoján>"i));


# bárti 0 = problem, 1 = uhell, 2 = skade, 3 = ulykke

SELECT ("skade"i) (0 ("<bárti>"i))(-1 ("<dagahit>"i)) ;
## Dálki lei ge ikte nu garas Finnmárkkus ahte dagahii 	bárttiid 	.  --- skapte skader

SELECT ("uhell"i) (0 ("<bárti>"i))(-1 ("<oalle>"i)) ;
## - Lei oalle 	bárti 	mus odne , go láhppen ruhtaburssa vuovdái , ja dál ii leat ruhtabinná ge .  -- uhell


SELECT:fallback ("problem"i) (0 ("<bárti>"i));
## Ollu fierbmeguolásteaddjit erenoamážit Nuorta-Finnmárkkus leat gártan stuorra 	bárttiide 	go gonagasreabbá lea darvánan guollefirpmiide .  -- problemer
## Dasa lassin čatnasa stuorit riska 	bárttiide 	, roasmmuhuvvamiidda ja lihkuhisvuođaide alkohola návddašemiin . -- ulykke
## Porsáŋggu suohkanis leat ovdal leamaš 	bárttit 	go olbmot eai mávsse rehkegiid suohkanii rievttes áigái .  - problemer
## Gilvaleaddjit lávejit vaikko makkár 	bárttiid 	vásihit go leat mátkkis , muhto dábálaččat dat gal manná bures .
## Olu vuoddjit leat vásihan ahte sii leat vajálduhttán juste dan mii dalle adnui go sii bohte 	bárttiid 	sisa , vaikko lei geahččalan ráhkkanit nu bures go vejolaš . - havner i problemer
## – Mus lea seamma 	bárti 	, viessu ii oba lieggange .  - problem
## – Mis lea dávjá 	bárti 	gávdnat rievttes viesu dušše čujuhusa vuođul .  -- problem
## Son lávii hui dávjá iežas dagahit 	bárttiid 	sisa , iešguđetlágan bárttiid sisa , muhto dábálaččat dat manai bures loahpas . -- uheldige situasjoner
## Danin sáhttá stuorit vejolašvuohta leat boahtit 	bárttiid 	sisa , lohká Buljo .  -- havne i problemer



# riekkis 0 = sirkel Geom and Org, 1 = dekk Obj

SELECT ("dekk"i) (0 ("<riekkis>"i))(1 cc LINK 1 ("<juvla>")) ;
SELECT ("dekk"i) (0 ("<riekkis>"i))(-1 ("<biila>") LINK 0 gen) ;	# Sem/Veh instead of biila
## Iskka iežat biilla ovdal go vuoddját gosage , earenoamžiid 	rieggáid 	dahje juvllaid . (Sem/Obj)
## Dalle sii masset vejolašvuođa Sámi bargguid ektui ja 	riekkis 	giddana Sámi guvlui máhccamis , Riitta Orti-Berg ( 41 ) máinnaša .
## – Oainnát , piikkat leat darvánan ja hárjánan vissis guvlui jorrat ja jus bidjá 	rieggá 	jorrat nuppe guvlui , de čolgada eret daid piikkaid .

SELECT ("sirkel"i) (0 ("<riekkis>"i)) ;
## Jose Moncada álggahii kurssa nu go álgoálbmogat dávjá dahket , ahte čuožžut 	riekkisin 	, ja nu ovttastahttit fámuid ja dagahit oktavuođa .
## Álggos galgá ráhkadit stuora 	rieggá 	muohttagii . (Sem/Geom)
## Sámi váhnemiid 	rieggá 	ulbmilin lea , maid sii ieža , mo sii ieža háliidit ja mat vejolašvuođaid sis lea ovddidit ja loktet sápmelaš kultuvrra ieža .  (Sem/Org)
## Álggos ráhkadii Mihkkal hui unna 	rieggáža 	, ja dan olggobeallái fas veaháš stuorit rieggá .
## OVTTAS : Ruošša álgoálbmotguossit bovdejedje gaskan konseartta olbmuid šilljui dánsut 	rieggás 	.
## Oválavuodjima loahppavuorus golbma falimusa vulget oktanaga čáhcebána ala ja vudjet vihtta 	rieggá 	boijaid birra .
SELECT:fallback ("sirkel"i) (0 ("<riekkis>"i));

SELECT:lang-speakers (".*talende"ri) (0 ("<.*giella>"ri) + n + pl) ;
# not sure about this analysis, but it does give nicer translations


# Nouns that were all 0-marked in the dix:
SELECT:fallback ("energi"i) (0 ("<arva>"i));
SELECT:fallback ("øre"i) (0 ("<beallji>"i));
SELECT:fallback ("nektelse"i) (0 ("<biehttalus>"i));
SELECT:fallback ("miljø"i) (0 ("<biras>"i));
SELECT:fallback ("jakt"i) (0 ("<bivdu>"i));
SELECT:fallback ("bro"i) (0 ("<boarri>"i));
SELECT:fallback ("kant"i) (0 ("<borri>"i));
SELECT:fallback ("spiser"i) (0 ("<borri>"i));
SELECT:fallback ("erstatning"i) (0 ("<buhtadas>"i));
SELECT:fallback ("kulde"i) (0 ("<buolaš>"i));
SELECT:fallback ("gutt"i) (0 ("<bárdni>"i));
SELECT:fallback ("trinn"i) (0 ("<ceahkki>"i));
SELECT:fallback ("vekt"i) (0 ("<deatta>"i));
SELECT:fallback ("forhold"i) (0 ("<dilli>"i));
SELECT:fallback ("oppgave"i) (0 ("<doaibma>"i));
SELECT:fallback ("lege"i) (0 ("<doavttir>"i));
SELECT:fallback ("bål"i) (0 ("<dolla>"i));
SELECT:fallback ("håndarbeid"i) (0 ("<duodji>"i));
SELECT:fallback ("ønske"i) (0 ("<dáhttu>"i));
SELECT:fallback ("ønsker"i) (0 ("<dáhttu>"i));
SELECT:fallback ("hus"i) (0 ("<dállu>"i));
SELECT:fallback ("behov"i) (0 ("<dárbbaš>"i));
SELECT:fallback ("eiendel"i) (0 ("<dávvir>"i));
SELECT:fallback ("norsk"i) (0 ("<dáčča>"i));
SELECT:fallback ("flokk"i) (0 ("<eallu>"i));
SELECT:fallback ("næring"i) (0 ("<ealáhus>"i));
SELECT:fallback ("hustru"i) (0 ("<eamit>"i));
SELECT:fallback ("makt"i) (0 ("<fápmu>"i));
SELECT:fallback ("skall"i) (0 ("<garra>"i));
SELECT:fallback ("mellomrom"i) (0 ("<gaska>"i));
SELECT:fallback ("negl"i) (0 ("<gazza>"i));
SELECT:fallback ("lettelse"i) (0 ("<geahpádus>"i));
SELECT:fallback ("gang"i) (0 ("<geardi>"i));
SELECT:fallback ("eng"i) (0 ("<gieddi>"i));
SELECT:fallback ("hånd"i) (0 ("<giehta>"i));
SELECT:fallback ("fly"i) (0 ("<girdi>"i));
SELECT:fallback ("kamerat"i) (0 ("<guoibmi>"i));
SELECT:fallback ("sentrum"i) (0 ("<guovddáš>"i));
SELECT:fallback ("tak"i) (0 ("<gáhttu>"i));
SELECT:fallback ("navnebror"i) (0 ("<gáibmi>"i));
SELECT:fallback ("vare"i) (0 ("<gálvu>"i));
SELECT:fallback ("gjerde"i) (0 ("<gárdi>"i));
SELECT:fallback ("kasse"i) (0 ("<gássa>"i));
SELECT:fallback ("butikk"i) (0 ("<gávpi>"i));
SELECT:fallback ("herre"i) (0 ("<hearrá>"i));
SELECT:fallback ("stas"i) (0 ("<hearva>"i));
SELECT:fallback ("vestsame"i) (0 ("<hoammá>"i));
SELECT:fallback ("bøy"i) (0 ("<hállan>"i));
SELECT:fallback ("kjæreste"i) (0 ("<irgi>"i));
SELECT:fallback ("ektemann"i) (0 ("<isit>"i));
SELECT:fallback ("forstand"i) (0 ("<jierbmi>"i));
SELECT:fallback ("elv"i) (0 ("<johka>"i));
SELECT:fallback ("trafikant"i) (0 ("<johtaleaddji>"i));
SELECT:fallback ("elvebredd"i) (0 ("<jávregáttis>"i));
SELECT:fallback ("medlem"i) (0 ("<lahttu>"i));
SELECT:fallback ("rom"i) (0 ("<latnja>"i));
SELECT:fallback ("enke"i) (0 ("<leaska>"i));
SELECT:fallback ("rørelse"i) (0 ("<lihkadus>"i));
SELECT:fallback ("studie"i) (0 ("<lohkan>"i));
SELECT:fallback ("tall"i) (0 ("<lohku>"i));
SELECT:fallback ("spor"i) (0 ("<luodda>"i));
SELECT:fallback ("geværpatron"i) (0 ("<ládda>"i));
SELECT:fallback ("garn"i) (0 ("<láigi>"i));
SELECT:fallback ("glass"i) (0 ("<láse>"i));
SELECT:fallback ("haug"i) (0 ("<látna>"i));
SELECT:fallback ("venn"i) (0 ("<lávvi>"i));
SELECT:fallback ("mark"i) (0 ("<meahcci>"i));
SELECT:fallback ("betydning"i) (0 ("<mearkkašupmi>"i));
SELECT:fallback ("mål"i) (0 ("<mearri>"i));
SELECT:fallback ("følgeskriv"i) (0 ("<mielddus>"i));
SELECT:fallback ("mål"i) (0 ("<mihttu>"i));
SELECT:fallback ("mål"i) (0 ("<moalla>"i));
SELECT:fallback ("smule"i) (0 ("<moallu>"i));
SELECT:fallback ("vrede"i) (0 ("<moarri>"i));
SELECT:fallback ("rot"i) (0 ("<moivi>"i));
SELECT:fallback ("minne"i) (0 ("<muitu>"i));
SELECT:fallback ("mold"i) (0 ("<muolda>"i));
SELECT:fallback ("tre"i) (0 ("<muorra>"i));
SELECT:fallback ("betaling"i) (0 ("<máksu>"i));
SELECT:fallback ("suppe"i) (0 ("<mális>"i));
SELECT:fallback ("mønster"i) (0 ("<málle>"i));
SELECT:fallback ("skaft"i) (0 ("<nađđa>"i));
SELECT:fallback ("tet"i) (0 ("<njunuš>"i));
SELECT:fallback ("grunne"i) (0 ("<njuorra>"i));
SELECT:fallback ("østlending"i) (0 ("<nuortalaš>"i));
SELECT:fallback ("skinn"i) (0 ("<náhkki>"i));
SELECT:fallback ("utdanning"i) (0 ("<oahppu>"i));
SELECT:fallback ("eie"i) (0 ("<oamastus>"i));
SELECT:fallback ("del"i) (0 ("<oassi>"i));
SELECT:fallback ("medvirkende"i) (0 ("<oasálaš>"i));
SELECT:fallback ("mann"i) (0 ("<olmmái>"i));
SELECT:fallback ("ordning"i) (0 ("<ortnet>"i));
SELECT:fallback ("representant"i) (0 ("<ovddasteaddji>"i));
SELECT:fallback ("rett"i) (0 ("<riekti>"i));
SELECT:fallback ("komma"i) (0 ("<rihkku>"i));
SELECT:fallback ("trette"i) (0 ("<riidu>"i));
SELECT:fallback ("rike"i) (0 ("<riika>"i));
SELECT:fallback ("landsforening"i) (0 ("<riikkasearvi>"i));
SELECT:fallback ("fyrstikk"i) (0 ("<rišša>"i));
SELECT:fallback ("skvett"i) (0 ("<rišša>"i));
SELECT:fallback ("rulle"i) (0 ("<rulla>"i));
SELECT:fallback ("trekubbe"i) (0 ("<ráddi>"i));
SELECT:fallback ("gras"i) (0 ("<rássi>"i));
SELECT:fallback ("agn"i) (0 ("<seakti>"i));
SELECT:fallback ("frø"i) (0 ("<siepman>"i));
SELECT:fallback ("hjem"i) (0 ("<siida>"i));
SELECT:fallback ("grunn"i) (0 ("<sivva>"i));
SELECT:fallback ("trekk"i) (0 ("<skoađas>"i));
SELECT:fallback ("blankett"i) (0 ("<skovvi>"i));
SELECT:fallback ("gris"i) (0 ("<spiidni>"i));
SELECT:fallback ("leke"i) (0 ("<stoagus>"i));
SELECT:fallback ("ly"i) (0 ("<suodji>"i));
SELECT:fallback ("dialekt"i) (0 ("<suopman>"i));
SELECT:fallback ("forgreining"i) (0 ("<suorgi>"i));
SELECT:fallback ("preken"i) (0 ("<sárdni>"i));
SELECT:fallback ("venn"i) (0 ("<ustit>"i));
SELECT:fallback ("hundeflokk"i) (0 ("<valvi>"i));
SELECT:fallback ("hefte"i) (0 ("<veahtu>"i));
SELECT:fallback ("lignelse"i) (0 ("<veardádus>"i));
SELECT:fallback ("skatt"i) (0 ("<vearru>"i));
SELECT:fallback ("skikk"i) (0 ("<vierru>"i));
SELECT:fallback ("stilling"i) (0 ("<virgi>"i));
SELECT:fallback ("hus"i) (0 ("<visti>"i));
SELECT:fallback ("smør"i) (0 ("<vuodja>"i));
SELECT:fallback ("angel"i) (0 ("<vuogga>"i));
SELECT:fallback ("måte"i) (0 ("<vuohki>"i));
SELECT:fallback ("styrke"i) (0 ("<vuoibmi>"i));
SELECT:fallback ("seier"i) (0 ("<vuoitu>"i));
SELECT:fallback ("rekreasjon"i) (0 ("<vuoiŋŋasteapmi>"i));
SELECT:fallback ("tur"i) (0 ("<vuorru>"i));
SELECT:fallback ("grunn"i) (0 ("<vuođđu>"i));
SELECT:fallback ("skade"i) (0 ("<váddu>"i));
SELECT:fallback ("påvirkning"i) (0 ("<váikkuhus>"i));
SELECT:fallback ("mangel"i) (0 ("<váili>"i));
SELECT:fallback ("besvær"i) (0 ("<váivi>"i));
SELECT:fallback ("fullmakt"i) (0 ("<váldi>"i));
SELECT:fallback ("pågriper"i) (0 ("<váldi>"i));
SELECT:fallback ("taker"i) (0 ("<váldi>"i));
SELECT:fallback ("advarsel"i) (0 ("<várrehus>"i));
SELECT:fallback ("hustru"i) (0 ("<áhkká>"i));
SELECT:fallback ("frist"i) (0 ("<áigemearri>"i));
SELECT:fallback ("embete"i) (0 ("<ámmát>"i));
SELECT:fallback ("tanke"i) (0 ("<árvalus>"i));
SELECT:fallback ("hjørne"i) (0 ("<čiehka>"i));
SELECT:fallback ("pynt"i) (0 ("<čikŋa>"i));
SELECT:fallback ("møte"i) (0 ("<čoahkkin>"i));
SELECT:fallback ("oppsummering"i) (0 ("<čoahkkáigeassu>"i));
SELECT:fallback ("topp"i) (0 ("<čohkka>"i));
SELECT:fallback ("poeng"i) (0 ("<čuokkis>"i));
SELECT:fallback ("notat"i) (0 ("<čálus>"i));
SELECT:fallback ("slag"i) (0 ("<šládja>"i));
SELECT:fallback ("surr"i) (0 ("<šurra>"i));

# Based on frequency in parallel text:
SELECT ("áigodat"i) (0 ("<periode>"i));
SELECT ("sameby"i) (0 ("<čearru>"i));
SELECT ("urin"i) (0 ("<gužža>"i)) ;
SELECT ("måned"i) (0 ("<mánnu>"i)) ;
SELECT ("ting"i) (0 ("<diggi>"i)) ;
SELECT ("område"i) (0 ("<guovlu>"i)) ;
SELECT ("grunntanke"i) (0 ("<vuođđojurdda>"i)) ;
SELECT ("slutt"i) (0 ("<loahppa>"i)) ;


# Adpositions → Prepositions
# ==========================
SELECT ("for"i) (0 ("<bealis>"i)) ;
# TODO: can we do "fra NP side" / "for NP del" ?

SELECT ("i henhold til"i) (0 ("<olis>"i)) ;

# Pronouns, relativisers, conjuctions
# ==========================
SELECT ("hvor"i) (0 ("<mii>"i) + @OBJ→) (-1 tv + FMAINV) (1 a) ; # Eadni muitalii man dehálaš dat lei …
SELECT:ge-man ("hvor"i) (0 ("<mii>"i) + @OBJ→) (-1 pcle) (-2 tv + FMAINV) (1 a) ; # mihtidit ge man mávssolaččat sámi aviissat leat …
SELECT ("hva"i) (0 ("<mii>"i) + @OBJ→) (-1 tv + FMAINV) ; # Minsttarplána čilge maid oahppit berrešedje máhttit.
LIST loc/adv = loc adv;
SELECT:test ("hva som"i) (0 ("<mii>"i) + @OBJ→) (*-1 FMAINV BARRIER (*) - loc/adv) ; # Hui hárve boahtá<iv!> ovdan oahppoplánabarggus maid sii gáibidit skuvllas.
SELECT:fuomášit ("hva som"i) (0 ("<mii>"i)) (-1 FMAINV) ;
SELECT:fallback ("som"i) (0 ("<mii>"i)) ;

SELECT:Leimmet-muhtun ("noe"i) (-1 LEAT + pl) ;

SELECT:klokken-tolv-eller-ett ("én"i) (0 ("<okta>"i)) (*-1 ("<diibmu>") BARRIER clb OR v OR adv) ;
SELECT:ett-om-natten ("én"i) (0 ("<okta>"i)) (1 ("<ihkku>")) ;
SELECT:fallback ("en"i) (0 ("<okta>"i)) ;

SELECT:hans-egen ("egen"i) (0 ("<ieš>"i)) (-1 pron + pers + gen) ;
# Dá lea mu iežan girji => Her er min egen bok

SELECT:oss-selv ("selv"i) (0 ("<ieš>"i) + acc) (-1 pron + pers + acc) ;
# eai galgga soardit min iežamet → ikke skal gjøre vondt for oss selv

SELECT:til-meg-selv ("selv"i) (0 ("<ieš>"i) +  ill) (-1 pers + ill) ;
SELECT:på-seg-selv ("seg selv"i) (0 ("<ieš>"i) + ill) (NOT -1 pers + ill) ;

SELECT:skadet-seg-selv ("seg selv"i) (0 ("<ieš>"i) + acc) (NOT -1 pron + pers + acc) (NOT *1 v) ;

LIST ies-px = "de"i "dere"i "du"i "jeg"i "seg"i "vi"i;
SELECT:din ies-px + gen (0 ("<ieš>"i)) (0 Px) ;
# Mun ferten čorget iežan lanja → Jeg må rydde mitt rom
# Váldde biergasiid iežat fárrui → Ta sakene med deg (adpositional genitive turned back into non-genitive in t2x)

SELECT:fallback ("prpers"i) (0 ("<ieš>"i) + acc) ;


# Adverbs
# =======
SELECT:ble-mye-verre ("mye") (0 ("<sakka>") + adv) (-1 a + pass LINK 0 v) ; # vearránii sakka
SELECT ("til") (0 ("<vuhtii>")) (*-1 ("<váldit>")) ;
SELECT ("til rette for") (0 ("<nu>")) (-1 ("<dilálašvuohta>")) (1 ("<ahte>")) ;
SELECT ("så") (0 ("<nu>"i)) (1 a) ; # dat skuvla nu johtil ahte
SELECT:så-langt-som ("så") (0 ("<nu>"i)) (1 adv) (2 cs) ;
SELECT ("slik") (0 ("<nu>"i)) ;     # Ja nu leat sii
SELECT ("fast"i) (0 ("<gitta>"i)) (NOT 1 NP-MEMBER);
SELECT ("til"i) (0 ("<gitta>"i)) ; # looks more like a prep?

SELECT ("bort"i) (0 ("<eret>"i)) (-1 v) ;
SELECT:fallback ("fra"i) (0 ("<eret>"i)) ;
SELECT:fallback ("frå"i) (0 ("<eret>"i)) ;

# Based on frequency in parallel text:
SELECT ("lenger"i) (0 ("<šat>"i)) ;

SELECT ("avsides"i) (0 ("<boaittobealde>"i)) ;

LIST YEAR = ("[0-9][0-9]+"r);
SELECT:year ("høsten"i) (0 ("<čakčat>"i) + adv)    (-1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvet>"i) + adv)  (-1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvit>"i) + adv)  (-1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geasset>"i) + adv) (-1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geassit>"i) + adv) (-1 YEAR) ;
SELECT:year ("våren"i) (0 ("<giđđat>"i) + adv)     (-1 YEAR) ;
SELECT:year ("høsten"i) (0 ("<čakčat>"i) + adv)    (1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvet>"i) + adv)  (1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvit>"i) + adv)  (1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geasset>"i) + adv) (1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geassit>"i) + adv) (1 YEAR) ;
SELECT:year ("våren"i) (0 ("<giđđat>"i) + adv)     (1 YEAR) ;

SELECT ("om høsten"i) (0 ("<čakčat>"i) + adv) ;
SELECT ("om vinteren"i) (0 ("<dálvet>"i) + adv) ;
SELECT ("om vinteren"i) (0 ("<dálvit>"i) + adv) ;
SELECT ("om sommeren"i) (0 ("<geasset>"i) + adv) ;
SELECT ("om sommeren"i) (0 ("<geassit>"i) + adv) ;
SELECT ("om våren"i) (0 ("<giđđat>"i) + adv) ;

# Adjectives
# ==========
SELECT ("vær så god") (0 ("<buorre>"i)) (-1 ("<leat>"i) LINK 0 imprt);

# Sámediggi ja Sámi oahpahusráđđi gárttaiga čilget máŋgii vuođđojurdagiid man vuođul gáibideimmet ollislaš sámi oahppoplána
SELECT ("helhetlig") (0 ("<ollislaš>"i));

SELECT ("hel") (0 ("<ollis>"i)) (1 ("tid"));

SELECT:fallback ("sterk") (0 ("<nanus>"i));

SELECT ("forrige") (0 ("<ovddit>"i comp)) (1 n + sg);

SELECT ("trygg") (0 ("<luohttevaš>"i)) (0 a) (NOT 0 n);
SELECT:fallback ("tillitsfull") (0 ("<luohttevaš>"i));

IFF ("-årig") (0 ("<jahkásaš>"i)) (1 ("<.*skuvla>"ri));

## leage buorre (vær så god)

# buorre:0 → bra, buorre:1→god , så god

LIST IJ-TIME = "<beaivi>" "<eahket>" "<beassážat>" "<juovllat>" ;
SELECT ("god"i) (0 ("<buorre>"i)) (1 IJ-TIME) ;
SELECT ("god"i) (0 ("<buorre>"i)) (1 ("<ođas>"i) LINK 1 ("<jahki>"i)) ;
SELECT ("god"i) (0 ("<buorre>"i)) (1 n);
## Dat lei buorre girji (god)
## Dat lei buorre. (bra)

#REMCOHORT TARGET ("<leat>"i)(0 imprt) (1 ("<buorre>"));


# vissis:0 → sikker, vissis:1 → viss
SELECT ("viss") (0 ("<vissis>"i)) (*1 n BARRIER NOT-A) ;
# muhtun vissis:1 áiggi maŋŋel, doallat viesu rabasin vissis:1 áiggiid
# (vs. mun lean vissis:0 ahte)

SELECT ("samisk"i) (0 ("<sápmi>"i))(0 gen);


# Subjunctions
# ============

SELECT ("at"i) (0 ("<nu ahte>"i)) (-1 ("sørge# for"));
SELECT:fallback ("slik at"i) (0 ("<nu ahte>"i));

SELECT ("når"i) (0 ("<dalle go>"i)) (-1 ("<earret>"i));
SELECT:fallback ("da"i) (0 ("<dalle go>"i));

# Proper nouns
# ============
