# This file is for word sense disambiguation (lexical selection)
# See https://wiki.apertium.org/wiki/Limited_rule-based_lexical_selection

DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>";

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

LIST N = N ;
LIST A = A ;
LIST Adv = Adv ;
LIST V = V ;
LIST Pron = Pron ;

LIST CS = CS ;
LIST CCC = CC ;
SET CC = CCC - ("sihke") ;
SET CC-CS = CC OR CS ;
LIST Po = Po ;
LIST Pr = Pr ;

LIST Pcle = Pcle ;
LIST Num = Num ;
LIST Coll = Coll ;
LIST Actor = Actor ;
LIST G3 = G3 ;
LIST Prop = Prop ;

LIST LEFT = LEFT ;
LIST RIGHT = RIGHT ;
LIST WEB = WEB ;

LIST V* = V* ;

# POS sub-categories
# ------------------

LIST Pers = Pers ;
LIST Dem = Dem ;
LIST Interr = Interr ;

LIST Indef = Indef ;

LIST Recipr = Recipr ;
LIST Refl = Refl ;
LIST Rel = Rel ;
 
LIST Interj = Interj ;
LIST Adp = Adp ;
 

# Morphosyntactic properties
# --------------------------

LIST Nom = Nom ;
LIST Acc = Acc ;

LIST Gen = Gen ;
LIST Ill = Ill ;

LIST Loc = Loc ;
LIST Com = Com ;

LIST Ess = Ess ;

LIST Sg = Sg ;
LIST Pl = Pl ;
LIST Du = Du ;

LIST Cmpnd = Cmpnd ;
 
LIST SgNomCmp = SgNomCmp ;
 
LIST SgGenCmp = SgGenCmp ;

LIST ShCmp = ShCmp ;

LIST PxSg1 = PxSg1 ;
LIST PxSg2 = PxSg2 ;
LIST PxSg3 = PxSg3 ;
 
LIST PxDu1 = PxDu1 ;
LIST PxDu2 = PxDu2 ;
LIST PxDu3 = PxDu3 ;
 
LIST PxPl1 = PxPl1 ;
LIST PxPl2 = PxPl2 ;
LIST PxPl3 = PxPl3 ;

LIST Comp = Comp ;
LIST Superl = Superl ;

LIST Attr = Attr ;
LIST Ord = Ord ;
 
LIST Qst = Qst ;
 
LIST Foc/ge = Foc/ge ;
LIST Foc/gen = Foc/gen ;
LIST Foc/ges = Foc/ges ;
LIST Foc/gis = Foc/gis ;
LIST Foc/naj = Foc/naj ;
LIST Foc/ba = Foc/ba ;
LIST Foc/be = Foc/be ;
LIST Foc/hal = Foc/hal ;
LIST Foc/han = Foc/han ;
LIST Foc/bat = Foc/bat ;
LIST Foc/son = Foc/son ;

LIST IV = IV ;
LIST TV = TV ;

LIST Der_Pass = Der_PassL Der_PassS ;

LIST Prt = Prt;
LIST Prs = Prs ;
 

LIST Ind = Ind ;
LIST Pot = Pot ;
LIST Cond = Cond ;

LIST Imprt = Imprt ;
LIST ImprtII = ImprtII ;

LIST Sg1 = Sg1 ;
LIST Sg2 = Sg2 ;
LIST Sg3 = Sg3 ;

LIST Du1 = Du1 ;
LIST Du2 = Du2 ;
LIST Du3 = Du3 ;

LIST Pl1 = Pl1 ;
LIST Pl2 = Pl2 ;
LIST Pl3 = Pl3 ;

LIST Inf = Inf ;
LIST ConNeg = ConNeg ;
LIST Neg = Neg ;

LIST PrfPrc = PrfPrc ;
LIST VGen = VGen ;

LIST PrsPrc = PrsPrc ;
 

LIST Ger = Ger ;
LIST Sup = Sup ;
LIST Actio = Actio ;

LIST VActor = (Der2 Actor) ;
LIST VAbess = VAbess ;

# Derivation
# ----------

LIST Der_adda = Der_adda ;
LIST Der_ahtti = Der_ahtti ;
LIST Der_alla = Der_alla ;
LIST Der_asti = Der_asti ;
LIST Der_easti = Der_easti ;
LIST Der_d = Der_d ;
LIST Der_eaddji = Der_eaddji ;
LIST Der_eamoš = Der_eamoš ;
LIST Der_amoš = Der_amoš ;
LIST Der_eapmi = Der_eapmi ;
LIST Der_geahtes = Der_geahtes ;
LIST Der_gielat = Der_gielat ;
LIST !better: = !better: ;
LIST Der_NuA = Der_NuA ;

LIST Der_h = Der_h ;
LIST Der_heapmi = Der_heapmi ;
LIST Der_hudda = Der_hudda ;
LIST Der_huhtti = Der_huhtti ;
LIST Der_huvva = Der_huvva ;
LIST Der_halla = Der_halla ;
LIST Der_j = Der_j ;
LIST Der_l = Der_l ;
LIST Der_laš = Der_laš ;
LIST Der_las = Der_las ;
LIST Der_hat = Der_hat ;

LIST Der_meahttun = Der_meahttun ;
LIST Der_muš = Der_muš ;
LIST Der_n = Der_n ;
LIST Der_st = Der_st ;
LIST Der_stuvva = Der_stuvva ;
LIST Der_upmi = Der_upmi ;
LIST Der_supmi = Der_supmi ;
LIST Der_vuohta = Der_vuohta ;
LIST Der_goahti = Der_goahti ;

LIST Der_lágan = Der_lágan ;
LIST Der_lágán = Der_lágán ;
LIST Der_lágaš = Der_lágaš ;
LIST Der_jagáš = Der_jagáš ;
LIST Der_jahkásaš = Der_jahkásaš ;
LIST Der_diibmosaš = Der_diibmosaš ;

LIST Der_Dimin = Der_Dimin ;
LIST Der_viđá = Der_viđá ;
LIST Der_viđi = Der_viđi ;
LIST Der_veara = Der_veara ;
LIST Der_duohke = Der_duohke ;
LIST Der_duohkai = Der_duohkai ;
LIST Der_vuolle = Der_vuolle ;
LIST Der_vuollai = Der_vuollai ;
LIST Der_vuolde = Der_vuolde ;

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
LIST @-F←ADVL = @-F←ADVL ;
LIST @-FADVL→ = @-FADVL→ ;
LIST @-F←SPRED = @-F←SPRED ;
LIST @-F←OPRED = @-F←OPRED ;
LIST @-FSPRED→ = @-FSPRED→ ;
LIST @-FOPRED→ = @-FOPRED→ ;

SET FOBJ = @-F←OBJ OR @-FOBJ→ ; 
SET FMAINV = @-FMAINV OR @+FMAINV ;
SET FAUXV = @-FAUXV OR @+FAUXV ;

LIST @ADVL = @ADVL @ADVL→ @ADVL← @←ADVL @→ADVL @-F←ADVL @-FADVL→ ;
LIST @→ADVL = @→ADVL ;
LIST @ADVL← = @ADVL← ;
LIST @←ADVL = @←ADVL ;
LIST @ADVL→ = @ADVL→ ;

LIST @HAB = @HAB ;
 
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

SET ←OBJ-OTHERS = ←OBJ OR (Gen) OR (Nom) OR (Ess) OR (Loc) OR (Adv) ;
SET OBJ→-OTHERS = OBJ→ OR (Gen) OR (Nom) OR (Ess) OR (Loc) OR (Adv) ;


LIST @X = @X ;

# Semantic tags
# -------------

#LIST Ani = Ani ;
LIST Fem = Fem ;
LIST Mal = Mal ;

LIST Obj = Obj ;
LIST Org = Org ;
LIST Plc = Plc ;

LIST Sur = Sur ;



# Other tags
# ----------

LIST ABBR = ABBR ;
LIST ACR = ACR ;
LIST CLB = CLB ;

LIST QMARK = """ ; # ADD " FOR SYNTAX COLOURING.
LIST PPUNCT = PUNCT ;
SET PUNCT = PPUNCT - QMARK ;


# Single-word sets
# ----------------
 
LIST COMMA = "," ;
LIST ¶ = ¶;

LIST OKTA = "akta" "okta";
LIST go = "go" ;
 

# Initials
# --------

LIST INITIAL = "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m"
        "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
        "á" "æ" "ø" "å" "ö" "ä" ;

LIST CAP-INITIAL = "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M"
        "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
        "Á" "Æ" "Ø" "Å" "Ö" "Ä" ;

# Tag sets
# ========


# Word or not
# -----------
LIST WORD = N A Adv V Pron CS CC Po Pr Interj Pcle Num ABBR ACR  \? ;
 # any word

SET REALWORD = WORD - Num - Ord ;

SET REALWORD-NOTABBR = WORD - Num - Ord - ABBR ;

SET WORD-NOTDE = WORD - ("de") ; 

# Derivational affixes
# --------------------

LIST V-DER = Der_adda Der_alla Der_asti Der_d Der_g Der_h Der_halla Der_hudda Der_huhtti Der_huvva Der_j Der_l Der_ahtti Der_st Der_stuvva Der_goahti ;

LIST N-DER = Der_eaddji Der_Dimin Der_eamoš Der_eapmi Der_heapmi Der_n Der_š Der_muš Der_upmi Der_us Der_vuohta (Der2 Actor) ;
 # Actio ;

LIST A-DER = Der_diibmosaš Der_eaddji Der_geahtes Der_keahtes Der_heapmi Der_lágan Der_laš Der_meahttun Der_lágán (V* A);

LIST A-V = (V* A) ;

SET A-NOT-V = A - A-V ;

LIST Der1 = Der1 ;
LIST Der2 = Der2 ;
LIST Der3 = Der3 ;

SET V-ACT = V - Der_Pass ;

# Case sets
# ---------

LIST ADVLCASE = Ill Loc Com Ess ;
LIST CASE-HALFAGREEMENT = Ill (Sg Loc) (Pl Com) Ess ;
LIST CASE-AGREEMENT = Nom Acc Gen (Pl Ill) Loc Com Ess ;
LIST CASE = Nom Acc Gen Ill Loc Com Ess ;

SET NOT-NOM = CASE - Nom ;
SET NOT-GEN = CASE - Gen ;
SET NOT-ACC = CASE - Acc ;
SET NOT-ACC-GEN = CASE - Acc - Gen ;

# Verb sets
# ---------

# Verbs and their complements
# - - - - - - - - - - - - - -

SET NOT-VERB = WORD - V ;

# Finiteness and mood
# - - - - - - - - - -

SET V-IND-FIN = Prs OR Prt ;
 # Problem: "In boahtán" is an invisible indicative

SET V-MOOD = Ind OR Pot OR Imprt OR ImprtII OR Cond OR (Neg Sup) ;

LIST GC = ("gč") ;

SET VFIN = GC OR V-MOOD - ConNeg ;

SET VFIN-POS = V-MOOD - ConNeg - Neg ;

SET VFIN-NOT-IMP = VFIN - Imprt ;

SET VFIN-NOT-NEG = VFIN - Neg ;
  # this might be to strict, besides, "iige" can be written "ii ge"

SET NOT-PRFPRC = WORD - PrfPrc ;

# Person
# - - - - 

LIST V-SG1 = (V Ind Prs Sg1)  (V Ind Prt Sg1) (V Cond Prs Sg1) 
             (V Cond Prt Sg1) (V Pot Prs Sg1) (V Neg Ind Sg1);
 
LIST V-SG2 = (V Ind Prs Sg2)  (V Ind Prt Sg2) (V Cond Prs Sg2) 
             (V Cond Prt Sg2) (V Pot Prs Sg2) (V Neg Ind Sg2);
 
LIST V-SG3 = (V Ind Prs Sg3)  (V Ind Prt Sg3) (V Cond Prs Sg3) 
             (V Cond Prt Sg3) (V Pot Prs Sg3) (V Neg Ind Sg3);
 
LIST V-DU1 = (V Ind Prs Du1)  (V Ind Prt Du1) (V Cond Prs Du1) 
     	     (V Cond Prt Du1) (V Pot Prs Du1) (V Neg Ind Du1);
 
LIST V-DU2 = (V Ind Prs Du2)  (V Ind Prt Du2) (V Cond Prs Du2) 
	         (V Cond Prt Du2) (V Pot Prs Du2) (V Neg Ind Du2);
 
LIST V-DU3 = (V Ind Prs Du3)  (V Ind Prt Du3) (V Cond Prs Du3) 
	         (V Cond Prt Du3) (V Pot Prs Du3) (V Neg Ind Du3);
 
LIST V-PL1 = (V Ind Prs Pl1)  (V Ind Prt Pl1) (V Cond Prs Pl1) 
             (V Cond Prt Pl1) (V Pot Prs Pl1) (V Neg Ind Pl1);
 
LIST V-PL2 = (V Ind Prs Pl2)  (V Ind Prt Pl2) (V Cond Prs Pl2) 
             (V Cond Prt Pl2) (V Pot Prs Pl2) (V Neg Ind Pl2);
 
LIST V-PL3 = (V Ind Prs Pl3)  (V Ind Prt Pl3) (V Cond Prs Pl3) 
             (V Cond Prt Pl3) (V Pot Prs Pl3) (V Neg Ind Pl3);
 

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
SET V-3  = V-SG3 OR V-DU3 OR V-PL3 ;

# Sets consisting of forms of "leat" (these ones need to be rewritten)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
LIST LEAN = ("leat" V Ind Prs Sg1) ("leat" V PrfPrc);
LIST LEAT = ("leat" V Ind Prs Pl1) ("leat" V Ind Prs Pl3) 
      ("leat" V Ind Prs Sg2) ("leat" V Inf) ("leat" V Ind Prs ConNeg);

LIST LEAT-FIN-NOT-IMP = ("leat" V Ind) ("leat" V Cond) ("leat" V Pot);
 
LIST VPRFPRC = (V PrfPrc) ;
LIST LEATPRFPRC = ("leat" PrfPrc) ;
SET PRC-NOT-LEAT = VPRFPRC - LEATPRFPRC ;
    # In order to distinguish between real leat-constructions and participles of other verbs
LIST HABEO-SG3 = ("leat" Sg3) (V Neg Sg3) ("šaddat" Sg3) ;

LIST HABEO-PL3 = ("leat" Pl3) (V Neg Pl3) ("šaddat" Pl3) ;

SET HABEO-3 = HABEO-SG3 OR HABEO-PL3 ;

# Pronoun sets
# ------------

LIST MUN = (Pron Pers Sg1 Nom);
LIST DON = (Pron Pers Sg2 Nom);
LIST SON = ("son" Pron Pers Sg3 Nom);
LIST MOAI = (Pron Pers Du1 Nom);
LIST DOAI = (Pron Pers Du2 Nom);
LIST SOAI = (Pron Pers Du3 Nom);
LIST MII-PERS = (Pron Pers Pl1 Nom);
LIST DII = (Pron Pers Pl2 Nom);
LIST SII = ("son" Pron Pers Pl3 Nom);

SET PPRON-NOM-NOT-DAT = MUN OR DON OR SON OR MOAI OR DOAI OR SOAI OR MII-PERS OR DII OR SII ;

SET PPRON-NOT-DAT = (Pron Pers) - ("dat") ;

SET PPRON-DU-PL = MOAI OR DOAI OR SOAI OR MII-PERS OR DII OR SII ;
SET PPRON-PL = MII-PERS OR DII OR SII ;

SET PRON-DU = MOAI OR DOAI OR SOAI ;

SET PPRON-NOT-SII = MUN OR DON OR SON OR MOAI OR DOAI OR SOAI OR MII-PERS OR DII ;

LIST PPRON-GEN = (Sg1 Gen) (Sg2 Gen) (Sg3 Gen) (Du1 Gen) (Du2 Gen) (Du3 Gen) 
	(Pl1 Gen) (Pl2 Gen) (Pl3 Gen);

SET PPRON-NOT-GEN = (Pron Pers) - PPRON-GEN ;

LIST DEM-SG = (Pron Dem Sg Nom);
LIST DEM-PL = (Pron Dem Pl Nom);
SET NOT-DEM = WORD - Dem ;

LIST SGPRON = (Pron Sg1) (Pron Sg2) (Pron Sg3) (Pron Sg) (Pron PxSg1) (Pron PxSg2) (Pron PxSg3);
LIST DUPRON = (Pron Du1) (Pron Du2) (Pron Du3)  (Pron PxDu1) (Pron PxDu2) (Pron PxDu3);
LIST PLPRON = (Pron Pl1) (Pron Pl2) (Pron Pl3) (Pron Pl) (Pron PxPl1) (Pron PxPl2) (Pron PxPl3);
LIST DUPRON-NOTPX = (Pron Du1) (Pron Du2) (Pron Du3) ;

SET PRON-NOT-SG = DUPRON OR PLPRON ;

LIST DAT-PRON = "dat" "dát" "diet" "duot" "dot" ;

LIST QUANT-PRON = "ollu" "olu" "unnán" "váháš" "veaháš" "veháš" ;
# This set is for choosing between Adv and Pron Indef.

# Adjectival sets and their complements
# -------------------------------------
SET LEX-A = A - A-DER ;

SET A-CASE = A - Attr - Adv ;

LIST A-CC = A CC ;

SET NOT-ADJ = WORD - A ;
SET NOT-ADJ-COMMA = WORD - A - COMMA ;
SET NOT-Attr = WORD - Attr ;
SET NOT-ADJ-PCLE = WORD - A - Pcle ;
SET NOT-ADJ-CC = WORD - A-CC ;

SET NOT-AA = WORD - A - Adv OR ("maid") ;

LIST NOMINAL-ADJ = "guoktilaš" "lámis" "oasálaš" ("suddu" Der_laš) "viissis";
 
 # and many others
 
# Adverbial sets and their complements
# ------------------------------------
SET LEX-ADV = Adv - (A*) ;

SET NOT-ADV            = WORD - Adv;
SET NOT-ADV-N          = WORD - Adv - N;
SET NOT-ADV-PCLE       = WORD - Adv - Pcle ;
SET NOT-ADV-INDEF      = WORD - Adv - Indef ;
SET NOT-ADV-PCLE-ILL   = WORD - Adv - Pcle - Ill ;
SET NOT-ADV-PCLE-Refl  = WORD - Adv - Pcle - Refl ;
SET NOT-ADV-PCLE-INDEF = WORD - Adv - Pcle - Indef ;
SET NOT-ADV-PCLE-NEG   = WORD - Adv - Pcle - Neg ;
SET NOT-ADVL-PCLE-NEG  = WORD - @ADVL - @P← - Pcle - Neg ;


LIST MO-MANge = "goas" "gokko" "gos" "gosa" "govt" "makkár" "man" "manne" "mo" "mot" "mov" "movt" ("nugo" @CVP) (V Qst);
 
SET MO = MO-MANge - ("man" Foc/ge) ; 
 
 # Introduce finite clauses.
 
LIST PLACE-ADV =  "davábealde" "máttabealde" "nuorttabealde" "oarjebealde" "olggobeale" ;
# There will usually be a Gen in front. 

LIST DOPPE = "badjin" "bajil" "dakko" "dá" "dákko" "dáppe" "diekko" "dieppe" "do" "dokko" "doppe" "duo" "duokko" "duoppe" "olgun" ;
# Adverbs with a locativic form, but don´t get Loc as a tag. 

LIST DOHKO = "bajás" "deike" "diehke" "diehko" "dohko" "duohko" "lulás" "olggos" "ruoktot" "sisa" "vuovdimassii" ;
# Adverbs with a illativic form, but they don´t get Ill as a tag.


# Coordinators
# ------------
SET Foc = Foc/ge  OR Foc/gen  OR Foc/ges  OR Foc/gis  OR Foc/naj OR Foc/ba  OR Foc/be  OR Foc/hal  OR Foc/han  OR Foc/bat OR Foc/son ;

LIST NEGFOC = (Neg Foc/ge) ;

LIST XGO = "dego" "dugo" "nugo" "seammaládjego" "seammaláhkaigo" ;
  # Compounds
LIST SEAMMAX = "seammaládje" "seammaláhkai" "seammaláhkái" ;
  # Those combine with go
  
LIST MADE = "mađe" "mađi" ;
LIST DADE = "dađe" "dađi" ; 
  
SET CRD = COMMA OR CC OR NEGFOC OR XGO OR ("/") OR ("-") OR DADE ;
 
	# coordinators
	
LIST LCRD = @CNP ;
    # local coordinator
LIST GCRD = @CVP ;
    # global coordinator
    
SET CRD2 = (@CNP) OR COMMA OR NEGFOC OR XGO OR ("/") OR ("-") OR DADE ;
    # AFTER LCRD vs. GCRD disambiguation
    


# Sets of elements with common syntactic behaviour
# ================================================

SETS

# Verbs
# -----
# Hmm V*?
SET VERB = V - (V N);
  # V is all readings with a V tag in them, VERB should
            # be the ones without an N tag following the V  
SET VERB-NOT-ACTIO = V - (V N) - Actio ;
            
SET LEX-V = VERB - V-DER;
       # VERB but not V-DER
 
 # The set REALCOPULAS is smaller than COPULAS, made for verbs with PrfPrc complements: Seammás REALCOPULAS son dovdan iežas...
LIST REALCOPULAS = "dáidit" "leahkit" "leat" "soaitit" "veadjit" ;

# The set COPULAS is for predicative constructions
LIST COPULAS = "dáidit" "gártat" "leahkit" "leat" "orrut" "soaitit" "šaddat" "veadjit" ;
 #  "bissut" ?
 # 'Dáidit' can appear without 'leat'.

SET V-NOT-COP = V - COPULAS ;

LIST MOD-ASP = "bállet" "berret" "dáidit" "fertet" "galgat" "gillet" "lávet"  "sáhttit" "seahtit" "soaitit" "viggat" ;

 # Verbs that never have arguments of their own - so we leave out "áigut", for ex.

LIST AUX-OR-MAIN = "áigut" "álgit" "beassat" "galgat" "hálidit" "háliidit" "máhttit" "nagodit" "ollit" "orrut" "sihtat" "veadjit";

 # These verbs can take arguments, so they do not belong in the AUX group, 
 # but they are nevertheless mapped to (@+FAUXV). 
 # Added "álgit" to the group (Lene) - Made rules for "boahtit" which  sometimes can be AUX
 # Magga (1982: 120): áigut, dáidit, deaivat, fertet, galgat, lávet, máhttit, oažžut, sáhttit, soaitit, veadjit - in some of the meanings 
 # Halvhjelpeverb: álgit, berret, dohkket, gártat, heivet, liigut, šaddat - in some of the meanings 
 
SET AUX = COPULAS OR Neg OR MOD-ASP OR AUX-OR-MAIN ;
 

SET V-NOT-AUX = V - AUX ;
 # The set of verbs that cannot be auxiliaries. 
			  # Does not include AUX-OR-MAIN.
SET VFIN-NOT-AUX = VFIN - AUX ;

SET V-MAIN = V - COPULAS - Neg - MOD-ASP OR ("orrut") ;
 
# The set of verbs that can be main verbs. Includes AUX-OR-MAIN.
SET V-DER-PASS = V OR V-DER OR Der_Pass;
  # OR is intersection, this should work
				   # The set is used in one rule with no hits.
LIST V-TRANS = TV (IV Der_ahtti) (IV Der_h) ;
# This is only a tool for making the following sets, bacause of that the symbols (|) and (-) in the set don´t function as one had expected.
SET V-TRANS-ACT = V-TRANS - (TV Der_PassS) - (TV Der_PassL);
 #XXX Never acc-obj for a.l. or actor?
 # All active verbs with a TV tag, including AUX-OR-MAIN.
 
SET V-TRANS-ACT-NOT-AUX = V-TRANS - Der_Pass - AUX ;

SET V-TRANS-ACT-NOT-ACT = V-TRANS - Der_Pass - Der_n - Actio - VActor - PrsPrc - Attr OR (TV Actio Ess) ;

SET V-TRANS-ACT-NOT-ACT-NOT-AUX = V-TRANS - Der_Pass - Der_n - Actio - VActor - AUX OR (Actio Ess) ;


# Sets for verbs choosing oblique objects or adverbials
# - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# This is the list of strictly transitive verbs. In the rules, refer not to STVLIST, but to the set STV defined below.
LIST STVLIST = (IV Der_ahtti) (IV Der_h) "addit" "amašit" "atnit" "ánssášit" "árvalit" "árvidit" "árvvoštallat" "ásahit" "ávžžuhit" "bajidit" "bearrat" "biebmat" "bidjat" "bilidit" "billistit" "bissehit" "bisuhit" "boaldit" "boktit" "borahit" "buhtadit" "buktit" "buoridit" "caggat" "coggalit" "cealkit" "cegget" "čađahit" "čielggadit" "čoaggit" "čoavdit" "čohkket" "čuoččuhit" "čuohppat" "čuovvulit" "čuovvut" "dadjat" "dagahit" "dahkat" "dáhkidit" "dáhttut" "dárbbahit" "dárbbašit" "dárkkistit" "dávistit" "deaivat" "deattuhit" "deavdit" "diehtit" "diktit" "doahttalit" "doaimmahit" "doalahit" "doallat" "doarjut" "dohkkehit" "dovdat" "dovddahit" "duođaštit" "eahpidit" "eaiggáduššat" "eaktudit" "ealáskahttit" "eavttuhit" "evttohit" "fállat" "fidnet" "fievrridit" "fuolahit" "fuomášit" "garvit" "gaskkustit" "gádjut" "gáhttet" "gáibidit" "gáržžidit" "gávdnat" ("gávnnadit" Sg1) ("gávnnadit" Sg2) ("gávnnadit" Sg3) "geahčadit" "geahččat" "geassit" "geatnegahttit" "geavahit" "gieđahallat" "giddet" "goddit" "gohččut" "gohčodit" "gokčat" "gozihit" "guoddalit" "guođđit" "guođohit" "guorahallat" "guorrat" "guoskkahit" "hábmet" "háhkat" "hálddašit" "heaittihit" "heivehit" "hilgut" "ipmirdit" "jođihit" "juksat" "juohkit" "juolludit" "kártet" "lágidit" "láhčit" "láigohit" "loahpahit" "lohpidit" "loktet" "luoikat" "luoikkahit" "luoitit" "massit" "mearkkašit" "mielddisbuktit" "movttiidahttit" "muddet" "muitalit" "muittuhit" "namahit" "nammadit" "namuhit" "nannet" "nanosmahttit" "nuppástuhttit" "oaidnit" "oastit" "oaivvildit" "oamastit" "oažžut" "ođasmahttit" "ođastit" "ollašuhttit" "organiseret" "ovdanbuktit" "ovdánahttit" "ovddastit" "ovddidit" "prioriteret" "ráddjet" "ráđđet" "ráfáidahttit" "ráfáiduhttit" "ráhkadit" "rávvet" "rievdadit" "rihkkut" "sáddet" "seaguhit" "seailluhit" "sihkkarastit" "sihtat" "siskkildit" "sisttisdoallat" "suodjalit" "suovvat" "unnidit" "vahágahttit" "váillahit" "váldit" "válljet" "várret" "vásihit" "váttásmahttit" "viiddidit" "vuhtiiváldit" "vuođđudit" "vuohttit" "vuoitit" "vuojuhit" "vuoruhit" "vuosttaldit" "vuovdit" ;

	# Strictly transitiv-verbs - a start. This set is ment as a help choosing Acc or Gen. Example: "Mun borren eatni kafeás." - there is Gen, no Acc, even if the verb is transitive. That´s why "borrat" is not in this set.
	# These verbs: "addit", "fidnet" and "oažžut" can, when it´s about sex, be without object: "Son oaččui gonagasa bártnis." 

SET STV = STVLIST - Der_Pass ;

	
SET STV-NOT-ACT = STV - (Actio Nom) - (Actio Gen) - (Actio Acc) - (Actio Loc) - (Actio Ill) - (Actio  Com) - VActor ;
	

LIST LOCV = "ávkkástallat" "ballat" "beassat" "beroštit" "biehttalit" "bihtit" "ceavzit" "dinet" "dolkat" "eastadallat" "eastadit" "fuolahit" "fuollat" "geargat" "heaitit" "ilbmat" "jearrat" "luohpat" "máinnašit" "nohkkot" "oassálastit" "spiehkastit" "váruhit" "vástidit" ;

		#Note that "fuolahit" obviously has two homonymous variants: 
		#fuolahit1+Acc, fuolahit2+Loc

LIST COMV = "árvalit" "árvvohuššat" "ávkašuvvat" "bálddalastit" "bártašuvvat" "birgehallat" "birget" "buohtastahttit" "deaivvadit" "gulahallat" "gulaskuddat" "hilbošit" "joatkit" "leaikkastallat" "lohpádaddat" "lohpádallat" "lonuhit" "meannudit" "malssidit" "molssodit" "ovttasbargat" "ovttastahttit" "riidalit" "servvoštallat" "servvoštaddat" "soabadit" "soahpat" "šiehtadallat" "šiehtadit" ;
 
		#Note that "leaikkástallat" has two homonymous variants:
		#leaikkástallat1 (IV), leaikkástallat2+Com

LIST ILLV = "áibbašit" "álgit" "ásaiduvvat" "báitit" "beassat" "čohkkedit" "čujuhit" "čuohcit" "deaivat" "doaškut" "dorvvastit" "došket" "duhtat" "geahččat" "gullat" "guoskat" "gustot" "hárjánit" "heivet" "irggástallat" "jáhkkit" "liikot" "luohttit" "mannat" "máhccat" "mieđihit" "oahpásmuvvat" "oahpásnuvvat" "ollet" "oskut" "riepmat" "ráhkkanit" "soahpat" "searvat" "suhttat" "vástidit" "vuolgit";
 		

LIST TRANSLV = "jápmit" "duššat" "hávkat" "náitalit" "gaskkalduvvat" "nohkat" "goarránit" "heahpanit" "boakčánit" "šlundut" "ráigánit" "vuollánit" "gopmánit" "fuotnánit" "roahppánit" "reakčanit" "bieđganit" "luoddanit" "guvggodit" "liegganit" "suorganit" "báhkkanit" "cuovkanit" "hedjonit" "lohppet" "goikat" "galbmot" "goallut" "ruostut" "buoidut" "guvggodit" "suvrut" "suddat" ;

  # Taken from Helander (2001) p. 89, might be useful in the future as those verbs typically take humans and places in illative case.
  
LIST REKSV = "áibbašit" "deaivat" "dorvvastit" "duhtat" "gustot" "hárjánit" "jáhkkit" "liikot" "mieđihit" "ollet" "ráhkkanit" "soahpat" "searvat" "vuolgit" "beroštit" "biehttalit" "bihtit" "ceavzit" "dinet" "dolkat" "eastadallat" "eastadit" "fuolahit" "fuollat" "geargat" "heaitit" "luohpat" "oassálastit" "váruhit" ;
# This set is for giving infitives @ADVL after the verb.  

LIST ACC-LOCV = "biehttalit" "earuhit" "gieldit" "jearrat" ;

LIST ACC-ILLV = "addit" "bidjat" "mearkkašit";
    # Two-place predicates that take a direct object and an illative adverbial.

LIST MIELDE-V = "addit" "bidjat" "dáidit" "leat" "oastit" "oažžut" "váldit" ;
    # Verbs that take mielde as their complement.

# Son attii girjji mielde.

LIST TIMEADVERBIAL-V = "ádjánit" "ássat" "bargat" "bistit" "bivdit" "eallit" "fievrridit" "guohtut" "joatkit" "láddet" "oahpahit" "ođasmahttit" ;
 
    # Do not take members of the time set as an object
    
LIST TIMEOBJECT-V = "addit" "atnit" "árvalit" "bálvalit"  "čuovvut" "deavdit" "diŋgot" "evttohit" "fátmmastit" "gáibidit" "gávdnat" "geavahit" "gierdat" "guhkidit" "hábmet" "jorgalit" "juolludit" "lasihit" "liigudit" "loahpahit" "loaktit" "markeret" "mearridit" "molsut" "oanidit" "oažžut" "soahpat" "šiehttat" "várret" "viiddidit" ;

    # might take time as an object - verbs which are not members of PLACE-V: 
    
LIST DURATION-V = "ádjánit" "bargat" "bistit" "eallit" "leat" ;

LIST POINT-IN-TIME-V = "árrit" "bissehit" "caggat" "cakkadit" "cakkastallat" "doalahit" "doallat" "duostut" "dustet" "eastadit" "gieldit" "goahcat" "heađuštit" "hehttet" ;

LIST ROUTEADVERBIAL-V = "boahtit" "čuoigat" ;
 
    # bevegelse langsmed noe, innafor et bestemt område   
LIST ROUTEOBJECT-V = "ásahit" "bidjat" "botnjat" "basuhit" "buoridit" "čielggadit" "čuovvulit" "čilget" "čuorvut" "čurvet" "dieđihit" "duođaštit" "duorggastit" "geavahit" "geahpedit" "geahpidit" "gudnejahttit" "guorahallat" "gieđahallat" "guođđit" "gilljut" "heahtit" "huikit" "huikkádit" "juoigat" "lávlut" "lohkat" "loahpahit" "mearridit" "máidnut" "nannet" "njulget" "oahpahit" "ráhkadit" "sivdnidit" "suokkardit" "unnidit" "válmmaštit" "vurket" ;

LIST HAB-VERB = "boahtit" "leat" "goallut" "heaŋgát" "jápmit" ;
	# To be used in habitative-sentences.

# Valency sets
# - - - - - - -

LIST INFV = "astat" "ádjánit" "áigut" "álgit" "ásahit" "bágget" "bávččagit" "beassat" "berret" "bivdit" "bivvat" "bistit" "boahtit" "bovdet" "čohkkát" "čohkkedit" "čohkkánit" "čuoččahit" "čuoččastit" "čuorvut" "čurggodit" ("dadjat" Der_PassL) ("dadjat" Der_PassS) "dagahit" "dáhttut" "dáidit" "dárbbašit" "defineret" "diktit" "doaivut" "doapmat" "duostat" "fertet" "fuobmát" "fuolahit" "galgat" "gáibidit" "gárrut" "gártat" "geahččalit" "geargat" "geatnegahttit" "gierdat" "gillet" "gohččut" "háhppehit" "hálidit" "háliidit" "hárjánit" "heivet" "lávet" "mannat" "máhttit" "máššat" "movttiidahttit" "muitit" "nagodit" "navdit" "oahpahit" "oahppat" "oažžut" "ollet" "ribahit" "riepmat" "sáhttit" "seahtit" "sihtat" "soaitit" "suovvat" "šaddat" "stađđat" "veadjit" "viggat" "viššat" "vuogáiduvvat" "vuolgit" "vuollánit" "vuordit";
 

LIST ACC-INFV = "bivdit" "čuorvut" "dagahit" "diktit" "gohččut" "movttiidahttit" "sihtat" "suovvat" ;

 # These are verbs taking accusative objects and infinitives at the same time;
 
 # a subset of INFV.
	## Ii suova nieiddas náitalit.

LIST OPREDV = "alidit" "atnit" "dadjat" "dahkat" "dulkot" "geavahit" "geahččat" "gohčodit" "gohččut" "meroštallat" "navdit" "váldit" "válljet";

 # Verbs that occur with objects that have secondary predicates.
 
LIST OKTII-V = ("boallu" Der_huvva) "goallostuvvot" "beaškkehat" "bidjat" "čatnat" "suddat" "heivet" "bidjat" "časkit" "geassit" "gullat" "rehkenastit" "ordnet" "soahpat" "gávnnadit" "heivehit" "doaibmat" "iskat" "laktit" "seaguhit";

 # Danger: This list could be too long, in certain respects. 
 # TODO: Think of counter examples, i.e. sentences where we have these verbs, but where oktii is not an adverbial.
 
LIST VGENV = "bassit" "bivdit" "boahtit" "čierrut" "čuoigat" "čuoiggadit" "čuovvut" "fárret" "fitnat" "garrudit" "gálašit" "gállit" "gilljut" "girdit" "johtit" "jorgut" "luoibmat" "mannat" "mátkkoštit" "njahkalit" "njoammut" "riidet" "ruohttat" "sihkkelastit" "soabbut" "šloahtat" "váccašit" "vádjolit" "vájaldit" "vájuldit" "vánddardit" "vázzit" "viehkat" "viežžat" "vuodjat" "vuodjit" "vuojadit" "vuojašit" "vuolgit" "čilget" "čuorvut" "čurvet" "dadjat" "dárostit" "sámástit" "suomastit" "digáštallat" "hállat" "hoallat" "huikit" "hupmat" "juoigat" "lávlut" "logaldallat" "máidnut" "máinnašit" "muitalit" "savkalit" "skierbmut" "vástidit" "njurgut" "veahkehit" "vuoitit" "vuoššat" ;

 
LIST SOURCE-V = "gáibidit" ;

# verbs that need a human locative argument as source. XXX Oahppit sáhttet skuvllas gáibidit eanet veahki. Perhaps ACTOR would be better?
 
# Lexical valency sets
# - - - - - - - - - - -

     
LIST MOVEMENT-V = "ádjit" "beassat" "boahtit" "čuoigat" "čuoiggadit" "čuovvut" "fárret" "finadit" "finihit" "fitnat" "gálašit" "gállit" "girdit" "johtit" "mannat" "mátkkoštit" "njoammut" "ollit" "riidet" "ruohttat" "sáhtostit" "sihkkelastit" "suobbulit" "soabbut" "šloahtat" "váccašit" "vádjolit" "vájaldit" "vájuldit" "vánddardit" "vázzit" "viehkalit" "viehkat" "viežžat" "vuodjalit" "vuodjat" "vuodjit" "vuojadit" "vuojašit" "vuolgit" ;

 # These verbs typically combine with place adverbials in the genitive case @ADVL
 # (i.e. not accusative) I am not sure if the verbs in the second line do that too. They denote movement anyway.
 # These verbs take GEOGRAPHICAL-PLACE in Acc @OBJ.
  
LIST HUMAN-ACTIVITY-V = "bassit" "bealuštit" "beaskidit" "beastit" "bivdit" "boaldit" "botket" "buktit" "buvttadit" "časkit" "čatnat" "čájehit" "čállit" "čoaggit" "čoavdit" "čugget" "čuohppat" "dearvvahit" "deavdit" "devdnet" "dikšut" "divvut" "doarrádallat" "doidit" "dubmet" "duddjot" "duvdilit" "ferdnet" "gáhkket" "gárvodit" "gásttašit" "gávkat" "geahččat" "gilvit" "goarrut" "goddit" "gođđit" "gohččut" "goikadit" "goivet" "gokčat" "gottihit" "guldalit" "guolástit" "hábmet" "hervet" "hoigat" "hoitát" "hukset" "huškut" "juhkat" "juksat" "juogadit" "juohkit" "láibut" "láktadit" "loaiddastit" "luddet" "merket" "mihtidit" "murret" "nannet" "náitalit" "njuoskadit" "oahpahit" "ohcat" "rahpat" "ráhkadit" "ráidnet" "rátkit" "registreret" "rekruteret" "ruohkkat" "sáddet" "sáltet" "sárgut" "sihkkut" "skihtardit" "skoalkalit" "tevdnet" "vadjat" "veahkehit" "vikšet" "vuođđudit" "vuosehit" "vuoidat" "vuoiddadit" "vuoitit" "vuostáiváldit" "vuoššat" "vurket" ;

  # in contrast to abstract "activities" and static verbs. 
  # According to the rules choosing Loc or Com, all activity-verbs do not select TOOL, ABSTR-TOOL, CONCEPT or HUMAN in (Pl Loc).
  
LIST BODY-ACTIVITY-V = "borrat" "čiekčat" "čujuhit" "čuorbmat" "gullat" "guoskkahit" "lihkahit" "lihkastahttit" "njávkkadit" "njávkkastit" "oaidnit" "seavvit" ;
  
    # These verbs can also have BODY as a tool. The verb-set belongs to the superset of dynamic-verbs, so they will also work with TOOL and ABSTR-TOOL in Com. "Giehta" is in both the TOOL-set and the BODY-set because it selects in Com to a lot of verbs.

LIST PLACING-ACTIVITY-V = "bidjat" "buonjostit" ;

#LIST HUNTING-ACTIVITY-V = "bivdit" "goddit" "luossa-#bivdit" ;

#LIST FOOD-ACTIVITY-V = "ferdnet" ;

#LIST WORKING-ACTIVITY-V = ;

LIST WRITING-ACTIVITY-V = "čállit" ;

LIST HANDICRAFT-ACTIVITY-V = "buddet" "botnit" "goarrut" "hervet" "vadjat" "vikšet" ;

SET ACTIVITY-V = BODY-ACTIVITY-V OR WRITING-ACTIVITY-V OR PLACING-ACTIVITY-V OR HUMAN-ACTIVITY-V OR HANDICRAFT-ACTIVITY-V ;

#LIST DADJAT = "dadjat" "lohkat" ;
# This set is for  cealkkavástta: DADJAT + Acc + Inf - Not in use for the time being

LIST HUPMAT =  "dáikit" "dárostit" "digáštallat" "digaštit" "duoldat"  "háladit" "háleštit" "hállat" "hoallat" "humadit" "hupmat" "logaldallat" "máidnut" "máinnašit" "muitaladdat" "njurgut" "oaivvildit" "savkalit" "ságastaddat" "ságastallat" "ságastit" "sámástit" "sámistit" "sárdnidit" "sárdnut" "sártnodit" "solžat" "suomastit" ;
# These should not take HUMAN as object

LIST VERBAL-ACTIVITY =  "árvalit" "cealkit" "čilget" "basuhit" "cuoigut" "čuorvut" "čurvet"  "dadjat" "gielistit" "gilljut" "gopmulit" "háladit" "háleštit" "hállat" "hoallat" "huikit" "huikkádit" "jearrat" "juoigat" "kommenteret" "lávlut" "lohkat"  "muitalit"  "rávvet" "sivdnidit" "váruhit" "vástidit" ;

SET VERBAL-ACTIVITY-V = VERBAL-ACTIVITY OR HUPMAT ;

#Under construction! (as most of the other LISTs) 
    # According to the rules choosing Loc or Com, the these verbs select TOOL, ABSTR-TOOL, CONCEPT or HUMAN in (Pl Loc).
    # SATNI in Com

LIST HUMAN-AGENT-V = "áŋgiruššat" "ásahit" "beahttit" "buoridit" "čielggadit" "čuovvulit" "dássidit" "deattuhit" "dieđihit" "dievvat" "duođaštit" "geahpedit" "geahpidit" "gudnejahttit" "guorahallat" "illudit" "lassánit" "liekkadallat" "loahpahit" "luohpat" "mearridit" "moivašuhttit" "nannet" "oassálastit" "suokkardit" "unnidit" "váikkuhit" "válmmaštit" "verrošit" "vurket" ;

    # According to the rules choosing Loc or Com, the these verbs do not select TOOL, ABSTR-TOOL, CONCEPT, SATNI or HUMAN in (Pl Loc).

#LIST ABSTR-EVENT-V = "lassánit" ;

    # In contrast to the HUMAN-AGENT-V set, this one presupposes no human or human-like actor who initiates the action.

LIST INTELLECTUAL-ACTIVITY-V = "dovdat" "fuobmát" "fuomášit" "huobmát" "jurddahit" "jurddašit" "smiehttat" ;

    # According to the rules choosing Loc or Com, the these verbs do not select TOOL, ABSTR-TOOL, CONCEPT or HUMAN in (Pl Loc).

LIST VEHICLE-PLACE-V = "addit" "bearrat" "gaikkihit" "gáibidit" "geiget" "oastit" "oažžut" "suoladit" "váldit"  ;

    # According to the rules choosing Loc or Com, these verbs do not select TOOL, ABSTR-TOOL and CONCEPT in (Pl Loc), but HUMAN or ACTOR in (Pl Loc).
    # HUMAN is source and locative, VEHICLE is locative

LIST VEHICLE-TOOL-V = "buktit" "doalvut" "fievrridit" "vuolggahit" ;

    # HUMAN is source and locative, VEHICLE is comitative

SET HUMAN-SOURCE-VEHICLE-V = VEHICLE-PLACE-V OR VEHICLE-TOOL-V ;

#SET HUMAN-SOURCE-V =
# agentive verbs with humans as their agents

    # The two subsets differ in their choice of case for members of VEHICLE, but both choose locative for members of the set HUMAN (with the thematic role source)

LIST ABSTR-ENTITY-COM-V = "investeret" "lihkosmuvvat" "lihkosnuvvat" "lihkostuvvat" "lihkustuvvat" "ruhtadit";

    # According to the rules choosing Loc or Com, these verbs do not select TOOL, ABSTR-TOOL, CONCEPT, ABSTR-ENTITY and ACTOR in (Pl Loc).

LIST ONLY-PLACE-LOC-V = "áimmahuššat" "álggahit" "bártidit" "bargat" "dahkat" "veahkehit" ;

    # According to the rules choosing Loc or Com, these verbs only select (Pl Loc) if PLACE or ORGANIZATION.

LIST HUMAN-LOC-V = "atnit" "báhcit" "geavahit" "gohčodit" "namuhit" ;

    # According to the rules choosing Loc or Com, these verbs choose only (Sg Com) if CONCEPT or HUMAN or "sátni".
    # Abstract

LIST PLACE-V = "ássat" "buolvvastallat" "buolvvastit" "čippostallat" "čohkkát" "čohkahit" "čuožžut" "čuččodit" "morihit" "gohččát" "gullát" "morránit" "orrut" "orodit" "stuorrut" "veallát" "veallahit" ;
  # Those get only not locative if the target is a member TOOL, ABSTR-TOOL or ANIMATE or CONCEPT. Selects more locatives than ONLY-PLACE-LOC-V 
  
LIST ABSTR-PLACE-V = "váilut" "heivet" "hevvet" "hiehpat" "sistisdoallat" "soahpat" "šiehtat";
    # Verbs without agent

LIST EVENT-V = "dáhpáhuvvat" ;

  # TIME/AIGODAT are locative
  
LIST STATE-V = "eallit" ;

  
LIST REM-WITH-PARTS = "gaikkihit" ;

    # Belongs to the DYNAMIC-V. They also take PARTS in comitative case. 
    
LIST CONTRAST-V = "rátkit" ;

    # two arguments, the second of which is locative

  
LIST EMOTION-V = "heahpanaddat" "heahpanit" "ráhkistit" ;

#LIST PERCEPTION-V = 
LIST SENSATION-V = "gullat" "oaidnit" ;

LIST ILLNESS-V = "buohcat" "dearvvašmahttit" "dearvvašmuvvat" "dearvvašnuvvat" "dearvvaštuvvat" ;

  
# HIERARCHY:

#SET STATIC-V = PLACE-V OR EMOTION-V OR SENSATION-V ;

SET DYNAMIC-V = ACTIVITY-V OR MOVEMENT-V OR VERBAL-ACTIVITY-V OR HUMAN-AGENT-V OR INTELLECTUAL-ACTIVITY-V OR ABSTR-ENTITY-COM-V OR HUMAN-SOURCE-VEHICLE-V OR REM-WITH-PARTS ;

    # According to the rules choosing Loc or Com, dynamic-verbs do not select TOOL, ABSTR-TOOL or CONCEPT in (Pl Loc).
    # Human becomes either Loc or Com depending on its subset membership.
    
SET N-TIMEOBJECT-V = MOVEMENT-V OR ACTIVITY-V OR VERBAL-ACTIVITY-V OR INTELLECTUAL-ACTIVITY-V OR PLACE-V ;

    # Those verb sets in addition to TIMEADVERBIAL-V do not take TIME expressions as objects

# Adverbs
# -------

# Adverbs as predicates
# - - - - - - - - - - -
    # in combination with verbs

LIST COM-ADV = "fárrolaga" "oktan" "oktanaga" "ovttamielas" "ovttas" "ovttasráđiid" "searválagaid" "searválaga" "searvál" "searvála" ;

    # Could also be perceived as particles within complexs verbs.
    
# others: vuhti combines with váldit - Com

# Other adverb sets
# - - - - - - - - - 

LIST GRADE-ADV =  "áibbas" "beare" "dušše" ("eanet" Adv) "erenoamán" "erenoamáš" "earenoamáš" "hirbmat" "hui" "ila" "issoras" ("man" Adv) "measta" "menddo" "muhtun_muddui" "nu" "oalle" "oba" ("oppa" Adv) "seamma" "seammá" ("veaháš" Adv) "vehá" "veháš" "veahá" "veaháš" ;

LIST PLURALIZER = "buot" "buotlágan" "buotlágán" "buotlágáš" "earálágan" "iežálágan" "iežálágán" "gait" "gaitlágan" "gaitlágán" "goappeš" "goappašat"  "máŋggalágan" "máŋggalágán" "moattelágan" "moattelágán" "moattilágan" "moattilágán" ;
    # Singular nouns can have a plural form combined with those
  

# Adjectives
# ----------

# Lexical valency sets
# - - - - - - - - - - -
    # here we have adjectives according to their semantic properties
    # in periphrastic constructions (together with "leat") they subcategorize for comitative, locative etc. depending on the noun's semantic properties
    
LIST COM-ADJ = "olles" "oppa" ;

LIST ILL-ADJ = "gullevaš" ;

LIST ACTIVITY-ADJ = "hilbat" "oskkáldas" ;

    # denote som kind of activity, might take HUMAN comitative?
    
LIST DEHALAS = "dábálaš" "dehálaš" "suohtas" ;
	# When Attr = pred.form
	## Lea suohtas kurssas. - not Attr 
	## Lea čuovvovaš kurssas. - Attr

#LIST ATTITUDE-ADJ = 

#LIST ATTRIBUTE-ADJ = "čeahppi" ;

# Nickel: predicative adjectives (take a complement) "fargat" "heavnnas" "sáiggas" "suhtas"

# Other adjective sets
# - - - - - - - - - - -
    # In order to disambiguate between N and A
    # Those are nouns/adjectives with zero derivation
    
LIST DER-ADJ-N = "addi" "lávlu" "lohkki" "ovddasteaddji" "ráđđejeaddji" "sadjásaš" "vázzi" "vuoddji" "vuoiti" "vuovdi";

LIST ADJ-N = "buoidi" "čeahppi" "headju" "heittot" "jalla" "neavri" "nuorra" "oahpis" "oarbbis" "ráhkis" "rikkis" "váivváš" "vuoras";
    
    # nouns that have very specific semantics and are derived from adjectives
    # those nouns are animate
    
LIST ADJ-N-CASE = "varas" ;
    # adjectives which are also nouns in other cases than nominative 

LIST NON-GRADE-ADJ = "sápmelaš" "alternatiiva" ;
    # gradable under certain circumstances, for example if we write "nu" "hirbmat" "hui" "oalle" "oppa" "veháš" 
    ## mon dagahallan NU sápmelažžan = jeg later som jeg er SÅÅ same/samisk?
    ## mon anán du VIEHKA sápmelažžan 
    
LIST GRADE-ADJ = "fávru" "headju";
    # The ones that have a strong adjective meaning, and are inclined to be adjectives rather than nouns in Ess constructions

LIST LEX-ADJ = "bassi" "guovddáš" "nuorra" "oahpis" "váivi" "oainnus";
    # Those are quite strongly lexicalized as nouns.
    
LIST TIME-A = "boahtte" "čuovvovaš" "maŋemus" "maŋimus" "ovddit" ("mannat" PrfPrc) ("vássát" PrfPrc)   ;

LIST DURATION-A = "heila" "eanas" "eanet" "geažo" "geažos" "guhkki" "obba" "oba" "ollis" "oppa" "visot" ;

LIST DURATION-ADV = "meastui" "measta" "masá" "varga" "vargui" "vargahui" "goasii" "goase" ;
    
LIST POINT-IN-TIME-SPEC = "dološ" "eará" "nubbi" ;

    

# NP sets defined according to their morphosyntactic features
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

LIST N-SG-NOM = (N Sg Nom);
LIST N-PL-NOM = (N Pl Nom);

SET LEX-N = N - N-DER;

LIST PROP = (N Prop);

SET CNOUN = N - Prop;

SET HNOUN = N - Cmpnd ;

SET HNOUN-NOM = (N Nom) - Cmpnd ;

SET N-NOT-GEN = N - (N Gen) ;

SET NP = N OR A ;                      # anything that can take except numerals
SET NP-HEAD        = Pron OR HNOUN - ("buorre") ;
SET NP-HEAD-SG     = SGPRON OR (N Sg) OR (A Sg) - Cmpnd  - Dem - ("buorre");
SET NP-HEAD-PL     = PLPRON OR (N Pl) OR (A Pl) - Cmpnd  - Dem - ("buorre");
SET NP-HEAD-SG-NOM = SGPRON + Nom OR (N Sg Nom) OR (A Sg Nom) - ("buorre") - Cmpnd ;
SET NP-HEAD-PL-NOM = PLPRON + Nom OR (N Pl Nom) OR (A Pl Nom) - Cmpnd  - ("buorre");
SET NP-HEAD-NOM    = NP-HEAD-SG-NOM OR NP-HEAD-PL-NOM ;
SET NP-HEAD-ACC    = (Pron Acc) OR (N Acc) OR (A Acc) - Cmpnd - Dem - ("buorre");
SET NP-HEAD-GEN    = (Pron Gen) OR (N Gen) OR (A Gen) - Cmpnd - Dem - ("buorre");

# The PRE-NP-HEAD family of sets
# - - - - - - - - - - - - - - - -

SET PRE-NP-HEAD = (Prop Attr) OR (Prop @→N) OR (A Attr) OR (ABBR Attr) OR ("buorre") OR (Pron Pers Gen) OR (N Gen) OR 
         Num OR Cmpnd OR CC OR (Pron Dem) OR (Pron Refl Gen) OR (Pron Indef) OR 
         (PrfPrc @>N) OR PrsPrc OR (A Ord) ;
         # The strict version of items that can only be premodifiers, not parts of the predicate
         
SET V-PRE-NP = PrfPrc OR PrsPrc OR VActor OR Actio OR (V A) OR (Ind Prs Sg3) OR (Ind Prs Sg1) OR (Imprt Du2) ;
    # to be used together with PRE-NP-HEAD before @>N is disambiguated
         
SET NP-MEMBER   = PRE-NP-HEAD OR N ;

SET PRE-A-N     = (Pron Pers Gen) OR (Pron Indef) OR Num OR (A Ord) OR (Pron Dem) OR (Pron Refl Gen) ;

SET NOT-PRE-A-N = WORD - PRE-A-N ;

LIST PUNCT-LEFT = (PUNCT LEFT) ;
LIST PUNCT-RIGHT = (PUNCT RIGHT) ;

SET PRE-APP   = COMMA OR PUNCT-LEFT OR PRE-NP-HEAD ;
 # This set ist not only for what can
                            # stand in front of appositions but also
                            # postmodifiers.

# V NPNHAIIP... N
# BOS ... N V

# There must be a sensible naming convention for these sets...
# Most strict BARRIERs...
SET NPNH     = WORD - PRE-NP-HEAD OR ABBR ;                     
# NPNH  = "NOT-PRE-NP-HEAD" 
SET NPNH1     = NPNH - Acc OR ABBR ; 
# To be used in mappingrules, before hte disambuation of Acc and Gen.                     

SET NPNHV    = WORD - PRE-NP-HEAD - V-PRE-NP ;                 
# including possible verbal premodifiers 
SET NPNHA    = WORD - PRE-NP-HEAD - Adv ;                      
# NPNHA = "NOT-PRE-NP-HEAD-OR-ADV"
SET NPNHAV   = WORD - PRE-NP-HEAD - Adv - V-PRE-NP ;           
# including possible verbal premodifiers
SET NPNHAI   = WORD - PRE-NP-HEAD - Adv - Indef ;              
# NPNHAI = "     ...-OR-INDEF"
SET NPNHAII  = WORD - PRE-NP-HEAD - Adv - Indef - Ill ;        
# Illative indir.obj.
SET NPNHAIIP = WORD - PRE-NP-HEAD - Adv - Indef - Ill - Pcle ; 
# <== is this our NPNH set?
SET NPNHC    = WORD - PRE-NP-HEAD - Com ;                      
# "njaŋggofirpmiiguin bivdin"
SET NPNHCCC  = WORD - PRE-NP-HEAD - COMMA ;
SET NPNHCC   = WORD - PRE-NP-HEAD - COMMA - LCRD ;
SET NAPP     = WORD - PRE-APP ;

# SET TOLERANT-PRENPP = V ; (everything non-NP-head!)
# ... Most sloppy BARRIERs

# Set for NP with participle premodifier
# ... IF *-1 X BARRIER NPNH OR 
# LocComIll are ok, but only with a PrfPcc to the right

# Other negatively defined morphosyntactic noun sets
# - - - - - - - - - - - - - - - - - - - - - - - - - 

SET NOT-N = WORD - N ;

#SET NOT-A = WORD - A ;

SET NOT-NA = WORD - N - A ;

SET NOT-NAPrfCC = WORD - N - A - CC - PrfPrc ;

SET NOT-NP = VFIN-NOT-NEG OR ConNeg OR Inf OR Pcle OR Interj OR CS ;
 # The set NP-BOUNDARY is bigger. 
SET NPROP = N - PROP ;

SET NOT-COMMA = CLB - COMMA OR PUNCT-LEFT OR PUNCT-RIGHT ;

SET NOT-QMARK = WORD OR CLB OR PUNCT - QMARK ; 

SET W-NOT-ACC-GEN = WORD - Acc - Gen ;



  
# Nominal sets defined according to their semantical properties
# -------------------------------------------------------------

# Here we will write what sets we have and how we divide them.

# Spatial nouns. These nouns behave like postpositions
LIST SPATIALNOUN = "guovlu" "osku" "sadji" "vuođđu" ;
 
# These nouns in essiv get @ADVL:
LIST ESS-ADVL-N = "arvi" "árga" "baika" ("bassi" N) ("báhkka" N) "beaivvádat" "biegga" "bievla" ("buolaš" N) "čuoika" "čuovga"  (".*dálki"r) "dulvi" "mánoheahpi" "muohta" "njáhcu" ("seavdnjat" N) "varra" "veaigi";

# These nouns/adjectives in essiv can get @ADVL:
LIST ESS-PROB-ADVL-N = ("bassi" N) "boaris" ("nuorra" N) ;
 

# Time sets
# - - - - -

LIST MANNU = "ođđajagemánnu" "ođđajagimánnu" "guovvamánnu" "njukčamánnu" "njuvččamánnu" "mársmánnu" "cuoŋománnu" "cuoŋosmánnu" "cuoŋumánnu" "gáranasmánnu" "miessemánnu" "máimánnu" "geassemánnu" "suoidnemánnu" "borgemánnu" "šnjilčamánnu" "šnjilžamánnu" "čakčamánnu" "golggotmánnu" "skábmamánnu" "novembermánnu" "ritnemánnu" "juovlamánnu" ;

LIST AIGODAT = "áigi" (".*áigodat"r) "álgoáigi" "bargoáigi" "soahteáigi" "soahtegaskaáigi" ;
 
LIST VAHKKU-DUR = "beaivi" "jándor" "bodda" "čakča" "čakčageassi" "čakčaseavdnjat" "čuohtejahki" "dálvi" "diibmu" "eahket" "eahketbodda" "geassi" "giđđa" "idja" "iđit" "iđitbodda" "jahki" "jahkebealle" "jahkečuohti" "kaleanddarjahki" "loahppajahki" ("[0-9]*-lohku"r) "mánnu" "minukta" "njealjádasjahki" "skuvlajahki" "tiibma" "vahkkoloahppa" "vahkku" ;
# these are periodes and can be Acc

LIST VAHKKU-TIME = "b" "bievlajahki" "bivdoáigi" (".*beaivi"r) "D-beaivi" "dienasjahki" "doaibmajahki" "eamiálbmotjahki" "earrejahki" "gaskaidja" "geardi"  "juovlabassi" "luomejahki" "luopmojahki" "mihcamárra" "muorjejahki" "nissonjahki" "vuoitojahki" ("[0-9]*-jahki"r) ("[0-9]*-jahki"r) "[0-9]*-[0-9]*-jahki"  "[0-9]*-[0-9]*-lohku" ("[0-9]*-lohku"r) ("[0-9]*-lohku"r) ;

 # The quoteless jahki here is since the preprocessor is not fine-tuned
 # yet, it still gives '"1870-" # jahki N Sg Com'. # lets see if "dbm" works
 # Duomma:lea
 
SET VAHKKU = VAHKKU-DUR OR VAHKKU-TIME ;
 
LIST NUM-JAHKI = "jahki" "skuvlajahki";

    # Years which can be numerated
 
LIST PARTTIME = "čavččabealle" ;
	# This set is for finding Gen in expressions like PARTTIME OR TIME Gen.

LIST AIGI = "áigi" (".*áigi"r) ; 

LIST SP-BEAIVI = "albmáimannanbeaivi" "bargočoahkkinbeaivi" "beassášbeaivi" "mánnodat" "vuossárga" "disdat" "maŋŋebárga" "gaskavahkku" "duorastat" "bearjadat" "juovlabeaivi" "lávvardat" "lávvordat" "sotnabeaivi" "sábbát" "skilleduorastat" ;

LIST GEN-BEAIVI = "álbmotbeaivi" "árgabeaivi" "bargobeaivi" "beaivi" "duopmobeaivi" "riegádanbeaivi" "skuvlabeaivi"  ;
# General-beaivi can have Gen modifier, like "skuvlla árgabeaivi".

SET BEAIVI = SP-BEAIVI OR GEN-BEAIVI ;


SET TIME = MANNU OR VAHKKU OR BEAIVI OR AIGI ;

  # Do not add AIGODAT, it has some other characteristics in some cases.
  # But fix!!
  # "Sámediggeráđđi   lea áigodagas doallan   5 čoahkkima."
  # Today believed to be obj.
  
SET NOTIME = N - TIME ;

LIST GEASSET = "dálvet" "dálvit" "giđđat" "geasset" ("geassit" Adv) "čakčat" ;
 # What is special here?

LIST PAST-MARKER = ("mánná" Ess) "dalle" "diibmá" "dolin" "dološ" "dovle" "duvle" "eske" "gieskat" "ikte" ("nuorra" Ess) "ovdal" ("ovdditbeaivi" Gen) ("vássánáigi" Loc) ("boaresáigi" Gen) ;

LIST PRESENT-MARKER = "dál" "ihttin" "odne" "otne" ("boahtteáigi" Loc) ("boahtteáigi" Gen)  ;

SET TIME-MARKER = PAST-MARKER OR PRESENT-MARKER ;

LIST OTHER-TIME-ADV =  "árabuš" "árrat" "easkka" "guhká" ("guhkit" Adv) "maŋemustá" "maŋŋel" "maŋŋelaš" "maŋŋeleappos" "maŋŋit" "muhtumin" "ovdal" "álo" "álohii" "álot" ;

SET TIME-ADV = TIME-MARKER OR OTHER-TIME-ADV OR GEASSET;

SET NOT-TIME-ADV = WORD - TIME-ADV ;

SET ORRUT-BO = WORD - PRE-NP-HEAD - TIME-ADV  ;


# Amount sets
# - - - - - -
 
LIST VOLUME = "cl" "lihtar" (".*lihtter"r) "dl" "lihtter" "ml"  ;

LIST WEIGHT = "mg" "kg" "kilo" "kilu" "gilo" "tonna" ;

LIST LENGTH = "čuoldabadji" "dumá" "fierbmebadji" "gaska" "miila" (".*mehtar"r) (".*mehter"r) "mehtar" "mehter" "sente" "cm" "tumá" "állan" "salla" ;

LIST TEMPERATURE = "buolašceahkki" "buolašgráda" "lieggaceahkki" "lieggagráda" "galbmaceahkki" "galbmagráda" "temperatuvra" ;

LIST AMOUNT = "uhcánaš" "unnánaš" ;

LIST TIME-UNIT = "jahki" "minukta" "sekunda" "vahkku" "mánnu" "diibmu" ;
	# For use for rules hitting "maŋŋel" as Adv instead of Po. Also in MEASURE-set.

SET MEASURE = VOLUME OR WEIGHT OR LENGTH OR AMOUNT OR TEMPERATURE OR TIME-UNIT ;

LIST CURRENCY = "denara" "dollár" "euro" "kruvdnu" "kr" "ru" "rubel" "ruvdno" "ruvdnu" "¢" "€" "$";

SET CURRENCY-GEN = CURRENCY + Gen ;

SET NOT-CURRENCY-GEN = N - CURRENCY-GEN ;
 	

LIST NUMUNIT = "čuohti" "duhát" "miljon" "millijovdna" "milliovdna" "mill" "milj" "miljo" "miljarda" "mrd";

LIST KIND = (".*šládja"r)  ;

LIST COUNTABLE = "oassi" "kapihttal" "paragráfa" ;

LIST NUMMAR = "identifiserennummar" "njuolggotlf" "nr" "nummar" "nummir" "tabeallanummar" "Vuorkááššenr" ;

LIST KLASS = "ášši" "bálkáceahkki" "čuokkis" "s" "siidu" "§" "§§" "paragráfa" "oassi" "kap" "kapihttal" "kapihtal";

LIST PEOPLE-NUM = "guovttis" "golmmas" "njealjis" "viđas" "guđas" "čiežas" "gávccis" "ovccis" "logis" ;


# These are ABBR:
LIST REAL-TITLE =  "prof" "cand.mag" "cand.oecon" "cand.philol" "cand.real" "cand.scient" "cand.theol" "cand"  "dr.art" "eksp.hoavd" "eksp.sj" "fenr" "fig" "fil.tri" "gen.lt" "genr" "genr.lt" "h.r.adv" "hr" "kapt" "korp" "lekt" "lic" "ltn" "mag.art" "mag" "merc" "Miss" "Mr" "Mrs" "odont" "oecon" "ordf" "ossod.dir" "stud.phil." "res.kap" "stud.philol" "vit.ass" "dr" "dr.med" "dr.philos" "dr.theol" ;
 
LIST TITLE-LIKE = ("gásttašit" Actor) "justitiarius" "majestehta" "miss" "ránnjá" ;
# Ránnjá Ole Vuolab imašta manne ....

    
LIST FAMILY-ONLY-HUMAN = (Prop Mal) (Prop Fem) (Prop Sur) "áddjut" "áhkká" "áhkkut" "bárdnemánná" "boadnji" "čeahci" "čeahcit" "dálueamit" "eahki" "eamit" "eammi" "eanu" "goaski" "guoibmi" "irgi" "isit" "lunta" "mánáidmánná" "mannji" "máttaráddjá" "máttaráhkku" "moarsi" "muoŧŧa" "muoŧŧal" "náittosguoibmi" "neahpi" "oabbá" "oabbábealli" "oambealli" "oappáš" "oarpmealli" "oskuguoibmi" "ristvánhen" (".*sássa"r) "siessal" "siessá" "vieljaš" "viellja" "vielljabealli" "vilbealli" "vuohppa" "vuonáhkku" "vuoni" ;
# These can only be possessed by HUMAN-INDIVIDUAL, HUMAN-GROUP, PROFESSION, OFFICE, HUM-FUNCTION, ABSTR-TEXT

LIST FAMILY-ALSO-ABSTRACT = "áhčči" "áddjá" "áhkku" "bearaš" "eadni" "oapmahaš" "sohka" "sohkagoddi" "váhnen" "veahka" ;
# These can be possessed by HUMAN-INDIVIDUAL, HUMAN-GROUP, PROFESSION, OFFICE, HUM-FUNCTION, ABSTR-TEXT, PLACE (minus NATURE-PLACE), Prop Plc, NATION, ANIMAL, EDUCATION, ORGANIZATION and INSTITUTION. Can also be used as metaphors.

SET FAMILY = FAMILY-ONLY-HUMAN OR FAMILY-ALSO-ABSTRACT ;

LIST NON-FAMILY = "almmáiolmmoš" "álbmotguoibmi" "ámmátolmmoš" "bálvalanguoibmi" "bárdni" "bártnáš" "dievdoolmmoš" "eaŋkilolmmoš" "gánda" "guossi" "kránnjá" "lagamuš" "mánná" "mánáš" "nieida" "nieiddaš" "nisson" "nissonolmmoš" "nisu" "Norgga-ustit" "nuorra" "ollesolmmoš" "oskuguoibmi" "oskuviellja" "olmmái" "olmmoš" "ránnjá" "rumaš" "rávisolmmoš" "sámemánná" "sámenisson" "sámenisu" "sámenuorra" "siidaguoibmi" "siidaguoibmenisu" "skibir" "skihpár" "smávvagánda" "ustit" "verdde" "viissis" ;
# These can be possessed by HUMAN-INDIVIDUAL, HUMAN-GROUP, PROFESSION, OFFICE, HUM-FUNCTION, ABSTR-TEXT, EDUCATION, PLACE (minus NATURE-PLACE), Prop Plc, NATION, EDUCATION, ORGANIZATION, INSTITUTION and INDUSTRY.

LIST HUMAN-LIKE = "beahtu" "beargalat" "eŋgel" "háldi" "hearrá" "ipmil" "stállu" "suodjaluseŋgel" "ulda" ;

SET HUMAN-INDIVIDUAL = HUMAN-LIKE OR FAMILY OR NON-FAMILY ;

LIST HUMAN-GROUP =  "almennet" "almmolašvuohta" "álbmot" (".*#álbmot"r) (".*bearaš"r) (".*čearda"r) "delegašuvdna" "gázzi" "gilialmennet" (".*guovttis"r) (".*guovttos"r) (".*joavku"r) (".*kommišuvdna"r) (".*komiteá"r) "ráidu" "ráđđi" ("sápmi" N Pl) "stáhtaalmennet" "unnitlohku" (".*veahka"r) ;
  ## group of humans that connot be a building at the same time
   # Duomma:lea 
 
LIST PROFESSION = (".*advokáhta"r) (".*advokáhtta"r) (".*duopmár"r) "arkeologa" (".*artista"r) (".*assisteanta"r) (".*áittardeaddji"r) "ákšoálmmái" (".*bargi"r) "ámmátolmmái" "ámmátolmmoš" (".*mánni"r) (".*hoavda"r) (".*meannudeaddji"r) 
(".*geahčči"r) (".*bagadalli"r) (".*bagadeaddji"r) (".*konsuleanta"r) "bargoveahka" "bassaleaddji" "bassi" "báhkkár" "báhppa" "bálvaleaddji" (".*čálli"r) "bearremánni" "bibliotekára" (".*biigá"r) "biiladivvu" (".*vuovdi"r) "birasgáhttenráđđeaddi" (".*terapevta"r)  (".*terapeuta"r) "bisma" "bismá" "bispa" (".*bivdi"r) (".*hábmejeaddji"r) "boanda" "boazodoalli" "boazosápmelaš" "boazosápmi" "bolesmeašttir" (".*vuoddji"r) "buvttadeaddji" 
"čalbmeáhkku" "čalbmeeadni" "čálaoahppavaš" "čiekči" "čorgejeaddji" (".*čuojaheaddji"r) 
"dáidár" "dáiddár" "dálon" "dálueamit" "dáluisit" "dárkkisteaddji" "davvisápmi" (".*dikšu"r) (".*direktevra"r) (".*dirigeanta"r) (".*divššár"r) (".*doaimmaheaddji"r) (".*doavttir"r) "dulka" ("duodjeoahpahallat" Actor) "duojár" (".*duopmar"r) (".*dutki"r) 
"ealáhusdoalli" "eallodoalli" "eanandoalli" "eananhearrá" (".*sadjásaš"r) "eatnandoalli"
"fáldi" "fitnodatdoaibmi" "fitnodatoamasteaddji" 
"gávpejas" "giellaráđđi" (".*veahkki"r) "girdi" "girkobálvaleaddji" "girkodulka" "gollerávdi" "gonagas" "govvadáidár" "govvadáiddár" "govvedeaddji" "govvejeaddji" "guođoheaddji" "guolásteaddji"
"hárjeheaddji" (".*teknihkar"r) (".*jođiheaddji"r) "johttisápmi" "johttisápmelaš" (".*journalista"r) "keaisár" "kirurga" "koahkka" "korefereanta" "kursaoahppi" 
"lágideaddji" "láibu" "lávlu" "leanut" "logopeda" "luhkkár" 
"máilmmemeašttir" "máhttájeaddji" "máttasápmi" "mearraalmmái" "mearraolmmái" "mearrasápmi" "mišuneara" "museábargi" "musihkkadahkki" "musihkkár"
"návetvázzi" "neavttár" "njunušjurista" "noaidi" "oahpahalli" (".*oahpaheaddji"r) "oahppi" "oaivadeaddji" "oaivámuš" "ođashoavda" "ođaslohkki" "ossodatdirektevra" "ossodatdirektøra" 
"parkerenfákta" "pedagoga" "plánejeaddji" "poliisa" "politiija" "prentejeaddji" "profehta" "professor" 
"rádjefákta" "rádjesoalddat" "ráđđeaddi" "ráđđeolmmái" "rávdi" "reaŋga" "redaktevra" "rehketdoallodárkkisteaddji"  "rehketdoalli" "rektor" "ruhttejeaddji" "ruvdnaprinsa" "ruvvejeaddji" 
"sámedikkeráđđi" "sámeduojár" "sárdnideaddji" "sávzadoalli" "sealgeeadni" "sester" "silbarávdi" "snihkkár" "soalddat" "sosionoma" "spábbačiekčanhárjeheaddji" "spábbačiekči" "stipendiáhta" "studeanta" "sundi" "suohkanbáhppa" "suohkanplánejeaddji" 
"šibitdoalli" "taksivuoddji" "telefonvástideaddji" "tuollár" "turistaofelaš" "uksafákta" "universitehtalektor"  
"váldodoaimmaheaddji" "viessohoiddár"  "vuoktačuohppi";


LIST OFFICE = "áirras" "ámtamánni" "bajitbáhppa" "bearašminister"  "biebmoministtar"  "birasgáhttenministtar" "boazodoallohoavda" (".*čálli"r) "dearvvašvuođaministtar" "dekana" "eanadoallominister" "farao" "fylkkaráđđi" "gielddaminister" "gonagas" "guolástusminister" "justisministtar" "kulturminister" "leansmánni" "ministtar" "nissonáirras" "politihkar" "politihkkár" "prinseassa" "ruvdnaprinseassa" "ságadoalli" "Sámedemokráhtta" "sámedikkeáirras" "Sámediggepresideanta" "sámediggepresideanta" "sátnejođiheaddji" "sosiálaministtar" "stáhtaministtar" "stivralahttu" "suodjalusminister" "ovdaolmmoš" "presideanta" "stáhtaráđđi" "várrepresideanta" ;

SET TITLE = REAL-TITLE OR TITLE-LIKE OR PROFESSION OR OFFICE ; 

LIST HUM-FUNCTION =  "Bergen-soalddát" "kandidáhtta" "kandidáhta" "nomáda" "oahppanolmmoš" "oktavuođaolmmoš" "olbmobárdni" "pasienta" "ráđđealmmái" "riikavuloš" "sámedemokráhtta" "skohtervuoddji" "soahteolmmái" "stáhtaboargár" ("suddu" Der_laš) "turista" "virgeguoibmi" "virgeolmmoš" "vuorasolmmoš";
 #XXX bad name
 # Don´t add veahkki + Ess.
 
LIST HUM-ATTR =  "bassi" "divššohas" "eananeaiggát" "eaiggát" "eatnigielhálli" "fástaássi"  "gáktehas" "informánta"  "lestadiánalaš" "sámegielat" ("suddu" Der_laš) ;
    # adjectival

LIST HUM-VERB = "ássi" "boaris" "bálvaleaddji" "bálvalanguoibmi" "boazoeaiggát" "dállodoalli" "eananeaiggát" "geavaheaddji" "giliássi" "muitaleaddji" "ovttasássi" "riikkaássi"  "vuotnaássi" "vuostebelle" "vuostebealli";
    # vearbal

LIST NATIONAL-IDENTITY-NOT-SAPMI = "badjesápmelaš" "dáčča" "dánskalaš" "duiskkalaš" "Enodatsápmelaš" "Guovdageainsápmelaš" "guovdageaidnolaš" "hollándalaš" "indiána" "israellaš" "judálaš" "juvddálaš" "julevsápmelaš" "lullisápmelaš" "Maya-indiána" "njávdánsápmelaš" "nuortalaš" "oarjesápmelaš" "olgoriikkalaš" "palestinalaš" "romalaš" "romer" "ruotasuopmelaš" "Ruošša-Sápmelaš" "samarialaš" "siseatnansápmelaš" "Suonjilsápmelaš" "Várjjatsápmelaš" "vuotnasápmelaš" ;

     # Also regional identity 
      
LIST SUOPMA = "Davvi-Ruoŧŧa" "Davvi-Suopma" "Lulli-Ruoŧŧa" "Lulli-Suopma" "Mátta-Ruoŧŧa" "Mátta-Suopma" "Oarje-Ruoŧŧa" "Oarje-Suopma" "ruošša" "Ruošša" "ruoŧŧa" "Ruoŧŧa" "suopma" "Suopma" ;
     
# This set is used in Gen/Acc-rules.
     
LIST SAPMI = "davvisápmi" "julevsápmi" "lullisápmi" "máttasápmi" "mearrasápmi" "nuortasápmi" "oarjesápmi" "sápmi" "Sápmi" ;
      
# This set is used in Gen/Acc-rules.

SET NATIONAL-IDENTITY = NATIONAL-IDENTITY-NOT-SAPMI OR SAPMI ;

SET HUMAN = HUMAN-INDIVIDUAL OR HUMAN-GROUP OR PROFESSION OR HUM-FUNCTION OR HUM-ATTR OR HUM-VERB OR OFFICE OR NATIONAL-IDENTITY ;

SET NOT-HUMAN = N - HUMAN ; 

# Animals

LIST GEN-ANIMAL = "ábegáhttu" "ásen" "beana" "bohkká" "bussá" "čeavrris" "ciiku" "čivga" "dámmá" "ealit" "fuođđu" "gáhttu" "gáica" "gálbi" "gihcci" "guigu" "gussa" "heasta" "horti" "láppis" "loddi" "máhtu" "njiŋŋálas" "ore" "sávza" "sávzabeana" "smávvafuođđu" "spiinnečivga" "spiidni" "vársá" "vársi" "vielppis" "vierca" "vuoksá" "vuoncávaris" "vuonccis" ;

LIST HUNT-ANIMAL = "ealga" "rievssat" ;

LIST BOAZU = "áldu" "boazu" "čearpmat" "čora" "eallu" "heargi" "miessi" "sarvvis" "vierroboazu" "vuonjal" ;

LIST FISH = "bálddis" "čuska" "dápmot" "diddi" "diksu" "dorskeguolli" "dorski" "duovvi" "gilot" "guolli" "hávga" "juksu" "luosjuolgi" "luossa" "luossaguolli" "luossanálli" "muortu" "sallit" "sáidi" "sáivaguolli" "šákšadorski" "stábbasáidi" "stáinnir" "stuorasáidi" "rutnot" "veajet" ;

LIST ANIMAL-GROUP = "čora" "eallu" "heargeráidu" ;

SET ANIMAL = GEN-ANIMAL OR HUNT-ANIMAL OR BOAZU OR FISH ;

LIST BIRD = "ákta" "báiski" "bovttáš" "cagan" "čearret" "gáddeloddi" "gáiru" "mearaloddi" "skávli" "skuolfi" "šuoršu"  "albatrossa" "alitbađuš" "alitgaccet" "alitoaigaccet" "bakku" "bastesuorsi" "bađošgaccet" "beahcebáhcatloddi" "beahceloddi" "bealdocihci" "bealdogarjá" "bealdovuorra" "bealgeloddi" "bealljeloađgu" "bealljerásttis" "bearalskuolfi" "beasterages" "beibboš" "beibbošcihci" "beibbošcizáš" "belddošvizar" "beškkoš" "beštor" "bieggafálli" "biehkan" "bigán" "bihcabasčáihni" "bihcebasgáski" "bihcebasčáihni" "bissehávka" "bižus" "boaimmáš" "boallonjukča" "boađđocivkkán" "borjjastit" "borsenjunni" "bovttáš" "bulddogas" "bumbá" "buoidegaccet" "buokčat" "buokči" "bupmálaš" "bursanjunni" "bussáskuolfi" "buvvedat" "báiski" "bákteduvvá" "bárbmofálli" "bávgoš" "cagan" "cagán" "cielláš" "cihceskuolfi" "cihrrelastavizar" "civkaleivvoš" "cizašfálli" "cizopaš" "cizot" "davvelastavizar" "davveloddi" "davvevizar" "deaggačáihni" "deaggebáiski" "deaggecihci" "dearbmerásttis" "derpmoš" "dieldá" "dielkoduvvá" "dihtti" "diksobáhppa" "dirrelihká" "doadjosuorsi" "dokta" "dovtta" "duoršu" "duottarbižus" "duottarcivkaleivvoš" "duvvá" "duvvárásttis" "dálvebeštor" "dálveruoivil" "dálvi" "dážaboaimmáš" "dážasuorsi" "fasána" "fiehta" "fiervávierru" "fierváviroš" "fiskesbeštor" "fiskescihci" "fiskescižáš" "fiskesgaccet" "fiskesjievžžan" "fiskesnjungáhkkor" "fiskesvizar" "fiŋka" "gaccepaš" "gaccet" "gahperbáiski" "gahpervizar" "garjá" "gassanjunni" "gazzaloddi" "gazzebiehtár" "geađgejorgu" "geađgerásttis" "giegabiigá" "giehka" "giehpavuonccis" "giellavealgu" "gierdoduvvá" "gierdorásttis" "gierdosuorsi" "gierdočuonjá" "gierra" "giljobaš" "gilljobaš" "gilvabeštor" "girjebáhcatloddi" "girjelivkkár" "giron" "goahcceloddi" "goahppil" "goahppilgálli" "goahtegoljaš" "goalsi" "goalsoruoššehas" "goalšovizar" "goarga" "goargaloddi" "goargŋohaŋŋá" "goaski" "goaskin" "gollaš" "gollebeibboš" "gollecihci" "gollegahpir" "golli" "golláš" "gorgeshávda" "gorgeslihkká" "govuskuolfi" "gođaloddi" "gožuvuoražas" "guoikgáhrit" "guoikgárri" "guoksa" "guolbbavierru" "guolbbaviroš" "guolbbačoavžžu" "guollefálli" "guollečearret" "guorga" "guossabáhcatloddi" "guossagaccet" "guossaruossanjunni" "guossavizar" "guovssat" "guovssoloddi" "gussagoalsi" "guškilvierru" "guškilviroš" "guškkástat" "gáddebuvvet" "gáddeskirvi" "gáddevierru" "gáddeviroš" "gáhkkor" "gáiru" "gállat" "gálli" "gállit" "gáranas" "gáranasloddi" "gárggogoalsi" "gárgogoalsi" "gávlačuonjá" "hálkaloddi" "haŋŋá" "heartavizar" "hoaššacihci" "hurrat" "hurri" "hurrigoahppil" "hurričukčá" "háigir" "háigirloddi" "hálka" "hálkagonagas" "hálkačielkkis" "háskil" "hávda" "idjaskuolfi" "jeaggefálli" "jeaggemeahkástat" "jeaggečoavžžu" "jeaggehávut" "kanárialoddi" "keaisárpingviidna" "jiekŋačielkkis" "jiesmi" "jievjaskuolfi" "jievželoddi" "jávresopmir" "leahttofálli" "leahttospálfu" "leaibeloddi" "leivvoš" "lidnu" "liidn-elláš" "liin-elláš" "litnut" "livkkár" "loađgu" "loddi" "loddegonagas" "loddejievži" "luhkkaloddi" "láfol" "láhtospálfu" "látteguoksa" "látteguovssat" "láttovuonccis" "láŋgá" "meahkástat" "mearragoaski" "mearragoaskin" "mearragáiru" "mearračuonji" "mearračuonjá" "miellespálfu" "miesttacihci" "miesttarásttis" "miesttavizar" "miesttašurrevizar" "moldecizáš" "muhkkecizáš" "muogir" "muorracivkkán" "muorragakcu" "mákreallačearret" "niehttegarjá" "niitocivkkán" "njukča" "njurggu" "njurgut" "noaideloddi" "nuortacihci" "nuortalastavizar" "nuorti" "náhkkesoadjá" "oanehisnjunčuonjá" "paradiisaloddi" "pelikanloddi" "pingviidna" "ribeskáiti" "riddocivkaleivvoš" "riddovierru" "riddoviroš" "rievssat" "rievssatcižáš" "rievssatfálli" "roavgogonagas" "rohtogaccet" "rohtovizar" "rohtočoavžu" "rohtočoavžžu" "ruksesbađoš" "ruksesbeibboš" "ruksescivkaleivvoš" "ruksesfiehta" "ruksesguškil" "ruksesjuolčoavžžu" "ruksesruivil" "ruksesruoivil" "ruksesrásttis" "ruksessoadjá" "ruksessuorrehávut" "ruoivil" "ruonábeibboš" "ruonácihci" "ruonácizáš" "ruonájuolčoavžžu" "ruonáčáihni" "ruossalasnjunni" "ruovddagas" "ruovdecihci" "ruovdecizáš" "ruođa" "ruoššaboaimmáš" "ruoššaskire" "ruoššaskirri" "ruoššaállat" "ránescihci" "ránescizáš" "ránesháigir" "ráneslivkkár" "ránesrásttis" "ránesskuolfi" "ránesskávli" "ránessnárttal" "ránesčuonjá" "ránesčáihni" "rásttis" "rávgoš" "salletgáiru" "sallitgáiru" "seallecižáš" "siessemohkki" "sieđgacivkkán" "sildegáiru" "silkebuokča" "sitronbeštor" "skierru" "skilkeskálka" "skire" "skirri" "skiŋgegaccet" "skoarra" "skuolfi" "skutnjaloddi" "skáhpeloddi" "skáiti" "skárfa" "skárfačielkkis" "skávli" "snárttal" "soadjanjálla" "sopmir" "spoađđoduoršu" "spálfu" "stoarbmaloddi" "stoarbmaspálfu" "stohkkegaccet" "stohkkerievdu" "stohkkespálfu" "stohpoháigir" "stohpospálfu" "struhcca" "struhccaloddi" "stuorrafiehta" "stuorragiljobaš" "stuorraguškil" "stuorraguškkástat" "stuorrameahkástat" "stuorraskáiti" "stuorraskávli" "stuorravuodja" "stuorravuojaš" "stuorračarkkus" "stuorračoavžu" "stuorračoavžžu" "stuorračuonjá" "stálobeibboš" "stárra" "suoidnesuorsi" "suoidnečiksa" "suolaskáiti" "suorrespálfu" "suorsi" "suotnjoliráš" "suotnjočoavžžu" "suovkacihci" "suvlá" "sáhcomeahkástat" "sáhpánboaimmáš" "sáhpánskuolfi" "sáivahávda" "sávjahávda" "sávzaloddi" "toardnagarjá" "toardnagájon" "uhcabuokča" "uhcabuvvedat" "uhcabáiski" "uhcaciellá" "uhcacihci" "uhcameahkástat" "uhcanjukča" "uhcasaddi" "uhcavierru" "uhcaviroš" "uhcačoavžžu" "uhcačáihni" "ummolcizáš" "upmolcizáš" "unduláhtta" "uvlohávut" "varraloddi" "veastareaddji" "vigláčoavžžu" "vilgesnierčuonjá" "vilgessoadjaskávli" "vilgesummolcizáš" "vilgesvierru" "vilgesviroš" "vilgesčoavžu" "vilgesčoavžžu" "vilgessealčáihni" "vintán" "vuoncáčivga" "vuoncávaris" "vizardit" "vuodja" "vuojaš" "vuoktafiehta" "vuoktagaccet" "vuoktagoalsi" "vuoktaláfol" "vuoktaskárfa" "vuonccis" "vuonccisloddi" "vuoražas" "vuorččis" "vuovdaduvvá" "vuovdecivkaleivvoš" "vuovdegaccet" "vuovdeloddi" "vuovdemeahkástat" "vuovderásttis" "vuovdevizar" "vuovdevuorččis" "vuovdečoavžu" "vuovdečoavžžu" "ábirievssat" "áhpedokta" "áhpedovtta" "áhpeháskil" "áhpehávda" "áhpelihkká" "áhpespálfu" "ákta" "állat" "čarkkus" "čearret" "čiekčá" "čielkkis" "čierggesrásttis" "čiksa" "čoađgi" "čukčá" "čuohtegielas" "čuohtegiella" "čuonji" "čuonjá" "čuonjáfálli" "čáhcebávgoš" "čáhcevuonccis" "čáhppesbađošguškil" "čáhppesbuokča" "čáhppessealbeštor" "čáhppesgaccet" "čáhppesrásttis" "čáhppesčoavji" "čáhppesčoavžu" "čáhppesčoavžžu" "čáihnecizáš" "čáihnegaccet" "čáihni" "šilljocihci" ;

#LIST ANIMAL-PLANT =
    # Plants that are rather animals (lingustically)

SET ANIMATE = HUMAN OR ANIMAL ;
 

# Things

LIST TOOL = "áibmi" "ákšu" "bargobierggas" "baste" "bastevuogga" "báddi" "báddenrusttet" "beana" "bieggamillorusttet" "bierggas" "bissu" "bivttas" "boazonjuovvanniibi" "bohtal" "borramuš" "buiku" "buođđu" 
"čáhci" "čála" "čuoibmi" "datneárpu" "dáidda" "dálkkas" "dihtor" "dihtormašiidna" "doarta" "dolgevuogga" "dolla" "dorte" "duodji" "duorgu" "ettetviidni" "fierbmi" 
"gáddenuohtti" "gáidánuohtti" "gáffal" "gazirdanniibi" "giehta" "giehtamihttu" "giehtaváđđu" "gievdni" "giikan" "goallunstoahku" "gohppu" "golgadat" "gollebánno" "gurotgiehta" 
"hárpa" "HV-bissu" "jávrevuogga" "joddu" "joddu-buođđu" "kohppa" "kruvdnu" 
"láhkki" "liidna" "liidnesihkaldat" "luovosbeana" "luossavuogga" "luovosfierbmi" "lyra" 
"mašiidna" "miehkki" "mihttu" "millo" "millu" "mobiltelefovdna" "mohtorsahá" "muorječoaggi" "muorravuogga" "nállu" "niibi" "njuovvanniibi" 
"oaggunstággu" "oaggunstávra" "olgešgiehta" "olju" "roahkkefierbmi" "ruhta" "ruvdnu" 
"sahá" "sáiti" "sálti" "seaila" "siibma" "sihkaldat" "sirpe" "skárbban" "skierra" "snáldu" "soabbi" "soavvelvuogga" "speallanmášiidna" "spihkár" "stággu" "stávra" "stivrran" "suohpan" "suorbma" 
"váđđu" "veahkke#mohtor" "veaikebaste" "vealgi" "viidni" "vuogga" "vuoiddas" "vuoigŋanmašiidna" ;

   # Those could be further subdivided into: kitchen tools, working tools, hunting tools, fishing tools, writing tools...
  
#LIST FISHING-TOOL = "buođđu" "fierbmi" "gáddenuohtti" "giehtaváđđu" "goallunstoahku" "joddu" "joddu-buođđu" "liidna" "luovosfierbmi" "vuogga";

#LIST HUNTING-TOOL = "bissu" "HV-bissu" "njuolla";

#LIST KITCHEN-TOOL = "baste" "gealva" "millo";

#LIST WORKING-TOOL = "ákšu" "goaivu" "mohtorsahá" "nibi" "sirpe" ;

#LIST COMMUNICATION-TOOL = "mobiltelefovdna" ;

#LIST MACHINE = "bieggamillorusttet" "mašiidna" ;

#LIST EATING-TOOL = "gáffal" ;

#LIST MUSIC-INSTRUMENT = "hárpa" "lyra" ;

LIST WRITING-TOOL = "bliánta" "bleahkka" "dihtor" "krihtta" "liánta" "peanna";

#LIST HANDICRAFT-TOOL = "áibmi" "datneárpu" "nálu" "suorbmagoahti" "vikšamuorra" ;

# preliminary name for the set:
LIST ABSTR-T =  "ášši" "bargobearráigeahčču" "bargodearvvašvuođabálvalus" "bearráigeahčču" "cummá" "dánsa" "dánsu" "dearvvašvuođageahčču" "doarjja" "eallin" "fápmu" "gásta" "geahčču" "gullu" "heagga" "jahkebargu" "láhkavuođđudus"  "mearka" "oahppu" "oaidninvuohki" "preassadoarjja" "ruhtadoarjja" "soabadanproseassa" "sosialiserenproseassa" "suvli" "varra" ;

LIST SINGLE-SOUND = "fonema" "jietna" "jietnadat" "loahppajietnadat" "vokála" ;

    # Can be part of a word
LIST SOUND-SYSTEM = "básonšuokŋa" "čottajuoigan" "gohččun" "lávlunvuohki" "luohti" "musihkka" "riedja" "rohkos" ;

LIST LANGUAGE = "amasgiella" "álgogiella" "anársámegiella" "anárašgiella" "Áhkkilsámegiella" "áššemeannudangiella" "bargogiella"  "b-giella" "B-giella" "bihtánsámegiella" "Biŧonsámegiella" "bihtánsámegiella" "boaresdárogiella" "C-giella" "c-giella" "čállingiella" "dárogiella" "davvisámegiella" "davvisuopman" "dáččagiella" "diplomáhtagiella" "dološdárogiella" "duiskagiella" "dutkangiella" "eaŋgalasgiella" "eatnigiella" "eŋgelasgiella" "EU-giella" "fágagiella" "fránskkagiella"
"gárjilgiella" "giella" "girjegiella" "greikkagiella" "guovddášsámegiella"  
"hálddahusgiella" "hállangiella" "heasttaguolgagiella" "hebreagiella" "hollánddagiella" "hupmangiella" "islánddagiella" "jiddisch" "julevsámegiella" "julevsámegiella" 
"kvenagiella" "latiinnagiella" "latingiella" "láhtengiella" "lullisámegiella" "lullisámegiella" "lydegiella"
"máilmmegiella" "máttaoarjesuopman" "máttasámegiella" "mearrasámegiella" "meänkieli" "meissetgiella" "minoritehtagiella" "njenecgiella" "nuortalašgiella" "nuortasámegiella" "nubbingiella" 
"oahpahusgiella" "oarjesuopman" "oarjelsámegiella" "oarjesámegiella" "ođđadárogiella" "ovdasuomagiella" "ovdavuođđosuomagiella" 
"preussagiella" "ránskkagiella" "rievssatgiella" "romani" "ruoŧagiella" "ruoššagiella" "ruoššadárogiella" "ruovttugiella" "sáme-dárogiella" "sámegiella" "sámojedagiella" "skandinávagiella"  "skoaltagiella" "spánskagiella" "substantiivagiella" "suomagiella" 
"thaigiella" 
"ubmisámegiella" "Ubmisámegiella" "unnitlogugiella" "váldogiella" "veahádatgiella" "verbálagiella" "vierisgiella" "vierrogiella" "vuođđodárogiella" "vuođđogiella" "vuođđosámegiella" "vuođđosuomagiella" "vuosttasgiella" "vuosttašgiella" ;

SET SOUND = SINGLE-SOUND OR SOUND-SYSTEM OR LANGUAGE ;

LIST SATNI = "adjektiiva" "advearba" "bárahisstávvalvearba" "boazosápmelaštearbma" "doaba" "kásushápmi" "kontráktavearba" "laktapartihkkal" "laktapartihkal" "namma" "partihkal" "partihkkal" "postposišuvdna" "preposišuvdna" (".*tearbma"r) "sátni" "sátnemátta" "substantiiva" "tearbma" "vearba" (".*sátni"r) (".*namma"r) ;

    ## tool for verbal activity

LIST WORD-PARTS = "akseantamearka" "bustávva" "B-bustávva" "C-bustávva" "goallossáhcu" "gravismearka" "stávval" ;

LIST SIGN = "akseantamearka" "čuokkis" "duppalčuokkis" "gažaldatmearka" "goallossáhcu" "gravismearka" ;

SET ABSTR-TOOL = SOUND OR ABSTR-T ;

# Premilinary dividing of the set as a help for dimambiguating "gullat" vs. "gullát".  
 
#Those are typically comitative (instead of locative) if they go together with verbs from the LIST HUMAN-AGENT-V and probably also from INTELLECTUAL-ACTIVITY-V. The counterpart for locative is until now SITUATION, we might have to consider making a new list ABSTR-TOOL comprising SITUATION and other elements.

# qualities
# - - - - -

LIST COLOUR = "alit" "čáhppat" "fiskat" "fioleahtta" "ránes" "ruoná" "ruoksat" "runta" "ruškat" "sáhppat" "vielgat" "violeahtta";

# objects, not necessarily tools
# - - - - - - - - - - - - - - - -

LIST MATERIAL = "ávnnas" "báhkki" "bohcconáhkki" "gusanáhkki" "materiála" "muorra" "náhkki" "ullu" "sávzzanáhkki" "silba" "stálli" ;
  
LIST PLANT-PART = "lasta" "ruohtas" "upmol" ;
 
    # of plants etc. 
  
LIST SHOE = "čázet" "gállot" "gálssot" "gáma" "goikket" "gummestevvel" "njuorjjot" "nuhtat" "nuvttat" "nuvttot" "sabet" "sáppat" "sisttet" "skárri" "skuovva" "stevvel" "suohkku" "ullosuohkku" ;

    # anything that will go on feet. IV-verbs like "vázzit" can take these as objekt.
    
LIST BEDCLOTHES = "beaska" "gávdni" "oađádat" "rátnu" "roavgu" "seaŋga";

    # anything that can be used as bedclothing. IV-verbs like "oađđit" can take these as objekt. 
    
LIST CLOTHES = "báidi" "beaska" "bivttas" "boagán" "buksa" "čikŋabivttas" "čuvla" "dálvebivttas" "dorka" "gákti" "gárvu" "geassebivttas" "kamelguolgabivttas" "láđđebivttas" "láđđegákti" "liidnegákti" "náhkkeboagán" "olgguldasbivttas" "sámebivttas" "sisbáidi" "sistegákti" "sámegákti" "T-báidi" ;
   

LIST FOOD = "beatnatmuorji" "biebmu" "biergu" "bohccobiergu" "bohccobiergoborramuš" "borramuš" "čáhppesmuorji" "eanamuorji" "fuođar" "goikeguolli" "gordni" "guossemális" "jáfu" "jokŋa" "láibi" "mális" "málli" "meahccemuorji" "ruksessarvabiergu" "sarrit" "vuodjagáhkku" ;

    # potential tool for political activity etc., potential place for other food, insects etc.

LIST POISONOUS-FOOD = "dierpmámuorji" ;
    
LIST FOOD-TIME = "gaskabeaibiebmu" "iđitbiebmu" ;

LIST LIQUID = "bohccomielki" "bruvsa" "buolleviidni" "buollinviidna" "čáhci" "čáhppesmuorjesákta" "čielgamielki" "deadja" "duolvačáhci" "gáffe" "gáiccamielki" "gearra" "goden" "gusamielki" "jugus" "juhkamuš" "mielki" "ruksesviidni" "sarritsákta" "sáivačáhci" "sákta" "sávzzamielki" "suvrramielki" "viidna" "viidni" "vilgesviidni" "vuola" "vuolla"  ;

    
LIST PLANT = "alášbađverássi" "alitdiehpperássi" "ávža" "báhpačehporaš" "beahci" "bastilislátnjá" "beahceguolbba" "beatnatnjuovččarássi" "biehtárguhkká" "biehtárrássi" "bievlaguolbba" "boallorássi" "biellodaŋas" "biellorássi" "cizašvuolpu" "duopma" "duottarbusságeahpil" "fiikkonmuorra" "fiskesrássi" "gálla" "gámasuoidni" "gáiski" "gáskálas" "gieddeguolbba" "gieddemáđir" "gollerássi" "guossa" "heasttagazzarássi" "horbmá" "jámešbátni" "jeagil" "juopmu" "lastamuorra" "lageš" "leaibi" "miestta" "muotkenjárgaguolbba" "niittoguolbba" "njálanjuovčča" "oaivejeagil" "oaksi" "rásseguolbba" "reatká" "sállja" "sieđga" "skáhpi" "skierri" "soahki" "suhpi" "uvlorássi" "vándádivga" "vilgesmáđir" "vuodjarássi" "vuovdeguolbba" ;

    # Plants could be actors in fairytales (Alice)
    

LIST FURNITURE = "áltár" "beavdi" "hildu" "ildu" "seaŋga" "skáhppe" "soffá" "stuollu" ;

LIST CONTAINER = "bohtal" "čáhcelihtti" "dáigelihtti"  "eappir" "fárppal" "gohppu" "gordnelihtti" "gore"  "guollelihtti" "jienastanlihtti" "lieggačáhcelihtti" "lihtti" "mielkelihtti" "muorralihtti" "oljolihtti" "ruskalihtti" "sáltelihtti"  "sohkarlihtti" "sovsalihtti" "tempelbumbá" "veaddelihtti" "vuoššanlihtti" ;

  #Those always function as units too, such as in: A bottle of water.

# People can be inside them:
LIST SPACIOUS-VEHICLE = "áhpeguolástanfanas" "biila" "boastabiila" "borjjasfanas" "borjjasvanca" "buohccebiila" "buohccibiila" "bussa" "busse" "čáhcegirdi" "dámpa" "drošša" "drošše" "fanas" "fievru" "gádjunhelikopter" "gálvobiila" "gávpotbussa" "gávpotbusse" "girjebusse" "geaksu" "girdi" "guollefanas" "guorbmebiila" "helikopter" "johkafanas" "láivi" "minibussa" "minibusse" "mohtorfanas" "mohtorfievru" "mohtorvanca" "njealjit" "njealljejuvllat" "olgoriikkafeastonuohttefanas" "ruvttobiila" "skuvlabiila" "skuvlabussa" "skuvlabusse" "suhkkivanca" "tákse" "táksi" "traktor" "tráktor" "vanas" "vanca";

# People cannot be inside them:
LIST SMALL-VEHICLE = "ásen" "beana" "fievrošibit" "heargi" "heasta" "mánásihkkel" "meahccesihkkel" "mohtorgielká" "mohtorsihkkel" "mopeda" "nieidamánásihkkel" "njealljejuvllat" "sihkkel" "skohter" "skuter" "sykkel" ;

SET VEHICLE = SPACIOUS-VEHICLE OR SMALL-VEHICLE ;

LIST TEXT = (".*listu"r) (".*čálus"r) (".*girji"r) (".*gažaldat"r) (".*aviisa"r) (".*áviisa"r) (".*bábir"r) (".*logahallan"r) 
"bargobihttá" (".*prográmma"r) (".*lávlla"r) (".*bláđđi"r) (".*mearrádus"r) "bušeahttapoasta" (".*čála"r) (".*cealkámuš"r) "čuovus" 
(".*teaksta"r) (".*dieđáhus"r) (".*journála"r) "dokumeanta" (".*girje"r)  
"e-poasta" (".*eksamen"r) "eksamenbihttá" 
"fáddásiidu" "fáksa" "gáldu" "gullugovva" "journálačállin" "journáladiehtu" 
"kárta" "lasta" "láhka" "láđđi" "leaksu" "mátkemuitalus" "mielddus" 
"neahttasiidu" "novealla" (".*raporta"r) (".*reive"r) "riektedieđa" "romána" "ruovttubargu" "ruovttusiidu" (".*konvenšuvdna"r)  "sárdni" "sitáhtta" "statistihkka" "telegrámma" "váidda" ;

  # A potential place (locative?) for sth. written.
  # Maybe one should differentiate between written and spoken texts

LIST ABSTR-TEXT = "alimusriektemearrádus" "almennetmearrádus" "almmuhusteakstaevttohus" "areálaplána" "áideplána" "áigeplána" "áittardanplána" "ákšuvdnaplána" "álbmotmeahcceplána" "álbmotriektemearrádus" "árvalus" "ássanplána" "bartaplána" "bábermearrádus" "bábirmearrádus" "bággolonistanmearrádus" "bálvalusplána" "bivdoáigemearrádus" "bivdomearrádus" "boazodoalloláhkaevttohus" "borasdávdaplána" "boarrásiidplána" "boazodoalloplána" "buoridanplána" "buhtadusortnet" "bušeahttaevttohus"  "buhtadanmearrádus" "buoridanevttohus" "bušeahttamearrádus" "bušeahttamálleevttohus" 
"cuvccas" "čađahanmearrádus" "čađahanplána" "čoahkkeplána"
"dearvvašvuođaplána" "departemeantaevttohus" "diibmojuohkoplána" "diehtojuohkinplána"  "dievasčoahkkinmearrádus" "diggemearrádus" "divvunplána" "doaibmabidjoevttohus" "doaibmaplána" "doallo-ortnet" "doalloplána" "doarjjaortnet" "dulvadanevttohus" "dulvadanmearrádus" "dulvadanplána" "dutkanplána" "duodjeoahppoplána" "duodjeplána"
"eaktu" "eanačujuhus" "eanačujuhancealkámuš" "eanandoalloplána" "eanaháldenplána" "eananjuohkinmearrádus" "eanaláhkamearrádus" "eanamihtidannjuolggadus" "eananvuovdinnjuolggadus" "eanavuovdinmearrádus" "eanetlohkomearrádus" "eaŋkalmearrádus" "earremearrádus" "ekonomiijaplána" "elfápmoháhkanplána" "energiplána" "eSápmiplána" "EU-mearrádus" "evttohus" 
"fáddáevttohus" "fágaplána" "fágaidoahppoplána" "fápmudusmearrádus" "fálesráfáiduhttinmearrádus" "fievrridanplána" "finnmárkkuláhkaevttohus" "friddjasuohkanmearrádus" "fylkkadiggemearrádus" "fylkkageaidnoplána" "fylkkaoasseplána" "fylkkaplána" "fylkkaplánaevttohus" 
"geaskoevttohus" "gažaldat" "gáhtteneaktu" "gáhttenplána" "gárrenmirkoplána" "gáržžidanevttohus" "gáržžidanmearrádus" "gávpemearrádus" "geasku" "geaidnoplána" "gealboplána" "geavahanplána" "gelbbolašvuođaplána" "gelbbolašvuođaloktenplána" "generálplána" "gielddaoasseplána" "gielddaplána" "giellagažaldat" "giellamearrádus" "giellanjuolggadus" "giellaoahppaplána" "giellaovddidanplána" "guođoheaddjibartaplána" "guolástanmearrádus" "guollebivdomearrádus" "guovddášlihttu" "guovttegielalašvuođaplána"
"haddeevttohus" "haddemearrádus" "hálddašandoaibmaplána" "hálddašanortnet" "hálddahusplána" "hálddašanmearrádus" "heivehanplána" "huksenáššemearrádus" "huksenplána" "ILO-soahpamuš" "investerenplána" "IO-plána" "IT-doaibmaplána" "jahkeplána" "jearaldat" "jođihanplána" "johtolatdorvvolašvuođaplána" "journálavurkenortnet"
"konsešuvdnamearrádus" "kultursuodjalanmearrádus" "kulturplána" "kulturviessoplána"
"lasihanplána" "láhkarievdadanevttohus" "láhkaásahusmearrádus" "láhkaevttohus" "láhkamearrádus" "láhkamuddenevttohus" "láhkarievdadanevttohus" "láhttoevttohus" "láigohaneanavuovdinmearrádus" "lávdegoddeevttohus" "lihttoláigohanmearrádus" "luođaleaktu" "lonuhanmearrádus" "luossabivdomearrádus" 
"máinnas" "mánáidgárdeplána" "márkanplána" "mátkeplána" "mearrádus" "mearrádusevttohus" "mearrahápmanplána" "muddenmearrádus" "muddenplána" "muitalus" "murjenmearrádus" "muorračuohppanplána" "murrenmearrádus" 
"nannenplána" "njuolggadus" "njuolggadusevttohus" "nuoraidplána" "nuppástusevttohus" 
"oahppoplána" "oanidanmearrádus" "ođastusevttohus" "orohatplána" "ovdaplána" "ovddidanplána" "ollašuhttinplána" "ovttastahttinmearrádus" "plánaevttohus" "plánamearrádus" "prejudikáhtamearrádus" "prinsihppamearrádus" "prošeaktaplána" 
"ráfáiduhttinplána" "ráhkadanplána" "rámmaplána" "ráŋggáštusmearrádus" "rávdnjevuogádatplána" "resolušuvdna" "riektecealkámuš" "riektemearrádus" "rievdadanevttohus" "riikkaoasseplána" "rusttetplána" "ruvkeplána"
"sámekodisilla" "Sámediggeplána" "sámeguovllumearrádus" "sámemearrádus" "sierralohpemearrádus" "sierramearrádus" "sisdoallomearrádus" "skuvlaplána" "skuvlenplána" "soahpamuševttohus" "sosialplána" "sosiálaplána" "spiehkastanmearrádus" "stivrramearrádus" "strategiijaplána" "suodjalanevttohus" "suodjalanmearrádus" "suodjalanplána" "suorgeplána" "suvdinplána"
"teáhterplána" "tearbmaevttohus" "traktáhtamearrádus" 
"váiddamearrádus" "váldesirdinmearrádus" "váldogeaidnoplána" "váldomearrádus" "várddusplána" "veajuiduhttinplána" "vearromearrádus" "vearuhanmearrádus" "viiddidanplána" "virgáibidjannjuolggadus" "vuođđoláhkaevttohus" "vuođđoláhkamearrádus" "vuođđomearrádus" "vuoruhanplána" "vuovdedoalloplána" "vuovdemearrádus" "Wienersoahpamuš" 
"1873-mearrádus" "1967-mearrádus" ;

  # A potential place (locative?) for sth. written, spoken or abstract activity 
  
# Part-whole for human

LIST BODY = "ámadadju" "bahta" "bahtaráigi" "bállosuotna" "bátni" "beađbelađas" "bealgi" "beallji" "bierggas" "biežadákti" "billu" "buđđá" "čalbmedeahkki" "čalbmi" "čatnangođđu" "čeabet" "čelččen" "čeŋkkeš" "čibbeskálžu" "čibbi" "čižžebátni" "čielgeađa" "čielgedákti" "čielgi" "čoalli" "čoamohas" "čoarbbealdeahkki" "čoarbbeallađas" "čoarbbealli" "čoavji" "čorbma" "čorbmaoassi" "čorbmaváimmus" "čorbmavuođđu" "čotta" "čuožžamasdeahkki" "čurti" "čuvdi" "dábba" "dáđvi" "dáktegođus" "dákti" "dávdi" "deahkkegođus" "deahkki" "erttet" "erttetdeahkki" "gahpárus" "gahperus" "gardnjil" "gaskasuorbma" "gassačoalli" "gassaváhkká" "gáddu" "gáibi" "gállu" "gánis" "gátnis" "geađđi" "geahpis" "giegir" "giehta" "giehtadeahkki" "giehtagávva" "giehtaláhpi" "giehtaramas" "giehtaruohtta" "giehtasealgi" "giehtaváibmu" "giehtaváimmus" "gilga" "goapmirváimmus" "goaŧŧočotta" "goaŧŧu" "goikedákti" "gorut" "gullu" "guoggomas" "guoggomasráksá" "gurotgiehta" "hárdu" "heaggaroasmmoheapmi" "jarri" "juolgebealgi" "juolgečelččen" "juolgegávva" "juolgelađas" "juolgeláhpi" "juolgemátta" "juolgesuorbma" "juolgevuođđu" "juolgi" "lađas" "láhpelađas" "manin" "mannejođas" "manneráksá" "maŋŋebuoidi" "mánágoahtečotta" "mánágoahti" "mielganjunni" "monimuš" "monin" "monnejođas" "monneráksá" "morčesuotna" "morči" "muohtu" "náhpi" "niehkki" "nierra" "niskegohpi" "niski" "njálbmi" "njiehcehas" "njunni" "njuovčča" "oaiveassi" "oaivečohkka" "oaivi" "oalgedeahkki" "oalgenorasdeahkki" "oalgenorasváhkká" "oalgi" "oalul" "obbalággá" "orbbeš" "raddi" "rápma" "rumaš" "rumašgolggus" "rumašlahttu" "rumašnjalbi" "sáhppesuvri" "rumašgolggus" "rumašlahttu" "rumašnjalbi" "sáhppesuvri" "siidu" "siskkitbeallji" "sotkenoalli" "spiral" "suolbmudanoalli" "suorbma" "suorbmageahči" "šušmi" "váhkkádeahkki" "váibmu" "vuohččecuozza" "vuoivvas" "vuokta" "vuolit" "oassi" "gieđas" "vuorggu";

LIST WEATHER-ENTITY = "balva" "arvi" "muohta" ;

    
SET OBJECT = PLANT-PART OR SHOE OR FOOD OR TEXT ;

    # entities which not necessarily are tools

# Places
LIST BUILDING = "áiti" "ámmátskuvla" "biebmorámbuvri" "barta" "badjedállu" "boasta" "buohcciidsiida" "buohcciviessu" "buvda" "buvri" 
"dállu" "dálveskuvla" "dálveviessu" "eanandoalloallaskuvla" "fáŋgaviessu" "fiervábuvri" 
"geaidnogievkkan" "geardeviessu" "geassebuvri" "goahti" "gávpi" "gielddaskuvla" "girku" "hotealla"
"internáhttaskuvla" "inšenevraallaskuvla" "kafeá" "krambuvda" "kulturskuvla"  "láđđu" "láhtu" "lávvu" "lonuhusgávpi" 
"mánáidskuvla" "mearrabuvri" "mearraskuvla" "musihkkaallaskuvla" "návet" "návetgoahti" "návsti" "návstu" "nuoraidskuvla" 
"oktasašbarta" "orrunviessu" "poasta" "priváhtaskuvla" "ráidoviessu" "rámbuvri" "rámbuvra" "rásseláđđu" "riikaskuvla" "riikabuohcciviessu" 
"sámeskuvla" "skuvla" "stálla" "stálle" "stállja" "stohpu" "synagoga" "šloahtta" 
"tempel" "tuolloviessu"  "universiteahta" "viessu" "visti";

LIST GENERAL-PLACE = "aktoráđđenguovlu" "albmi" "almmiravda" "almmiriika" "areála" "atnueana" "Árjepluovi-guovlu" "ásodatguovlu" "ássanbáiki" "ássanguovlu" 
"badjegeardi" "badjeeana" "badjeeanan" "bartaguovlu" "báikegoddi" "báiki" "báktehárji" "bealdu" "bieggabáiki" "biras" "bivdoguovlu" "boazodoalloguovlu" "boazoguovlu" "boazoguohtoneana" "boazoguohtoneanan" "buođđosadji" 
"čakčaeana" "čakčaeana" "čakčaeanan" "čakčabáiki" "čakčaorohat" "čiegus" "čoahkkebáiki" 
"dálvebáiki" "dálveeanan" "dálveeana" "dálveguohtoneana" "dálveguohtunguovlu" "dálveorohat" "dáruiduhttinguovlu" "davviguovlu"  "davviriika" "davvisiida" "dánssabáiki" "diggebáiki" "dimbbarčuohppansadji" "distribušuvdnaguovlu" "doaibmaguovlu" "dollagáddi" "duiskaeana" "duottarguovlu" "dutkanguovlu" "eanandoallo-eana" "eanandoalloeana"  "eanadoalloguovlu" "eretfárrenguovlu" "earresadji" "fabrihkkaguovlu" "fanasláttasadji" "fágabiras" 
"gáddebáiki" "gádderavda" "gáhttenguovlu" "gávpebáiki" "gávpemárkan" "gávpot" "gávpotpoarta" "geahččanguovlu" "geaidnoguorra" "geaidnoravda" "geassebáiki" "geasseeana" "geasseeanan" "geasseguohtoneanan" "geasseguohtoneana" "geasseorohat" "geassesadji" "geavahanguovlu" "gilli" "giliguovlu" "giddagasbáiki" "giđđabáiki" "gieddeeana" "giliguovlu" "gilvvagárdi" "gilvvohallanbáiki" "girkogárdi" "guovlu" "goahtesadji" "goikeeana" "goikeeanan" "guoddinseaŋga" "guohtunguovlu" "guolástanguovlu" "guolástusguovlu" "guollebáiki" "guollebivdosadji" "guohtoneana" "guohtoneanan" "guohtuneana" "guottetbáiki" "guovddášguovlu"
"hálddašanguovlu" "hámman" "hávdeeanan" "hávdeeana" "helvet" "jeaggeeanan" "jeaggeeana" "jeaggeeanan" "jeagelguovlu" "jeagelguohtuneana" "jienastanbáiki" "johtinguovlu" "julevsámeguovlu" 
"kálkaeana" "kontineanta" "konvenšuvdnaguovlu"
"lagašguovlu" "lassieana" "láigoeana" "leansmánniguovlu" "LNF-guovlu" "lulliguovlu" "lullisámeguovlu"  "luomeeana" "luossabáiki" "luonddubiras" 
"mandáhttaguovlu" "máilbmečiehka" "máilbmi" "márkan" "máttaguovlu" "máttasámiguovlu" "meahcceeana" "meahccegilli" "meahceguovlu" "mearraloddeguovlu" "mearrasámiguovlu" "mearrasuodjalusguovlu" "njáskanbáiki" "njunušsadji" "nuortaeana"
"oahppobáiki" "oaivegállobáiki" "oktasašeana" "oktasašeanan" "oktasašguohtoneanan""oktasašguovlu" "oktasašorohat" "olgobáiki" "olgoriika" "orohat" "orrunbáiki" "orrunguovlu" "priváhtaeana" 
"rasttidanbáiki" "ravdaguovlu" "rádjaguovlu" "rádjeguovlu" "rádjeguohtunguovlu" "ránnáriika" "riddoeana" "riddoguovlu" "riggodatguovlu" "riika" "ruoktu" "ruovdemáđidja" "ruovttueanan" "ruovttueana" "ruovttuguovlu"
"sadji" "sáidebáiki" "seahkalasgiellaguovlu" "šákšadorskeguovlu" "sámieana" "sámeeana" "sámigielatguovlu" "sámevearroeana" "sámeguovlu" "sámiguovlu" "siseatnanguovlu" "sohkaguovlu" "sallju" "searveguovlu" "siida" "siseana" "skáhpponguovlu" "skoaltabáiki" "skuvlabiras" (".*šillju"r) "SOF-guovlu" "stáhtaeana" "stáhtaálbmotguovlu" "stáhtasadji" "suopmanguovlu" 
"TV-šearbma"
"váhneneana" "váhneneanan" "váldoássanguovlu" "várdobáiki" "vearroeana" "viessosadji" "viesttarbađaeana" "virgebáiki" "vuoiŋŋastanbáiki" "vuotnaguovlu" "vuolggaguovlu" "vuopmeeana" "vuovdeguovlu" ;

LIST NATURE-PLACE = "almennet" "ávži" "bákti" "beahcevuovdi" "borri" "buollánávži" "coagis" "čázádat" "čolpi" "darfejeaggi" "dearbmi" "duottarjávri" "duottaroassi" "eatnu"
"fielbmá" "fiervá" "gáisá" "gáisi" "gárggu" "gárgu" "gieddi" "gievajeaggi" "gohpi" "gohppi" "gorži" "guolbban" "gurra" "jávri" "jávregáddi" "jeaggi" "jiehkki" "johka" "johkagaska" "johkagáddi" "johkaleahki" "johkanjálbmi" 
"láddu" "láttu" "latnja" "lavdnjejeaggi" "leahki" "lokta" "luohkká" "luokta" "luondu" "luoppal" "luossajohka" "meahccegieddi" "mearra" "mielli" "mohkki" "muotki" "njárga" "njunni" "oaivi" "oalgejohka" "oalgi" "orda" "orrit" 
"reašši" "riddogáddi" "riddu" "riidi" "ruovttugieddi" "soahkevuovdi" "stealli" "várrevielti" "várri" "vearroduottar" "vielti" "vuohppi" "vuotnabahta" "vuotnagáddi" ;

#LIST ELEMENT = "áibmu" "čáhci" "dolla" ;

    ## (probably often place) They are often tools - they are not probably Pl Loc.

LIST SETTLEMENT-PLACE = "ássanguovlu" "duottar" "eana" "eanaguovlu" "eanan" "eatnan" "gáddi" "geassesiida" "Gennesaretjávregáddi" "gilli" "guovlu" "mátkeguovlu" "meahcci" "mearragáddi" "njárga" "riddu" "sámisiida" "siseana" "siseanan" "siseatnan" "siseatnansiida" "sisvuotna" "suolu" (".*jávregáddi"r) "vággi" "vuotna" "vuotnabahta" "vuotnagáddi" "vuotnaguovlu" "vuovdi" ;

SET GEOGRAPHICAL-PLACE = NATURE-PLACE OR SETTLEMENT-PLACE ;

LIST GEN-POLITICAL-PLACE = "gávpot" "gilli" "girkosuohkan" "fylka" "mearragáttesuohkan" "miellahttosuohkan" "orohat" "rádji" "riddosuohkan" "riika" "riikarádji" "ruovttugávpot" "sámeeana" "Sámeeana" "siseatnangilli" "siseatnansuohkan" "stáhta" "suohkan" "válgabiire" "vuotnagávpot" "vuotnasuohkan" ;

  ## can also function as an actor
  
LIST FYLKA = "Finnmárku" "Finnmarku" "Romsa" "Nordlánda" "Lulli-Trøndelag" "Davvi-Trøndelag"
       "Hedmárku" "Akershus" "Buskerud" "Vestfold" "Østfold" "Aust-Agder" "Vest-Agder"
       "Rogalánda" "Hordalánda" "Opplánda" "Fjordane" "Romsdal" "Telemark" ;

LIST NORGA = "Dánmárku-Norga" "davviNorga" "Davvi-Norga" "gaska-Norga" "Norga" "norga" "norggabealli" "Norgga-ruoŧŧa" ;

LIST NATION-NOT-NORGA = "Columbia" "Duiska" "Frankriika" "Guatemala" "Israel" "Kanada" "Láhten-Amerihká" "náššuvdna" "riika" "Ruošša" "Ruoŧŧa" "Sápmi" "sápmi" "Skandinávia" "stáhta" "Suopma" "Suopma-Ruošša" ;

LIST GIELDA = "fylkkagielda" "gielda" "guovddášgielda" "hálddašangielda" "riddogielda" "ruovttugielda" "sámegielda" "Sámegielda" "vuotnagielda" ;

    
SET NATION = NATION-NOT-NORGA OR NORGA ;

SET POLITICAL-PLACE = NATION OR GEN-POLITICAL-PLACE OR FYLKA OR GIELDA ;

    # Can be an actor

  
# This set is important for distiguishing "vuodjit" and "vuodjat", so there shouldn`t be words which can be combined with "vuodjat":
LIST CONCRETE-ROUTE = "Álttá-Kárášjoga-máđidja" "Álttá-Kárášjoga-máđii" "bálggis" "bievlageaidnu" "dálveluodda" "dálvemáđidja" "dálvemáđii" "eanadatluodda" "E6-bálggis" "gáhta" "gávpotgáhta" "geaidnu" "guorra" "johttingeaidnu" "kulturluodda" "láhttu" "luodda" "luonddubálggis" "máđidja" "máđii" "meahcceluodda" "ráidu" "reahpenráigi" "spáiddarráidu" "suohkanluodda" "váldogeaidnu" ;
 # and others!

LIST ABSTR-ROUTE = "gaska" "mátki" "miila" "mohkki" "tuvra" ;

SET ROUTE = CONCRETE-ROUTE OR ABSTR-ROUTE ;
 

LIST WATER = "ája" "áhpi" "álddis" "basseaŋŋa" "čáhci" "cázádat" "deanučáhcadat" "deanucázádat" "eatnu" "fielbmá" "jávri" "johka" "luokta" "mearra" "sállannuorri" "sálteája" "vuodjanálddis" "vuojadanálddis" "vuotna" ;

LIST GOAHTI-PLACE = "árran" "boaššu" "loaidu" "reahpenráigi" "soggi";
 

LIST ROOM = "bargomárkankantuvra" "bártniidhivsset" "biergodiehtojuohkinkantuvra" "boazodoallokantuvra" "čájáhuslatnja" "ealáhuskantuvra" "ealáhuskántuvra" "eamiálbmotkantuvra" "eanajuohkinkantuvra" "eananvuovdinkantuvra" "eanavuovdinkantuvra" "feaskkir" "fylkkaeanadoallokantuvra" "gámmár" "gámmir" "garáša" "gievkkan" "guovllukántuvra" "guovllukantuvra" "hivsset" "informašuvdnakántuvra" "kántuvra" "kantuvra" "klássalatnja" "leansmánnekantuvra" "lášmmohallansále" "lášmmohallansálla" "livnnetkantuvra" "livnnetkántuvra" "lokta" "luohkkálatnja" "molssodanlatnja" "nieiddaidhivsset" "nohkkanlatnja" "oađđenlatnja" "oađđinlatnja" "oahpaheaddjilatnja" "sallju" "skuvlalatnja" "sosiálkantuvra" "stohpu" "studio" "šillju" ;

SET PLACE = GEOGRAPHICAL-PLACE OR POLITICAL-PLACE OR GENERAL-PLACE OR ROUTE OR BUILDING OR ROOM OR GOAHTI-PLACE ;


LIST ORGANIZATION = (Prop Org) "alimusriekti" "álbmotallaskuvla" "allaskuvla" "ámmátorganisašuvdna" "ámmátskuvla" "ámtadiggi" "ásahus" "bargokantuvra" "báhpaskuvla" "báikkálašsearvi" "bálvalandoaibma" "bearráigeahččanorgána" "bellodat" "birasgáhttendepartemeanta" "boazodoallosearvi" "buohccestohpu" "buohcceviessu" "buohcciidsiida" 
"dearvvašvuođaásahus" "dearvvašvuođafitnodat" "departemeanta" "departementa" "dearvvašvuođadutkanguovddáš" "diggi" "doaibmaguovddáš" "duopmostuollu" "dutkandepartemeanta" "dutkanráđđi" 
"ealáhusráđđi" "eanandoallodepartemeanta" "eanandoallodepartementa" "eanandoallosearvi" "eananjuohkindiggi" "eiseváldi" "etáhta" "etáhtta" 
"fakultehta" "Finnmárkkukommišuvdna" "firbmá" "fitnodat" "fylkkagielda" 
"geahččodoaibma" "geahččoeiseváldi" "gelbbolašvuođaguovddáš" "giddagas" "gieldadepartementa" "gielddadiggi" "giellaguovddaš" "giellaossodat" "giellaráđđi" "girjerájus" "girku" "girkoráđđi" "gozihankomitea" "guolástandepartemeanta" "guovddášeiseváldi" "guovddášsearvi" "guovllustivra" "guovllubuohcceviessu" 
"hálddašanorgána" "hálddahus" "dearvvašvuođaásahus" "dearvvašvuođaguovddáš" "fylkkadiggi" "instituhtta" "institušuvdna" "IT-ovttadat" 
"jándorásahus" "jienastanstivra" "joatkkaskuvla" "johttisámisearvi" "justisdepartemeanta" "justiskomitea" "kantuvra" "klinihkka" "komitea" "komišuvdna" "kulturlávdegoddi" "kulturmuitoráđđi" "láhkaásahus" "lávdegoddi" "Luondduhálddašandirektoráhta" "luondduhálddašan-direktoráhta" "luondduhálddašandirektoráhta" "mánáidgárdi" "mánáidskuvla" "media" "meieriija" "militeara" "musea" 
"našunáldiggi" "nuoraidskuvla" "oahpahusdoaibma" "oahpaheaddjisearvi" "oahpahusráđđi" "olgoriikkadepartemeanta" "organisašuvdna" "orgána" "ossodat" "ovdaskuvla" "parlameantta" "psykiatriijabuohcceviessu" "preassa" "ráđđehus" "ráđđi" "regulerenráđđi" "riekteásahus" "riikasearvi" "riikkasearvi"
"Sámediggeráđđi" "Sámediggeráđđi" "Sámediggi" "sámediggi" "sámeinstitušuvdna" "sámekomitea" "Sámelávdegoddi" "sámemišuvdna" "sámemusea" "sámiráđđi" "sámesiida" "sámeskuvllastivra" "sámivuoigatvuođalávdegoddi" "searvegoddi" "searvi" "servodat" "sierraduopmostuollu" "skuvla" "skuvlakantuvra" "skuvlla" "stáhta" "stuorradiggi" "suodjalankomitea" "suohkan" "suohkanstivra" "synagoga" 
"universiteahtta" "universitehta" "universitehtabuohcceviessu" "virgáibidjanráđđi" "vuođđoskuvla"  "vuoigatvuođalávdegoddi"
"dearvvašvuođastašuvdna" "gielda" "riddogielda" "ruovttugielda" "sámegielda" "Sámegielda" "válgalávdegoddi" "vuotnagielda" ;
 
# those can both be buildings and represent humans

LIST INSTITUTION = "audiopedagogabálvalus" "álgobálvalus" "álgodearvvašvuođabálvalus" "bagadanbálvalus" "báikenammabálvalus" "bálvalus" "bátnedearvvašvuođabálvalus" "bearráigeahččanbálvalus" "bibliotehkabálvalus" "birrajándorbálvalus" "bolesbálvalus" "čállinbálvalus" 
"databálvalus" "dábálašdoavtterbálvalus" "dálveluoddabálvalus" "dearvvašvuođabálvalus" "dearvvašvuođageahčču" "dieđihanbálvalus" "diehtojuohkinbálvalus" "divvunbálvalus" "doarjjabálvalus" "dulkonbálvalus" "duollobálvalus" 
"fierpmádatbálvalus" "fysioterapiijabálvalus" "fitnodatdearvvašvuođabálvalus" "fuolahusbálvalus" "fuollabálvalus" 
"gádjunbálvalus" "geahččoortnet" "gielddadearvvašvuođabálvalus" "girjerádjobálvalus" "girjerájusbálvalus" "girkoráđđi" "gohccibálvalus" "govdafierpmádatbálvalus" "gulahallanbálvalus" "guovddáš" "huksehanbálvalus" 
"instituhtta" "inšenevrabálvalus" "jordamorbálvalus" "jorgalanbálvalus" "konsuleantabálvalus" "kulturráđđi"
"maŋŋáhárjehallanbálvalus" "mánáidsuodjalus" "mánáidsuodjalusbálvalus" "meahccebálvalus"  "mielladearvvašvuođasuodjalus" "militearbálvalus" "neahttabálvalus" "nuoraidbálvalus" 
"oaivadanbálvalus" "oahpahusbálvalus" "oassebálvalus" "olgoipmilbálvalus"  "oskkubálvalus" 
"PP-bálvalus" "poastabálvalus" "ráfibálvalus" "ruovttobálvalus" "ruovttubálvalus" "sámegielbálvalus" "searvegodderáđđi" "servodatbálvalus" "sihkarvuođabálvalus" "skuvladearvvašvuođabálvalus" "soalddátbálvalus" "sosiálabálvalus" "spesialistabálvalus" "spesialistadearvvašvuođabálvalus" "spesialistadearvvašvuođa-bálvalus" "suodjalanbálvalus" 
"telebálvalus" "telematihkkabálvalus" "vákšunbálvalus" "Várrebálvalus" "vuođđodearvvašvuođabálvalus" "vuostebálvalus" "Vuovdebálvalus" ;

# the previous items can both represent abstract processes and humans
 
LIST MEDIA = "media" "oahpahusrádio" "radio" "rádio" "televišuvdna" "TV" ;

#SYMB-INSTITUTION = "njuolggadus" "vuoigatvuohta" "láhka" "ortnet" "čoahkkin#ortnet" ;

    # Those cannot be buildings, but "act" , "say" things for example..

# Two aspects: Place and institution:
# and a couple of other words that do not really have to do with that
# suits "vázzit" + Acc
LIST EDUCATION = "allaskuvla" "allaskuvlaoahppu" "álbmotallaskuvla" "álbmotallaskuvlaoahppu" "álgooahppu" "ámmátskuvla" "artiumkursa" "badjedássi" "báhpaskuvla" "befálaoahppu" "boazodoallofága" "boazodoallosuorgi" "boazodoallofágaoahppu"
"dásseárvofága" "doavttirskuvla" "dulkaoahppu" "duodjekursa" "duodjeoahppu" "eanandoalloallaskuvla" "fága" "fidnoskuvla" 
"gaskaskuvla" "gávpeoahpposkuvla" "giellafága" "giellagursa" "gierdoskuvla" "gohttehatskuvla" "gursa" "joatkkakursa" "joatkkaoahppu" "joatkkaskuvla" "julevsámegieloahppu" "kursa" "luohkká" "luonddufága" "mánáidskuvla" "musihkkadiibmu" "musihkkaskuvla" "musihkkasuorgi" "musihkkaallaskuvla" "nuoraidskuvla" 
"oahpaheaddjiallaskuvla" "oahpaheaddjeoahppu" "oahpaheaddjioahppu"   "oahppofálaldat" "oahppoinstitušuvdna" "oahpaheaiskuvla" "oahpaheaiallaskuvla" "oahppoásahus" "oahppodássi" "oahppu" "ovdaskuvla" "páhpaskuvla" "rávesolbmuidskuvla" "rávisolbmuidskuvla" "rekruttskuvla" "rihppaskuvla" 
"sámegielfága" "sámegielgaskafága" "seminára" "skuvla" "skuvlla" "smávvaskuvla" "sotnabeaiskuvla" "stáhtainternáhtta" "stáhtainternáhta" "stuorraskuvla" "teaterallaskuvla" "teáhterallaskuvla" "universiteahtta" "universitehta" "veahkkeskuvla" "verddeskuvla" "vuođđoskuvla" "vuolledássi" ;

# suits to LANGUAGE Gen
LIST LESSON =  "álgogursa" "dáiddaoahpahus" "gaskafága" "gealbu" "gelbbolašvuohta" "giellaovdáneapmi" "fálaldat" "joatkkafáddá" "joatkkagursa" "lávdaoahppofálaldat" "lohkanbajioahppu" "máhttu" "musihkkadiibmu" "oahppa" "oahppofálaldat" "oahpahus" "váldofága" "vuođđofága";
 

LIST OTHER-INDUSTRY = "bálvalusealáhus" "biedjobivdu" "bivdu" "boazoealáhus" "boazodoallu" "deanubivdu" "duodji" "ealáhus" "ealáhusdoaibma" "eanandoallu" "eanadoalloealáhus"  "eksportealáhus" "fuođđobivdu" 
"geasseguollebivdu" "giđđaguollebivdu" "goddebivdu" "guollebiebmanealáhus" "guollebivdu" "industriija" "johkaluossabivdu" "lassiealáhus" "luossabivdu" "lotnolasealáhus"  
"mátkeealáhus"  "mátkkoštanealáhus" "meahcceealáhus" "mearradoalloealáhus" "riektepolitihkka" "rievssatbivdu" "ruvkedoaibma" 
"sáivaguollebivdu" "sáivabivdu" "sáivaguollebivdu" "sosiálapolitihkka" "šákšadorskebivdu" "šákšadorskebivdu" "sámeduodji" "sámeealáhus" "smávvabivdu" "šibitdoallu" "tertiearaealáhus" "vuoddoealáhus" "vuođđoealáhus" ;

# Not related to certain political verbs

LIST POLITICAL-INDUSTRY = "alkoholpolitihkka" "assimilerenpolitihkka" "álgoálbmotpolitihkka" "ásodatpolitihkka" "ássanpolitihkka"
"bálkápolitihkka" "barggahanpolitihkka" "bargoaddipolitihkka" "bartapolitihkka" "bellodatpolitihkka" "bearašpolitihkka" "boazodoallopolitihkka" "boazodoallopolitihkka" "boraspirepolitihka" "boraspirepolitihkka" "dáruiduhttinpolitihkka" "dásseárvopolitihkka" "dearvvašvuođapolitihkka" "diehtopolitihkka"
"ealáhuspolitihkka" "eamiálbmotpolitihkka" "eananpolitihkka" "etnopolitihkka" "fágapolitihkka"
"gávpepolitihkka" "giellapolitihkka" "guolástanpolitihkka" "guolástuspolitihkka" "guovllupolitihkka" "johtolatpolitihkka"
"kulturárbi" "kulturpolitihkka" "mediapolitihkka" "muddenpolitihkka" "nuoraidpolitihkka" "oaččuhanpolitihkka" "olgoriikapolitihkka" "poastaheaittihanpolitihkka" "politihkka"
"rádjepolitihkka" "regiunpolitihkka" "riektepolitihkka" "riikkapolitihkka" "regionálapolitihkka" "regulerenpolitihkka" "ruoššaduhttinpolitihkka"
"sámegielpolitihkka" "sámepolitihkka" "sámieatnanpolitihkka" "sámipolitihkka" "servodatpolitihkka" "sihkarvuođapolitihkka" "sirrenpolitihkka" "skuvlapolitihkka" "sosiálapolitihkka" "stáhtakássasisaboahtopolitihkka" "stáhtapolitihkka" "stuorapolitihkka"
"unnitlogupolitihkka" "veajuiduhttinpolitihkka" "vearropolitihkka" "viessosadjepolitihkka" "viidánanpolitihkka" "virgáibidjanpolitihkka" "virgáibidjanpolitihkka" ;
 # Related to certain political verbs
 
SET INDUSTRY = POLITICAL-INDUSTRY OR OTHER-INDUSTRY ;

LIST RIEKTEDILLI = "bajithearrávuohta" "bálvalusfálaldat" "čearddalašvuohta" "diggegirji" "dilálašvuohta" "ealáhusvuođđu" "eallindiliváttisvuohta" "eanajuohkinsuohkan"  "eanadoallobuvttadeapmi" "eanavuovdinkantuvra"  "hálddašeapmi" "kultuvra" "matrihkal" "meahcceriggodat" "opmodat" "rádjemearka" "rádji" "rádjá" "resursageavaheapmi" "riektedilli" "riekteáddejupmi" "riddomearraguovlu" "sierraortnet" "stáhtaeana"  "suodjalanguovlu" "váldi" "váldofierpmádat" "vearronjuolggadus" "vuoigatvuođadilálašvuohta" "vuoigatvuohta" "vuovdeatnu" "vuovdenjuolggadus" "suverenitehta" "kulturdoarjja";

# FYLKA in front of the set is usually in Gen.

LIST STAHTA-GEN = 
"IT-doaibmaplána" "almennet" "bargiidgiehtagirji" "boazodoallohálddahus" "bálvalus" "dearvvašvuođageahčču" "dearvvašvuođaiskkadeapmi" "dearvvašvuođagozáhus" "doaibma" "doaibmaplána" "doarjja" "doarjjavuogádat" "dássi" "eaiggáduššanvuoigatvuohta" "eaiggátgáibádus" "eana" "eanan" "eatnan" "eiseváldi" "gaskadilleortnetdoarjja" "geahččoortnet" "geatnegasvuohta" "geavat" "gáibádus" "háldu" "joatkkaskuvla" "kulturráđđi" "mearrabodni" "oahppodoaibma" "oaidnu" "oaivil" "orgána" "ovddasteaddji" "peršonalgiehtagirji" "ruhta" "sosiálapolitihkka" "spesialistadearvva?vuo?abálvalus" "tariffašiehtadus" "vuostebealli" "áddejupmi" "ámmátolmmoš" "ásahus" ("jávri" Pl) ("oassálastit" Actio) ("vuovdi" Pl) ("áŋgiruššat" Actio) ;

 # "stáhta" in front of the set, is usually Gen.

LIST SAMEDIGGI-GEN = "autoritehta" "áirras" "árvokommišuvdnalahttu" ("ásahit" Actio) "bargu" "bušeahtta" "bušeahttamearrádus" "bušeahttavuogádat" "coahkkinortnet" "čielggadeapmi" "čilgehus" "čoahkkin" "čoahkkinortnet" "dievasčoahkkin" "doaibma" "doaimmahat" "ealáhusfoanda" "ekonomiijahálddašeapmi" "ekonomiijastivret" "hálddašanapparáhtta" "jahkedieđáhus" "jahke-dieđáhus" "joavku" "kulturviessobušeahtta" "lahttu" "mearrádus" "njuolggadus" "nuoraidkonferánsa" "oaidnu" ("oassálastit" Actio)  "ollesáigepolitihkkár" "opposišuvdna"  "ovttasbargoaktøra" "politihkkár" "rehketdoallu" "sadji" "ságajođiheaddji" "šiehtadusmálle" "ulbmil" "váldoášši" "váldohálddahus" ;

SET ACTOR = ANIMATE OR INSTITUTION OR ORGANIZATION ;

  # Should EVENT be part of this set?

# To be used in habitative-sentences:
SET HAB-ACTOR = ACTOR OR HUMAN-GROUP OR INDUSTRY OR EDUCATION OR PEOPLE-NUM OR ("gii") OR Pers OR ("eará") ;
SET HAB-ACTOR-NOT-HUMAN =  INSTITUTION OR ORGANIZATION OR INDUSTRY OR EDUCATION ;


LIST STATE = "bahávuohta" ("dearvvas" Der_vuohta) "gaskavuohta" "mielladearvvašvuohta" "ráfi" "váivi" "veahkki";

  
LIST OTHER-ABSTR-ENTITY = "ášši" "diehtojuohkinprošeakta" "doaibmaplána" "hehttehus" "oahppoplána" "ovttasbargoprošeakta" "plána" "prošeakta" "sosiálaplána" "váttisvuohta" ;

  # can represent a concrete entity

LIST MONEY = "ánsu" "árvu" "bálká" "beaiveruhta" "buorrin" "bušeahtta" "čoahkkinbuhtadus" "dearvvasvuođabálvalusmearreruhta" "dienas" "divat" "doarjja" "duksaruhta"
"dutkanruhta" "fuolahanbálká" "giellaruhta" "giellaprošeaktaruhta" "gollu" "guovttegielalašvuođaruhta" "haddi" 
"jahkebušeahtta" "juolludeapmi" "juolludus" "kulturmearreruhta" "lassiruhta" "liigudeapmi" "máksu" "mátkkoštangollu" 
"oahpaheddjiidbálká"  "preassadoarjja" "prošeaktaruhta" "reantu" "ruhta" "ruoššaruhta" "sáhkku" "sisaboahtu" "spealloruhta" "stáhtadoaibma" "tienas" "veahkkeruhta" "vealgi" "vearru" "vuoitu";

    # Ambiguous with respect to concreteness, either the symbolic amount or the concrete coins and bills

SET ABSTR-ENTITY = MONEY OR STATE OR OTHER-ABSTR-ENTITY ;

 
LIST GEN-CONCEPT = "anistupmi" "álgu" "áŋgirvuohta" "áigumuš" "árbevierru" "ávžžuhus" 
"ballu" "bálvaleapmi" "bálvaluskvaliteahtta" "bargomálle" "boađus" "dárbu" "dássi" "diehtu" "doaibma" "duođaštangeatnegasvuohta" "duogaš" "eaiggátvuohta" "eallinvuohki" "erohus" "evttohus" 
"fádda" "friddjavuohta" "fuolalašvuohta" "gaskamearri" "gaskaoapmi" ("geargat" Der_vuohta) "geatnegasvuohta" "gelbbolašvuohta" ("gudnejahttit" Actio) "gudni" "guollebivdovuoigatvuohta" "hállu" "hástalus" "isitvuohta" 
"konflikta" "kontákta" "kulturduogáš" "kulturmáhttu" "kvaliteahtta" "loahppa" "loatnaetymologiija" "lohpi" 
"máhttu" ("máŋggabealat" Der_vuohta) "miella" "mihttomearri" "mihttomearri" "molssaeaktu" "muitu" "oamedovdu" "oktavuohta" "olahahttivuohta" "ovdamearka" "ovddasvástádus" "ovttadássásašvuohta" "perspektiiva" 
"ráffi" "ráfi" "ráhkisvuohta" "rámma" "riekteprinsihppa" "rolla" "sámegielmáhttu" "sámekultuvra" "sihkkarastinstrategiija" "strategiija" "šiehtadallanfáddá" "symbolasystema" 
"ulbmil" "ustitvuohta" ("vanhurskkis" Der_vuohta) "váibmu" "váikkuhanfápmu" "váikkuhus" "váldosivva" "vásáhusduogáš" "vearrivuohta" "virgelohpi" "vuordámuš" "vuoigatvuohta"
"bivdovuoigatvuohta" "geavahanvuoigatvuohta" "guolástanvuoigatvuohta" "jienastanvuoigatvuohta" "eanangeavahanvuoigatvuohta" "oamastanvuoigatvuohta" "mearraguollevuoigatvuohta" "teltenvuoigatvuohta" "sierravuoigatvuohta" "murjenvuoigatvuohta" "láigovuoigatvuohta" "láigohanvuoigatvuohta" "bivdinvuoigatvuohta" "guohtunvuoigatvuohta" "eananoamastanvuoigatvuohta" "eanangeavahanvuoigatvuohta" "vuođđovuoigatvuohta" ;
 
  # very abstract
  # Adding words to this set, consider if they suit to the SG-WORD-set as well. 
  
LIST MOD-CONCEPT = "eanandoalloálggahanulbmil" ;

    #for quite specified concepts, that has probably an effect on its potential to be modified.
    
LIST EMOTION = "gierisvuohta" "moraš" "ráhkisvuohta" "vašši" ;

   
LIST STRUCTURE = "álgu" "loahppa" "struktuvra" "maŋŋegeahči" "lasáhus" "loahpageahči" "álgogeahči" "álgooassi" "sisdoallu" "veršuvdna" ;

LIST PROPERTY = "burrodat" "fastivuohta" "hedjodat" "allodat" "gassodat" "kvaliteahtta" "sturrodat" "guhkkodat" "govdodat" "hápmi" "ivdni" "fearga" "dovdomearka" "iešvuohta" "viidodat" ;

LIST MOD-PROPERTY = "bálvaluskvaliteahtta" ;

LIST IDEOLOGY = "buddhisma" "kommunisma" "osku" "sosialdarwinisma" ;

SET CONCEPT = GEN-CONCEPT OR STRUCTURE OR PROPERTY OR IDEOLOGY ;

  
LIST ACTIVITY = "aktivitehta" "báikenammadutkamuš" "boazodoallodutkamuš" "čađaheapmi" "dearvvašvuođadutkan" "eallinbirasdutkamuš" "fuolaheapmi" "geahčastat" "gilledutkamuš" "guorahallan" "heahtebargu" "loatnadutkamuš" (".*lodden"r) "lodden" "mátki" "návetbargu" "sámedutkamuš" "sisafárren" "substráhtadutkamuš" "šiehtadallan" ;

  # semantically comparable to Actio forms + lexicalized Actio forms.
  # probably change of state in the course of time
  
LIST PROCESS = "duodjeproseassa" "kártenproseassa" "mearridanproseassa" "mearridanprosessa" "oahppoproseassa" "proseassa" "revitaliserenproseassa" ;

    # Reminds of time sets
    
LIST TOPIC = "areálaášši" "áideášši" "ášši" "bearráibeahččoášši" "boazodoalloášši" "B-ášši" "buhtadusášši" "bušeahttagáržžidanášši"
"čázádathuksenášši" "Čiekŋudanfáddá" "čoahkkinášši" "diggeášši" "doarjjajuohkinášši"
"eallinášši" "eanamihtádusášši" "eaŋkalášši" "eananoastinášši" 
"giellaášši" "girkoášši" "gudnerihkkunášši"  "guolleášši" "guovlogáhttenášši" "hálddašanášši" "huksenášši" "individuálaášši" "juogadanášši" "Junkerdal-ášši" "konsešuvdnaášši"
"lassiášši" "luonddugáhttenášši"
"meroštanášši" "muddenášši"
"nammalogahallanášši" "nággoášši" 
"rádjaášši" "ráfáiduhttinášši" "rávdnjehuksenášši" "riidoášši" 
"sámeášši" "sisbuksaášši" "suohkanstivrraášši" 
"plánaášši" "riekteášši"  
"sámeášši" "sámiášši" "suopmanášši" "váiddaášši" "váidinášši" "váldoášši" "vearroduottarášši" "vuoigatvuođaášši" "WTO-ášši" "1867-ášši";

SET ABSTRACT = ABSTR-ENTITY OR CONCEPT OR ACTIVITY ;
 
  
LIST DILLI = "areáladilli" "bargodilli" "birasdilli" "boazodilli" "boazodoallodilli" "čearddalašvuohtadilli" "dilli" "doaibmadilli" "duopmováldedilli" "eaiggátdilli" "eallindilli" "eallin-dilli" "eanadoallodilli" "eanaeaiggátdilli" "fápmodilli" "gaskadilli" "geavahandilli" "gielladilli" "háldodilli" "heahtedilli" "lonohallandilli" "luonddudilli" "mielladilli" "monopoldilli" "náittosdilli" "niestedábuhanheahtedilli" "náittosdilli" "oahpponeavvodilli" "oamasteaddjidilli" "resurssadilli" "riektedilli" "riidodilli" "ruhtadilli" "seaktedábuhandilli" "sierradilli" "skuvladilli" "valljivuohtadilli" "vuoigatvuođadilli" "šaddadandilli" ;

  # Likely to be locative in most contexts
  
LIST WEATHER-SITUATION = "beaivvádat" "bievla" "buolaš" "dálki" "dálkedilálašvuohta" "fiertu" "goalki" "siivu" "jođádat" "liekkas" "linádat" "oppas" "riđđu" "muohtti" "ilbmi" "balva" "čuoika" "čoaskin" "biegga" "nuorttadat" "davádat" "oarjjádat" "luládat" "orjješbiegga" "nuortabiegga" "obbadálki" "balvadálki" "balvailbmi" "arvi" "savda" "savdaarvi" "liehmu" "láfubiegga" "baján" "johtti" "gállu" "jiella" "hieibma" "šlahtti" "seaŋáš" "borga" "guoldu" "dobadat" "dulvi" "moarri" "geardni" "cuoŋu" "jealahas" "jalahas" "geasádat" "dálvvádat" "jáldu" "lievhnu" "galmma" "guostta" "čođđolat" "čođđálat" "sealádat" "šearádat" "bálgu" "bálggádat" ;

  

LIST OTHER-SITUATION = "áŧestus" ;

SET SITUATION = DILLI OR WEATHER-SITUATION ;

SET ACTOR-ROLE = HUMAN OR ORGANIZATION OR POLITICAL-PLACE OR EDUCATION ;
  #Institution: Restricting possible actor subjects.

LIST EVENT-TOOL-ACTIVITY = (Actio) "addin" "dearvvašvuođaiskkadeapmi" "goddin" "hárjehallan" "jápmin" "ráđđádallan" "šiehtadallan" "vázzin" ;

LIST EVENT = "avádatčoahkkin" "álbmotčoahkkin" "ámtadiggečoahkkin" "bargiidčoahkkin" "bajimusčoahkkin" "beassášmárkan" "bismmačoahkkin" "buohkaidčoahkkin" "boazodoallošiehtadallan" "budjeahttačoahkkin" 
"cup" "čakčamárkan" "čoahkkin" "Čuoigancup" "dievasčoahkkin" "digaštallančoahkkin" "diggečoahkkin" "dutkančoahkkin" "erenoamáščoahkkin" "fáddáčoahkkin" "feasta" "festivála" "fitnodatčoahkkin"
"gielddaválga" "girkočoahkkin" "gittačoahkkin" "gozihančoahkkin" "gulaskuddančoahkkin" "guossečoahkkin" "gulaskuddančoahkkin" 
"headja" "heargegilvu" "jahkečoahkkin" "joavkočoahkkin" "joavko-čoahkkin" "juovlamárkan" "juristtačoahkkin" "konferánsa" "konsearta" "kursa" "lávdegottečoahkkin" "loahppačoahkkin" "luoddačoahkkin" "lávdegoddečoahkkin" 
"máilmmesoahti" "mátki" "mearridanproseassa" "miellahttočoahkkin" "ministtarčoahkkin" "miellačájehančoahkkin" "miellahtočoahkkin" "njunusčoahkkin" "nominašuvdnačoahkkin" "nášunalčoahkkin" 
"ođđaorganiserenčoahkkin" "oktavuohtačoahkkin" "oktasaščoahkkin" "ovttasbargočoahkkin" "olgoriikaministerčoahkkin" "ollesčoahkkin" "proseassa" 
"ráđđádallančoahkkin" "ráđđečoahkkin" "ráđđehusčoahkkin" "ráhkkanančoahkkin" "ráhkkananstivračoahkkin" "riektečoahkkin" "riikkačoahkkin" "ruhkos" 
"ságaškuššančoahkkin" "sámečoahkkin" "sámediggeválga" "sámediggeválga" "Sámediggeválga" "sámemeašttirgilvu" "Sámi-meašttirgilvu" "sámemusihkkafestivála" "siidačoahkkin" "soahti" "stivračoahkkin" "suokkardančoahkkin" 
"telefončoahkkin" 
"Varangerfestivála" "váldočoahkkin" "válga" "vuosttaldančoahkkin" "vuođđudančoahkkin" "váhnenčoahkkin" "válgačoahkkin" "vuosttaščájálmas" ;
 #XXX bad name, too general

SET ABSTR-PLACE = ORGANIZATION OR INSTITUTION OR EVENT OR EDUCATION OR INDUSTRY OR SITUATION ;

LIST ILLNESS = "albmasuoigi" "allergiija" "anemiija" "ástandávda" "árbedávda" "báhti" "bátnevárka" "bátnevearka" "bárku" "bárkodávda" "bárkudávda" "bearri" "boazodávda" "boahkkodávda" "boahkku" "borasdávda" "buohcu" "buohcuvuohta" "buollán" "buozalmas" "čáhcedávda" "čižžeborasdávda" "čoavjebávččas" "čoavjebonjahat" "čoavjedávda" "čottadávda" "dávda" "dohppehallandávda" "eksema" "fiskesdávda" "fiskesfeber" "gárrenávnnas" "gárrenávnnasváttisvuohta" "gárrendilli" "geahpesdávda" "geahppesdávda" "geahppesvihki" "golgadandávda" "golgodávda" "golgovihki" "guolledávda" "infekšuvdnadávda" "influensa" "jápmindávda" "juhkanvuohta" "lađasdávda" "lađasleasmedávda" "leasmedávda" "leasmi" "liikedávda" "logahasdávda" "luossadávda" "luhčadávda" "mánáiddávda" "mánnodávda" "nissondávda" "njoammudávda" "nuorvu" "nuoskkesdávda" "oaivvesvuohta" "obbondávda" "rabiesdávda" "ráŋka" "rohttodávda" "rohttudávda" "rohtudávda" "ruodnu" "skihpa" "časkásanváddu" "seargadávda" "sismáhtodávda" "sisváddu" "skurbbetdávda" "sogadávda" "sogaváddu" "sohkardávda" "spánskadávda" "speallandávda" "suohtta" "tuberkulosadávda" "varrasonahat" "váddu" "vátnedávda" "vihki" "virusdávda" "vuolši" "vuorri" ;

# LIST ANIMAL-ILLNESS = "luossa#dávda" "vuorri" ;

# Sets denoting relations

LIST OASSI = "gonagasoassi" "riikaoassi" "oassi" "teakstaoassi" "váldooassi";
 
	# Might be useful for partitive constructions.	
	# Try to make a set of nouns wich not will be Gen in a AccGen string.
	
LIST HEADOFPARTS = "nissonoassi" "oassi" "váldooassi" "bealli" "guhtemuš" "goappašat" "proseanta" "%" ;

  # This may be a better partitive set.	

# Miscellaneous sets
# ------------------
LIST Px = PxSg1 PxSg2 PxSg3 PxDu1 PxDu2 PxDu3 PxPl1 PxPl2 PxPl3 ;

LIST PX1 = PxSg1 PxDu1 PxPl1 ;

LIST PX2 = PxSg2 PxDu2 PxPl2 ;

LIST PX3 = PxSg3 PxDu3 PxPl3 ;

SET PXNOTSG1 = Px - PxSg1 ;
SET PXNOTSG2 = Px - PxSg2 ;
SET PXNOTSG3 = Px - PxSg3 ;

SET PXNOTDU1 = Px - PxDu1 ;
SET PXNOTDU2 = Px - PxDu2 ;
SET PXNOTDU3 = Px - PxDu3 ;

SET PXNOTPL1 = Px - PxPl1 ;
SET PXNOTPL2 = Px - PxPl2 ;
SET PXNOTPL3 = Px - PxPl3 ;

LIST POST-A = "rájes" ;
  
LIST POST-B = "rádjái" ;

LIST GASKAL = "gaskal" "gaskkal" "gaskii" "gaskka" "gaskkas" ;
 
 # p-positions that like coordination
 
LIST TIME-PREP = "badjel" "čađa" "earret" "gaskkal" "guovddáš" "maŋŋel" "maŋŋil" "miehtá" "ovdal" ;
 

SET NUMERALS = Num - OKTA ;

# this set does not contain ordinals, I am not sure if that is necessary.

SET NOT-NUMERALS = WORD - Num ;

LIST MANGA = "máŋga" "galle" ;
 # Not referred to by any rule.

SET CARDINALS = Num - Ord - MANGA ;

SET NOT-CC = WORD - CC ;

SET NOT-PCLE = WORD - Pcle ;

LIST COMPAR = "dávjjit" "eanet" "earalágan" "eará" "earret" "seammás" 
		"seammalágan" "seammalágán" "seammaláhkai";
 
 # These combine with "go" Pcle, but COMPAR stands for 'comparison' rather than
 # 'comparative'.

LIST CONTRA = "muhto" ;
 # In lean muitalan, muhto dál muitalan.

LIST PROSEANTA = "proseanta" "%" ;

SET REALCLB = CLB - COMMA ;

SET NOTCOMMA = WORD - COMMA ;

SET NOT-CAP-INITIAL-CC = WORD - CAP-INITIAL - CC ;

# Border sets and their complements
# ---------------------------------

SET CP = (Pron Interr) OR (Pron Rel) OR MO ;

 
LIST SEMICOL = "\;" ;

LIST COL = ":" ;

SET S-BOUNDARY  = (Pron Interr) OR (Pron Rel) OR ("muhto") OR ("de" CC) OR MO OR ("\;") OR (":") OR ("-") OR ("–") OR CS ;
	# includes CP. Remember that (",") and CC are potential sentence boundaries, too

SET S-BOUNDARY1  = (Pron Interr) OR (Pron Rel) OR ("muhto") OR ("de" CC) OR MO OR ("\;") OR (":") OR ("-") OR ("–") ;
	# includes not CS because of "go" in questions, before it is disambugated.
	
SET S-BOUNDARY2 = (Pron Interr) OR (Pron Rel) OR ("muhto") OR ("de" CC) OR MO OR ("\;") OR (":") OR ("-") OR ("–") OR (@CVP) ;
 
	# includes CP
	# this one includes @CVP, the conjunction which actually connects two sentences (each with a finite verb) to each other, 
	# and not @CNP, which coordinates internal NP-/AdvP-/AP ... coordination
	# To be used only AFTER the disambiguation of @CVP and @CNP taking place in the chapter right before "Disambiguatig pronouns"

# S-BOUNDARY2 is used as barrier. When used as target, rather than as barrier,
# it includes BOS and EOS, and is given the names BOC and EOC (beginning and end of clause)

SET BOC = S-BOUNDARY OR BOS ;
SET BOC2 = S-BOUNDARY2 OR BOS ;
SET BOC-PUNCT = BOC - ("-") - ("–") ; 
SET EOC = S-BOUNDARY OR EOS ;
SET EOC2 = S-BOUNDARY2 OR EOS ;

SET NP-BOUNDARY = BOS OR EOS OR REALCLB OR VFIN OR Inf OR (Actio Ess) OR ConNeg OR VGen OR Sup OR PPRON-NOT-GEN OR Recipr OR Po OR Pr OR Pcle OR ("jed") OR Interj OR CS OR CP ;

SET APP-BOUNDARY = REALCLB OR VFIN OR Inf OR (Actio Ess) OR ConNeg OR VGen OR Sup OR Recipr OR Po OR Pr OR Pcle OR Interj OR CS OR CP ;
# A special barrier used with mapping of appositions. 

#SET SV-BOUNDARY = S-BOUNDARY OR Inf OR Sup OR V-MAIN ;

# To be used in mappingrules and before mapping because FMAINV-set contents @
SET SV-BOUNDARY = S-BOUNDARY OR Inf OR Sup OR V-MAIN - PrsPrc ;
 # VFIN-NOT-AUX ;
 # should be V-MAIN linked to VFIN-aux to the left. (cg-3)
# This set is ment to use in rules for disambiguating due to verbs or verbsets. It contents @.
SET SV-BOUNDARY2 = S-BOUNDARY2 OR FMAINV OR Inf OR Sup ;

SET SVF-BOUNDARY = S-BOUNDARY OR VFIN ;

# This set is ment to use in rules for disambiguating due to verbs or verbsets. 
# Here we search for either an S-BOUNDARY or a finite verb, either aux or main.

SET CCCOMMA = CC OR COMMA ;
	# remember that those are potential sentence boundaries, too

SET BOUNDARY = S-BOUNDARY OR NP-BOUNDARY ;
   # Note: This set is not in use.

SET INTR = Rel OR PUNCT-LEFT ;

	# interrupters
SET INTR-END = COMMA OR PUNCT-RIGHT ;






#############################################
####      								 ####
####      								 ####
####           RULES START HERE 		 ####
####      								 ####
####      								 ####
#############################################



SECTION

# Verb rules
# ----------

# bargat 0 = arbeide, 1 = gjøre
SUBSTITUTE ("bargat") ("bargat:1") ("bargat" V) (*-1 ("mii" Pron Acc))(NOT *1 Com BARRIER S-BOUNDARY) ;


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

# Ritva Test: lágidit 0 = ordne, 1 = arrangere, 2 = stelle, 3 = drive
SUBSTITUTE ("lágidit") ("lágidit:1") ("lágidit") (*0 ORGANIZATION LINK 0 (@SUBJ→));
SUBSTITUTE ("lágidit") ("lágidit:1") ("lágidit") (*0 EVENT);
	## Lea Norut Áltá ja Finnmárkku allaskuvla mat lágidit konferánsa.

# leat 0 = være, 1 = ha, 2 = måtte («ha å»)
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (*-1 @HAB BARRIER NOT-ADV) ;
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (-1 Neg) (*-2 @HAB BARRIER NOT-ADV) ;
SUBSTITUTE ("leat:1") ("leat:2") ("leat:1" V IV) (1 Inf) ;
    # mis lea cahkkehit dola
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 FAUXV) (NOT *1 (Actio Ess) BARRIER S-BOUNDARY) (NOT 1 (Der_PassL PrfPrc)) ;
    # sin giella lea<er> áitojuvvon ja sáhttá jávkat; … sii leat<er> dál<Adv> guorahallamin<Actio> …
    ## Leat go Ibsenii sáddemin dieđu?
SUBSTITUTE ("leat") ("leat:1") ("leat" V IV) (0 (Ind Prt)) (1 Inf) ;
# Jos mun ledjen dadjat sátnegeažige, de ii son lean vuolgit.
# (Perf Cond 2)
# TODO: Gávpotmuvrra vuođđogeađggit ledje<være> čiŋahuvvon 
# (unfortunately no animacy, and impers isn't until bidix...)
# TODO: ledje<ha> ovdalaččas guokte nieidda

# lohkat 0 = lese, 1 = si, 2 = telle

LIST READABLE = "aviisa" "girji" ;

SUBSTITUTE ("lohkat") ("lohkat:1")
	TARGET ("lohkat" V)
	IF (
		(1 ("ahte") OR (Refl Acc) OR (Refl Loc) OR PrfPrc)
		OR
		(*1 FMAINV OR Actio OR PrfPrc OR Inf BARRIER S-BOUNDARY OR ("galle") OR ("man"))
	   ) (NEGATE *0 OBJ LINK 0 READABLE BARRIER S-BOUNDARY)
	   (NEGATE *0 ("jitnosit") OR ("hiđis" Adv) OR ("jaskat" Adv) BARRIER S-BOUNDARY OR V);
	## Ovddeš bargi Yle Sámi Radios, Ánne Risten Juuso, lohká ahte Gárasavvonis livčče eará latnja leamaš Yle Sámi radio doaimmahussii. -  Den tidligere arbeideren Yle på Samelands Radio, Ánne Risten Juuso, hun sier at ...
	## Son lohká máddin Sámis lea sámit garrasabbot deddon dahje vealahuvvon go davvin. - Han sier sørfra har Sameland samer hardere trykt eller berøvd nordpå.
	## Lars Anders Baer ii eahpit ii veahášge go lohká dákkáraš álbmotsirren lea lága ja álbmotrievtti vuostá. - Lars Anders Baer tviler ikke ikke *veahášge når han sier *dákkáraš en folkeisolering er loven og folkeretten mot.
	## Son lohká ádjá boahtit. - Han sier at bestefar skulle komme.
	#$ Soai siđaiga dávjá Liná lohkat jitnosit go sis lei lohkan-hárjehallan.
	
SUBSTITUTE ("lohkat") ("lohkat:2")
	TARGET ("lohkat" V)
	IF (*1 (@←OBJ) LINK NOT 0 TEXT BARRIER S-BOUNDARY);
SUBSTITUTE ("lohkat") ("lohkat:2")
	TARGET ("lohkat" V)
	IF (1 ("galle") OR ("man") LINK 1 QUANT-PRON LINK *1 (@←OBJ) BARRIER NPNH);

	## Son lohká ruđaid. - Han teller penger.
	## Son lohká galle girjji mis leat. - Han teller mange bøker på oss være.


# máksit 0 = bety, 1 = koste, 2 = betale
SUBSTITUTE ("máksit") ("máksit:1") ("máksit" V) (*-1 (@SUBJ→) LINK NOT 0 HUMAN)(0* CURRENCY OR QUANT-PRON OR Num BARRIER Ill OR S-BOUNDARY) ;
 ## Duhpát máksá guokte ruvnnu. # Tobakken koster to kroner.
SUBSTITUTE ("máksit") ("máksit:2") ("máksit" V) (*1 Ill LINK *1 CURRENCY OR Num) ;
 ## Son máksá munnje guokte ruvnnu. # Han betaler meg to kroner.
SUBSTITUTE ("máksit") ("máksit:2") ("máksit" V) (*-1 HUMAN OR Org OR ORGANIZATION OR INSTITUTION LINK 0 (@SUBJ→));
 ## Máret máksá guokte ruvnnu.
 ## Skuvla máksá sáhttu.

 
# mannat 0 = dra, 1 = gå
SUBSTITUTE ("mannat") ("mannat:1") ("mannat" V) (*-1 ("mo") OR ("dat"))(0 (Sg3));

# bivdit 0 = be, 1 = spørre, 2 = fiske, 3 = jakte
SUBSTITUTE ("bivdit") ("bivdit:1") ("bivdit" V)(*1 Qst);
SUBSTITUTE ("bivdit") ("bivdit:2") ("bivdit" V)(*0 FISH);
SUBSTITUTE ("bivdit") ("bivdit:3") ("bivdit" V)((*0 NATURE-PLACE OR HUNT-ANIMAL OR BIRD) OR (0 (Actor)));

# borahit 0 = mate, 1 = fôre
SUBSTITUTE ("borahit") ("borahit:1") ("borahit" V)(*0 ANIMAL);
	# Son borahi máná. Son borahi spiinniid.

# orrut 0 = synes, 1 = bo, 2 = bli, 3 = være
#SUBSTITUTE ("orrut") ("orrut:1") ("orrut" V IV) (1 ("dego") OR (Actio Ess)) ;
SUBSTITUTE ("orrut") ("orrut:3") ("orrut" V IV) (1 ("jaska" Adv)) ;
SUBSTITUTE ("orrut") ("orrut:1") ("orrut" V IV) (*1 Loc BARRIER ORRUT-BO) ;
#This rule should have another barrier, a set of all words except TIME-ADV.
#For sentences like: Mun orron diibmá Romssas.
#Check SET ORRUT-BO

	## Sii orrot goit čeahpit hutkat vugiid movt ávkkástallat sin sámegielmáhtuin, čilge son.
	## Mun orun Romssas.
	## Oro jaska.
	
    # šaddat 0 = bli, 1 = vokse, 2 = komme til å, 3 = vokse, 4 = bli, 5 = få, 6 = føde
SUBSTITUTE ("šaddat") ("šaddat:1") ("šaddat" V IV) (1 ("bajás")) ;
SUBSTITUTE ("šaddat") ("šaddat:5") ("šaddat" V IV) (*-1 @HAB BARRIER NOT-ADV) ;
    # Sutnje šattai hoahppu.
SUBSTITUTE ("šaddat") ("šaddat:5") ("šaddat" V IV) (-1 Neg) (*-2 @HAB BARRIER NOT-ADV) ;
    # Sutnje šattai álo nu hoahppu.
SUBSTITUTE ("šaddat") ("šaddat:6") ("šaddat" V IV) (*0 @ADVL)(NEGATE *0 SPRED) ;
    # Mun lean šaddan Kárášjogas.
    # Kárášjogas mun lean šaddan.
    # Mun lean šadden oahpaheaddjin Guovdageainnus
    # Guovdageainnus mun lea šáddan oahpaheaddjin


# guorrassit 0 = slutte seg, 1 = tilslutte seg
SUBSTITUTE ("guorrasit") ("guorrasit:1") ("guorrasit" V IV) (NOT *0 Ill) ;
# Ráđđehus guorrasii Gonagasa oaivilii => Regjeringen sluttet seg til Kongens mening


# ohcat 0 = søke, 1 = søke etter, 3 = lete
SUBSTITUTE ("ohcat") ("ohcat:1") ("ohcat" V TV) (*1 ("olmmoš:1") OR ("olmmoš")) ;


# ásahit 0 = ordne, 1 = innføre, 2 = grunnlegge
SUBSTITUTE ("ásahit") ("ásahit:2") TARGET ("ásahit" V) 
        IF (*1 (Num Loc) OR (TIME) OR (TIME-ADV));


# Dynamically deverbal nouns:
SUBSTITUTE ("dánset") ("dánset:1") ("dánset" N) ;
SUBSTITUTE ("dánsut") ("dánsut:1") ("dánsut" N) ;
SUBSTITUTE ("geavahit") ("geavahit:1") ("geavahit" N) ;
SUBSTITUTE ("miehtat") ("miehtat:1") ("miehtat" N) ;

    # less frequent verbs
    # - - - - - - - - - -
# civkkádit 0 = kvitre, 1 = pipe
SUBSTITUTE ("civkkádit") ("civkkádit:1") ("civkkádit" V IV) (*0 ("mobiltelefuvdna") OR ("mobiila") OR ("telefuvdna") BARRIER S-BOUNDARY1) ;
## Lihkus juste de civkkádii mobiltelefuvnnas sutnje diehtu.

SUBSTITUTE ("árvalus") ("árvalus:1") ("árvalus" N) (1 ("meannudit") OR ("ovddidit") OR ("sáddet"));
SUBSTITUTE ("árvalus") ("árvalus:1") ("árvalus" N) (-1 ("fágalaš") OR ("loahpalaš") OR ("lávdegoddi") OR ("Sámediggi"));


    # Noun rules
    # ----------

# soadji 0 = vinge, 1 = skovl, 2 = fløy, 3 = erme
SUBSTITUTE ("soadji") ("soadji:2") ("soadji" N) (0* ORGANIZATION);
	# Bellodaga radikála soajis bođii garra proteasta.
	
SUBSTITUTE ("soadji") ("soadji:3") ("soadji" N) (0* CLOTHES);
	# Mu báiddi soajis lea ráigi.


# beaivi 0 = dag, 1 = sol
SUBSTITUTE ("beaivi") ("beaivi:1") ("beaivi" N) (0* ("báitit"));
	# Beaivi báitá.
	
# luohkká 0 = bakke, 1 = klasse
SUBSTITUTE ("luohkká") ("luohkká:1") ("luohkká" N) (*1 EDUCATION OR LESSON OR ("oahpaheaddji"));
    
SUBSTITUTE ("luohkká") ("luohkká:1") ("luohkká" N) (*<-1 EDUCATION OR LESSON OR ("oahpaheaddji"));

SUBSTITUTE ("luohkká") ("luohkká:1") ("luohkká" N) (-1 Gen LINK 0 Pers OR Refl);
    ## Earát su luohkás ledje juo vissa njeallje siiddu su ovdalis matematihkka-girjjis.
    
SUBSTITUTE ("luohkká") ("luohkká:1") ("luohkká" N) (-1 Num OR Ord);
    # Son lea vuosttaš luohkás.
    # Son lea 1A luohkás.
	# Biera vázzá sámi luohkás.
	# Biera vázzá sámegiel luohkás.
	# Bireha luohkás leat eanaš nieiddat.
	# Mu luohkás leat vihtta nieidda ja golbma bártni.

# diibmu 0 = time, 1 = klokke
SUBSTITUTE ("diibmu") ("diibmu:1") ("diibmu" N Sg) (1 Num OR Ord) ;
	# Boahtte gaskavahku diibmu 11.00 rahpá kurdarbearaš Mehidi Kárášjohkii ođđa kaféa.
	# Ord because of possible incorrect analysis of Num + punctuation.
SUBSTITUTE ("diibmu") ("diibmu:1") ("diibmu" N Sg) (*0 ("ollu")) ;
	# Ollugo diibmu lea.
SUBSTITUTE ("diibmu") ("diibmu:1") ("diibmu" N Sg) (1 COPULAS LINK *1 Num) ;
	# Dál diibmu lea fargga vihtta.

	
# miella 0 = sinn, 1 = oppfatning, 2 = behag
SUBSTITUTE ("miella") ("miella:1") ("miella" N Sg Loc) (-1 @→N) ;
# sinn => oppfatning (kan regelen vere meir generell?)
SUBSTITUTE ("miella") ("miella:2") ("miella" N) (1 ("mielde")) ;

# gonagas 0 = konge, 1 = kong
SUBSTITUTE ("gonagas") ("gonagas:1") ("gonagas" N Sg) (1 Mal) ;
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

# goddi 0 = komite, 1 = villrein
SUBSTITUTE ("goddi") ("goddi:1") ("goddi") (NOT 0/1 (*)) ;


# diehtu 0 = informasjon, 1 = kunnskap, 2 = viten, 3 = beskjed
SUBSTITUTE ("diehtu") ("diehtu:3") ("diehtu") (0 Nom OR Acc LINK *0  ("mobiltelefuvdna") OR ("mobiila")) ;
SUBSTITUTE ("diehtu") ("diehtu:3") ("diehtu") (0 OBJ LINK *0  ("sáddet") OR ("čállit") OR ("lohkat")) ;
    ## Lihkus juste de civkkádii mobiltelefuvnnas sutnje diehtu. 
    ## Lei Ájlin gii sáddii dieđu.

    # Other parts of speech
    # ---------------------
    
# oktii 0 = sammen, 1 = en gang
SUBSTITUTE ("oktii") ("oktii:1") ("oktii" Adv) (1 ("vel") OR TIME);
SUBSTITUTE ("oktii") ("oktii:1") ("oktii" Adv) (-1 ("vel") OR TIME);  
SUBSTITUTE ("oktii") ("oktii:1") ("oktii" Adv) (-1 ("go") LINK -1 ("eanet"));
    ## Jo dalle go ledjen Tessalonikas, dii sáddiidet munnje eanet go oktii daid maid mun dárbbašin.
SUBSTITUTE ("oktii") ("oktii:1") ("oktii" Adv) (NEGATE @1 OKTII-V);
    ## Dan áiggi Jesus lei oktii vázzimin gordnebealdduid čađa sábbáhin.

# ollu 0 = mange, 1 = mye, 2 = hvor mye
SUBSTITUTE ("ollu") ("ollu:1") ("ollu" Adv) (-1 BOS)(0 Qst LINK 1 ("diibmu")) ; 
SUBSTITUTE ("ollu") ("ollu:2") ("ollu" Adv) (-1 BOS)(*1 QMARK) ; 
    ## Ollu diibmu lea?
    ## Ollu go diibmu lea?
    ## Ollugo diibmu lea? 
    
SUBSTITUTE ("maŋŋel") ("maŋŋel:1") ("maŋŋel" Adv) (1 ("go")) ;
    ## Maŋŋel go guovtte geardde leat vuoitán eretčiekčamiin ja buriin álgguin dan gohčoduvvon fiskerseries, ledje valljit ruovttuguovllu olbmot boahtán geahččat iežaset lunttaid vuoitit badjel joavku maid atne heajubun.

#maŋit 0 = bakre, 1 = sist    
SUBSTITUTE ("maŋit") ("maŋit:1") ("maŋit" Superl) (*1 TIME BARRIER NPNH) ;
    ## Maŋemus guokte diimmu sis lei duodji.

# ge 0 = også, 1 = heller
SUBSTITUTE ("ge") ("ge:1") ("ge" Pcle) (*-1 Neg BARRIER S-BOUNDARY) ;
## In mun ge háliidivčče. In munge háliidivčče.


SUBSTITUTE ("juohke") ("juohke:1") ("juohke" Pron Indef) (1 ("lágan") OR ("lágán")) ;

# goabbáge 0 = begge, 1 = noe
SUBSTITUTE ("goabbáge") ("goabbáge:1") ("goabbáge" Pron Indef Sg) (*-1 Neg) ;

# duohta 0 = sann, 1 = virkelig
SUBSTITUTE ("duohta") ("duohta:1") ("duohta" A Sg Loc) (0 @ADVL) ;



# go (default)=> når
# go:1 => at, go:2 => enn, go:3 => som, go:4 => da, go:5 => fordi


SUBSTITUTE ("go") ("go:1") ("go" CS) (-1 ("maŋŋil" Adv) OR ("maŋŋel" Adv) OR ("maŋŋel:1" Adv) OR ("ovdal" Adv)) ;
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

SUBSTITUTE ("ieš") ("ieš:1") ("ieš" Pron Refl Acc) (0 (@-FOBJ→) OR (@-FSUBJ→)) ;
# Máhtte rábmui iežas:1 vuoitit => Máhtte skrøt at _han_ skulle vinne 
SUBSTITUTE ("ieš") ("ieš:2") ("ieš" Pron Refl Gen) (-1 (Pron Pers Gen)) ;
# Dá lea mu iežan:2 girji => Her er min _egen_ bok

SUBSTITUTE ("iehčanassii") ("iehčanassii:1") ("iehčanassii" Adv) (-1 ("leat")) ;

# Po: mielde => med, mielde:1 => langs, mielde:2 => i følge, mielde:3 => etter
SUBSTITUTE ("mielde") ("mielde:3") ("mielde" Po) (-1 ("dárbu") OR ("miella")) ;
    ## Don vieččat boaldinmuoraid dárbbu mielde.

# vai => for at, vai:1 => for å
SUBSTITUTE ("vai") ("vai:1") 
   TARGET ("vai" CS)
       IF (1 Inf) ;
 ## vai - for å

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

# For iešguđet+ge:
SUBSTITUTE SUB:1 (Pron Indef Gen Der1 Der_lágan A Attr) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Gen Der1 Der_lágan A Attr) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Acc Der1 Der_lágan A Attr) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Acc Der1 Der_lágan A Attr) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Gen) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Gen) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Acc) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef Acc) (A Attr) ("iešguhtet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef) (A Attr) ("iešguđet" Pron Indef);
SUBSTITUTE SUB:1 (Pron Indef) (A Attr) ("iešguhtet" Pron Indef);



# Adverbs
# =======

# fal 0: bare. 1: til

SUBSTITUTE ("fal") ("fal:1") ("fal" Adv) (-2 BOS)(-1 Neg + Sg3)(*1 N BARRIER NPNH) ;
    ## Ii fal

# nu 0 = slik, 1 = så

SUBSTITUTE ("nu") ("nu:1") ("nu" Adv) (*1 A BARRIER NOT-ADV) ;
    ## Matematihkka lei nu váttis!
    ## Matematihkka lei nu hirbmat váttis!

# Adjectives
# ==========

# buorre:0 → bra, buorre:1→god
LIST IJ-TIME = "beaivi" "eahket" "beassážat" "juovllat" ;
SUBSTITUTE ("buorre") ("buorre:1") ("buorre" A) (1 IJ-TIME + N) ;
SUBSTITUTE ("buorre") ("buorre:1") ("buorre" A) (1 ("ođas" A Attr)) (2 ("jahki" N)) ;


# vissis:0 → sikker, vissis:1 → viss
SUBSTITUTE ("vissis") ("vissis:1") ("vissis" A) (*1 N BARRIER NOT-ADJ) ;
# muhtun vissis:1 áiggi maŋŋel, doallat viesu rabasin vissis:1 áiggiid 
# (vs. mun lean vissis:0 ahte)


# guovttos

SUBSTITUTE ("guovttos") ("guovttos:1") ("guovttos" N) (-1 N) (*1 (N Com) BARRIER NPNH);
SUBSTITUTE ("guovttos") ("guovttos:2") ("guovttos" N) (-1 N) (*1 N BARRIER NPNH LINK 1 CC);

# oba

SUBSTITUTE ("oba") ("oba:1) ("oba" Adv) (*-1 Neg BARRIER ConNeg) ;
## Dat ii oba gula ge min servodahkii.
##  Dál ii sáhte šat bálljo oba jurddašit ge.





# Rules that are not word-specific
# --------------------------------

# Cond = kunne, Cond2 = skulle, Cond3 = skal
SUBSTITUTE (Cond) (Cond2) (Cond) (*-1 ("vaikko") OR ("vare")) ;
# Vaikko suhtašitge => Selv om du skulle bli sint 
SUBSTITUTE (Cond) (Cond2) (Cond) (*-1 ("jos") LINK 1 ("vel")) ;
# Jos vel boađášitge => Hvis enn du skulle komme
SUBSTITUTE (Cond) (Cond3) (Cond) (*-1 ("vai")) ;
# Dan mun dutnje muitalan, vai oahpašit => Den forteller jeg til deg for at du skal lære

