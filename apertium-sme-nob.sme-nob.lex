# -*- cg-pre-pipe: "apertium -d . sme-nob-biltrans | cg-conv -a 2>/dev/null" -*-

SOFT-DELIMITERS = "<,>" cm ;
DELIMITERS = "<.>" "<:>" "<!>" "<?>" "<...>" "<|>" "<$.>" "<$:>" "<$!>" "<$?>" "<$|>" sent ;

SETS




# I define end of clause and beginning of clause in a way so that the file
# may be read both by the CG-2 and the vislcg formalisms.

LIST BOS = (>>>) (<s>) (sent) ;
LIST EOS = (<<<) (</s>) (sent) ;

# CG3 doesn´t function without >>> and <<< !

# Tags declared as single-membered LISTs
# ======================================

# Parts of speech
# ---------------

LIST n = n ;
LIST adj = adj ;
LIST adv = adv ;
LIST vblex = vblex ;
LIST prn = prn ;
LIST det = det ;
LIST ind = ind ;

LIST cnjsub = cnjsub ;
LIST cnjcoo = cnjcoo ;
LIST post = post ;
LIST pr = pr ;
LIST pcle = pcle ;
LIST num = num ;
LIST interj = ij ;
LIST abbr = abbr ;
LIST acr = acr ;
LIST arab = arab ;

LIST clb = clb sent cm ;
LIST left = left lquot ;
LIST right = right rquot ;
LIST web = web ;
LIST punct = punct guio quot ;

LIST COMMA = "," ;
LIST ¶ = ¶;

#LIST V* = V* ;

#!! * Sets for POS sub-categories
# ------------------

LIST pers = pers ;
LIST dem = dem ;
LIST itgitg = itg ;
LIST indic = indic ;

LIST res = res ;
LIST ref = ref ;
LIST rel = rel ;
LIST pos = pos ;

LIST coll = coll ;
LIST nomag = nomag ;
LIST g3 = g3 ;
LIST np = np ;

#!! * Sets for Semantic tags
# -------------

LIST sem_ani = np.sem_ani sem_ani sem_ani-fish sem_ani_body-abstr_hum sem_ani_build sem_ani_build-part sem_ani_build_hum_txt sem_ani_group sem_ani_group_hum sem_ani_hum sem_ani_hum_plc sem_ani_hum_time sem_ani_plc sem_ani_plc_txt sem_ani_time sem_ani_veh ;
LIST sem_build = sem_amount_build sem_ani_build sem_ani_build-part sem_ani_build_hum_txt sem_build sem_build_event_org sem_build_obj sem_build-part sem_build-part_plc sem_build_build-part sem_build_clth-part sem_build_edu_org sem_build_event_org sem_build_org sem_build_route  ;
LIST sem_ani-fish = sem_ani-fish ;
LIST sem_curr = sem_clth-jewl_curr sem_clth-jewl_curr_obj sem_clth-jewl_curr_obj_org sem_curr sem_curr_org ;
LIST sem_date = sem_date ;
LIST sem_domain = sem_domain sem_domain_food-med sem_domain_prod-audio ;
LIST sem_edu = sem_edu sem_build_edu_org sem_edu_event sem_edu_group_hum sem_edu_mat sem_edu_org ;
LIST sem_fem = sem_fem (ant f);
LIST sem_food = sem_body_food sem_domain_food-med sem_event_food sem_food sem_food-med sem_food_perc-phys sem_food_plant   ;
LIST sem_clth = sem_body_clth sem_build_clth-part sem_clth sem_clth-jewl sem_clth-jewl_curr sem_clth-jewl_money sem_clth-jewl_org sem_clth-jewl_plant sem_clth-part sem_clth_hum ;
LIST sem_group = sem_act_group sem_ani_group sem_ani_group_hum sem_body_group_hum sem_body_group_hum_time sem_edu_group_hum sem_group sem_group_hum sem_group_hum_org sem_group_hum_plc sem_group_hum_prod-vis sem_group_org sem_group_sign sem_group_txt ;
LIST sem_hum = sem_ani_body-abstr_hum sem_ani_build_hum_txt sem_ani_group_hum sem_ani_hum sem_ani_hum_plc sem_ani_hum_time sem_aniprod_hum sem_body_group_hum sem_body_group_hum_time sem_body_hum sem_clth_hum sem_edu_group_hum sem_event_hum sem_feat-psych_hum sem_group_hum sem_group_hum_org sem_group_hum_plc sem_group_hum_prod-vis sem_hum sem_hum-abstr sem_hum_lang sem_hum_lang_plc sem_hum_lang_time sem_hum_obj sem_hum_org sem_hum_plant sem_hum_plc sem_hum_tool sem_hum_veh sem_hum_wthr  ;
LIST sem_lang = sem_hum_lang sem_hum_lang_plc sem_hum_lang_time sem_lang sem_lang_tool  ;
LIST sem_mal = sem_mal (ant m) ;
LIST sem_measr = sem_body_measr sem_measr sem_measr_sign sem_measr_time ;
LIST sem_money = sem_money ;
LIST sem_obj = sem_aniprod_obj-clo sem_body_obj_tool-catch sem_build_obj sem_game_obj-play sem_geom_obj sem_hum_obj sem_money_obj sem_obj sem_obj-clo sem_obj-cogn sem_obj-el sem_obj-ling sem_obj-play sem_obj-play_sport sem_obj-rope sem_obj-surfc sem_obj_semcon sem_obj_state ;
LIST sem_org = np.sem_org sem_build_event_org sem_build_edu_org sem_build_event_org sem_build_org sem_clth-jewl_org sem_ctain-abstr_org sem_curr_org sem_dance_org sem_edu_org sem_group_hum_org sem_group_org sem_hum_org sem_org sem_org_prod-cogn sem_org_rule sem_org_txt sem_org_veh sem_org org  ;
LIST sem_plant = sem_clth-jewl_plant sem_ctain-clth_plant sem_drink_plant sem_feat_plant sem_food_plant sem_hum_plant sem_mat_plant sem_plant sem_plant-part sem_plant_plant-part sem_plant_tool sem_plant_tool-measr  ;
LIST sem_plc = sem_act_plc sem_ani_hum_plc sem_ani_plc sem_ani_plc_txt sem_aniprod_plc sem_body_plc sem_build-part_plc sem_event_plc sem_event_plc-elevate sem_feat-measr_plc sem_group_hum_plc sem_hum_lang_plc sem_hum_plc sem_plc sem_plc-abstr sem_plc-abstr_rel_state sem_plc-abstr_route sem_plc-elevate sem_plc-line sem_plc-water sem_plc_pos sem_plc_route sem_plc_state sem_plc_substnc sem_plc_substnc_wthr sem_plc_time sem_plc_tool-catch sem_plc_wthr sem_plc top ;
LIST sem_rule = sem_rule ;
LIST sem_state = sem_state sem_obj_state sem_plc-abstr_rel_state sem_plc_state sem_state-sick sem_state-sick_substnc ;
LIST sem_sur = sem_sur ;
LIST sem_time = sem_time sem_ani_hum_time sem_ani_time sem_body_group_hum_time sem_body_time sem_event_time sem_hum_lang_time sem_measr_time sem_plc_time sem_time_wthr ;
LIST sem_veh = sem_ani_veh sem_ctain-clth_veh sem_feat-phys_veh sem_hum_veh sem_org_veh sem_veh ;
LIST sem_year = sem_year ;
LIST sem_txt = sem_txt sem_ani_build_hum_txt sem_ani_plc_txt sem_group_txt sem_mat_txt sem_money_txt sem_org_txt sem_prod-audio_txt sem_prod-cogn_txt sem_semcon_txt sem_txt ;
LIST sem_semcon = sem_semcon sem_semcon_txt ;
LIST sem_build-part = sem_build-part sem_build-part_plc ;

SET FIRSTNAME = (np ant f) OR (np ant m) OR (prop sem_fem) OR (prop sem_mal) ;

LIST TIME-N-SET = (n sem_time) ;
LIST NOT-TIME = "<dulvi>" "<lohpi>" "<vuorru>" ;
SET TIME-N = TIME-N-SET - NOT-TIME ;


LIST HUMAN = sem_hum sem_mal sem_fem cog ant sem_sur pers nomag der_nomag ;

SET LANGUAGE = (sem_lang) OR ("<.*giel>"ri n) OR ("<dárrolaš>"i) OR ("<nuortalaš>"i) OR ("<sápmelaš>"i) ;

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

LIST cmp_splitr = cmp_splitr ;
LIST cmp_attr = cmp_attr ;

LIST cmp = cmp ;

LIST px1sg = px1sg ;
LIST px2sg = px2sg ;
LIST px3sg = px3sg ;

LIST px1du = px1du ;
LIST px2du = px2du ;
LIST px3du = px3du ;

LIST px1pl = px1pl ;
LIST px2pl = px2pl ;
LIST px3pl = px3pl ;
LIST PX = px1sg px2sg px3sg px1du px2du px3du px1pl px2pl px3pl ;

LIST comp = comp ;
LIST sup = sup ;

LIST attr = attr ;
LIST ord = ord ;

LIST qst = qst ;

# The ("ge" pcle) etc. are used in Apertium
LIST foc_ge = foc_ge ("<ge>" pcle) ;
LIST foc_gen = foc_gen ("<gen>" pcle) ;
LIST foc_ges = foc_ges ("<ges>" pcle) ;
LIST foc_gis = foc_gis ("<gis>" pcle) ;
LIST foc_naj = foc_naj ("<nai>" pcle) ;
LIST foc_ba = foc_ba ("<ba>" pcle) ;
LIST foc_be = foc_be ("<be>" pcle) ;
LIST foc_hal = foc_hal ("<hal>" pcle) ;
LIST foc_han = foc_han ("<han>" pcle) ;
LIST foc_bat = foc_bat ("<bat>" pcle) ;
LIST foc_son = foc_son ("<son>" pcle) ;

LIST iv = iv ;
LIST tv = tv ;

LIST pasv = pasv ;              # bidix-added
LIST der_pass = der_passl der_passs ;

LIST pret = pret;
LIST pres = pres ;


LIST pot = pot ;
LIST cond = cond ;

LIST imp = imp ;

LIST sg1 = (p1 sg) ;
LIST sg2 = (p2 sg) ;
LIST sg3 = (p3 sg) ;

LIST du1 = (p1 du) ;
LIST du2 = (p2 du) ;
LIST du3 = (p3 du) ;

LIST pl1 = (p1 pl) ;
LIST pl2 = (p2 pl) ;
LIST pl3 = (p3 pl) ;

LIST inf = inf ;
LIST conneg = conneg ;
LIST neg = neg ;

LIST prfprc = prfprc ;
LIST vgen = vgen ;

LIST prsprc = prsprc ;


LIST ger = ger ;
LIST supn = supn ;
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
LIST der_geahtes = der_geahtes ;
LIST !better: = !better: ;

LIST der_h = der_h ;
LIST der_heapmi = der_heapmi ;
LIST der_hudda = der_hudda ;
LIST der_huhtti = der_huhtti ;
LIST der_huvva = der_huvva ;
LIST der_halla = der_halla ;
LIST der_j = der_j ;
LIST der_l = der_l ;
LIST der_lasj = der_lasj ;
LIST der_las = der_las ;
LIST der_hat = der_hat ;

LIST der_meahttun = der_meahttun ;
LIST der_muš = der_muš ;
LIST der_n = der_n ;
LIST der_st = der_st ;
LIST der_stuvva = der_stuvva ;
LIST der_upmi = der_upmi ;
LIST der_supmi = der_supmi ;
LIST der_vuota = der_vuota ;
LIST der_inchl = der_inchl ;

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


LIST HAB-V-TAGS = (p3 pl) (p3 sg) conneg prfprc inf ;

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

SET SYN-V = vblex + SUBJ OR OBJ + vblex OR @ADVL + vblex OR (vblex @N←) OR (vblex @A←) OR vblex + SPRED OR (vblex @COMP-CS←) ;


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
LIST WORD = n adj adv vblex prn cnjsub cnjcoo post pr ij pcle num abbr acr \? ;
# any word

SET REALWORD = WORD - num - ord ;

SET REALWORD-NOTABBR = WORD - num - ord - abbr ;

SET WORD-NOTDE = WORD - ("<de>") ;

# Verb sets
# ---------

# Verbs and their complements
# - - - - - - - - - - - - - -

SET NOT-VERB = WORD - vblex;

# Finiteness and mood
# - - - - - - - - - -

SET V-IND-FIN = pres OR pret ;
# Problem: "In boahtán" is an invisible indicative

SET V-MOOD = indic OR pot OR imp OR cond OR (neg supn) ;

LIST GC = ("<gč>") ;

SET VFIN = GC OR V-MOOD - conneg ;

SET VFIN-POS = V-MOOD - conneg - neg ;

SET VFIN-NOT-IMP = VFIN - imp ;

SET VFIN-NOT-NEG = VFIN - neg ;
# this might be to strict, besides, "iige" can be written "ii ge"

SET NOT-PRFPRC = WORD - prfprc ;

# Person
# - - - -

LIST V-SG1 = (vblex p1 sg) ;

LIST V-SG2 = (vblex p2 sg) ;

LIST V-SG3 = (vblex p3 sg) ;

LIST V-DU1 = (vblex p1 du) ;

LIST V-DU2 = (vblex p2 du) ;

LIST V-DU3 = (vblex p3 du) ;

LIST V-PL1 = (vblex p1 pl) ;

LIST V-PL2 = (vblex p2 pl) ;

LIST V-PL3 = (vblex p3 pl) ;


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

SET LEAT-FIN-NOT-IMP = LEAT - imp;

LIST VPRFPRC = (vblex prfprc) ;
LIST LEATPRFPRC = ("<leat>"i prfprc) ;
SET PRC-NOT-LEAT = VPRFPRC - LEATPRFPRC ;
# In order to distinguish between real leat-constructions and participles of other verbs
LIST HABEO-SG3 = ("<leat>"i p3 sg) (vblex neg p3 sg) ("<šaddat>" p3 sg) ;

LIST HABEO-PL3 = ("<leat>"i p3 pl) (vblex neg p3 pl) ("<šadda>t" p3 pl)  ;

SET HABEO-3 = HABEO-SG3 OR HABEO-PL3 ;

# Pronoun sets
# ------------

LIST MUN = (pers p1 sg nom) ;
LIST DON = (pers p2 sg nom) ;
LIST SON = ("son" pers p3 sg nom) ;
LIST MOAI = (pers p1 du nom) ;
LIST DOAI = (pers p2 du nom) ;
LIST SOAI = (pers p3 du nom) ;
LIST MII-PERS = (pers p1 pl nom) ;
LIST DII = (pers p2 pl nom) ;
LIST SII = ("son" pers p3 pl nom) ;

SET PPRON-NOM-NOT-DAT = MUN OR DON OR SON OR MOAI OR DOAI OR SOAI OR MII-PERS OR DII OR SII ;

SET PPRON-NOT-DAT = pers - ("<dat>") ;

SET PPRON-DU-PL = MOAI OR DOAI OR SOAI OR MII-PERS OR DII OR SII ;
SET PPRON-PL = MII-PERS OR DII OR SII ;

SET PRON-DU = MOAI OR DOAI OR SOAI ;

SET PPRON-NOT-SII = MUN OR DON OR SON OR MOAI OR DOAI OR SOAI OR MII-PERS OR DII ;

LIST PPRON-GEN = (p1 sg gen) (p2 sg gen) (p3 sg gen) (p1 du gen) (p2 du gen) (p3 du gen)
	 (p1 pl gen) (p2 pl gen) (p3 pl gen) ;

SET PPRON-NOT-GEN = pers - PPRON-GEN ;

LIST DEM-SG = (prn dem sg nom) ;
LIST DEM-PL = (prn dem pl nom) ;
SET NOT-DEM = WORD - dem ;

LIST SGPRON = (prn p1 sg) (prn p2 sg) (prn p3 sg) (prn sg) (prn px1sg) (prn px2sg) (prn px3sg) ;
LIST DUPRON = (prn p1 du) (prn p2 du) (prn p3 du) (prn px1du) (prn px2du) (prn px3du) ;
LIST PLPRON = (prn p1 pl) (prn p2 pl) (prn p3 pl) (prn pl) (prn px1pl) (prn px2pl) (prn px3pl) ;
LIST DUPRON-NOTPX = (prn p1 du) (prn p2 du) (prn p3 du) ;

SET PRON-NOT-SG = DUPRON OR PLPRON ;

LIST DAT-PRON = ("<dat>") ("<dát>") ("<diet>") ("<duot>") ("<dot>") ;

LIST QUANT-PRON = "<ollu>" "<olu>" "<unnán>" "<váháš>" "<veaháš>" "<veháš>" ;
# This set is for choosing between Adv and Pron Indef.

# Adjectival sets and their complements
# -------------------------------------

SET NOT-A = WORD - adj ;
SET NOT-A-COMMA = WORD - adj - COMMA ;
SET NOT-Attr = WORD - attr ;
SET NOT-A-PCLE = WORD - adj - pcle ;

SET NOT-A-ADV = WORD - adj - adv OR ("<maid>") ;

LIST NOMINAL-ADJ = "<guoktilaš>" "<lámis>" "<oasálaš>" ("<suddu>" der_lasj) "<viissis>";

# and many others

# Adverbial sets and their complements
# ------------------------------------
SET LEX-ADV = adv - (a*) ;

SET NOT-ADV-DE = WORD - adv ;
SET NOT-ADV = NOT-ADV-DE OR ("<de>" adv) OR clb ;
SET NOT-ADV-PCLE = NOT-ADV - pcle ;


LIST MO-MANge = "<goas>" "<gokko>" "<gos>" "<gosa>" "<govt>" "<makkár>" "<man>" "<manne>" ("<manin>" adv) "<mo>" "<mot>" "<movt>" ("<nugo>" @CVP) (vblex qst) ;

SET MO = MO-MANge - ("man" foc_ge) ;

# Introduce finite clauses.

LIST PLACE-ADV = (sem_plc adv) ;
# There will usually be adj Gen in front.

LIST TIME-ADVL = (sem_time gen) (sem_time loc) ;

LIST TIME-ADV = (adv sem_time) ;


LIST DOPPE = "<badjin>"i "<bajil>"i "<dakko>"i "<dá>"i "<dákko>"i "<dáppe>"i "<diekko>"i "<dieppe>"i "<do>"i "<dokko>"i "<doppe>"i "<duo>"i "<duokko>"i "<duoppe>"i "<olgun>"i ;
# Adverbs with a locativic form, but don´t get Loc as a tag.

LIST DOHKO = "<bajás>" "<bajit>" "<deike>" "<diehke>" "<diehko>" "<dohko>" "<duohko>" "<lulás>" "<olggos>" "<ruoktot>" "<sisa>" "<vuovdimassii>" ;
# Adverbs with a illativic form, but they don´t get Ill as a tag.


# Coordinators
# ------------
LIST foc = foc_ge foc_gen foc_ges foc_gis foc_naj foc_ba foc_be foc_hal foc_han foc_bat foc_son foc_s foc_miss ;

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
LIST HAB-ACTOR-ALL = sem_hum sem_mal sem_sur sem_fem ant sem_ani pers ("<gii>") (prn ind) coll ;
SET HAB-ACTOR = HAB-ACTOR-ALL - ("<cihca>") ;
SET HAB-ACTOR-NOT-HUMAN = sem_org ;

# Sets of elements with common syntactic behaviour
# ================================================

SETS

#!! * Sets for verbs
# -----

LIST NOT-REAL-V = (actio nom) (actio gen) (actio loc) (actio com) prsprc ;

SET REAL-V = vblex - NOT-REAL-V ;
#!! ** V is all readings with a V tag in them, REAL-V should
#!! be the ones without an N tag following the V.
#!! The REAL-V set thus awaits a fix to the preprocess V ... N bug.


# The set REAL is smaller than COPULAS, made for verbs with PrfPrc complements: Seammás REAL-COPULAS son dovdan iežas...
LIST REAL-COPULAS = "<dáidit>" "<leat>"i "<soaitit>" "<veadjit>" ;

#!! * The set COPULAS is for predicative constructions
LIST COPULAS = "<dáidit>" "<gártat>" "<leat>"i "<soaitit>" "<šaddat>" "<orrut>" "<veadjit>"  ;
#  "bissut" ?
# 'Dáidit' can appear without 'leat'.

SET NOT-COP-V = vblex - COPULAS ;

SET MAIN-V = vblex - FAUXV ;

# All active verbs with a TV tag, including AUX-OR-MAIN.

LIST V-TRANS = (vblex tv) (iv der_ahtti) (iv der_h) ;


SET TRANS-V = V-TRANS - der_pass + REAL-V ;

#!! * NP sets defined according to their morphosyntactic features
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


LIST N-SG-NOM = (n sg nom) ;

SET HEAD-N = n - cmp_splitr ;

SET HEAD-N-NOM = (n nom) - cmp_splitr ;

SET SUBJECTHEAD = n OR adj OR prn - ref ; # These, can be subject heads

SET NP = n OR adj ; # anything that can take except numerals
SET NP-HEAD = prn OR HEAD-N - ("<buorre>") ;
SET NP-HEAD-SG = SGPRON OR (n sg) OR (adj sg) - cmp_splitr - dem - ("<buorre>") ;
SET NP-HEAD-PL = PLPRON OR (n pl) OR (adj pl) - cmp_splitr - dem - ("<buorre>") ;
SET NP-HEAD-SG-NOM = SGPRON + nom OR (n sg nom) OR (adj sg nom) - ("<buorre>") - cmp_splitr ;
SET NP-HEAD-PL-NOM = PLPRON + nom OR (n pl nom) OR (adj pl nom) - cmp_splitr - ("<buorre>") ;
SET NP-HEAD-NOM = NP-HEAD-SG-NOM OR NP-HEAD-PL-NOM ;
SET NP-HEAD-ACC = (prn acc) OR (n acc) OR (adj acc) - cmp_splitr - (dem attr) - ("<buorre>") ;
SET NP-HEAD-GEN = (prn gen) OR (n gen) OR (adj gen) - der_nomact - cmp_splitr - (dem attr) - ("<buorre>") ;

#!! * The PRE-NP-HEAD family of sets

#!! These sets model noun phrases (NPs). The idea is to first define whatever can
#!! occur in front of the head of the NP, and thereafter negate that with the
#!! expression __WORD - premodifiers__.


SET PRE-NP-HEAD = (np attr) OR (np @→N) OR (adj attr) OR (abbr attr) OR ("<buorre>")
OR (pers gen) OR (n gen) OR (adj gen) OR ("<buot>") OR (cmp) OR
num OR cmp_splitr OR cnjcoo OR (prn dem) OR (prn ref gen) OR (ind attr) OR
(prfprc @→N) OR prsprc OR (adj ord) OR (num @→N) OR (adj @→N) OR @→N OR @→A OR @→Pron OR @Num← OR (cnjcoo @CNP) OR (@→CC) OR (action gen) OR (@Pron←) ;
# The strict version of items that can only be premodifiers, not parts of the predicate

#LIST PRE-NP-HEAD = @>N @>A @>Pron @Num< @CNP ;

SET PRE-NP-V = prfprc OR prsprc OR der_nomag OR actio OR der_nomact OR (vblex adj) OR (pres p3 sg) + indic OR (pres p1 sg) + indic OR (imp p2 du) ;
# to be used together with PRE-NP-HEAD before @>N is disambiguated

SET NP-MEMBER = PRE-NP-HEAD OR n ;

SET PRE-A-N = (pers gen) OR (pers acc) OR (prn ind) OR num OR (adj ord) OR (adj attr) OR (prn dem) OR (prn ref gen) OR (prn ref acc) ; # Acc pga av manglende disambiguering tidlig i fila

SET NOT-PRE-A-N = WORD - PRE-A-N ;

LIST PUNCT-LEFT = lquot ;
LIST PUNCT-RIGHT = rquot ;

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
SET NOT-NPMODADV-INDEF = WORD - PRE-NP-HEAD - adv - ind ;
## NOT-NPMODADVI = "     ...-OR-INDEF"
SET NOT-NPMODADVII = WORD - PRE-NP-HEAD - adv - ind - ill ;
# Illative indir.obj.
SET NOT-NPMODADVIIP = WORD - PRE-NP-HEAD - adv - ind - ill - pcle ;
# <== is this our NOT-NPMOD set?
SET NOT-NPMODCC = WORD - PRE-NP-HEAD - COMMA - @CNP ;
SET NAPP = WORD - PRE-APP ;



#!! * Miscellaneous sets
# ------------------
LIST Px = px1sg px2sg px3sg px1du px2du px3du px1pl px2pl px3pl ;

LIST GASKAL = "<gaskal>" "<gaskkal>" "<gaskii>" "<gaskka>" "<gaskkas>" ;

# p-positions that like coordination

LIST TIME-PP = "<badjel>" "<čađa>" "<earret>" "<gaskkal>" "<guovddáš>" "<maŋŋel>" "<maŋŋil>" "<maŋŋá>" "<miehtá>" "<ovdal>" ;


SET NUM = num - OKTA ;

# this set does not contain ordinals, I am not sure if that is necessary.

SET NOT-NUM = WORD - num ;

LIST MANGA = "<máŋga>" "<galle>" ;
# Not referred to by any rule.

SET CARDINALS = num - ord - MANGA ;

SET NOT-CC = WORD - cnjcoo ;

SET NOT-PCLE = WORD - pcle ;

LIST COMPAR = "<dávji>" "<eanet>" "<earalágan>" "<eará>" "<earret>" "<seammás>" "<seammalágan>" "<seamma láhkái>" ;

# These combine with "go" Pcle, but COMPAR stands for 'comparison' rather than
# 'comparative'.

LIST CONTRA = "<muhto>" ;
# In lean muitalan, muhto dál muitalan.

LIST PROSEANTA = "<proseanta>" "<%>" ;

SET REAL-CLB = clb - COMMA ;


SET NOT-INITIAL-CC = WORD - INITIAL - cnjcoo ;



#!! * Border sets and their complements
# ---------------------------------

SET CP = (prn itg) OR (prn rel) OR MO ;

LIST BOUNDARYSYMBOLS = "<\;>" "<:>" "<->" "<–>" ;

SET S-BOUNDARY = CP OR BOUNDARYSYMBOLS OR ("<muhto>") OR ("<de>" adv) OR (neg supn) OR @CVP OR ("<vel>" adv qst) ;
# does not include CS, because of "go" in questions, before it is disambugated.
# includes CP
# this one includes @CVP, the conjunction which actually connects two sentences (each with a finite verb) to each other,
# and not @CNP, which coordinates internal NP-/AdvP-/AP ... coordination
# To be used only AFTER the disambiguation of @CVP and @CNP taking place in the chapter right before "Disambiguating pronouns"


SET BOC = S-BOUNDARY OR BOS ;
SET BOC-PUNCT = BOC - ("-") - ("–") ;
SET EOC = S-BOUNDARY OR EOS ;

SET NP-BOUNDARY = BOS OR EOS OR REAL-CLB OR VFIN OR inf OR (actio ess) OR conneg OR vgen OR supn OR PPRON-NOT-GEN OR res OR post OR pr OR pcle OR interj OR cnjsub OR  @CVP ;

SET APP-BOUNDARY = REAL-CLB OR VFIN OR inf OR (actio ess) OR conneg OR vgen OR supn OR res OR post OR pr OR pcle OR interj OR cnjsub OR prfprc - @→N ;
# A special barrier used with mapping of appositions.

# This set contains FMAINV with @, which means that it functions for all kind of mainverbs after the verb-mapping rules
SET SV-BOUNDARY = S-BOUNDARY OR inf - FAUXV OR supn OR FMAINV ;
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

REMOVE cmp (0 n) ;


# Conditionalis: kunne vs skulle vs ville
SELECT:buoremus-livččii (cond-ville) (-1 adj + sup) (0 ("<leat>"i)) ;
SELECT:sáhttit (cond-skulle) (0 ("<sáhttit>"i)) ;
SELECT:fallback-kunne (cond) ;

SET OLLU = ("<ollu>"i) OR  ("<olu>"i) ;

SELECT ("mye"i) (0 OLLU LINK *1 (sem_plc_substnc_wthr) OR n + sg BARRIER n) ;
SELECT ("mye"i) (0 OLLU LINK 1 comp) ;
SELECT ("mange"i) (0 OLLU LINK *1 pl BARRIER WORD - attr) ;
SELECT:fallback ("mye"i) (0 OLLU) ;


SELECT ("bak"i) (0 ("<duohken>"i) LINK -1 sem_build OR sem_plc - (top) OR ("<lohku>"i)) ;
SELECT:fallback ("avhengig av"i) (0 ("<duohken>"i)) ;

SELECT ("om"i) (0 ("<alde>"i) OR ("<nalde>"i) LINK *-2 ("<nággu>"i) OR ("<gilvu>"i) OR ("<gilvalit>"i) OR ("<nágget>"i) OR ("<riidu>"i) OR ("<riidalit>"i) BARRIER SV-BOUNDARY) ;
SELECT:fallback ("på"i) (0 ("<alde>"i) OR ("<nalde>"i)) ;

# go (default)=> når
# go:1 => at, go:2 => enn, go:3 => som, go:4 => da, go:5 => fordi

SELECT:når ("når"i) (0 ("<go>"i)) (-1 ("<rápmi>"i) + loc) ;

SELECT:så-langt-som ("som"i) (0 ("<go>"i)) (-2 ("så" "<nu>")) (-1 adj OR adv OR ind) (0 cnjsub) ;
SELECT:som ("som"i) (0 ("<go>"i)) (*-1 ("<seammá>"i) OR ("<liikka>"i) BARRIER SV-BOUNDARY) ;
SELECT:som ("som"i) (0 ("<go>"i)) (1 ("<eará>"i) OR ("<navdit>") OR ("<jáhkkit>")) ;
SELECT:som ("som"i) (0 ("<go>"i)) (-1 comp LINK -1 ("<beali>"i)) ;

SELECT ("at"i) (0 ("<go>"i)) (0 cnjsub) (-1 ("<maŋŋel>"i) OR ("<ovdal>"i) OR ("<dan dihte>"i) LINK 0 adv) ;
SELECT ("at"i) (0 ("<go>"i)) (0 cnjsub) (-1 COPULAS LINK -1 (adj nom)) ;
#SELECT ("at"i) (0 ("<go>"i)) (0 cnjsub) (-1 adj - comp) ;
## Son bijai vuosttaš spáppa mollii 22 minuvtta maŋŋel go čiekčamat ledje álgán.
## Buorre lei go bohtet.
## Gummá go ii boahtán.

SELECT ("enn"i) (0 ("<go>"i)) (0 cnjsub LINK 1 ("<vejolaš>"i)) ;
SELECT ("enn"i) (0 ("<go>"i)) (0 cnjsub LINK 1 (@COMP-CS←)) ;
SELECT ("enn"i) (0 ("<go>"i)) (0 cnjsub LINK -1 (@COMP-CS←)) ;
SELECT ("enn"i) (0 ("<go>"i)) (0 cnjsub) (-1 ("<veara>"i) OR ("<eará>"i)) ;
SELECT ("enn"i) (0 ("<go>"i)) (-1 ("<veara>"i) OR ("<eará>"i)) ;
SELECT ("enn"i) (0 ("<go>"i)) (1 ("<dušše>"i) OR ("<goassege>"i)) ;
SELECT ("enn"i) (0 ("<go>"i)) (-1 conneg LINK -1 neg)(NEGATE 1 VFIN) ;
SELECT ("enn"i) (0 ("<go>"i)) (0 cnjsub) (*-1 ("<ovdal>"i) OR ("<eará>"i) BARRIER S-BOUNDARY) ;
SELECT ("enn"i) (0 ("<go>"i)) (0 cnjsub) (*-1 comp BARRIER VFIN OR S-BOUNDARY) ;
## Son lea viššaleabbo go mun.
## Dat dáidá riggát go mii jáhkkit.
## Dii han lehpet eanet veara go ollu cizážat.
## Viššalat ohppet eanet go láikkit.
## Ovdal buorida son dálkkiidis go neavrres olmmoš dábiidis.

SELECT ("som"i) (0 ("<go>"i)) (0 cnjsub) ((-1 ("<nu>"i) OR ("<seammá>"i) OR ("<seammás>"i) LINK 0 adv) OR (-1 adv OR adj LINK -1 ("<nu>"i))) ;
## Elvenes oaččui Niehkostipeandda nu go lei sávvan.

SELECT ("da"i) (0 ("<go>"i)) (0 cnjsub) (*1 (vblex pret) BARRIER (←hab→) OR (@ADVL→)) ;

SELECT ("fordi"i) (0 ("<go>"i)) (0 cnjsub) (1 (@ADVL→) OR (←hab→) LINK 1 COPULAS) ;
## Olbmot leat čoagganan Kárášjoga márkanii, go márkanis leat beassášdoalut.

SELECT ("fordi"i) (0 ("<go>"i)) (-1 adj + nom) ;


SELECT ("når"i) (0 ("<go>"i) LINK *1 indic) ;
SELECT:fallback ("når"i) (0 ("<go>"i) + cnjsub) ;

#SELECT ("i"i) (0 ("<otná>"i) LINK 1 (sem_time)) ;
SELECT ("i dag"i) (0 ("<otná>"i) LINK 1 post) ;
SELECT:fallback ("dagens"i) (0 ("<otná>"i)) ;

SELECT:fallback ("hvilken av de to"i) (0 ("<goabbá>"i)) ;

SELECT:fallback ("i hele"i) (0 ("<miehtá>"i)) ;

SELECT ("rundt"i) (0 ("<birra>"i) LINK 0 post LINK *0 ("<vuodjit>"i) ) ;
SELECT ("på"i) (0 ("<birra>"i) LINK 0 post LINK *-1 ("<jurddašit>"i) BARRIER SV-BOUNDARY ) ;
SELECT:fallback ("om"i) (0 ("<birra>"i)) ;

SELECT ("innen"i) (0 ("<sisa>"i) LINK 0 post LINK -1 sem_time) ;
SELECT:fallback ("inn i"i) (0 ("<sisa>"i) LINK 0 post) ;

SELECT:fallback ("foran"i) (0 ("<ovdalii>"i) ) ;

SELECT ("alene"i) (0 ("<iehčanassii>"i)) (-1 ("leat"i)) ;

# post: mielde => med, mielde:1 => langs, mielde:2 => i følge, mielde:3 => etter
SELECT ("etter"i) (0 ("<mielde>"i)) (0 post) (-1 ("<dárbu>"i) OR ("<miella>"i)) ;
SELECT ("i løpet av"i) (0 ("<mielde>"i)) (0 post LINK -1 sem_time)  ;
SELECT ("langs"i) (0 ("<mielde>"i)) (0 post) (-1 ("<šaldi>"i)) ;


## Don vieččat boaldinmuoraid dárbbu mielde.
SELECT ("med"i) (0 ("<mielde>"i)) (0 adv)  ;
SELECT ("med"i) (0 ("<mielde>"i)) (-1 ("<ahki>"i) OR ("<stevvel>"i))  ;

SELECT ("for å"i) IF (0 ("<vai>"i) + cnjsub) (1 inf) ;
SELECT:fallback ("for at"i) IF (0 ("<vai>"i) + cnjsub) (NOT 1 inf) ;


SELECT ("all"i) IF (0 ("<juohke>"i) LINK 1 ("<lágan>")) ;
#$ juohke lágán geđggiiguin

SELECT ("mens"i) IF (0 ("<bodda>"i) LINK -1 ("<dat>") LINK 0 gen) ;

SELECT ("stenge"i) IF (0 ("<gitta>"i) LINK *0 ("<geaidnu>"i) OR ("<luodda>"i) OR ("<gáhtta>"i) OR ("<uksa>"i) BARRIER S-BOUNDARY) ;
SELECT ("helt"i) IF (0 ("<gitta>"i) + @→A OR ("<gitta>"i) + @→N) ;
SELECT ("helt"i) IF (0 ("<gitta>"i) LINK 1 sem_time + ill) ;
SELECT ("inntil"i) IF (0 ("<gitta>"i) + @→Num) ;
SELECT ("fast"i) IF (0 ("<gitta>"i)) (*-1 ("<váldit>"i) OR ("<váldot>"i) OR ("<darvánit>"i) OR ("<oažžut>"i) OR ("<fidnet>"i))  ;
SELECT:fallback ("lukket"i) IF (0 ("<gitta>"i) LINK *0 ("<čalbmi>"i))  ;
SELECT:fallback ("stenge"i) IF (0 ("<gitta>"i))  ;

SELECT ("så"i) IF (0 ("<ná>"i) LINK 1 adj OR adv)  ;
SELECT:fallback ("slik"i) IF (0 ("<ná>"i))  ;

SELECT:fallback ("enda"i) IF (0 ("<vel>"i))  ;


# Verbs
# =====

#leat

# leat 0 = være, 1 = ha, 2 = måtte («ha å»)
SELECT:adj ("være"i) IF (0 ("<leat>"i) LINK 1 ("<lihkku>"i) LINK 0 (←ext→)) ; # mus lea lihkku - jeg er heldig
SELECT:aux ("ha"i) IF (0 ("<leat>"i) LINK 1 ("<dáhpáhuvvat>"i) OR ("<leat>"i))  ; 
SELECT:aux (agreem-pro) IF (0 ("<leat>"i) LINK *1 ("<dáhpáhuvvat>"i) OR ("<leat>"i) OR (agreem-pro) BARRIER NOT-ADV)  ; 
SELECT:aux ("være"i) IF (0 ("<leat>"i) LINK 1 (agreem-pro))  ; 

SELECT ("måtte"i) IF (0 ("<leat>"i) LINK -1 loc + HUMAN) (1 inf) ;
# mis lea cahkkehit dola
SELECT:hab-ha ("ha"i) IF (0 ("<leat>"i)) (*-1 (@ADVLhab→)  BARRIER SV-BOUNDARY) ;
SELECT:hab-ha ("ha"i) IF (0 ("<leat>"i)) (*1 (@←ADVLhab)  BARRIER SV-BOUNDARY) ;
SELECT:neg-ha ("ha"i) IF (0 ("<leat>"i)) (-1 neg) (*-2 ←hab→ BARRIER NOT-ADV) ;
SELECT:ha-NOT-actio ("ha"i) IF (0 ("<leat>"i)) (0 FAUXV) (NEGATE *1 actio + ess BARRIER S-BOUNDARY) (NOT *1 der_pass + prfprc) ;
# sin giella lea<er> áitojuvvon ja sáhttá jávkat; … sii leat<er> dál<Adv> guorahallamin<Actio> …
# Dat leat šaddan nu stuorat ahte dat šaddá nu váivi ja lossat dan oahpat dan dáfus go sii leat massán dan interessa mii sis lei go sii ledje unnibut
# Leat go Ibsenii sáddemin dieđu?
SELECT:ha-pret ("ha"i) IF (0 ("<leat>"i) LINK NOT -1 @SPRED→) (0 (indic pret)) (1 inf) ;
# Jos mun ledjen dadjat sátnegeažige, de ii son lean vuolgit.
# (Perf Cond 2)
# TODO: Gávpotmuvrra vuođđogeađggit ledje<være> čiŋahuvvon
# (unfortunately no animacy, and agreem-pro isn't until bidix...)
# TODO: ledje<ha> ovdalaččas guokte nieidda

#SELECT:ha-prfprac  ("ha"i) IF (0 ("<leat>"i)) (*1 prfprc + @-FMAINV BARRIER SV-BOUNDARY) ; #LOOK AT THIS

SELECT:Det-er ("være"i) IF (0 ("<leat>"i)) (-1 ("<Dat>") + @SUBJ→) ; # Dat lea …

SELECT:Det-er ("få# være"i) IF (0 ("<bállet>"i)) (1 ("<ráfi>") ) ;
SELECT:fallback ("ha# ro til"i) IF (0 ("<bállet>"i))  ;


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

SELECT ("ære"i) IF  (0 ("<gudnejahttit>"i)) (*-1 acc BARRIER SV-BOUNDARY LINK 0 sem_hum OR (ant) OR ("<Ipmil>"i) OR ("<.*rohkki>"r)) ;
SELECT ("ære"i) IF  (0 ("<gudnejahttit>"i)) (1 acc LINK 0 sem_hum OR (ant) OR ("<Ipmil>"i) OR ("<.*rohkki>"r)) ;
SELECT ("hedre"i) IF  (0 ("<gudnejahttit>"i) LINK 1 ("<dihte>"i)) ;

SELECT:fallback ("respektere"i) IF  (0 ("<gudnejahttit>"i)) ;

SELECT ("eller"i) IF  (0 ("<ii>"i) LINK 0 (foc_neg-ge))(NOT -1 COMMA)(*-1 neg)  ;
SELECT:fallback ("ikke"i) IF  (0 ("<ii>"i)) ;

SELECT ("tilkalle"i) IF  (0 ("<rávkat>"i) LINK 1 ess) ;
SELECT:fallback ("vekke"i) IF  (0 ("<rávkat>"i)) ;


SELECT ("barbere"i) IF  (0 ("<beaskidit>"i)) (0* ("<oaivi>"i)) ;
SELECT:fallback ("klippe"i) IF  (0 ("<beaskidit>"i)) ;

SELECT ("renne"i) IF  (0 ("<suohpput>"i))(0* ("<čuoldit>"i) OR ("<vuotta>"i) OR ("<boagán>"i)) ;
SELECT:fallback ("kaste"i) IF  (0 ("<suohpput>"i)) ;


SELECT:fallback ("veve# opplukk"i) IF  (0 ("<čuoldit>"i)) ;

SELECT ("få# plass"i) IF  (0 ("<šiehttat>"i)) (*1 ill BARRIER SV-BOUNDARY) ;
SELECT:fallback ("avtale"i) IF  (0 ("<šiehttat>"i)) ;

SELECT ("sist"i) IF  (0 ("<vássit>"i) LINK 0 @→N) ;
SELECT:fallback ("svinne"i) IF  (0 ("<vássit>"i)) ;

SELECT ("legge# til"i) IF  (0 ("<lasihit>"i) LINK -1 HUMAN + nom OR cnjcoo OR COMMA) ;
SELECT ("legge# til"i) IF  (0 ("<lasihit>"i) LINK 1 HUMAN + nom) ;
SELECT:fallback ("øke"i) IF  (0 ("<lasihit>"i)) ;


SELECT ("trakassere"i) IF  (0 ("<loavkašuhttit>"i) LINK -1 ("<seksualálaš>"i)) ;
SELECT:fallback ("fornærme"i) IF  (0 ("<loavkašuhttit>"i)) ;

SELECT ("bryte"i) IF  (0 ("<gaikut>"i) LINK 1 ("<sisa>"i)) ;
SELECT:fallback ("rive"i) IF  (0 ("<gaikut>"i)) ;


SELECT ("røkte"i) IF  (0 ("<dikšut>"i) LINK *0 sem_lang + acc) ;
SELECT:fallback ("stelle"i) IF  (0 ("<dikšut>"i)) ;

SELECT ("videreføre"i) IF  (0 ("<fievrridit>"i) LINK *0 sem_lang + acc) ;
SELECT:fallback ("frakte"i) IF  (0 ("<fievrridit>"i)) ;


SELECT ("kollidere"i) IF  (0 ("<beaškkehit>"i) LINK *0 ("<oktii>"i) OR ("<biila>"i)) ;
SELECT:fallback ("smelle"i) IF  (0 ("<beaškkehit>"i)) ;


SELECT ("spille"i) IF  (0 ("<neaktit>"i) LINK *1 acc BARRIER NOT-NPMODADV) ;
SELECT:fallback ("utøve skuespill"i) IF  (0 ("<neaktit>"i)) ;


SELECT ("vike"i) IF  (0 ("<gáidat>"i) LINK NOT 0 der_nomact) (0* ("<láhka>"i) LINK 0 nom) ;
SELECT:fallback ("fjerne"i) IF  (0 ("<gáidat>"i)) ;


SELECT ("lage"i) IF  (0 ("<duddjot>"i)) (0* acc BARRIER SV-BOUNDARY) ;
SELECT:fallback ("lage# duodji"i) IF  (0 ("<duddjot>"i)) ;

SELECT:fallback ("veilede"i) IF  (0 ("<rávvet>"i)) ;

SELECT:fallback ("merke"i) IF  (0 ("<vuohttit>"i)) ;



SELECT ("spire"i) IF  (0 ("<bohciidit>"i)) (0* sem_plant) ;
SELECT:fallback ("oppstå"i) IF  (0 ("<bohciidit>"i)) ;

SELECT ("ta# på"i) IF  (0 ("<coggat>"i)) (1 sem_clth) ;
SELECT:fallback ("putte"i) IF  (0 ("<coggat>"i)) ;

SELECT ("ta"i) IF  (0 ("<nahkehit>"i) ) (1 sem_clth) ;
SELECT:fallback ("putte"i) IF  (0 ("<nahkehit>"i)) ;

SELECT:fallback ("redusere"i) IF  (0 ("<unnidit>"i)) ;


SELECT ("fremme"i) IF  (0 ("<ovddidit>"i) LINK 1 acc) (*1 ill) ;
SELECT:fallback ("utvikle"i) IF  (0 ("<ovddidit>"i)) ;

SELECT:fallback ("gå"i) IF  (0 ("<lávket>"i) LINK *1 ill BARRIER NOT-Attr) ;
SELECT:fallback ("skritte"i) IF  (0 ("<lávket>"i)) ;


SELECT ("kalve"i) IF  (0 ("<guoddit>"i) LINK -1 ("<ala>"i) OR  ill) ;
SELECT ("kalve"i) IF  (0 ("<guoddit>"i) LINK *0 ("<áldu>"i)) ;
SELECT:fallback ("bære"i) IF  (0 ("<guoddit>"i)) ;


SELECT ("felle"i) IF  (0 ("<njeaidit>"i)) (0* sem_ani OR sem_plant BARRIER SV-BOUNDARY ) ;
SELECT:fallback ("velte"i) IF  (0 ("<njeaidit>"i)) ;

SELECT ("joike"i) IF  (0 ("<rohttestit>"i) OR ("<rohttet>"i)) (0* ("<luohti>"i) BARRIER SV-BOUNDARY ) ;
SELECT:fallback ("rykke"i) IF  (0 ("<rohttestit>"i)) ;


SELECT:fallback ("gjennomføre"i) IF  (0 ("<doibmiibidjat>"i)) ;


SELECT ("ville# ha"i) IF  (0 ("<háliidit>"i) + FMAINV LINK *1 n + acc BARRIER NOT-NPMOD LINK NOT 1 TRANS-V ) ;
SELECT ("ville# ha"i) IF  (0 ("<háliidit>"i) + FMAINV LINK 1 num ) ;
SELECT ("ville# ha"i) IF  (0 ("<háliidit>"i) + FMAINV LINK 1 qst LINK *1 n + acc BARRIER NOT-NPMOD ) ;
SELECT:fallback ("ville"i) IF  (0 ("<háliidit>"i)) ;


SELECT ("sette# fast"i) IF  (0 ("<darvánit>"i) LINK *0 sem_veh ) ;
SELECT:fallback ("feste"i) IF  (0 ("<darvánit>"i)) ;

SELECT:fallback ("berøre"i) IF  (0 ("<čuohcat>"i)) ;
SELECT:fallback ("berøre"i) IF  (0 ("<čuohcit>"i)) ;


SELECT ("turnere"i) IF  (0 ("<johtit>"i) LINK *0 np + nom ) ;
SELECT ("turnere"i) IF  (0 ("<johtit>"i) LINK 0 der_inchl ) ;
SELECT ("flytte"i) IF  (0 ("<johtit>"i) LINK 0 prsprc ) ;
SELECT ("flytte"i) IF  (0 ("<johtit>"i) LINK *0 ("<eallu>"i) OR ("<boazu>"i) OR ("<siida>"i) ) ;
SELECT:fallback ("flytte"i) IF  (0 ("<johtit>"i)) ;


SELECT ("knyttet"i) IF  (0 ("<čadnot>"i) LINK 1 ill + sem_plc ) ;
SELECT:fallback ("binde"i) IF  (0 ("<čadnot>"i)) ;

REMOVE (pasv) IF  (0 ("<riegádit>"i) LINK 0 prfprc ) ;
SELECT:fallback (pasv) IF  (0 ("<riegádit>"i)) ;


SELECT ("bevare"i) IF  (0 ("<bisuhit>"i) LINK *0 sem_lang OR ("<kultuvra>"i) ) ;
SELECT:fallback ("beholde"i) IF  (0 ("<bisuhit>"i)) ;

SELECT ("veie"i) IF  (0 ("<deaddit>"i) LINK *0 sem_measr OR sem_ani ) ;
SELECT:fallback ("trykke"i) IF  (0 ("<deaddit>"i)) ;


SELECT ("forbruke"i) IF  (0 ("<loaktit>"i) LINK 1 acc ) ;
SELECT:fallback ("trives"i) IF  (0 ("<loaktit>"i)) ;


SELECT ("nå"i) IF  (0 ("<joksat>"i)) (0* sem_veh) ;
SELECT ("nå"i) IF  (0 ("<joksat>"i)) (1 ill) ;
SELECT:fallback ("oppnå"i) IF  (0 ("<joksat>"i)) ;

SELECT ("heve"i) IF  (0 ("<lonuhit>"i)) (0*  ("<ruhta>"i)) ;
SELECT:fallback ("bytte"i) IF  (0 ("<lonuhit>"i)) ;

SELECT:fallback ("samordne"i) IF  (0 ("<ovttastit>"i)) ;


SELECT ("veve"i) IF  (0 ("<gođđit>"i)) (0* ("<liidni>"i)) ;
SELECT:fallback ("strikke"i) IF  (0 ("<gođđit>"i)) ;

SELECT ("sirkulere"i) IF  (0 ("<jorrat>"i)) (0* (sem_semcon) ) ;
SELECT:fallback ("dreie"i) IF  (0 ("<jorrat>"i)) ;

SELECT ("ta"i) IF  (0 ("<goddit>"i) LINK 0 der_pass) (0* sem_ani-fish) ;
SELECT ("få"i) IF  (0 ("<goddit>"i)) (0* sem_ani-fish) ;
SELECT:fallback ("drepe"i) IF  (0 ("<goddit>"i)) ;


SELECT ("samle"i) IF  (0 ("<čoaggit>"i)) (0* ("<ruhta>"i) + acc OR sem_curr + acc OR sem_curr + gen OR ("<namma>"i) + acc OR ("<namma>"i) + gen) ;
SELECT:fallback ("plukke"i) IF  (0 ("<čoaggit>"i)) ;

SELECT ("regne# ut"i) IF  (0 ("<rehkenastit>"i)) (1 ("<gallis>"i) OR ("<galle>"i)) ;
SELECT:fallback ("regne"i) IF  (0 ("<rehkenastit>"i)) ;


SELECT ("tilegne"i) IF  (0 ("<oamastit>"i)) ((1 ill) OR (-1 ill)) ;
SELECT:fallback ("eie"i) IF  (0 ("<oamastit>"i)) ;

SELECT ("innvie"i) IF  (0 ("<vihahit>"i)) (*0 ("<áltár>") BARRIER SV-BOUNDARY  LINK 0 nom OR acc) ;
SELECT:fallback ("vie"i) IF  (0 ("<vihahit>"i)) ;

SELECT ("bli"i) IF  (0 ("<boahtit>"i)) (1 ("<ovtta oaivilii>")) ;
SELECT:fallback ("komme"i) IF  (0 ("<boahtit>"i)) ;

SELECT ("utdanne"i) IF  (0 ("<oahppat>"i) LINK 0 prfprc + @→N) ;
SELECT:fallback ("lære"i) IF  (0 ("<oahppat>"i)) ;


SELECT:fallback ("ferde"i) IF  (0 ("<vánddardit>"i)) ;
SELECT:fallback ("bruke"i) IF  (0 ("<ádjánit>"i)) ;


SELECT ("stenge"i) IF  (0 ("<giddet>"i) LINK *0 (sem_route) OR ("<.*luodda>"r) OR ("<.*geaidnu>"r)) ;
SELECT:fallback ("lukke"i) IF  (0 ("<giddet>"i)) ;

SELECT:fallback ("avskjede"i) IF  (0 ("<lihccut>"i)) ;


SELECT ("utelate"i) IF  (0 ("<guođđit>"i)) (*1 ("<eret>")) ;
SELECT:fallback ("forlate"i) IF  (0 ("<guođđit>"i)) ;

SELECT ("møtes"i) IF  (0 ("<deaivvadit>"i) LINK NOT *1 com BARRIER SV-BOUNDARY) ;
SELECT:fallback ("møte"i) IF  (0 ("<deaivvadit>"i)) ;


SELECT ("fotografere"i) IF  (0 ("<govvet>"i)) (*1 np) ;
SELECT ("fotografere"i) IF  (0 ("<govvet>"i) LINK 0 prfprc) (-1 np + (cog) OR np + (ant)) ;
SELECT ("fotografere"i) IF  (0 ("<govvet>"i)) (1 ("<:>")) ;
SELECT ("fotografere"i) IF  (0 ("<govvet>"i)) (*0 ("<govva>"i)) ;
SELECT:fallback ("fotografere"i) IF  (0 ("<govvet>"i)) ;


SELECT:fallback ("oppleve"i) IF  (0 ("<vásihit>"i)) ;


SELECT ("legge# til rette"i) IF  (0 ("<láhčit>"i)) (1 cnjsub OR ("<sadji>")) ;
SELECT ("legge# opp"i) IF  (0 ("<láhčit>"i)) (1 ill) ;
SELECT ("legge# til rette"i) IF  (0 ("<láhčit>"i)) (-1 @OBJ→ + acc) ;
SELECT ("legge# til rette"i) IF  (0 ("<láhčit>"i)) (1 @←OBJ + acc) ;
SELECT:fallback ("legge# opp til"i) IF  (0 ("<láhčit>"i)) ;


# orrut 0 = synes, 1 = bo, 2 = bli, 3 = være
SELECT:dego ("synes"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (1 ("<dego>"i) OR (actio ess) OR ("<bures>"i) OR ("<ballu>"i) OR ("<illu>"i)) ;
SELECT:dego ("synes"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (2 ("<miella>"i) + loc OR ("<mielas>"i) OR ("<bures>"i) OR ("<ballu>"i) OR ("<illu>"i)) ;
SELECT:maid ("synes"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (-1 ("<mii>"i)) ;
SELECT:jaska ("synes"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (*1 ("<oahpis>"i)) ;
SELECT:jaska ("være"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (1 ("<jaska>"i)) ;
SELECT:dego ("virke"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (1 ("<nu>"i) OR adj + nom) ;
SELECT:bli ("bli"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (-1 ("<go>"i)) ;
SELECT:orron-doppe ("bo"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (*1 loc OR DOPPE OR ("<bealde>"i) BARRIER SV-BOUNDARY) ;
#This rule should have another barrier, a set of all words except TIME-ADV.
#For sentences like: Mun orron diibmá Romssas.
#Check SET ORRUT-BO
SELECT:doppe-son-orui ("bo"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (-1 @SUBJ→) (-2 loc OR DOPPE) ;
SELECT:doppe-son-orui ("bo"i) (0 ("<orrut>"i) OR ("<orrot>"i)) (-1 sem_plc + loc OR DOPPE) ;
SELECT ("bo"i) (0 ("<orrut>"i) OR ("<orrot>"i) LINK NEGATE *1 actio + ess ); 

SELECT:fallback ("synes"i) (0 ("<orrut>"i) OR ("<orrot>"i)); # says parallel corpus

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
SELECT ("føde"i) (0 ("<šaddat>"i)) (1 np + sem_plc + loc) (NEGATE *0 SPRED)(*-1 HUMAN + nom) ;
# Mun lean šaddan Kárášjogas.
# Kárášjogas mun lean šaddan.

SELECT:fallback ("bli"i) + (agreem-pro) (0 ("<šaddat>"i)) ;

# bargat 0 = arbeide, 1 = gjøre
SELECT ("gjøre"i) (0 ("<bargat>"i)) (*-1 ("<mii>"i prn acc) BARRIER V-IND-FIN) ;
SELECT ("gjøre"i) (0 ("<bargat>"i)) (*0 @OBJ→ OR @←OBJ OR @-F←OBJ BARRIER S-BOUNDARY) ;
SELECT ("arbeide"i) (0 ("<bargat>"i)) (*0 com OR ("<dainna>"i)) ;
SELECT:fallback ("arbeide"i) (0 ("<bargat>"i));

# beassat 0 = få, 1 = slippe, 2 = komme Refl til
## Sii leat beassan eallit dego gonagasat.

SELECT ("slippe"i) (0 ("<beassat>"i)) (*1 (@-F←ADVL-ela) OR (@←ADVL-ela) OR DOHKO OR actio + loc BARRIER SV-BOUNDARY) ;
	#$ Váttis beassat dien bahádagus eret.
	## Mun bessen vuolgimis.
SELECT ("komme"i) (0 ("<beassat>"i)) (*1 ill OR DOHKO BARRIER SV-BOUNDARY) ;
SELECT ("komme"i) (0 ("<beassat>"i) LINK *1 ("<searvái>")) ;
SELECT ("komme"i) (0 ("<beassat>"i) LINK *1 (@←ADVL-ela) BARRIER SV-BOUNDARY) ;
## In beassan skuvlii dan beaivve.  Jeg kom meg ikke på skolen den dagen.
## Maiddái Ranghild Nystad beassá Sámediggái. Også RN kommer seg inn på Sametinget.
## Sii ledje gáibidan ahte son galgá beassat riikastivrii. Du hadde krevd at han skulle komme seg inn i landsstyret.
## Mun nu illudan beassat duoddarii. Jeg gleder meg så til å komme meg på vidda.
## Nuoraidklubba nuorat besset dál Internehttii. Ungdomssklubbens ungdommer kommer seg nå på Internett.
SELECT:fallback ("få"i) (0 ("<beassat>"i));

# bivdit 0 = be, 1 = spørre, 2 = fiske, 3 = jakte
SELECT ("be"i) (0 ("<bivdit>"i) LINK *1 qst OR ("<veahkki>"i) OR ("<doarjja>"i) OR (sem_act) + acc BARRIER SV-BOUNDARY);
SELECT ("be"i) (0 ("<bivdit>"i) LINK 1 ("<ahte>"i) OR ("<veahkki>"i));
SELECT ("fiske"i) (0 ("<bivdit>"i)) (*0 ("<.*mearra>"r) OR ("<.*fanas>"r) OR ("<.*johka>"r) OR ("<.*jávri>"r)  OR ("<.*čázádat>"r) OR ("<sáibma>"r) OR ("<.*fierbmi>"r)  OR sem_ani-fish OR ("<reahkká>"i) OR ("<stággu>"i) OR ("<birrajándora>"i) OR ("<gonagasreabbá>"i) );
SELECT ("fisker"i) (0 ("<bivdi>"i)) (*0 ("<.*mearra>"r) OR ("<.*johka>"r) OR ("<.*jávri>"r) OR ("<.*čázádat>"r)  OR ("<sáibma>"i) OR ("<.*fierbmi>"r) OR ("<stággu>"i)  OR sem_ani-fish  OR ("<gonagasreabbá>"i) OR ("<.*reabbábivdu>"ri) );
SELECT ("jakte"i) (0 ("<bivdit>"i)) (*0 sem_ani LINK 0 acc OR gen );
SELECT:fallback ("be"i) (0 ("<bivdit>"i));
SELECT:fallback ("jeger"i) (0 ("<bivdi>"i));

SELECT ("ta# hensyn"i) (0 ("<váldit>"i)) (*1 ("<vuhtii>"i)) ;
SELECT ("ta# hensyn"i) (0 ("<váldit>"i)) (-1 ("<vuhtii>"i)) ;
SELECT ("bake"i) (0 ("<gáhkket>"i)) (*1 @←OBJ BARRIER NOT-NPMOD) ;

# borahit 0 = mate, 1 = fôre
SELECT ("fôre"i) (0 ("<borahit>"i)) (*0 sem_ani);
SELECT ("mate"i) (0 ("<borahit>"i)) (NOT *0 sem_ani);
## Son borahii máná. Son borahii spiinniid.
SELECT:fallback ("mate"i) (0 ("<borahit>"i));

SELECT ("bry# om"i) (0 ("<fuollat>"i) LINK *1 loc BARRIER NOT-NPMODADV);
SELECT:fallback ("ville# ha"i) (0 ("<fuollat>"i)) ;


# čuohppat: skjære vs klippe
SELECT ("klippe"i) (0 ("<čuohppat>"i)) (*0 ("<vuokta>"i) OR ("<liidni>"i));
SELECT ("skjære"i) (0 ("<čuohppat>"i)) ;

# Sámediggi ja Sámi oahpahusráđđi gárttaiga čilget máŋgii vuođđojurdagiid man vuođul gáibideimmet ollislaš sámi oahppoplána
SELECT ("utgreie"i) (0 ("<čilget>"i)) (NOT 1 ("<.*skuvla>"ri) OR ("<ossodat>"i)) ;

SELECT ("oversette"i) (0 ("<jorgalit>"i)) (NOT *0 ("fisk"i)) ;
SELECT ("oversette"i) (0 ("<jorgalit>"i)) (*0 sem_lang OR sem_txt) ;
SELECT:fallback ("snu"i) (0 ("<jorgalit>"i)) ;

SELECT ("oversette"i) (0 ("<jorgalahttit>"i)) (*0 sem_lang OR sem_txt) ;
SELECT:fallback ("snu"i) (0 ("<jorgalahttit>"i)) ;

SELECT:fallback ("betjene"i) (0 ("<bálvalit>"i)) ;

SELECT:vedta ("vedta"i) (0 ("<dohkkehit>"i)) ((*-1 (sem_rule)) OR (*1 (sem_rule))) ;
SELECT:fallback ("godkjenne"i) (0 ("<dohkkehit>"i)) ;

SELECT:anmelde ("anmelde"i) (0 ("<váidit>"i) LINK 0 der_pass) ((-1 sem_hum OR HUMAN OR coll LINK 0 nom)) ;
SELECT:anmelde ("anmelde"i) (0 ("<váidit>"i)) ((*-1 ("<politiija>"i) LINK 0 nom)) ;
SELECT:fallback ("klage"i) (0 ("<váidit>"i)) ;


#SELECT:vedta ("vrake"i) (0 ("<hilgut>"i))  ;
SELECT:fallback ("avvise"i) (0 ("<hilgut>"i)) ;

SELECT:savne ("savne"i) (0 ("<láhppot>"i) LINK 0 @→N)  ;
SELECT ("savne"i) (0 ("<láhppot>"i) LINK -1 HUMAN OR ("<gii>"i) LINK 0 nom OR coll) ;
SELECT ("savne"i) (0 ("<láhppot>"i) LINK *-1 ("<jahki>"i)  BARRIER SV-BOUNDARY LINK 0 (der_sasj) ) ;
SELECT ("gå vill"i) (0 ("<láhppot>"i) LINK -1 sg + (p1) LINK 0 nom) ;
SELECT:fallback ("miste"i) (0 ("<láhppot>"i))  ;


SELECT ("havne"i) (0 ("<geavvat>"i)) (1 ill LINK NOT 0 HUMAN) ;
SELECT ("heve"i) (0 ("<geavvat>"i)) (*0 sem_food LINK 0 SUBJ) ;
#  láibbit eai geargan geavvat ovdal go olbmot fertejedje hoahpus johttát .
SELECT:fallback ("hende"i) (0 ("<geavvat>"i)) ;
# Mii sáhttá leat geavvan?



SELECT ("igangsette"i) (0 ("<álggahit>"i)) ;

SELECT ("legge"i) (0 ("<lágidit>"i)) (1 ("forhold"i)) (2 ("til rette for"i)) ;
SELECT ("ordne"i) (0 ("<lágidit>"i)) (*1 ill BARRIER vblex OR S-BOUNDARY) ; # lágidit sáhtu buohccivissui
SELECT ("arrangere"i) (0 ("<lágidit>"i)) ; # passar i fleire kontekstar enn «ordne»


LIST CURRENCY = "<denara>" "<dollár>" "<euro>" "<kruvdnu>" "<kr>" "<ru>" "<rubel>" "<ruvdno>" "<ruvdnu>" "<¢>" "<€>" "<$>" ;


# lohkat 0 = lese, 1 = si, 2 = telle

SELECT ("si"i) (0 ("<lohkat>"i)) (0 (←vdic→)) ;
SELECT ("si"i) (0 ("<lohkat>"i)) (1 ("<:>")) ;
SELECT ("si"i) (0 ("<lohkat>"i)) (-1 ("<,>") OR dem + acc) ;

SELECT ("lese"i) (0 ("<lohkat>"i)) (-1 BOS)(1 ("<eambbo>"i) OR ("<eanet>"i) LINK 1 EOS) ;
SELECT ("telle"i) (0 ("<lohkat>"i)) (*0 ("<giehta>"i) + pl + com BARRIER SV-BOUNDARY) ;
SELECT ("telle"i) (0 ("<lohkat>"i)) (*0 sem_ani + pl + acc BARRIER SV-BOUNDARY) ;


SELECT ("lese"i) (0 ("<lohkat>"i)) ((1 sem_txt OR sem_domain OR ("<cealkámuš>"i) OR ("<Ávvir>") LINK 0 acc) OR (-1 sem_txt OR sem_domain LINK 0 acc )  OR (1 ("<eksámen>"i))) ;
# Son lohká ahte lea buorre doppe.

SELECT:lese-samisk ("lese"i) (0 ("<lohkat>"i)) (1 LANGUAGE LINK 0 acc OR loc) ;
SELECT:lese ("lese"i) (0 ("<lohkat>"i)) (*1 sem_edu LINK 0 loc) ;
SELECT:lese ("lese"i) (0 ("<lohkat>"i)) (1 sem_lang) ;
# Ruth Larsena mielas dát vuoseha ahte lea vejolaš lohkagoahtit sámegiela easkka joatkkaskuvllas
SELECT:lese ("lese"i) (0 ("<lohkat>"i) LINK 0 der_inchl) ;

SELECT ("si"i) (0 ("<lohkat>"i))(-1 HUMAN) (*1 ill BARRIER NOT-NPMOD) ;
SELECT ("si"i) (0 ("<lohkat>"i)) (1 ("<ahte>"i) OR ref + acc OR ref + loc OR prfprc OR adj - attr) ;
SELECT ("si"i) (0 ("<lohkat>"i)) (*1 ess) ;

SELECT ("si"i) (0 ("<lohkat>"i)) (*1 FMAINV OR actio OR prfprc OR inf BARRIER S-BOUNDARY OR ("<galle>"i) OR ("<man>"i)) (NEGATE *0 acc + sem_txt BARRIER S-BOUNDARY)   ;
## Ovddeš bargi Yle Sámi Radios, Ánne Risten Juuso, lohká ahte Gárasavvonis livčče eará latnja leamaš Yle Sámi radio doaimmahussii. -  Den tidligere arbeideren Yle på Samelands Radio, Ánne Risten Juuso, hun sier at ...
## Son lohká máddin Sámis lea sámit garrasabbot deddon dahje vealahuvvon go davvin. - Han sier sørfra har Sameland samer hardere trykt eller berøvd nordpå.
## Lars Anders Baer ii eahpit ii veahášge go lohká dákkáraš álbmotsirren lea lága ja álbmotrievtti vuostá. - Lars Anders Baer tviler ikke ikke *veahášge når han sier *dákkáraš en folkeisolering er loven og folkeretten mot.
## Son lohká ádjá boahtit. - Han sier at bestefar skulle komme.
## Soai siđaiga dávjá Liná lohkat jitnosit go sis lei lohkan-hárjehallan.


#SELECT ("si"i) (0 ("<lohkat>"i)) (-1 COMMA) (*1 (@←SUBJ) BARRIER VFIN);
#SELECT ("si"i) (0 ("<lohkat>"i)) (-1 (@SUBJ→) LINK -1 COMMA);
#SELECT ("si"i) (0 ("<lohkat>"i)) (1 sem_hum + nom OR np + nom) ;
## Dat lea duohta, lohká Trond.

SELECT ("si"i) (0 ("<lohkat>"i)) (-1 ("<nu>"i));
SELECT:fallback ("lese"i) (0 ("<lohkat>"i)) ;


SELECT ("telle"i) (0 ("<lohkat>"i))
	(1 ("<galle>"i) OR ("<man>"i) LINK NOT 0 sem_txt + nom);
## Son lohká ruđaid.
## Son lohká galle girjji mis leat.
SELECT:fallback ("si"i) (0 ("<lohkat>"i));

SELECT:fallback ("høve"i) (0 ("<soahpat>"i) LINK 1 ill);

SELECT:fallback ("forlike"i) (0 ("<soahpat>"i));

SELECT ("lese"i) (0 ("<lohkkot>"i) LINK -1 ("<eanemus>"i));
SELECT:fallback ("avregne"i) (0 ("<lohkkot>"i));


# mannat 0 = dra, 1 = gå
SELECT ("sist"i) IF (0 ("<mannat>"i) LINK 0 prfprc + @→N );
	
SELECT ("gå"i) IF (0 ("<mannat>"i)) (*-1 ("<mo>"i) OR ("<dat>"i)) (0 sg3);
## Mo manná dál?
SELECT ("gå"i) IF (0 ("<mannat>"i)) (*0 ("<bures>"i) OR ("<duššái>"i) BARRIER vblex);
SELECT ("gå"i) IF (0 ("<mannat>"i)) (1 ("<ovdalii>"i));

## Mun manan dál.
#SELECT ("gå"i) IF (0 ("<mannat>"i)) (*0 sem_time + SUBJ BARRIER SV-BOUNDARY);
SELECT ("dra"i) IF (0 ("<mannat>"i)) (*1 sem_plc + ill OR sem_org + ill);
SELECT:fallback ("gå"i) (0 ("<mannat>"i) LINK NOT 0 @→N) ;

SELECT ("bety"i) IF (0 ("<máksit>"i) ) (*0 ("<sátni>"i) + nom BARRIER NOT-NPMODADV);
SELECT ("bety"i) IF (0 ("<máksit>"i) )  (*1 ("<ahte>"i) BARRIER WORD);
#SELECT ("bety"i) IF (0 ("<máksit>"i) )  (1 COMMA) (2 ("<ahte>"i));
## Dat máksá, ahte mun dárbbašan dakkár njuolgadusa

SELECT ("betale"i) IF (0 ("<máksit>"i) ) (*-1 (@SUBJ→) LINK 0 HUMAN OR sem_org OR pers ) ;
## Máhtte máksá guokte ruvnnu.
SELECT ("betale"i) IF (0 ("<máksit>"i) ) (*-1 ("<vejolašvuohta>"i) OR ("<bággu>"i) OR ("<ráđđi>"i) OR ("<áigemeari>"i) OR ("<divat>"i)  OR ("<rehket>"i) OR sem_money ) ;
SELECT ("betale"i) IF (0 ("<máksit>"i) ) (*-1 loc BARRIER NOT-ADV-PCLE) ;
SELECT ("betale"i) IF (0 ("<máksit>"i) ) (*1 ("<.*vearru>"r) OR ("<áigemearri>"i) OR ("<.*divat>"r) OR sem_money) ;
SELECT ("betale"i) IF (0 ("<máksit>"i) ) (1 ill OR ("<ruovttoluotta>") OR sem_money) ;
SELECT ("betale"i) IF (0 ("<máksit>"i) ) (0 @←OBJ) ;



SELECT ("koste"i) IF (0 ("<máksit>"i) ) (*-1 (@SUBJ→) LINK NOT 0 HUMAN OR pers) (0* CURRENCY OR QUANT-PRON OR num BARRIER ill OR S-BOUNDARY) ;
## Girji máksá guokte ruvnnu.

SELECT ("tilsøle"i) (0 ("<durdut>"i)) ;

SELECT:fallback ("skje"i) (0 ("<dáhpáhuvvat>"i));

SELECT:berømt-forfatter ("berømme"i) (0 ("<beaggit>"i)) (0 @→N + prfprc) (NOT 1 clb) ; #  vaikko čálli lei beaggán girječálli
SELECT:kjent-som ("kjenne"i) (0 ("<beaggit>"i)) (0 prfprc) (*1 loc BARRIER clb OR vblex); # mu ovddabealde bekkii Skuvvanvárrái boahtit sámásteaddji dáža oahpaheaddji
SELECT:ble-kjent-i ("kjenne"i) (0 ("<beaggit>"i)) (0 pret) (*1 ill BARRIER clb OR vblex); # Son lea maiddái beaggán Sámi soga lávlaga čállin
SELECT:fallback ("kjenne"i) (0 ("<beaggit>"i)); # Maŋimuš áiggiid lea beaggán , maŋimustá

SELECT:reparere ("reparere"i) (0 ("<divvut>"i) LINK *0 ("<bátni>"i) OR sem_veh OR (sem_route));
SELECT:fallback ("rette"i) (0 ("<divvut>"i));

SELECT:reparere ("innkalle"i) (0 ("<gohččut>"i) LINK *0 ("<diibmu>"i) OR ("<čoahkkin>"i));
SELECT:fallback ("be"i) (0 ("<gohččut>"i));

SELECT:reparere ("smitte"i) (0 ("<njoammut>"i) LINK *0 ("<.*dávda>"r) OR ("<oaivevuorri>"i) OR ("<CWD>"i)  OR (sem_state-sick));
SELECT:fallback ("smitte"i) (0 ("<njoammut>"i));

SELECT:fallback ("sette# opp"i) (0 ("<cegget>"i));


SELECT:fallback ("rette"i) (0 ("<njulget>"i));

SELECT:ta-en-tur ("ta en tur"i) (0 ("<fitnat>"i) + inf )  ; 
SELECT:fallback ("være"i) (0 ("<fitnat>"i));

SELECT:publisere ("lansere"i) (0 ("<almmuhit>"i) LINK *0 ("<skearru>"i) OR ("<girji>"i) OR ("<lávlla>"i))  ; 
SELECT:publisere ("annonsere"i) (0 ("<almmuhit>"i) LINK *0 ("<.*virgi>"ir))  ; 
SELECT:publisere ("publisere"i) (0 ("<almmuhit>"i) LINK *-1 sem_txt  OR (sem_rule) OR (sem_prod-ling) LINK NOT 0 loc )  ; 
SELECT:publisere ("publisere"i) (0 ("<almmuhit>"i) LINK *1 sem_txt  OR (sem_rule) OR (sem_prod-ling) LINK NOT 0 loc )  ; 
SELECT:publisere ("publisere"i) (0 ("<almmuhit>"i) LINK 1 sem_time )  ; 
SELECT:fallback ("publisere"i) (0 ("<almmuhit>"i));

SELECT:beherske ("beherske"i) (0 ("<hálddašit>"i) LINK *0 sem_lang);
SELECT:fallback ("forvalte"i) (0 ("<hálddašit>"i));

SELECT ("tilegne"i) (0 ("<gazzat>"i) LINK *0 ("<.*oahppu>"r) + acc);
SELECT:fallback ("spise"i) (0 ("<gazzat>"i));


SELECT ("oppdatere"i) (0 ("<ođastit>"i) LINK 1 ("<:>") OR arab OR sem_date);
SELECT:fallback ("fornye"i) (0 ("<ođastit>"i));


SELECT:vedta ("vedta"i) (0 ("<mearridit>"i) LINK *-1 ("<.*čoahkkin>"r) OR ("<.*njuolggadus>"r));
SELECT:vedta ("vedta"i) (0 ("<mearridit>"i) LINK 1 (sem_prod-cogn) OR sem_txt) ;
SELECT:fallback ("bestemme"i) (0 ("<mearridit>"i));

SELECT:vite ("vite"i) (0 ("<dovdat>"i) LINK 1 rel);
SELECT:fallback ("kjenne"i) (0 ("<dovdat>"i));


SELECT:skyte ("skyte"i) (0 ("<bávkalit>"i) LINK *0 ("<rakeahtta>"r)); 
SELECT:fallback ("smelle"i) (0 ("<bávkalit>"i));

SELECT:påkjøre ("påkjøre"i) (0 ("<vuodjit>"i) + pasv);
SELECT:fallback ("kjøre"i) (0 ("<vuodjit>"i));
SELECT:fallback ("skuffe"i) (0 ("<beahttit>"i));

SELECT:påkjøre ("konsentrere"i) (0 ("<vuodjut>"i) + sg3 LINK *0 sem_edu) ;
SELECT:fallback ("synke"i) (0 ("<vuodjut>"i));


SELECT:kalle ("kalle"i) (0 ("<navdit>"i) LINK 1 acc LINK 1 ess );
SELECT:kalle ("kalle"i) (0 ("<navdit>"i) LINK 1 ess );
SELECT:fallback ("anta"i) (0 ("<navdit>"i));
SELECT:fallback ("etablere"i) (0 ("<ásahit>"i));

SELECT:advare ("advare"i) (0 ("<váruhit>"i) LINK 1 ("<ahte>"i) OR adv OR adj OR inf OR actio);
SELECT:advare ("advare"i) (0 ("<váruhit>"i) LINK 1 sem_hum OR np);
SELECT:fallback ("advare"i) (0 ("<váruhit>"i));

SELECT:ringe ("ringe"i) (0 ("<čuodjat>"i) LINK *0 ("<telefovdna>"i)) ;
SELECT:fallback ("klinge"i) (0 ("<čuodjat>"i) LINK NEGATE *0 ("<telefuvdna>"i) ) ;

SELECT:fallback ("forbli"i) (0 ("<bissut>"i) ) ;


SELECT:fallback ("kommunisere"i) (0 ("<gulahallat>"i) ) ;

SELECT:stå ("bestå"i) (0 ("<ceavzit>"i) LINK *0 ("<eksámen>"i) OR sem_edu OR sem_domain);
SELECT:fallback ("klare"i) (0 ("<ceavzit>"i));

SELECT:be ("be"i) (0 ("<dáhttut>"i) LINK 1 acc OR inf);
SELECT:fallback ("be"i) (0 ("<dáhttut>"i));


SELECT ("anse"i) (0 ("<atnit>"i) LINK *1 ess OR ("<árvu>"i) + loc) ;
SELECT ("anse"i) (0 ("<atnit>"i) LINK -1 ess OR ("<árvu>"i) + loc) ;
SELECT:fallback ("bruke"i) (0 ("<atnit>"i));

SELECT ("fordele"i) (0 ("<juohkit>"i) LINK 0 der_pass) ;
SELECT:fallback ("dele"i) (0 ("<juohkit>"i));


SELECT ("oppnå"i) (0 ("<olahit>"i) LINK 1 ("<.*vuohta>"r) OR ("<árvosátni>"r) LINK 0 acc) ;
SELECT ("oppnå"i) (0 ("<olahit>"i) LINK *1 sem_edu BARRIER NOT-NPMOD LINK 0 acc) ;
SELECT:fallback ("rekke"i) (0 ("<olahit>"i));

SELECT ("tørke"i) (0 ("<sihkkut>"i))(*0 ("<beavdi>"i) OR ("<njunni>"i) OR ("<távval>"i) LINK 0 acc) ;
SELECT:fallback ("stryke"i) (0 ("<sihkkut>"i)) ;

SELECT ("oppdra"i) (0 ("<geassit>"i))(*0 ("<mánná>"i) LINK 0 acc OR gen) ;
SELECT:fallback ("trekke"i) (0 ("<geassit>"i));

SELECT ("utveksle"i) (0 ("<lonohallat>"i) LINK *0 ("<vásáhus>"i));
SELECT:fallback ("skifte"i) (0 ("<lonohallat>"i));

SELECT ("slå# sammen"i) (0 ("<ovttastahttit>"i) LINK *0 sem_org OR (sem_pos));
SELECT:fallback ("forene"i) (0 ("<ovttastahttit>"i));

SELECT ("smelle"i) (0 ("<bávkkehit>"i) LINK *0 ("<rakeahtta>"i));
SELECT:fallback ("eksplodere"i) (0 ("<bávkkehit>"i));

SELECT ("advare"i) (0 ("<várret>"i) LINK 1 ("<nominašuvdna>"i));
SELECT ("reservere"i) (0 ("<várret>"i) LINK *0 acc OR ill BARRIER SV-BOUNDARY);
SELECT:fallback ("advare"i) (0 ("<várret>"i));

SELECT ("skyve"i) (0 ("<duvdit>"i) LINK *1 ("<eret>"i) BARRIER SV-BOUNDARY);
SELECT:fallback ("støtte"i) (0 ("<duvdit>"i));

SELECT ("tilegne"i) (0 ("<oččodit>"i) LINK *1 sem_lang BARRIER SV-BOUNDARY LINK NEGATE 0 gen LINK 1 n);
SELECT:fallback ("få"i) (0 ("<oččodit>"i));


SELECT:fallback ("fortsette"i) (0 ("<joatkit>"i));


# Verbs that were 0-marked in the dix:
SELECT:fallback ("rise"i) IF  (0 ("<risset>"i)) ;
SELECT:fallback ("behandle"i) (0 ("<meannudit>"i));
SELECT:fallback ("bevilge"i) (0 ("<juolludit>"i));
SELECT:fallback ("sette"i) (0 ("<bidjat>"i));
SELECT:fallback ("avslå"i) (0 ("<biehttalit>"i));
SELECT:fallback ("påvirke"i) (0 ("<báidnit>"i));
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
SELECT:fallback ("tilby"i) (0 ("<fállat>"i));
SELECT:fallback ("grave"i) (0 ("<goaivut>"i));
SELECT:fallback ("lenke"i) (0 ("<goallostit>"i));
SELECT:fallback ("gløde"i) (0 ("<goarddašit>"i));
SELECT:fallback ("redusere"i) (0 ("<geahpedit>"i));
SELECT:fallback ("svette"i) (0 ("<golggahit>"i));
SELECT:fallback ("slutte"i) (0 ("<guorrasit>"i));
SELECT:fallback ("sky"i) (0 ("<hirrut>"i));
SELECT:fallback ("forme"i) (0 ("<hábmet>"i));
SELECT:fallback ("mishandle"i) (0 ("<illastit>"i));
SELECT:fallback ("trene"i) (0 ("<hárjehit>"i));
SELECT:fallback ("forstå"i) (0 ("<ipmirdit>"i));
SELECT:fallback ("fryde"i) (0 ("<jierásmuvvat>"i));
SELECT:fallback ("nervøs"i) (0 ("<jierásmuvvat>"i));
SELECT:fallback ("forlenge"i) (0 ("<joatkkašit>"i));
SELECT:fallback ("slarke"i) (0 ("<johtalit>"i));
SELECT:fallback ("snu"i) (0 ("<jorahit>"i));
SELECT:fallback ("få"i) (0 ("<juollut>"i));
SELECT:fallback ("utslette"i) (0 ("<jávkadit>"i));
SELECT:fallback ("avslutte"i) (0 ("<loahpahit>"i));
SELECT:fallback ("lese"i) (0 ("<lohkalit>"i));
SELECT:fallback ("stole"i) (0 ("<luohttit>"i));
SELECT:fallback ("gå"i) (0 ("<luoitádit>"i));
SELECT:fallback ("stige"i) (0 ("<luoitádit>"i));
SELECT:fallback ("bety"i) (0 ("<mearkkašit>"i));
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
SELECT:fallback ("skryte av"i) (0 ("<rábmot>"i));
SELECT:fallback ("forberede"i) (0 ("<ráhkkanahttit>"i));
SELECT:fallback ("bevare"i) (0 ("<seailut>"i));
SELECT:fallback ("hente"i) (0 ("<viežžat>"i));
SELECT:fallback ("gjemme"i) (0 ("<čiehkádit>"i));
SELECT:fallback ("spille"i) (0 ("<čuojahit>"i));
SELECT:fallback ("følge"i) (0 ("<čuovvolit>"i));
SELECT:fallback ("følge"i) (0 ("<čuovvulit>"i));
SELECT:fallback ("pynte"i) (0 ("<čábbudit>"i));
SELECT:fallback ("dyrke"i) (0 ("<šaddadit>"i));

# Based on frequency in parallel text:
SELECT ("slåss"i) (0 ("<doarrut>"i)) ;
SELECT ("skille"i) (0 ("<earuhit>"i)) ;
SELECT ("forsvare"i) (0 ("<bealuštit>"i)) ;
SELECT ("vise"i) (0 ("<čujuhit>"i)) ; 

# Nouns
# ============

SELECT ("kjeks"i) (0 ("<čeaksa>"i) + pl) ;
SELECT ("kjeks"i) (0 ("<čeaksa>"i) LINK -1 ("<garas>"i) OR ("<njálggat>"i)  ) ;
SELECT:fallback ("bladmage"i) (0 ("<čeaksa>"i)) ;


SELECT ("tale"i) (*-1 ("<doallat>"i)) (0 ("sáhka"i));

SELECT ("skrott"i) (0 ("<gorut>"i) LINK -1 num) ;
SELECT ("skrott"i) (0 ("<gorut>"i) + pl) ;
SELECT:fallback ("kropp"i) (0 ("<gorut>"i) OR ("<rumaš>"i)) ;

SELECT:fallback ("differensiering"i) (0 ("<sirren>"i) ) ;
SELECT:fallback ("utgangspunkt"i) (0 ("<álgovuorru>"i) ) ;
SELECT:fallback ("godkjenning"i) (0 ("<dohkkeheapmi>"i) ) ;

SELECT ("oppbygging"i) (0 ("<huksehus>"i)  LINK -1 sem_txt ) ;
SELECT:fallback ("bygg"i) (0 ("<huksehus>"i)) ;

SELECT ("tale"i) (0 ("<hupman>"i)  LINK -1 ("<syntehtalaš>"i) ) ;
SELECT:fallback ("snakk"i) (0 ("<hupman>"i)) ;


SELECT ("nødvendig"i) (0 ("<bággu>"i)  LINK 1 inf ) ;
SELECT:fallback ("tvang"i) (0 ("<bággu>"i)) ;

SELECT ("posisjon"i) (0 ("<sajádat>"i)  LINK -1 cmp ) ;
SELECT:fallback ("beliggenhet"i) (0 ("<sajádat>"i)) ;

SELECT ("veigrøft"i) (0 ("<doaresbealli>"i) LINK *0 sem_veh BARRIER S-BOUNDARY)  ;
SELECT:fallback ("tvang"i) (0 ("<doaresbealli>"i)) ;


SELECT ("eldre"i) (0 ("<boaresolmmoš>"i) LINK 0 pl ) ;
SELECT:fallback ("gamling"i) (0 ("<boaresolmmoš>"i)) ;

SELECT ("datter"i) (0 ("<nieida>"i) LINK -1 (ant) + gen ) ;
SELECT:fallback ("jente"i) (0 ("<nieida>"i)) ;

SELECT:fallback ("mindreårig"i) (0 ("<vuolleahkásaš>"i)) ;


SELECT ("leder"i) (0 ("<láidesteaddji>"i) LINK -1 sem_edu + gen ) ;
SELECT:fallback ("konferansier"i) (0 ("<láidesteaddji>"i)) ;



SELECT:fallback ("begivenhet"i) (0 ("<dáhpáhus>"i) LINK -1 ("<rabas>"i) ) ;
SELECT:fallback ("hendelse"i) (0 ("<dáhpáhus>"i) ) ;

SELECT ("hardt vær"i) (0 ("<biegga>"i) LINK 1 ("<siste>"i) ) ;
SELECT:fallback ("vind"i) (0 ("<biegga>"i) ) ;

SELECT ("virkelighet"i) (0 ("<duohtavuohta>"i) LINK 0 loc ) ;
SELECT ("virkelighet"i) (0 ("<duohtavuohta>"i) LINK *0 ("<šaddat>"i) BARRIER SV-BOUNDARY) ;
SELECT:fallback ("sannhet"i) (0 ("<duohtavuohta>"i) ) ;

SELECT ("faste medlem"i) (0 ("<fástalahttu>"i) LINK 0 pl ) ;
SELECT:fallback ("fast medlem"i) (0 ("<fástalahttu>"i) ) ;

SELECT:fallback ("juks"i) (0 ("<vearridahku>"i) ) ;


SELECT ("småkopper"i) (0 ("<boahkku>"i) LINK 0 pl ) ;
SELECT:fallback ("vaksine"i) (0 ("<boahkku>"i) ) ;

SELECT ("vare"i) (0 ("<várra>"i) LINK *0 ("<váldit>"i) BARRIER SV-BOUNDARY) ;
SELECT:fallback ("fare"i) (0 ("<várra>"i) ) ;

SELECT ("kule"i) (0 ("<spábba>"i) LINK -1 ("<dolla>"i)) ;
SELECT:fallback ("ball"i) (0 ("<spábba>"i)) ;
SELECT ("ild"i) (0 ("<dolla>"i) LINK 1 ("<spábba>"i));
SELECT:fallback ("bål"i) (0 ("<dolla>"i));


SELECT:fallback ("tillatelse"i) (0 ("<lohpi>"i)) ;

SELECT:fallback ("slåsskamp"i) (0 ("<doarrun>"i)) ;

SELECT:fallback ("kontroll"i) (0 ("<dárkkisteapmi>"i)) ;

SELECT ("bane"i) (0 ("<šillju>"i))(*0 ("<čiekči>"i) OR ("<čiekčat>"i)) ;
SELECT:fallback ("gårdsplass"i) (0 ("<šillju>"i)) ;

SELECT ("lengde"i) (0 ("<guhkkodat>"i) LINK *0 ("<mehter>"i) OR ("<kilomehter>"i)) ;
SELECT:fallback ("varighet"i) (0 ("<guhkkodat>"i)) ;


SELECT ("heldig"i) (0 ("<lihkku>"i) LINK 0 (←ext→) LINK *-1 ←hab→) ;
SELECT:fallback ("lykke"i) (0 ("<lihkku>"i)) ;

SELECT ("matrett"i) (0 ("<biebmu>"i) LINK 0 pl) ;
SELECT:fallback ("mat"i) (0 ("<biebmu>"i)) ;

SELECT ("bånd"i) (0 ("<báddi>"i) LINK *0 ("<goarrut>"i) OR ("<gákti>"i)) ;
SELECT:fallback ("tau"i) (0 ("<báddi>"i)) ;


SELECT ("innstilling"i) (0 ("<áššeguoddu>"i) LINK -1 ("<ráđđealmmái>"i)) ;
SELECT:fallback ("holdning"i) (0 ("<áššeguoddu>"i)) ;

SELECT ("vår"i) (0 ("<bievla>"i) LINK -1 det) ;
SELECT:fallback ("barmark"i) (0 ("<bievla>"i)) ;


SELECT ("verge"i) (0 ("<áittardeaddji>"i) LINK -1 ("<veahkki>"i)) ;
SELECT:fallback ("ombud"i) (0 ("<áittardeaddji>"i)) ;

SELECT ("buesnitt"i) (0 ("<hoaŋka>"i) LINK 1 ("<beallji>"i)) ;
SELECT:fallback ("bergvegg"i) (0 ("<hoaŋka>"i)) ;


SELECT ("katalog"i) (0 ("<ohcu>"i) + pl) ;
SELECT:fallback ("søk"i) (0 ("<ohcu>"i)) ;

SELECT ("geskjeft"i) (0 ("<fidnu>"i) LINK -1 cmp) ;
SELECT:fallback ("yrke"i) (0 ("<fidnu>"i)) ;

SELECT ("satsing"i) (0 ("<áŋgiruššan>"i) LINK -1 cmp OR sem_org ) ;
SELECT:fallback ("iver"i) (0 ("<áŋgiruššan>"i)) ;

SELECT ("stamme"i) (0 ("<nálli>"i) LINK -1 sem_ani ) ;
SELECT:fallback ("rase"i) (0 ("<nálli>"i)) ;


SELECT ("motto"i) (0 ("<čurvestat>"i) LINK -1 cmp) ;
SELECT ("motto"i) (0 ("<čurvestat>"i) LINK 0 cmp) ;
SELECT:fallback ("rop"i) (0 ("<čurvestat>"i)) ;


SELECT ("tegn"i) (0 ("<mearka>"i) LINK -1 attr) ;
SELECT:fallback ("merke"i) (0 ("<mearka>"i)) ;

SELECT ("lås"i) (0 ("<lássa>"i) LINK -1 ("<alkohola>"i)) ;
SELECT ("lås"i) (0 ("<lássa>"i) LINK *-1 sem_veh BARRIER S-BOUNDARY) ;
SELECT:fallback ("glass"i) (0 ("<lássa>"i)) ;

SELECT:fallback ("påmelding"i) (0 ("<dieđiheapmi>"i)) ;

SELECT:fallback ("praksisperiode"i) (0 ("<hárjehallanáigodat>"i)) ;

SELECT:fallback ("par"i) (0 ("<bárra>"i)) ;

SELECT ("distanse"i) (0 ("<mátki>"i) LINK *0 ("<kilomehter>"i)) ;
SELECT:fallback ("reise"i) (0 ("<mátki>"i)) ;

SELECT ("pris"i) (0 ("<bálkkašupmi>"i) LINK -1 np) ;
SELECT:fallback ("pris"i) (0 ("<bálkkašupmi>"i)) ;

SELECT ("arrangement"i) (0 ("<lágideapmi>"i) + pl) ;
SELECT:fallback ("organisering"i) (0 ("<lágideapmi>"i)) ;


SELECT:fallback ("publisering"i) (0 ("<almmuheapmi>"i)) ;


SELECT ("forhold"i) (0 ("<dilli>"i) LINK -1 ("<buorre>"i) LINK -1 COPULAS) ; # tid
SELECT ("") (0 ("<dilli>"i) LINK -1 ("<láhčit>"i)) ; # 
SELECT:fallback ("situasjon"i) (0 ("<dilli>"i)) ;


SELECT ("grunn"i) (0 ("<ágga>"i) LINK -1 ("<navdit>"i)) ;
SELECT:fallback ("argument"i) (0 ("<ágga>"i)) ;


SELECT:fallback ("utredning"i) (0 ("<guorahallan>"i)) ;

SELECT:fallback ("bransje"i) (0 ("<suorgi>"i));


SELECT:fallback ("start"i) (0 ("<vuolgga>"i)) ;

SELECT ("verdifull"i) (0 ("<árvu>"i) + sg + loc LINK *-1 ("<atnit>"i)) ;
SELECT ("verdifull"i) (0 ("<árvu>"i) + sg + loc LINK 1 ("<atnit>"i)) ;
SELECT:fallback ("verdi"i) (0 ("<árvu>"i)) ;

	
SELECT ("villrein"i) (*-1 ("<bivdit>"i) OR ("dápmat"i) OR ("vuojihit"i)) (0 ("<goddi>"i));
SELECT ("komite"i) (0 ("<goddi>"i) LINK -1 cmp);
SELECT:fallback ("villrein"i) (0 ("<goddi>"i));

SELECT ("grunnlag"i) (0 ("<vuođđu>"i)) (0 ess LINK 1 inf);
SELECT ("grunn"i) (0 ("<vuođđu>"i)) (0 ess);
SELECT:fallback ("grunnlag"i) (0 ("<vuođđu>"i));

SELECT ("avdeling"i) (0 ("<ossodat>"i)); # parkorp har masse «avdeling»-døme, ingen «andel»

SELECT ("grad"i) (0 ("<muddu>"i)) (NOT -1 ord) ;

SELECT ("arrangement"i) (0 ("<dilálašvuohta>"i)) (-1 sem_time);
SELECT ("forhold"i) (0 ("<dilálašvuohta>"i)) (NOT -1 ("<virggálaš>"i)) (NOT -2 ("<virggálaš>"i));
SELECT:fallback ("situasjon"i) (0 ("<dilálašvuohta>"i)) ;

# áddjá: bestefar vs gamling
SELECT ("gamling"i) (0 ("<áddjá>"i) LINK -1 num LINK NOT *-1 ←hab→);
SELECT ("gamling"i) (0 ("<áddjá>"i) LINK -1 attr );
SELECT ("bestefar"i) (0 ("<áddjá>"i));
## Mus leat guokte ádjá.
## Doppe čohkkába guokte ádjá.

SELECT ("opplukk"i) (0 ("<čuoldin>"i));

SELECT ("fattigdom"i) (0 ("<geafi>"i) LINK 0 n);

# áhkku: bestemor vs eldre kvinne
REMOVE ("bestemor"i) (0 ("<áhkku>"i) LINK -1 num LINK NOT *-1 ←hab→);
SELECT ("bestemor"i) (0 ("<áhkku>"i));
## Mus leat šiega áhkku.
## Doppe čohkkába guokte áhkku.


# beaivi 0 = dag, 1 = sol
SELECT ("sol"i) (0 ("<beaivi>"i) LINK 0* ("<báitit>"i) OR ("<luoitádit>"i) OR ("<goardit>"i) OR ("<ligget>"i));
## Beaivi báitá.
SELECT ("sol"i) (0 ("<beaivi>"i) LINK 0 @→N LINK 1 ("<bárdni>"i) OR ("<mánná>"i) OR ("<nieida>"i)); 
SELECT:fallback ("dag"i) (0 ("<beaivi>"i));

SELECT ("oppmerksomhet"i) IF (0 ("<fuomášupmi>"i)) (*-1 ("<giddet>"i) OR ("<olahit>"i) OR ("<oažžut>"i) OR ("<sávakeahtes>"i) BARRIER SV-BOUNDARY) ;
SELECT:fallback ("ide"i) IF (0 ("<fuomášupmi>"i)) ;

SELECT ("institutt"i) IF (0 ("<goahti>"i) LINK -1 ("<.*dieđa>"ri)  OR ("<.*fága>"ri)  OR ("<.*dutkan>"ri)   OR ("<servodat>"i) OR ("<jođihit>"i)) ;
SELECT ("institutt"i) IF (0 ("<goahti>"i) LINK 1 ("<jođiheaddji>"i) OR ("<struktuvra>"i)) ;
SELECT ("institutt"i) IF (0 ("<goahti>"i) LINK *0 ("<.*dutkan>"ri) OR ("<.*fága>"ri)  OR ("<.*dieđa>"ri)  OR ("<.*oahppu>"ri)  OR ("<.*oahpahus>"ri)) ;
SELECT:fallback ("gamme"i) IF (0 ("<goahti>"i)) ;


# luohkká 0 = bakke, 1 = klasse
SELECT ("klasse"i) (0 ("<luohkká>"i) LINK *0 ("<oahpaheaddji>"i) OR ("<.*skuvla>"i) OR ("<skuvlamátki>"i) OR ("<čoahkkin>"i));
SELECT ("klasse"i) (0 ("<luohkká>"i) LINK -1 ("<deaddu>"i));
SELECT ("bakke"i) (0 ("<luohkká>"i) LINK *-1 ("<fierrat>"i) BARRIER SV-BOUNDARY);


SELECT ("klasse"i) (0 ("<luohkká>"i) LINK -1 num OR ord OR @→N OR sem_edu);
# Son lea vuosttaš luohkás.
# Son lea 1A luohkás.
# Biera vázzá sámi luohkás.
# Biera vázzá sámegiel luohkás.
# Bireha luohkás leat eanaš nieiddat.
# Mu luohkás leat vihtta nieidda ja golbma bártni.
# Earát su luohkás ledje juo vissa njeallje siiddu su ovdalis matematihkka-girjjis.

SELECT:fallback ("bakke"i) (0 ("<luohkká>"i));

# diibmu 0 = time, 1 = klokke
SELECT ("klokke"i) (0 ("<diibmu>"i) OR ("<tiibmu>"i) OR ("<tiibma>"i) LINK 1 num OR ord) ;
# Boahtte gaskavahku diibmu 11.00 rahpá kurdarbearaš Mehidi Kárášjohkii ođđa kaféa.
SELECT ("klokke"i) (0 ("<diibmu>"i)  OR ("<tiibmu>"i) OR ("<tiibma>"i) LINK *1 ("<sirdit>"i) LINK *1 ("<diibmu>"i)  OR ("<tiibmu>"i) OR ("<tiibma>"i) OR ("<goas>"i)) ;
# Diibmu guovttis galgá diimmu sirdit ovtta diimmu ovddos.
# eai muitte riekta guđe guvlui diimmu galgá sirdit goas.
# Ord because of possible incorrect analysis of Num + punctuation.
SELECT ("klokke"i) (0 ("<diibmu>"i) OR ("<tiibmu>"i) OR ("<tiibma>"i) LINK *0 ("<ollu>"i) OR ("<geahččat>"i) OR ("<čuodjat>"i)) ;
# Ollugo diibmu lea.
SELECT ("klokke"i) (0 ("<diibmu>"i) OR ("<tiibmu>"i) OR ("<tiibma>"i) LINK 1 COPULAS LINK *1 num) ;
# Dál diibmu lea fargga vihtta.
SELECT:fallback ("time"i) (0 ("<diibmu>"i) OR ("<tiibmu>"i) OR ("<tiibma>"i));

# hávvi gen as sår is the exceptional/rare case:
SELECT ("sår"i) (0 ("<hávvi>"i) LINK 0 gen) (1 ("<vuostá>"i));
SELECT ("gang"i) (0 ("<hávvi>"i) LINK 0 gen);
SELECT ("sår"i) (0 ("<hávvi>"i) LINK NOT 0 gen);
# genitive háve is always gang in corpus, and much more frequent than «sår»

# miella 0 = sinn, 1 = oppfatning, 2 = behag
SELECT ("oppfatning"i) (0 ("<miella>"i) LINK 0 loc LINK -1 @→N) ;
SELECT ("lyst"i) (0 ("<miella>"i)  LINK 0 nom LINK -1 ("<leat>"i)) ;
SELECT ("enig"i) (0 ("<miella>"i)  LINK 0 loc LINK -1 ("<leat>"i) LINK 0 conneg) ;
SELECT ("lyst"i) (0 ("<miella>"i)  LINK 0 (←ext→)) ;

SELECT:fallback ("sinn"i) (0 ("<miella>"i));


# giella 0 = språk, 1 = snare
SELECT:fallback ("språk"i) (0 ("<giella>"i));


SELECT ("sekretær"i) (0 ("<čálli>"i)) (-1 sem_org + gen);
SELECT:fallback ("forfatter"i) (0 ("<čálli>"i));

SELECT:fallback ("melodi"i) (0 ("<šuokŋa>"i));


# gonagas 0 = konge, 1 = kong
SELECT ("kong"i) (0 ("<gonagas>"i) LINK 1 sem_mal)(NOT -1 cmp) ;
# Konge Harald => Kong Harald
SELECT:fallback ("konge"i) (0 ("<gonagas>"i));


# johtu 0 = fart, 1 = bevegelse, 2 = gang
SELECT ("veg"i) (0 ("<johtu>"i) LINK 0 loc LINK 1 sem_plc + ill) ;
SELECT ("gang"i) (0 ("<johtu>"i) LINK 0 loc) ;
SELECT ("gang"i) (0 ("<johtu>"i) LINK 0 ill) ;
SELECT ("omsetning"i) (0 ("<johtu>"i) LINK -1 sem_food) ;
# til farten => i gang
SELECT:fallback ("fart"i) (0 ("<johtu>"i));

# oktavuohta 0 = kontakt, 1 = henvendelse, 2 = forbindelse, 3 = sammenheng
SELECT ("sammenheng"i) (0 ("<oktavuohta>"i)  LINK 0 loc)(NEGATE *1 com BARRIER NOT-NPMODADV) ;
SELECT ("forbindelse"i) (0 ("<oktavuohta>"i) LINK 1 (sg loc) OR ill) ;
SELECT ("forbindelse"i) (0 ("<oktavuohta>"i @←ADVL sg)) ;
# dan oktavuođas go => i den forbindelse når
SELECT ("kontakt"i) (0 ("<oktavuohta>"i) LINK 0 (←ext→)) ;
SELECT ("kontakt"i) (0 ("<oktavuohta>"i) LINK -1 BOS LINK 2 EOS) ;
#SELECT ("kontakt"i) (0 ("<oktavuohta>"i) LINK 0 loc LINK -2 vblex) ;
SELECT ("kontakt"i) (0 ("<oktavuohta>"i) LINK *-1 ("<váldit>"i)) ;
SELECT ("sammenheng"i) (0 ("<oktavuohta>"i) LINK 1 loc LINK -2 num or gen) ; #?
# máŋgga oktavuođas => i mange sammenhenger
# máŋggain oktavuođain => i mange sammenhenger
SELECT ("forhold"i) (0 ("<oktavuohta>"i) LINK -1 ("<lagaš>"i) OR ("<lagas>"i)) ; #?
SELECT:fallback ("kontakt"i) (0 ("<oktavuohta>"i));

SELECT ("man"i) (0 ("<olmmoš>"i) LINK 0 sg + nom + SUBJ)(NEGATE -1 @→N OR num OR ind OR cmp)(NEGATE 1 rel OR COMMA) ;
SELECT ("folk"i) (0 ("<olmmoš>"i) LINK 0 pl) ;
# olbmot leat čoagganan => folk har samlet seg
SELECT ("person"i) (0 ("<olmmoš>"i)+ loc LINK -1 sem_curr ) ;
SELECT ("person"i) (0 ("<olmmoš>"i) LINK -1 num OR ("<bealli>"i) + gen) ;
SELECT ("person"i) (0 ("<olmmoš>"i) LINK 1 rel) ;
SELECT ("person"i) (0 ("<olmmoš>"i) LINK 1 (pers-pro)) ;

SELECT ("menneske"i) (0 ("<olmmoš>"i) LINK 0 ess) ;
# olmmožin => som menneske
SELECT:fallback ("menneske"i) (0 ("<olmmoš>"i)) ;


SELECT ("husdyr"i) IF (0 ("<šibit>"i)) ;

# soadji 0 = vinge, 1 = skovl, 2 = fløy, 3 = erme
SELECT ("fløy"i) (0 ("<soadji>"i)) (0* sem_org);
# Bellodaga radikála soajis bođii garra proteasta.

SELECT ("erme"i) (0 ("<soadji>"i)) (0* sem_clth);
# Mu báiddi soajis lea ráigi.
SELECT:fallback ("vinge"i) (0 ("<soadji>"i));

# searvi 0 = forening, 1 = selskap
SELECT ("forening"i) (0 ("<searvi>"i)) (-1 ("<sápmi>"i));
SELECT:fallback ("forening"i) (0 ("<searvi>"i));

# stuibmi 0 = bråk, 1 = konflikt
SELECT ("bråk"i) (0 ("<stuibmi>"i) LINK -1 np) ;
SELECT:fallback ("bråk"i) (0 ("<stuibmi>"i));

# goddi 0 = komite, 1 = villrein
#SELECT ("goddi"i) ("goddi:1"i) ("goddi"i) (NOT 0/1 (*)) ;

# diehtu 0 = informasjon,  3 = beskjed
SELECT ("beskjed"i) (0 ("<diehtu>"i) LINK 0 nom OR acc) (*0 ("<mobiilatelefuvdna>"i) OR ("<mobiila>"i) OR ("<rápmi>"i)) ;
SELECT ("beskjed"i) (0 ("<diehtu>"i) LINK 0 sg + acc) (*0 ("<sáddet>"i) OR ("<čállit>"i) OR ("<lohkat>"i)) ;
## Lihkus juste de civkkádii mobiltelefuvnnas sutnje diehtu.
## Lei Ájlin gii sáddii dieđu.
SELECT:fallback ("viten"i) (0 ("<diehtu>"i) LINK -1 ("<árbevirolaš>"i));
SELECT ("informasjon"i) (0 ("<diehtu>"i) LINK 0 pl);
SELECT ("informasjon"i) (0 ("<diehtu>"i) LINK *-1 loc BARRIER S-BOUNDARY);
SELECT:fallback ("viten"i) (0 ("<diehtu>"i));


SELECT ("hus"i) (0 ("<stohpu>"i) LINK *0 ("<stohpoeaiggát>"i));
SELECT ("hus"i) (0 ("<stohpu>"i) LINK 0 pl);
SELECT ("hus"i) (0 ("<stohpu>"i) LINK *0 ("<buollit>"i));
SELECT:fallback ("stue"i) (0 ("<stohpu>"i));

# lávki 0 = skritt, 1 = løk
SELECT ("løk"i) (0 ("<lávki>"i))  (*1 ("<leat>"i) LINK 0 VFIN LINK *1 ("<čuohppat>"i) OR ("<čuohpadit>"i) LINK 0 prfprc) ;
## 	Danne go 	lávki 	lea antiseptalaš , de dat veahkeha go lea čuohpadan , gaskkahallan dahje go leat nárážat .
##  Lilja 	lávkkit 	vuovdit !
SELECT ("skritt"i) (0 ("<lávki>"i)) ;
## Sámi vuođđoskuvlaoahpaheaddjioahpu láhkaásahus lea 	lávkin 	dan guvlui , mainna sámiid iešmearrideapmi dahkko duohtan ja čalmmustahttojuvvo Norggas ja eará Davviriikkain .
## Joavkku bealis deattuhuvvo ahte raporta lea vuosttaš 	lávki 	stuorát ovddidanbarggus .
SELECT:fallback ("skritt"i) (0 ("<lávki>"i));


# gorka 0 = kork (badekar, flaske etc.), 1 = dupp, 2 = kjeft
SELECT ("kjeft"i) (0 ("<gorka>"i) OR ("<goarka>"i))  (*-1 ("<doallat>"i)) (*1 ("<gitta>"i)) ;
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
SELECT ("trafikk"i) (0 ("<johtolat>"i) LINK NOT 0 pl) (-1 ("<ollu>"i) OR ("<eanet>"i));
## 1938 rádjái lei Porsáŋggu-Kárášjoga máđija ráigge eanemus 	johtolat 	, go Kárášjoga ja Suoma gaskka vudje eanas dálvet , muhto maŋŋel go Kárášjohgeaidnu gárvánii.
SELECT ("flyttevei"i) (0 ("<johtolat>"i) LINK 0 pl) ;
## 	Ii leat dasto čielggas ledje go dát vuotnasápmelaččat dalle juo álggahan guhkit johtolagaid.
SELECT ("flyttevei"i) (0 ("<johtolat>"i) LINK *0 ("<.*orohat>"ri)) ;
## Oallugat deattuhedje man deaŧalaš 	johtolat 	lei boazodollui . ???
## Dákkár johtin ja 	johtolat 	gaskal dálveorohagaid siseatnamis ja geasseorohagaid mearragátteváriin lea ekologalaš heiveheapmi mii gottiin lei ja masa boazobargi lea iežas eallima heivehan .
## lea šaddan nu ahte hámmandilálašvuođat ja guollebivdohámmana guovddáš sajádat riddoruvttu985 johtolaga ektui lea deaŧalaččat go lagamus 	johtolat 	guollebáikái .
SELECT:fallback ("trafikk"i) (0 ("<johtolat>"i));

#Geaidnopolitiijat leat disdaga dárkkistan johtolaga Stállogárgotuneallas

# vealgi 0 = gjeld, 1 = lån
SELECT ("lån"i) (0 ("<vealgi>"i) LINK 0 pl) (*-1 ("<dárbbašit>"i)) ;
## Gáivuona suohkan áigo nannet ruhtadeamiid dakkár biergasiidda , jos olbmot dárbbašit 	velggiid 	go galget ruhtadit oastimiid .
SELECT ("lån"i) (0 ("<vealgi>"i) LINK 0 pl) (*1 ("<guhkesáiggivealgi>"i)) ;
## Dat 	vealgi 	lea guhkesáiggivealgi , nu ahte dat gal mákso dál ruovttoluotta nu movt galgá .
## Fylkkagieldda guhkesáiggi 	vealgi 	lea lassánan 289,3 miljovnnain ruvnnuin 2009 rájes 2010 rádjái .
## Vealggit lassánedje sullii 8 mill kr , mas oanehisáiggi 	vealgi 	lassánii sullii 4 mill kr.
## Mii mihtidit likviditehta go geahččat differánssa gaskal johtoomiid ( kássa // báŋkui sisabidju ja oanehisáigge bearramat ) ja oanehisáigge 	velggiid 	, man gohčoda bargokapitálan .
SELECT:fallback ("gjeld"i) (0 ("<vealgi>"i));

# goansta 0 = kunst, 1 = triks, 2 = ferdighet, 3 = påfunn

SELECT ("påfunn"i) (0 ("<goansta>"i)) (-1 ("<buorre>"i)) ;
## Juste dál hálidivččet atnit eambbo áiggi iežat guoibmái , muhto dat liikká ii leat nu buorre 	goansta.
## Ii lean várra šat nu buorre 	goansta 	vuodjit , go eaiggát lei sihkkarit lensmánnái dieđihan .  ---påfunn

SELECT ("ferdighet"i) (0 ("<goansta>"i) LINK 0 pl) (*-1 ("<ieš>"i)) ;
## Fuobmájin iežan 	goansttaid 	ja álgen hárjehallat viesus .

SELECT ("triks"i) (0 ("<goansta>"i)) (*-1 ("<fuobmát>"i) OR ("<dahkat>"i)) ;
## Áltálaš Jon Røkenes lea fuobmán álkit 	goansttaid 	ráhkadit dola . ---triks (måtene)
## De jearrá rieban bussás : – Galle 	goanstta 	leat dus ?
## Muhto go son manná vuostebiggii , dahje go son diehtá , gosa dan báikkis háliida boazu , de son manná ja guldala ja dainna 	goansttain 	gávdná ealu .
## Filbmemis dahket ollu 	goansttaid 	, nugohčoduvvon filmtriks ja muhtomin eai sáhte diktit neavttáriid neaktit jus ballet sin lápmahuvvat .

SELECT ("kunst"i) (0 ("<goansta>"i)) ;
## Dalle ii leat mihkke ge 	goansttaid 	jeakki rasttildit . (maybe translated in singular?)
## – Rektor doppe lei hui mielas ja oahpaheaddjit maiddái , ja go álggiimet hupmat dan birra , de ii orron goanstage 	.
SELECT:fallback ("kunst"i) (0 ("<goansta>"i));

# jietna 0 = stemme, 1 = lyd

SELECT ("lyd"i) (0 ("<jietna>"i)) (1 cnjcoo OR COMMA LINK 1 ("<govva>"i)) ;
## Ođđaáigásaš servodagas lea dárbbašlaš máhttit hálddašit iešguđet mediaid ja teavsttaid main leat ollu iešguđetlágan oasit biddjon oktii , nugo čála , 	jietna 	ja govva ja seammás oaidnit oktavuođaid giela ja árbemáhtu gaskkas .
## Multifunkšunála oahpponeavvuin sáhttet leat olu iešguđetlágán komponeanttat ja heivehuvvon oasit, nugo jienat, govat ja teavsttat , eaige dat dárbbaš leat dušše ovtta vásedin ulbmila váste ráhkaduvvon .
SELECT ("lyd"i) (0 ("<jietna>"i)) (-1 gen LINK 0 ("<luondu>"i) OR ("<skuter>"i));
## Go gullá luonddu jienaid, go oaidná - de sáhttá maid bidjat sániid sihke jienaide ja dasa maid oaidná luonddus .
#Sem/Plc OR Sem/Veh

SELECT ("lyd"i) (0 ("<jietna>"i)) (-1 ("<geaidut>"i) OR ("<ráhkadit>"i));
## Skutera 	jietna 	juoga sajis gullo .
## Nils Petter Molvær geaidu 	jienaid 	iežas trompehtain .
## Eará ii ávkkut , nugo čuoikabalddonasat mat ráhkadit jiena, lohká divredutki Preben Ottesen .
## De soai gullaba issoras ártegis 	jiena 	.

SELECT ("stemme"i) (0 ("<jietna>"i));
## - Sámediggi cealká earret eará ahte dat stuora erohusat mat leat dan ektui galle 	jiena 	leat juohke áirasa duohken geanohuhttet Sámedikki lobálašvuođa sihke sámi servodagas ja eará eisseválddiid ektui .
## ( 1 ) Jus jienasteaddji ii goastta válgalatnjii , de sáhttá son addit 	jiena 	guovtti jietnavuostáváldái dastán válgalanja olggobealde .
SELECT:fallback ("stemme"i) (0 ("<jietna>"i));

SELECT:fallback ("problem"i) (0 ("<čuolbma>"i));


# vuoján 0 = kjøretøy, 1 = kjørerein

LIST VUOJAN-ANI-WORDS = ("<čearpmat>"i) ("<varit>"i) ("<vuoitit>"i) ("<boazu>"i) ("<gabba>"i) ("<reahka>"i) ("<juovlanigá>"i) ("<juovlastállu>"i) ("<heargi>"i) ("<sprinta>"i) ("<eallu>"i) ("<SHL-#máilmmicup"i) ("<reahkavuodjin>"i) ("<gonagasgilvu>"i) ("<SVL-hearge#cup>"i) ("<heargevuodjingilvu>"i) ;
#possibly semantic category Ani-reindeer usefull?
LIST VUOJAN-ANI-ADJ = ("<sávri>"i) ("<buorre>"i) ("<sápmi>"i) ("<falli>"i) ("<nuorra>"i) ("<beakkán>"i) ;
LIST VUOJAN-ANI-V = ("<biebmat>"i) ("<hárjehahttit>"i) ("<njuovvat>"i) ("<ruohttat>"i) ("<vuoitit>"i);

SELECT ("kjørerein"i) (0 ("<vuoján>"i)) (*0 VUOJAN-ANI-WORDS OR VUOJAN-ANI-V) ;
#SELECT ("kjørerein"i) (0 ("<vuoján>"i) LINK 0 ess) ;
SELECT ("kjørerein"i) (0 ("<vuoján>"i)) (-1 VUOJAN-ANI-ADJ + attr) ;
## Bikko Máhte luohti lea dovddus Sančuari hámis “ Stállangazza ” , mii lei beakkán vuoján 	Bikko Máhtes . #disambiguation rule needs to fix beakkán analysis
## Dat lei erenoamáš fales vuoján , dadjá Eira , dan botta go njuovvá iežas 	vuojána 	máid massii .
SELECT ("kjørerein"i) (0 ("<vuoján>"i)) (1 COMMA LINK 1 ("«^.*"r));
## Vuosttaš máilmmiolahus John Inge Eiras dán dálvvi iežas vuojániin, «Limoin».
## Máhtte Niillas Gaup 	vuoján 	Ieš vuittii reahkavuodjima ja Máret Áile Sara vuoján Dolgii vuittii ges sabetvuodjimiid Sámi Grand Prix gilvvuin  beassášlávvordaga Guovdageainnus .
## Nils Henrik Eira 	vuojániin 	Summitiin , mas lei buoremus áigi olles gilvvuin ja oaččui ge Máze Gilisearvvis dan ovddas  dan stuorámus pokála .
## Sara vuot čájehii ahte son lea okta Sámi buoremus vuddjiin ja sus leat buorre 	vuoján, go mannan vahkkoloahpa vuittii SVL-heargecupa maŋemus vuodjima Mázes .
## Dát ledje várra 	vuojánat 	ja geahččobohccot .
## Ámtta 1866-70 viđajagidieđáhusas muitaluvvo boazodoalu birra ahte riddosuohkaniin ledje olbmuin bohccot 	vuojánin 	, dahje mearrasápmelaččat ledje árben bohccuid boazosáminieiddaiguin náitalemiid bokte .
## Guhkes gaskkaid ii leat gánnáhahtti dákkar 	vuojániiguin 	vuodjit .  - fartøy
## Diesel 	vuojánat 	main ollislaš deaddu lea 3500 gilus gitta 12000 gilui 990,- ru. .
## Njealjejuvllat 	vuoján 	roasmmohuvai vehá .
## Registrerekeahtes 	vuojániid 	lea muđui váttis doalvut tuollu meattá , Nieminen muitala .
## – Dát lei baicce somá , láhttestii Vicky Tauli-Corpus , ja leaikkastalai go lei sihke beassan vuodjit Juovlastálu 	vuojániin 	ja borrat bohccobierggu . ???
SELECT:fallback ("kjøretøy"i) (0 ("<vuoján>"i));


# bárti 0 = problem, 1 = uhell, 2 = skade, 3 = ulykke

SELECT ("skade"i) (0 ("<bárti>"i)) (-1 ("<dagahit>"i)) ;
## Dálki lei ge ikte nu garas Finnmárkkus ahte dagahii 	bárttiid 	.  --- skapte skader

SELECT ("uhell"i) (0 ("<bárti>"i)) (-1 ("<oalle>"i)) ;
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

SELECT ("dekk"i) (0 ("<riekkis>"i)) (1 cnjcoo LINK 1 ("<juvla>"i)) ;
SELECT ("dekk"i) (0 ("<riekkis>"i)) (-1 ("<biila>"i) LINK 0 gen) ;	# Sem/Veh instead of biila
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

SELECT:lang-speakers (".*talende"ri) (0 sem_lang LINK 0 n + pl) ;
# not sure about this analysis, but it does give nicer translations

SELECT ("nok"i) (0 ("<doarvi>"i)) (0 ill) ;
SELECT:fallback ("mengde"i) (0 ("<doarvi>"i)) ;

SELECT ("milepæl"i) (0 ("<olahus>"i)) (1 ill LINK 0 HUMAN OR prn) ;
SELECT:fallback ("rekord"i) (0 ("<olahus>"i)) ;



SELECT ("middel"i) (0 ("<doarjja>"i)) (-1 ("<ruoná>"i)) ;
SELECT:fallback ("støtte"i) (0 ("<doarjja>"i)) ;

SELECT ("diakritisk tegn"i) (0 ("<dárkka>"i)) (*-1 ("<merket>"i)) ;
SELECT:fallback ("pålitelighet"i) (0 ("<dárkka>"i)) ;


SELECT ("stamme"i) (0 ("<mátta>"i)) (-1 cmp) ;
SELECT ("sør"i) (0 ("<mátta>"i) LINK 0 sg) (1 np or sem_plc or ("<sápmi>"i)) ;
SELECT ("sør"i) (0 ("<mátta>"i) LINK 0 sg) (0 cmp_splitr) ;
SELECT:fallback ("sør"i) (0 ("<mátta>"i)  LINK 0 sg)  ;	
SELECT ("stamme"i) (0 ("<mátta>"i) LINK 0 pl) ;

SELECT ("samskipnad"i) (0 ("<ovttastus>"i)) (-1 ("<studeanta>"i)) ;
SELECT:fallback ("forbindelse"i) (0 ("<ovttastus>"i))  ;	

SELECT:fallback ("nordmann"i) (0 ("<dáža>"i))  ;	

SELECT ("handskrift"i) (0 ("<giehtačálus>"i) LINK *0 ("<bábir>"i) + loc)  ;	
SELECT:fallback ("manus"i) (0 ("<giehtačálus>"i))  ;	


SELECT ("press"i) (0 ("<deaddu>"i) + acc) (*-1 ("<bidjat>"i) OR ("<bargat>"i)  BARRIER SV-BOUNDARY) ;
SELECT:fallback ("tyngde"i) (0 ("<deaddu>"i)) ;
SELECT:fallback ("byrde"i) (0 ("<noađđi>"i)) ;


SELECT ("premie"i) (0 ("<vuoitu>"i) LINK 0 cmp) (1 sem_veh) ;
SELECT ("gevinst"i) (0 ("<vuoitu>"i)) (-1 ("<oppalaš>"i) OR ("<fasket>"i)) ;
SELECT ("gevinst"i) (0 ("<vuoitu>"i)) (*0 CURRENCY OR ("<goastadit>"i)  OR ("<oažžut>"i)  OR ("<geiget>"i)  OR ("<fasket>"i)) ;	
SELECT ("gevinst"i) (0 ("<vuoitu>"i) LINK -1 ("<smávis>"i) OR ("<stuoris>"i))  ;	
SELECT:fallback ("seier"i) (0 ("<vuoitu>"i));

SELECT ("samisk"i) (0 ("<sápmi>"i) + sg LINK 0 @→N OR @→A) ; #(NEGATE -1 num LINK NOT 2 n + sg + gen OR n + sg + acc);
SELECT ("reindriftssamisk"i) (0 ("<boazosápmi>"i) + sg LINK 0 @→N) ;
SELECT ("sørsamisk"i) (0 ("<máttasápmi>"i) LINK 0 sg + gen);
SELECT ("sørsamisk"i) (0 ("<lullisápmi>"i) LINK 0 sg + gen);
SELECT ("pitesamisk"i) (0 ("<bihtonsápmi>"i) LINK 0 sg + gen);
SELECT ("lulesamisk"i) (0 ("<julevsápmi>"i) LINK 0 sg + gen);
SELECT ("sjøsamisk"i) (0 ("<mearrasápmi>"i) LINK 0 sg + gen);
SELECT ("nordsamisk"i) (0 ("<davvisápmi>"i) LINK 0 sg + gen);
SELECT:fallback ("sameland"i) (0 ("<sápmi>"i) LINK 0 sg + loc);
SELECT:fallback ("same"i) (0 ("<sápmi>"i));
SELECT:fallback ("pitesame"i) (0 ("<bihtonsápmi>"i));
SELECT:fallback ("sørsamisk"i) (0 ("<máttasápmi>"i));
SELECT:fallback ("sørsame"i) (0 ("<lullisápmi>"i));
SELECT:fallback ("lulesame"i) (0 ("<julevsápmi>"i));
SELECT:fallback ("sjøsame"i) (0 ("<mearrasápmi>"i));
SELECT:fallback ("nordsame"i) (0 ("<davvisápmi>"i));

SELECT ("sameland"i) (0 ("<sápmi>"i) LINK -1 ("<ollis>"i) OR ("<miehtá>"i) OR adj + attr);
#SELECT ("Samisk"i) (0 ("<Sápmi>"i) LINK 0 sg + gen);
SELECT:fallback ("Sameland"i) (0 ("<Sápmi>"i));

SELECT:finsk ("finsk"i) (0 ("<Suopma>"i) LINK 0 gen LINK 1 ("<bealde>"i) OR ("<bealli>"i) OR ("<beallai>"i));
SELECT:fallback ("Finland"i) (0 ("<Suopma>"i));

SELECT:svensk ("svensk"i) (0 ("<Ruoŧŧa>"i) LINK 0 gen LINK 1 ("<bealde>"i) OR ("<bealli>"i) OR ("<beallai>"i));
SELECT ("svensk"i) (0 ("<Ruoŧŧa>"i) LINK 0 @→N)(NEGATE -1 num LINK NOT 2 n + sg + gen OR n + sg + acc);
SELECT:fallback ("Sverige"i) (0 ("<Ruoŧŧa>"i));

SELECT:norsk ("norsk"i) (0 ("<Norga>"i) LINK 0 gen LINK 1 ("<bealde>"i) OR ("<bealli>"i) OR ("<beallai>"i));

SELECT:fallback ("Sverige"i) (0 ("<Norga>"i));

SELECT:russisk ("russisk"i) (0 ("<Ruošša>"i) LINK 0 gen LINK 1 ("<bealde>"i) OR ("<bealli>"i) OR ("<beallai>"i));

SELECT:fallback ("Sverige"i) (0 ("<Ruošša>"i));

SELECT:fallback ("hvor mange"i) (0 ("<gallis>"i) + n);

SELECT ("levning"i) (0 ("<bázahus>"i) LINK -1 HUMAN OR ("<rumaš>"i));
SELECT:fallback ("avfall"i) (0 ("<bázahus>"i));

SELECT:fallback ("fiskekort"i) (0 ("<bivdolohpi>"i));


SELECT ("arbeider"i) (0 ("<bargi>"i) LINK -1 ("<eaktodáhtolaš>"i));
SELECT:fallback ("ansatt"i) (0 ("<bargi>"i));

SELECT ("sentrum"i) (0 ("<guovddáš>"i) LINK 0 sg + loc)(*-1 sem_org + nom);
SELECT ("fokus"i) (0 ("<guovddáš>"i) LINK 0 sg + ill) (-1 ("<bidjat>"i));
SELECT ("fokus"i) (0 ("<guovddáš>"i) LINK 0 sg + loc) (*-1 ("<.*vuohta>"r) OR (sem_rule) OR ("<jurddašeapmi>"i) OR ("<árvu>"i) OR sem_semcon  OR sem_domain + gen);
SELECT ("sentrum"i) (0 ("<guovddáš>"i) LINK 0 sg + loc)(*-1 ("<leat>"i) BARRIER SV-BOUNDARY);
SELECT:fallback ("senter"i) (0 ("<guovddáš>"i));

SELECT:fallback ("skive"i) (0 ("<skearru>"i));
SELECT:fallback ("jernbane"i) (0 ("<ruovdemáđidja>"i));

SELECT ("løype"i) (0 ("<máđidja>"i) LINK -1 ("<dihkká>"i));
SELECT:fallback ("vei"i) (0 ("<máđidja>"i));


SELECT ("pensjon"i) (0 ("<ealáhat>"i) LINK 0 ill LINK *-1 ("<mannat>"i) OR ("<báhcit>"i) BARRIER SV-BOUNDARY);
SELECT:fallback ("beite"i) (0 ("<skearru>"i));


SELECT:part ("part"i) (0 ("<bealli>"i) LINK *1 ("<deaivvadit>"i) OR ("<soabadit>"i) BARRIER SV-BOUNDARY);
SELECT:part ("part"i) (0 ("<bealli>"i) LINK -1 ("<bargoeallin>"i) OR ("<ášši>"i) OR ("<nubbi>"i));
SELECT:side ("side"i) (0 ("<bealli>"i) LINK *-1 ("<muitalit>"i) OR ("<čájehit>"i)  BARRIER SV-BOUNDARY);
SELECT:side ("side"i) (0 ("<bealli>"i) LINK -1 adj + @→N OR np + @→N);
SELECT:side ("side"i) (0 ("<bealli>"i) LINK 0 pl);
SELECT:side ("side"i) (0 ("<bealli>"i) LINK *1 sem_domain + loc);
SELECT:halvpart ("halvpart"i) (0 ("<bealli>"i) LINK 1 n + pl);
SELECT:fallback ("halvpart"i) (0 ("<bealli>"i));

SELECT:fallback ("hete"i) (0 ("<báhkka>"i));

SELECT ("ved"i) (0 ("<muorra>"i) LINK 0 loc);
SELECT ("ved"i) (0 ("<muorra>"i) LINK *0 ("<cahkkehit>"i) OR ("<omman>"i) OR ("<uvdna>"i) OR ("<goikat>"i) OR ("<buollat>"i) OR ("<buollát>"i));
SELECT ("ved"i) (0 ("<muorra>"i) LINK -1 ("<njuoskkas>"i));
SELECT:fallback ("tre"i) (0 ("<muorra>"i));

SELECT:fallback ("fremføring"i) (0 ("<ovdanbuktin>"i));


SELECT ("glad"i) (0 ("<illu>"i) LINK 0 loc);
SELECT:fallback ("glede"i) (0 ("<illu>"i));

SELECT ("redd"i) (0 ("<ballu>"i) LINK 0 loc);
SELECT:fallback ("frykt"i) (0 ("<ballu>"i));


SELECT ("tale"i) (0 ("<ságat>"i) LINK 0 ill);
SELECT ("tale"i) (0 ("<ságat>"i) LINK 0 loc LINK -1 HUMAN);
SELECT:fallback ("nyhet"i) (0 ("<ságat>"i));

SELECT ("engasjement"i) (0 ("<mokta>"i) LINK *0 ("<buolli>"i) OR ("<buollát>"i) OR ("<buollit>"i));
SELECT:fallback ("humør"i) (0 ("<mokta>"i));


SELECT:fallback ("tilbud"i) (0 ("<fálaldat>"i));
SELECT:fallback ("innlegg"i) (0 ("<sátnevuorru>"i));


SELECT ("preken"i) (0 ("<sárdni>"i) LINK *-1 ("<báhppa>"i) OR ("<girku>"i));
SELECT:fallback ("tale"i) (0 ("<sárdni>"i));

SELECT ("samiske språk"i) (0 ("<sámegiella>"i) LINK 0 pl);
SELECT ("samiske språk"i) (0 ("<sámegiella>"i) LINK 0 gen LINK -1 num);
SELECT ("samisk språk"i) (0 ("<sámegiella>"i) LINK 1 cnjcoo LINK 1 ("<kultuvra>"i) OR ("<sápmi>"i) + gen);
SELECT ("samisk språk"i) (0 ("<sámegiella>"i) LINK 1 ("<ovdáneapmi>"i) OR sem_state OR ("<ipmil>"i));
SELECT:fallback ("samisk"i) (0 ("<sámegiella>"i));

SELECT ("adresse"i) (0 ("<čujuhus>"i) LINK 0 pl OR ill);
SELECT ("adresse"i) (0 ("<čujuhus>"i) LINK 1 ("<namma>"i) OR ("<šilta>"i) );
SELECT ("adresse"i) (0 ("<čujuhus>"i) LINK -1 gen);
SELECT:fallback ("henvisning"i) (0 ("<čujuhus>"i));

SELECT ("tale"i) (0 ("<sáhka>"i) LINK *-1 ("<leat>"i)) (1 loc);
SELECT ("tale"i) (0 ("<sáhka>"i) LINK *-1 ("<leat>"i)) (1 gen LINK 1 ("<birra>"i));
SELECT ("tale"i) (0 ("<sáhka>"i) LINK *-1 ("<leat>"i)) (-1 ("<birra>"i));
SELECT ("tale"i) (0 ("<sáhka>"i) LINK *-1 ("<leat>"i)) (1 cmp LINK 1 loc);
SELECT ("tale om"i) (0 ("<sáhka>"i) LINK -1 ("<leat>"i)) (NEGATE 1 loc);
SELECT:fallback ("budskap"i) (0 ("<sáhka>"i));

SELECT ("utseende"i) (0 ("<hápmi>"i) LINK -1 ("<movttet>"i));
SELECT ("måte"i) (0 ("<hápmi>"i) LINK 0 com LINK -1 adj + attr);
SELECT:fallback ("form"i) (0 ("<hápmi>"i));
SELECT:fallback ("skilt"i) IF (0 ("<galba>"i)) ;

SELECT:fallback ("tur"i) (0 ("<vuorru>"i) LINK -1 pers + gen OR np + gen);
SELECT:fallback ("gang"i) (0 ("<vuorru>"i) LINK -1 dem + gen);
SELECT:fallback ("omgang"i) (0 ("<vuorru>"i));

SELECT ("måte"i) (0 ("<láhki>"i) LINK -1 adj OR prn);
SELECT:fallback ("måte"i) (0 ("<láhki>"i));


SELECT ("jobb"i) (0 ("<bargu>"i) LINK *-1 ("<álgit>"i) OR ("<heaitit>"i) BARRIER SV-BOUNDARY);
SELECT:fallback ("arbeid"i) (0 ("<bargu>"i));

REMOVE (maydetind) (0 ("<sadji>"i) LINK *-1 ("<boahtit>"i) OR ("<addit>"i) OR ("<oažžut>"i) BARRIER SV-BOUNDARY);
SELECT ("plass"i) (0 ("<sadji>"i) LINK *-1 ("<boahtit>"i) OR ("<addit>"i) OR ("<oažžut>"i) BARRIER SV-BOUNDARY);
SELECT ("plass"i) (0 ("<sadji>"i) LINK -1 ord OR ("<nubbi>"i) OR ("<pálla>"i) OR ("<sihkar>"i) OR ("<eahpesihkar>"i) OR ("<cup>"i));
SELECT ("plass"i) (0 ("<sadji>"i) LINK 1 post);
SELECT:fallback ("sted"i) (0 ("<sadji>"i));

SELECT ("skyld"i) (0 ("<sivva>"i) LINK -1 gen);
SELECT:fallback ("grunn"i) (0 ("<sivva>"i));

SELECT ("leting"i) (0 ("<ohcan>"i) LINK -1 ("<diehtu>"i));
SELECT:fallback ("søknad"i) (0 ("<ohcan>"i));

SELECT ("stolt"i) (0 ("<rápmi>"i) LINK 0 loc);
SELECT:fallback ("ros"i) (0 ("<rápmi>"i));

SELECT:fallback ("ekstra"i) (0 ("<liige>"i));

SELECT ("vei"i) (0 ("<geinnodat>"i) LINK -1 acr);
SELECT:fallback ("flyttevei"i) (0 ("<geinnodat>"i));


SELECT ("antall"i) (0 ("<lohku>"i) LINK -1 pl + gen + sem_hum OR pl + gen + sem_ani OR (sem_cat)) ;
SELECT:fallback ("tall"i) (0 ("<lohku>"i));

SELECT ("omveg"i) (0 ("<mohkki>"i) + pl) ;
SELECT:fallback ("bukt"i) (0 ("<mohkki>"i));


SELECT:fallback ("forskning"i) (0 ("<dutkan>"i));


SELECT ("anmeldelse"i) (0 ("<árvvoštallan>"i) LINK -1 sem_txt + acc OR ("<filbma>"i) + acc) ;
SELECT:fallback ("vurdering"i) (0 ("<árvvoštallan>"i));


SELECT ("driftsenhet"i) (0 ("<doallu>"i) LINK *0 ("<orohat>"i) OR ("<siida>"i) OR ("<boazu>"i)) ;
SELECT:fallback ("arrangement"i) (0 ("<doallu>"i)) ;

SELECT ("reinbeitedistrikt"i) (0 ("<orohat>"i) LINK 1 (arab) OR ("<ovdaolmmoš>"i) OR ("<siida>"i)) ;
SELECT ("reinbeitedistrikt"i) (0 ("<orohat>"i) LINK *0 ("<boazu>"i) OR ("<boazolohku>"i)) ;
SELECT:fallback ("reinbeitedistrikt"i) (0 ("<orohat>"i));

SELECT ("topp"i) (0 ("<njunuš>"i))(*0 ("<artista>"i) OR ("<listu>"i) OR ("<válga.*>"r));
SELECT ("toppfolk"i) (0 ("<njunuš>"i) + pl) ;
SELECT:fallback ("topp"i) (0 ("<njunuš>"i));

SELECT:fallback ("forsvar"i) (0 ("<suodjalus>"i));

SELECT ("omkring"i) (0 ("<biras>"i) LINK 0 pl + gen) (1 ("<mánnu>"i));

SELECT ("avstand"i) (0 ("<gaska>"i) LINK -1 ("<stuoris>"i));
SELECT ("strekning"i) (0 ("<gaska>"i) LINK *0 CURRENCY OR ("<prográmmaguovlu>"i));
SELECT ("strekning"i) (0 ("<gaska>"i) LINK 0 pl);
SELECT ("stund"i) (-1 ("<okta>"i))(0 ("<gaska>"i));
SELECT:fallback ("mellomrom"i) (0 ("<gaska>"i));

SELECT ("sjikt"i) (0 ("<geardi>"i) LINK -1 comp + attr);
SELECT:fallback ("gang"i) (0 ("<geardi>"i));

SELECT ("tagg"i) (0 ("<gilkor>"i));
#SELECT:fallback ("navnemerke"i) (0 ("<geardi>"i));


SELECT ("besøk"i) (0 ("<guossi>"i) LINK 0 ess);
SELECT:fallback ("gjest"i) (0 ("<guossi>"i));


SELECT:fallback ("insekt"i) (0 ("<divri>"i));

SELECT ("lag"i) (0 ("<joavku>"i) LINK *0 ("<čiekčat>"i) OR ("<divišuvdna>"i) OR ("<ráidočiekčan>"i) OR ("<čiekčan>"i) OR ("<čiekčat>"i) OR ("<čiekči>"i));
SELECT:fallback ("gruppe"i) (0 ("<joavku>"i)) ;

SELECT ("venn"i) (0 ("<olmmái>"i) LINK -1 HUMAN + gen OR pers + du);
SELECT:fallback ("mann"i) (0 ("<olmmái>"i));

SELECT ("vern"i) (0 ("<suodji>"i) LINK -1 ("<kultuvra>"i) OR cmp );
SELECT:fallback ("ly"i) (0 ("<suodji>"i));

SELECT ("gård"i) (0 ("<dállu>"i) LINK *0 ("<.*vuoigatvuohta>"r) OR ("<eana>"i));
SELECT:fallback ("hus"i) (0 ("<dállu>"i));

SELECT:sønn ("sønn"i) (0 ("<bárdni>"i) LINK -1 HUMAN  OR ("<beaivi>"i) LINK 0 @→N);
SELECT:sønn ("sønn"i) (0 ("<bárdni>"i) LINK *-1 COPULAS BARRIER NOT-NPMOD LINK *-1 ←hab→ LINK 0 HUMAN);
SELECT:fallback ("gutt"i) (0 ("<bárdni>"i));

SELECT ("tiltak"i) (0 ("<doaibma>"i) LINK -1 cmp) ;
SELECT ("virksomhet"i) (0 ("<doaibma>"i) LINK 0 PX) ;
SELECT ("virksomhet"i) (0 ("<doaibma>"i) LINK -1 gen ) ;
SELECT:fallback ("oppgave"i) (0 ("<doaibma>"i));

SELECT ("yrkes"i) (0 ("<ámmát>"i) LINK 0 cmp) ;
SELECT:fallback ("embete"i) (0 ("<ámmát>"i));

SELECT ("ekstern"i) (0 ("<olggobealle>"i) LINK 0 gen) ;
SELECT:fallback ("ytterside"i) (0 ("<olggobealle>"i));


SELECT ("torske"i) (0 ("<dorski>"i) LINK 0 cmp) ;
SELECT:fallback ("torsk"i) (0 ("<dorski>"i));

SELECT:fallback ("utmark"i) (0 ("<meahcci>"i));

SELECT:fallback ("velsignelse"i) (0 ("<sivdnideapmi>"i));

SELECT:fallback ("hage"i) (0 ("<gárdi>"i) LINK -1 ("<mánná>"i) + cmp);
SELECT:fallback ("gjerde"i) (0 ("<gárdi>"i));

SELECT ("vindusrute"i) (0 ("<láse>"i) + acc LINK *0 ("<rahpat>"i) OR ("<rabastit>"i));
SELECT:fallback ("glass"i) (0 ("<láse>"i));

SELECT ("markeds"i) (0 ("<márkan>"i) LINK 0 cmp);
SELECT:fallback ("marked"i) (0 ("<márkan>"i));


SELECT ("part"i) (0 ("<oassi>"i) LINK -1 ("<eanaš>"i) OR ("<eanas>"i));
SELECT:fallback ("del"i) (0 ("<oassi>"i));

SELECT ("landskap"i) (0 ("<eana>"i) LINK 0 pl);
SELECT:fallback ("jord"i) (0 ("<eana>"i));


SELECT ("studium"i) (0 ("<oahppu>"i) LINK 0 pl);
SELECT ("studium"i) (0 ("<oahppu>"i) LINK -1 ("<ohcat>"i));
SELECT ("studie"i) (0 ("<oahppu>"i) LINK 1 cnjcoo LINK 1 ("<dutkan>"i));
SELECT ("studie"i) (0 ("<oahppu>"i) LINK 1 ("<bagadallan>"i));
SELECT:fallback ("studium"i) (0 ("<oahppu>"i));


SELECT ("fiske"i) (0 ("<bivdu>"i) LINK *0 sem_ani-fish OR ("<reahkká>"i) OR ("<gonagasreabbá>"i)  OR ("<.*reabbábivdu>"ri)) ;
SELECT:fallback ("jakt"i) (0 ("<bivdu>"i));

SELECT:fallback ("kreps"i) (0 ("<reabbá>"i) LINK -1 BOS)(1 EOS);
SELECT ("krabbe"i) (0 ("<reabbá>"i));


SELECT:fallback ("berømt"i) (0 ("<beakkán>"i) LINK 0 sg + nom OR attr);
SELECT ("kjendis"i) (0 ("<beakkán>"i));

SELECT ("kaos"i) (0 ("<moivi>"i) LINK -1 ("<muohta>"i) LINK 0 cmp);
SELECT:fallback ("rot"i) (0 ("<moivi>"i));

SELECT ("svømmer"i) (0 ("<vuoddji>"i) LINK *0 ("<vuodjat>"i) OR ("<vuodjan>"i) );
SELECT:fallback ("sjåfør"i) (0 ("<vuoddji>"i));


SELECT ("doktor"i) (0 ("<doavttir>"i) LINK 1 (ant) OR (cog));
SELECT:fallback ("lege"i) (0 ("<doavttir>"i));
SELECT:fallback ("bilideapmi"i) (0 ("<ødeleggelse>"i));

# Nouns that were all 0-marked in the dix:
SELECT:fallback ("fiske"i) (0 ("<guollebivdu>"i));
SELECT:fallback ("gjenstand"i) (0 ("<dávvir>"i));
SELECT:fallback ("kjennemerke"i) (0 ("<dovddaldat>"i));
SELECT:fallback ("energi"i) (0 ("<arva>"i));
SELECT:fallback ("øre"i) (0 ("<beallji>"i));
SELECT:fallback ("nektelse"i) (0 ("<biehttalus>"i));
SELECT:fallback ("miljø"i) (0 ("<biras>"i));
SELECT:fallback ("bro"i) (0 ("<boarri>"i));
SELECT:fallback ("kant"i) (0 ("<borri>"i));
SELECT:fallback ("spiser"i) (0 ("<borri>"i));
SELECT:fallback ("erstatning"i) (0 ("<buhtadas>"i));
SELECT:fallback ("kulde"i) (0 ("<buolaš>"i));
SELECT:fallback ("trinn"i) (0 ("<ceahkki>"i));
SELECT:fallback ("vekt"i) (0 ("<deatta>"i));
SELECT:fallback ("håndarbeid"i) (0 ("<duodji>"i));
SELECT:fallback ("ønske"i) (0 ("<dáhttu>"i));
SELECT:fallback ("eiendel"i) (0 ("<dávvir>"i));
SELECT:fallback ("norsk"i) (0 ("<dáčča>"i));
SELECT:fallback ("flokk"i) (0 ("<eallu>"i));
SELECT:fallback ("hustru"i) (0 ("<eamit>"i));

SELECT:kraft ("kraft"i)(0 ("<fápmu>"i) LINK *-1 ("<bidjat>"i) BARRIER SV-BOUNDARY);
SELECT:kraft ("kraft"i) (*-1 @SUBJ→ LINK 0 sem_rule) (0 ("<fápmu>"i));
SELECT:kraft ("kraft"i) (0 ("<fápmu>"i)) (-1 ("<magihkalaš>"i) OR ("<ceavzin>"i));
SELECT:fallback ("makt"i) (0 ("<fápmu>"i));

SELECT:fallback ("skall"i) (0 ("<garra>"i));
SELECT:fallback ("negl"i) (0 ("<gazza>"i));
SELECT:fallback ("lettelse"i) (0 ("<geahpádus>"i));
SELECT:fallback ("eng"i) (0 ("<gieddi>"i));
SELECT:fallback ("hånd"i) (0 ("<giehta>"i));
SELECT:fallback ("fly"i) (0 ("<girdi>"i));
SELECT:fallback ("kamerat"i) (0 ("<guoibmi>"i));
SELECT:fallback ("tak"i) (0 ("<gáhttu>"i));
SELECT:fallback ("navnebror"i) (0 ("<gáibmi>"i));
SELECT:fallback ("vare"i) (0 ("<gálvu>"i));
SELECT:fallback ("kasse"i) (0 ("<gássa>"i));
SELECT:fallback ("butikk"i) (0 ("<gávpi>"i));
SELECT:fallback ("herre"i) (0 ("<hearrá>"i));
SELECT:fallback ("pynt"i) (0 ("<hearva>"i));
SELECT:fallback ("vestsame"i) (0 ("<hoammá>"i));

SELECT:fallback ("tale"i) (0 ("<hállan>"i));

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
SELECT:fallback ("vei"i) (0 ("<luodda>"i));
SELECT:fallback ("geværpatron"i) (0 ("<ládda>"i));
SELECT:fallback ("garn"i) (0 ("<láigi>"i));
SELECT:fallback ("haug"i) (0 ("<látna>"i));
SELECT:fallback ("venn"i) (0 ("<lávvi>"i));
SELECT:fallback ("betydning"i) (0 ("<mearkkašupmi>"i));
SELECT:fallback ("mengde"i) (0 ("<mearri>"i));
SELECT:fallback ("vedlegg"i) (0 ("<mielddus>"i));
SELECT:fallback ("mål"i) (0 ("<mihttu>"i));
SELECT:fallback ("mål"i) (0 ("<moalla>"i));
SELECT:fallback ("smule"i) (0 ("<moallu>"i));
SELECT:fallback ("vrede"i) (0 ("<moarri>"i));
SELECT:fallback ("minne"i) (0 ("<muitu>"i));
SELECT:fallback ("mold"i) (0 ("<muolda>"i));
SELECT:fallback ("betaling"i) (0 ("<máksu>"i));
SELECT:fallback ("suppe"i) (0 ("<mális>"i));
SELECT:fallback ("mønster"i) (0 ("<málle>"i));
SELECT:fallback ("skaft"i) (0 ("<nađđa>"i));
SELECT:fallback ("grunne"i) (0 ("<njuorra>"i));
SELECT:fallback ("skinn"i) (0 ("<náhkki>"i));
SELECT:fallback ("eie"i) (0 ("<oamastus>"i));
SELECT:fallback ("medvirkende"i) (0 ("<oasálaš>"i));
SELECT:fallback ("ordning"i) (0 ("<ortnet>"i));
SELECT:fallback ("representant"i) (0 ("<ovddasteaddji>"i));
SELECT:fallback ("rett"i) (0 ("<riekti>"i));
SELECT:fallback ("komma"i) (0 ("<rihkku>"i));
SELECT:fallback ("krangel"i) (0 ("<riidu>"i));
SELECT:fallback ("land"i) (0 ("<riika>"i));
SELECT:fallback ("landsforening"i) (0 ("<riikkasearvi>"i));
SELECT:fallback ("fyrstikk"i) (0 ("<rišša>"i));
SELECT:fallback ("skvett"i) (0 ("<rišša>"i));
SELECT:fallback ("rulle"i) (0 ("<rulla>"i));
SELECT:fallback ("trekubbe"i) (0 ("<ráddi>"i));
SELECT:fallback ("gras"i) (0 ("<rássi>"i));
SELECT:fallback ("agn"i) (0 ("<seakti>"i));
SELECT:fallback ("frø"i) (0 ("<siepman>"i));
SELECT:fallback ("siida"i) (0 ("<siida>"i));
SELECT:fallback ("skoletur"i) (0 ("<skuvlamátki>"i));
SELECT:fallback ("trekk"i) (0 ("<skoađas>"i));
SELECT:fallback ("blankett"i) (0 ("<skovvi>"i));
SELECT:fallback ("gris"i) (0 ("<spiidni>"i));
SELECT:fallback ("dialekt"i) (0 ("<suopman>"i));
SELECT:fallback ("venn"i) (0 ("<ustit>"i));
SELECT:fallback ("hundeflokk"i) (0 ("<valvi>"i));
SELECT:fallback ("hefte"i) (0 ("<veahtu>"i));
SELECT:fallback ("lignelse"i) (0 ("<veardádus>"i));
SELECT:fallback ("skatt"i) (0 ("<vearru>"i));
SELECT:fallback ("skikk"i) (0 ("<vierru>"i));
SELECT:fallback ("stilling"i) (0 ("<virgi>"i));
SELECT:fallback ("hus"i) (0 ("<visti>"i));
SELECT:fallback ("smør"i) (0 ("<vuodja>"i));
SELECT:fallback ("måte"i) (0 ("<vuohki>"i));
SELECT:fallback ("styrke"i) (0 ("<vuoibmi>"i));
SELECT:fallback ("rekreasjon"i) (0 ("<vuoiŋŋasteapmi>"i));
SELECT:fallback ("skade"i) (0 ("<váddu>"i));
SELECT:fallback ("mangel"i) (0 ("<váili>"i));
SELECT:fallback ("besvær"i) (0 ("<váivi>"i));
SELECT:fallback ("fullmakt"i) (0 ("<váldi>"i));
SELECT:fallback ("pågriper"i) (0 ("<váldi>"i));
SELECT:fallback ("taker"i) (0 ("<váldi>"i));
SELECT:fallback ("advarsel"i) (0 ("<várrehus>"i));
SELECT:fallback ("hustru"i) (0 ("<áhkká>"i));
SELECT:fallback ("forslag"i) (0 ("<árvalus>"i));
SELECT:fallback ("styrking"i) (0 ("<nannen>"i));
SELECT:fallback ("hjørne"i) (0 ("<čiehka>"i));
SELECT:fallback ("pynt"i) (0 ("<čikŋa>"i));
SELECT:fallback ("sammendrag"i) (0 ("<čoahkkáigeassu>"i));
SELECT:fallback ("tekst"i) (0 ("<čálus>"i));
SELECT:fallback ("slag"i) (0 ("<šládja>"i));
SELECT:fallback ("surr"i) (0 ("<šurra>"i));

SELECT:fallback ("ende"i) (0 ("<loahppa>"i) LINK -1 ("<máilbmi>"i)) ;
SELECT:fallback ("slutt"i) (0 ("<loahppa>"i)) ;

SELECT ("poeng"i) (0 ("<čuokkis>"i) LINK 0 acc LINK *0 ("<oažžut>"i));
SELECT ("poeng"i) (0 ("<čuokkis>"i) LINK -1 sem_edu);
SELECT:fallback ("punkt"i) (0 ("<čuokkis>"i)) ;


SELECT:fallback ("hovedforslag"i) (0 ("<váldoevttohus>"i)) ;

SELECT ("raide"i) (0 ("<ráidu>"i) LINK 1 ("<vuojan>"i)) ;
SELECT ("raide"i) (0 ("<ráidu>"i) LINK *0 ("<boahtit>"i) OR ("<njolgi>"i) OR ("<leahttu>"i)) ;
SELECT ("kø"i) (0 ("<ráidu>"i) LINK *0 ("<vuordit>"i) OR ("<čuožžut>"i)) ;
SELECT:fallback ("serie"i) (0 ("<ráidu>"i)) ;

SELECT ("retning"i) (0 ("<guovlu>"i) + ill LINK -1 ("heajos"i) OR (comp) + (attr) OR sem_time OR  (sem_event)) ;
SELECT ("veg"i) (0 ("<guovlu>"i) + ill LINK -1 ind) ;
SELECT ("veg"i) (0 ("<guovlu>"i) + ill LINK -1 ("<ge>") LINK -1 ind) ;
SELECT:fallback ("område"i) (0 ("<guovlu>"i)) ;

SELECT ("live"i) (0 ("<heagga>"i) LINK 0 loc) ;
SELECT ("rein"i) (0 ("<heagga>"i) LINK -1 num - ("<okta>"i)) ;
SELECT:fallback ("liv"i) (0 ("<heagga>"i)) ;

SELECT ("middel"i) (0 ("<ávnnas>"i) LINK -1 ("<kárten>"i)) ;
SELECT:fallback ("råvare"i) (0 ("<ávnnas>"i)) ;

SELECT ("horn"i) (0 ("<ládju>"i) LINK *-1 ("<.*gahpir>"ri)) ;
SELECT:fallback ("slåttonn"i) (0 ("<ládju>"i)) ;


SELECT:fallback ("betaling"i) (0 ("<máksámuš>"i)) ;
SELECT:fallback ("kvote"i) (0 ("<earri>"i)) ;

SELECT ("rett"i) (0 ("<diggi>"i) LINK 0 ill) ;
SELECT:fallback ("rett"i) (0 ("<diggi>"i)) ;

SELECT ("måne"i) (0 ("<mánnu>"i) LINK 0 SUBJ) ;
SELECT:fallback ("måned"i) (0 ("<mánnu>"i)) ;

# Based on frequency in parallel text:
SELECT ("periode"i) (0 ("<áigodat>"i));
SELECT ("sameby"i) (0 ("<čearru>"i));
SELECT ("urin"i) (0 ("<gužža>"i)) ;
SELECT ("grunntanke"i) (0 ("<vuođđojurdda>"i)) ;


# Adpositions → Prepositions
# ==========================
SELECT ("for"i) (0 ("<bealis>"i)) ;
# TODO: can we do "fra NP side" / "for NP del" ?

SELECT ("i henhold til"i) (0 ("<olis>"i)) ;

SELECT:fallback ("etter"i) (0 ("<maŋis>"i)) ;

SELECT ("hos"i) (0 ("<luhtte>"i) LINK -1 HUMAN) ;
SELECT:fallback ("ved"i) (0 ("<luhtte>"i)) ;

SELECT ("på"i) (0 ("<njeaiga>"i) LINK -1 gen LINK *-1 ("<vuodjit>"i) BARRIER SV-BOUNDARY) ;
SELECT:fallback ("mot"i) (0 ("<njeaiga>"i)) ;


SELECT ("blant"i) (0 ("<gaskkas>"i) LINK -1 HUMAN + pl + gen) ;
SELECT:fallback ("mellom"i) (0 ("<gaskkas>"i)) ;

SELECT ("om"i) (0 ("<geahčen>"i) LINK -1 sem_time) ;
SELECT:fallback ("hos"i) (0 ("<geahčen>"i)) ;

SELECT ("for"i) (0 ("<ektui>"i) LINK -1 (sem_perc-phys)) ;
SELECT ("sammenlignet med"i) (0 ("<ektui>"i) LINK -1 ("<diimmá>"i) OR ("<diibmá>"i)) ;
SELECT:fallback ("mot"i) (0 ("<ektui>"i)) ;

SELECT ("med"i) (0 ("<mielde>"i) LINK -1 sem_veh OR HUMAN) ;
SELECT:fallback ("etter"i) (0 ("<mielde>"i) + post) ;

SELECT:fallback ("i"i) (0 ("<siste>"i)) ;

SELECT ("på grunn av"i) (0 ("<dihte>"i) LINK *-1 ("<rámis>"i) BARRIER SV-BOUNDARY) ;
SELECT ("for å"i) (0 ("<dihte>"i) LINK -1 (actio gen) ) ;
SELECT:fallback ("for"i) (0 ("<dihte>"i) + post) ;


SELECT:fallback ("fra"i) (0 ("<rájes>"i)) ;

SELECT:fallback ("i henhold til"i) (0 ("<vuođul>"i)) ;


# Pronouns, relativisers, conjuctions
# ==========================

# SELECT:todo ("denne"i nt) (0 ("<dat>"i) LINK 0 ill LINK 1 ("<leat>"i)) ;
SELECT pers (0 ("<dat>"i) LINK 0 OBJ) ;
SELECT ("den"i nt) (0 ("<dat>"i) LINK 1 ("<leat>"i)) ;
SELECT:fallback ("den"i nt) (0 ("<dat>"i)) ;




SELECT ("hun"i) (0 ("<son>"i) LINK *-1 ("<nieida>"i) OR ("<nisu>"i) OR sem_fem BARRIER sem_mal) ;
SELECT ("hun"i) (0 ("<son>"i) LINK *1 ("<nieida>"i) OR ("<nisu>"i)  BARRIER sem_mal) ; # OR sem_fem BARRIER prn OR n) ;
SELECT ("hun"i) (0 ("<son>"i) LINK 1 ("<namma>"i) LINK *1 sem_fem BARRIER prn OR n) ;
SELECT ("han"i) + (m) (0 ("<son>"i)  LINK *1 ("<bárdni>"i) OR ("<dievdu>"i) OR sem_mal BARRIER prn OR n) ;
SELECT ("han"i) + (m) (0 ("<son>"i)  LINK *-1 ("<bárdni>"i) OR ("<dievdu>"i) OR sem_mal BARRIER sem_fem) ;


SELECT ("nå"i)  (0 ("<dát>"i) LINK 0 gen LINK 1 ("<rádjai>"i) LINK 0 post) ;
SELECT:fallback ("denne"i)  (0 ("<dát>"i)) ;

SELECT:fallback ("han"i) + (GD_pers) (0 ("<son>"i)) ;

SELECT ("av hvem"i) (0 ("<gii>"i)) (NEGATE 0 ←hab→ ) ;
SELECT ("hvem"i) (0 ("<gii>"i) LINK 0 rel + gen) ;
SELECT ("noe"i) (0 ("<gii>"i) LINK 0 (foc_neg-ge)) ;
SELECT:fallback ("hvem"i) (0 ("<gii>"i)) ;


SELECT:fuomášit ("hva som"i) (0 ("<mii>"i)) (-1 FMAINV)(1 VFIN) ;
SELECT:fuomášit ("hva"i) (0 ("<mii>"i)) (-1 FMAINV)(1 n LINK 1 VFIN) ;
SELECT ("hvor"i) (0 ("<mii>"i) LINK 0 @OBJ→) (-1 tv + FMAINV) (1 adj) ; # Eadni muitalii man dehálaš dat lei …
SELECT ("hvor"i) (0 ("<mii>"i) + loc LINK NOT 0 ←hab→)  ; # mas
SELECT:ge-man ("hvor"i) (0 ("<mii>"i) LINK 0 @OBJ→) (-1 pcle) (-2 tv + FMAINV) (1 adj) ; # mihtidit ge man mávssolaččat sámi aviissat leat …
SELECT ("hva"i) (0 ("<mii>"i) LINK 0 @OBJ→) (-1 tv + FMAINV) ; # Minsttarplána čilge maid oahppit berrešedje máhttit.
LIST loc/adv = loc adv;
SELECT:test ("hva"i) (0 ("<mii>"i) LINK 0 @OBJ→) (*-1 FMAINV BARRIER (*) - loc/adv) ; # Hui hárve boahtá<iv!> ovdan oahppoplánabarggus maid sii gáibidit skuvllas.
SELECT:post ("hva"i) (0 ("<mii>"i) LINK 1 post) ;
SELECT:fallback ("som"i) (0 ("<mii>"i)) ;
SELECT ("hvilken"i) (0 ("<mii>"i) LINK 0 rel + @→N LINK 1 @→N) ;
SELECT:fallback ("hvis"i) (0 ("<mii>"i) LINK 0 rel + @→N ) ;

SELECT:pl ("noen"i) (0 ("<muhtun>"i) + pl) ;
SELECT:Leimmet-muhtun ("noen"i) (0 ("<muhtun>"i)) (-1 LEAT + pl) ;
SELECT:muhtun-sániid ("noen"i) (0 ("<muhtun>"i)) (1 n + pl) ;
SELECT:muhtun-sániid ("noen"i) (0 ("<muhtun>"i)) (2 n + pl) ;
SELECT:Leimmet-muhtun ("noen"i) (0 ("<muhtin>"i)) (-1 LEAT + pl) ;
SELECT:muhtun-sániid ("noen"i) (0 ("<muhtin>"i)) (1 n + pl) ;
SELECT:muhtun-sániid ("noen"i) (0 ("<muhtin>"i)) (2 n + pl) ;
SELECT:muhtun-sániid ("noen"i) (0 ("<muhtin>"i) LINK 0 pl) ;

SELECT:klokken-tolv-eller-ett ("én"i) (0 ("<okta>"i)) (*-1 ("<diibmu>"i) BARRIER clb OR vblex OR adv) ;
SELECT:ett-om-natten ("én"i) (0 ("<okta>"i)) (1 ("<ihkku>"i)) ;
SELECT:fallback ("en"i) (0 ("<okta>"i)) ;

SELECT:movt ("som"i) (0 ("<movt>"i)) (-1 ("<nie>"i) OR ("<nu>"i)) ;
SELECT:mot ("som"i) (0 ("<mot>"i)) (-1 ("<nie>"i) OR ("<nu>"i)) ;
SELECT:mo ("som"i) (0 ("<mo>"i)) (-1 ("<nie>"i) OR ("<nu>"i)) ;
SELECT:fallback ("hvordan"i) (0 ("<movt>"i)) ;
SELECT:fallback ("hvordan"i) (0 ("<mot>"i)) ;
SELECT:fallback ("hvordan"i) (0 ("<mo>"i)) ;

SELECT:oba ("i det hele tatt"i) (0 ("<oba>"i)) ((-1 conneg) OR (-1 neg) OR (1 conneg)) ;
SELECT:fallback ("aldeles"i) (0 ("<oba>"i)) ;

SELECT:ge ("heller"i) (0 ("<ge>"i)) (*-1 neg) ;
SELECT:fallback ("også"i) (0 ("<ge>"i)) ;

SELECT ("ene sin"i) (0 ("<nubbi>"i) + gen) (*1 ("<nubbi>"i)) ;
SELECT ("andre sin"i) (0 ("<nubbi>"i) + gen) (*-1 ("<nubbi>"i)) ;
SELECT:fallback ("annen"i) (0 ("<nubbi>"i)) ;

SELECT ("nest"i) (0 ("<nubbi>"i) + ord LINK 1 sup) ;
SELECT:fallback ("andre"i) (0 ("<nubbi>"i) + ord) ;


SELECT:hans-egen ("egen"i) (0 ("<ieš>"i)) (-1 prn + pers + gen) ;
# Dá lea mu iežan girji => Her er min egen bok

SELECT:oss-selv ("selv"i) (0 ("<ieš>"i) LINK 0 acc) (-1 prn + pers + acc) ;
# eai galgga soardit min iežamet → ikke skal gjøre vondt for oss selv

SELECT:til-meg-selv ("selv"i) (0 ("<ieš>"i) LINK 0  ill) (-1 pers + ill) ;
SELECT:på-seg-selv ("seg selv"i) (0 ("<ieš>"i) LINK 0 ill) (NOT -1 pers + ill) ;
#SELECT:fra-seg-selv ("seg selv"i) (0 ("<ieš>"i) LINK 0 loc LINK 0 (@ADVL-ela))  ;

SELECT:skadet-seg-selv ("seg selv"i) (0 ("<ieš>"i) LINK 0 acc LINK NOT -1 prn + pers + acc) ; # (NOT *1 vblex BARRIER S-BOUNDARY) ;
SELECT:fallback ("selv"i) (0 ("<ieš>"i) LINK 0 loc )  ;

SELECT:med-deg prn (0 ("<ieš>"i)) (0 @→P OR @P←) ;
# Váldde biergasiid iežat fárrui → Ta sakene med deg
SELECT:mitt-rom pos (0 ("<ieš>"i)) (NOT 0 @→P OR @P←) ;
# Mun ferten čorget iežan lanja → Jeg må rydde mitt rom

SELECT:fallback ("prpers"i) (0 ("<ieš>"i) LINK 0 acc) ;

SELECT ("hvor mange"i) (0 ("<galle>"i)) (-1 vblex) ;
#SELECT:fallback ("mange"i) (0 ("<galle>"i)) ;

SELECT ("noe slik"i) (0 ("<dakkár>"i)) (*-1 neg BARRIER S-BOUNDARY)(NOT 0 attr) ;
SELECT:fallback ("slik"i) (0 ("<dakkár>"i)) ;

SELECT ("forskjellig"i) (0 ("<iešguhte>"i) LINK 0 (foc_pos-ge)) ;
SELECT ("forskjellig"i) (0 ("<iešguhte>"i) LINK 0 (foc_neg-ge)) ;
SELECT:fallback ("hver"i) (0 ("<iešguhte>"i)) ;


SELECT ("hvilken"i) (0 ("<guhte>"i) LINK 0 attr) ;
SELECT:fallback ("hvem"i) (0 ("<guhte>"i)) ;

# Numerals
# =======

SET NT-BEAL-NUM-NOB =  ("ni og et halvt"i) OR ("åtte og et halvt"i) OR ("sju og et halvt"i) OR ("seks og et halvt"i) OR ("fem og et halvt"i) OR ("fire og et halvt"i)  OR ("tre og et halvt"i) OR ("to og et halvt"i) ;
SET BEAL-NUM-SME =  ("<beallogát>"i) OR ("<bealovccát>"i) OR  ("<bealgávccát>"i) OR  ("<bealčihččet>"i) OR ("<bealguđat>"i) OR ("<bealviđat>"i) OR ("<bealnjealját>"i)  OR ("<bealgoalmmát>"i) ;


SELECT NT-BEAL-NUM-NOB (0 BEAL-NUM-SME LINK *1 (nt) BARRIER WORD - attr) ;  
REMOVE:fallback NT-BEAL-NUM-NOB (0 BEAL-NUM-SME) ;


# Adverbs
# =======
SELECT:ble-mye-verre ("mye"i) (0 ("<sakka>"i) LINK 0 adv) (-1 adj + pasv LINK 0 vblex) ; # vearránii sakka
SELECT ("til"i) (0 ("<vuhtii>"i)) (*-1 ("<váldit>"i)) ;

SELECT ("slik"i) (0 ("<nu>"i) LINK -1 ("<ja>"i)) ;     # Ja nu leat sii
SELECT ("til rette for"i) (0 ("<nu>"i)) (-1 ("<dilálašvuohta>"i)) (1 ("<ahte>"i)) ;
SELECT ("så"i) (0 ("<nu>"i)) (1 adj or ("<galle>"i) or ("<gealdagas>"i) or ("<bures>"i)) ; # dat skuvla nu johtil ahte
SELECT:så-langt-som ("så"i) (0 ("<nu>"i)) (1 adv) (2 cnjsub) ;
SELECT:fallback ("slik"i) (0 ("<nu>"i)) ;     # Ja nu leat sii

SELECT ("fast"i) (0 ("<gitta>"i)) (NOT 1 NP-MEMBER);
SELECT ("til"i) (0 ("<gitta>"i)) ; # looks more like a prep?


REMOVE ("opp"i) (0 ("<bajás>"i))(*0 ("<mánná>"i) LINK 0 acc OR gen) ;
SELECT:fallback ("opp"i) (0 ("<bajás>"i)) ;


SELECT ("enda"i) (0 ("<vuos>"i)) (-1 conneg);
SELECT ("først"i) (0 ("<vuos>"i)) ; 

SELECT:fallback ("mindre"i) (0 ("<unnit>"i)) ; 
SELECT:fallback ("selvfølgelig"i) (0 ("<dieđus>"i)) ; 

SELECT ("aller"i) (0 ("<buot>"i) LINK 1 sup) ; 
SELECT:fallback ("alt"i) (0 ("<buot>"i)) ; 


SELECT ("være synlig"i) (0 ("<oidnosis>"i) LINK NOT *-1 COPULAS BARRIER SV-BOUNDARY) ; 
SELECT:fallback ("synlig"i) (0 ("<oidnosis>"i)) ; 

SELECT ("positiv til"i) (0 ("<mielas>"i) LINK -1 COPULAS)(NOT 1 ill) ; 
SELECT ("positiv"i) (0 ("<mielas>"i) LINK -1 COPULAS) ; 
SELECT:fallback ("gjerne"i) (0 ("<mielas>"i)) ; 


SELECT ("forhånds"i) (0 ("<ovddalgihtii>"i) LINK 1 ("<jietna>"i)) ; 
SELECT:fallback ("på forhånd"i) (0 ("<ovddalgihtii>"i)) ; 


SELECT ("opp"i) (0 ("<eret>"i)) (-1 ("<cealkit>"i)) ;
SELECT ("fra"i) + pr (0 ("<eret>"i)) (-1 ("<leat>"i) OR cnjcoo) ;
SELECT ("bort"i) (0 ("<eret>"i)) (-1 vblex)(NEGATE 1 loc) ;
SELECT ("bort"i) (0 ("<eret>"i)) (1 loc) ;
SELECT ("av"i) (0 ("<eret>"i)) (-1 ("<sahát>"i)) ;
SELECT:fallback ("fra"i) + pr (0 ("<eret>"i)) ;

SELECT ("sørpå"i) (0 ("<máddin>"i) LINK -1 DOPPE) ;
SELECT ("sørfra"i) (0 ("<máddin>"i) LINK 0 (@←ADVL-ela) OR (@ADVL-ela→)) ;
SELECT:fallback ("sørpå"i) (0 ("<máddin>"i)) ;
SELECT ("nordpå"i) (0 ("<davvin>"i) LINK -1 DOPPE) ;
SELECT ("nordfra"i) (0 ("<davvin>"i) LINK 0 (@←ADVL-ela) OR (@ADVL-ela→)) ;
SELECT:fallback ("nordpå"i) (0 ("<davvin>"i)) ;
SELECT ("vestpå"i) (0 ("<oarjin>"i) LINK -1 DOPPE) ;
SELECT ("vestfra"i) (0 ("<oarjin>"i) LINK 0 (@←ADVL-ela) OR (@ADVL-ela→)) ;
SELECT:fallback ("vestpå"i) (0 ("<oarjin>"i)) ;
SELECT ("østpå"i) (0 ("<nuortan>"i) LINK -1 DOPPE) ;
SELECT ("østfra"i) (0 ("<nuortan>"i) LINK 0 (@←ADVL-ela) OR (@ADVL-ela→)) ;
SELECT:fallback ("østpå"i) (0 ("<nuortan>"i)) ;



SELECT ("dobbelt"i) (0 ("<beali>"i) LINK 1 ("<eanet>"i)) ;
SELECT:fallback ("halve"i) (0 ("<beali>"i)) ;

SELECT ("sammen"i) (0 ("<oktii>"i) LINK -1 ("<bidjat>"i) OR ("<časkit>"i) OR ("<laktit>"i) OR ("<beaškkehit>"i)) ;
SELECT:fallback ("en gang"i) (0 ("<oktii>"i)) ;


SELECT ("masse"i) (0 ("<dievva>"i) LINK 1 n + pl) ;
SELECT:fallback ("full"i) (0 ("<dievva>"i) + adv) ;

SELECT ("lite"i) (0 ("<unnán>"i) LINK 1 gen LINK 1 post) ;
SELECT ("få"i) (0 ("<unnán>"i) LINK *1 n + pl BARRIER NOT-A - cmp) ;
SELECT:fallback ("lite"i) (0 ("<unnán>"i) + adv) ;



SELECT:fallback ("fra gamle dager"i) (0 ("<don doložis>"i)) ;

SELECT ("fordi"i) (0 ("<dan dihte>"i) LINK 1 ("<go>"i)) ;
SELECT:fallback ("derfor"i) (0 ("<dan dihte>"i)) ;


SELECT ("like"i) (0 ("<liikka>"i) LINK 1 adj + nom) ;
SELECT:fallback ("likevel"i) (0 ("<liikka>"i)) ;

SELECT ("altfor"i) (0 ("<beare>"i) LINK 1 ("<unnán>"i) OR ("<ollu>"i) OR ("<máŋga>"i) OR ("<ollugat>"i) OR adj + nom OR adj + attr) ;
SELECT:fallback ("bare"i) (0 ("<beare>"i)) ;


SELECT ("på hvilken måte"i) (0 ("<guđe ládje>"i)) ;


SELECT ("mulig"i) (0 ("<vejolaččat>"i) LINK -1 ("<go>"i)) ;
SELECT:fallback ("muligens"i) (0 ("<vejolaččat>"i)) ;

SELECT ("offisielt"i) (0 ("<almmolaččat>"i) LINK -1 ("<rahpat>"i)) ;
SELECT:fallback ("offentlig"i) (0 ("<almmolaččat>"i)) ;


SELECT ("hva"i) (0 ("<manin>"i) LINK *1 ("<gohčodit>"i)) ;
SELECT:fallback ("hvorfor"i) (0 ("<manin>"i)) ;

SELECT ("mot"i) (0 ("<vuostálaga>"i) OR ("<vuostálagaid>"i) LINK *1 acc) ;
SELECT:fallback ("mot hverandre"i) (0 ("<vuostálaga>"i) OR ("<vuostálagaid>"i)) ;

SELECT:fallback ("fremst"i) (0 ("<ovddemusas>"i)) ;

SELECT:fallback ("så pass"i) (0 ("<mađe>"i) LINK 1 adj + nom) ;
SELECT:fallback ("likeså"i) (0 ("<mađe>"i)) ;

SELECT:fallback ("noensinne"i) (0 ("<goasse>"i)) ;

SELECT:fallback ("over"i) (0 ("<badjelii>"i) + adv) ;


SELECT ("halvferdig"i) (0 ("<gaskan>"i) LINK *-1 ("<guođđit>"i) OR ("<vuolgit>"i)) ;
SELECT:fallback ("sammen"i) (0 ("<gaskan>"i)) ;

SELECT:fallback ("da"i) (0 ("<fal>"i)) ;

SELECT:fallback ("like"i) (0 ("<seammá>"i) LINK 1 ("<ollu>"i) OR ("<olu>"i) OR adj + nom OR adv) ;
SELECT:fallback ("samme"i) (0 ("<seammá>"i)) ;

# Based on frequency in parallel text:
SELECT ("lenger"i) (0 ("<šat>"i)) ;
SELECT:fallback ("til"i) (0 ("<vuhtii>"i)) ;

SELECT ("avsides"i) (0 ("<boaittobealde>"i)) ;

LIST YEAR = ("[0-9][0-9]+"r);
SELECT:year ("høsten"i) (0 ("<čakčat>"i) LINK 0 adv)    (-1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvet>"i) LINK 0 adv)  (-1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvit>"i) LINK 0 adv)  (-1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geasset>"i) LINK 0 adv) (-1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geassit>"i) LINK 0 adv) (-1 YEAR) ;
SELECT:year ("våren"i) (0 ("<giđđat>"i) LINK 0 adv)     (-1 YEAR) ;
SELECT:year ("høsten"i) (0 ("<čakčat>"i) LINK 0 adv)    (1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvet>"i) LINK 0 adv)  (1 YEAR) ;
SELECT:year ("vinteren"i) (0 ("<dálvit>"i) LINK 0 adv)  (1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geasset>"i) LINK 0 adv) (1 YEAR) ;
SELECT:year ("sommeren"i) (0 ("<geassit>"i) LINK 0 adv) (1 YEAR) ;
SELECT:year ("våren"i) (0 ("<giđđat>"i) LINK 0 adv)     (1 YEAR) ;

SELECT ("om høsten"i) (0 ("<čakčat>"i) LINK 0 adv) ;
SELECT ("om vinteren"i) (0 ("<dálvet>"i) LINK 0 adv) ;
SELECT ("om vinteren"i) (0 ("<dálvit>"i) LINK 0 adv) ;
SELECT ("om sommeren"i) (0 ("<geasset>"i) LINK 0 adv) ;
SELECT ("om sommeren"i) (0 ("<geassit>"i) LINK 0 adv) ;
SELECT ("om våren"i) (0 ("<giđđat>"i) LINK 0 adv) ;


SELECT ("med"i) (0 ("<mii>"i) LINK 0 rel + sg + gen LINK 1 ("<bokte>"i)) ;
SELECT ("som"i) (0 ("<mii>"i) LINK 0 adv) ;

SELECT ("med"i) (0 ("<bokte>"i) LINK 0 post LINK -1 ("<mii>"i) LINK 0  rel + sg + gen) ;
SELECT ("ved"i) (0 ("<bokte>"i) LINK 0 adv LINK -1 FIRSTNAME OR prn) ;
SELECT:fallback ("via"i) (0 ("<bokte>"i)) ;

SELECT:fallback ("på"i) (0 ("<badjelis>"i) LINK -1 sem_clth) ;
SELECT:fallback ("ovenfor"i) (0 ("<badjelis>"i)) ;


SELECT ("ja"i) (0 ("<ja>"i)) (-1 cnjcoo) (1 ("<ja>"i)) ;
SELECT ("ja"i) (0 ("<ja>"i)) (1 cnjcoo)  (-1 ("<ja>"i)) ;
# Dajai, ahte ja ja.

SELECT:fallback ("og"i) (0 ("<ja>"i));


SELECT:bra ("bra"i) (0 ("<bures>"i) LINK *0 ("<mannat>"i) OR ("<heivet>"i) BARRIER SV-BOUNDARY) ;
SELECT:fallback ("godt"i) (0 ("<bures>"i)) ;




# Adjectives
# ==========


SELECT (n f pl ind) (-1 num)(0 ("<ruvdnosaš>"i)); #??

SELECT (det) (0 ("<sierra>"i));
# Mii čujuhit ahte sámiin go lea sierra álbmot ja eamiálbmot

SELECT ("fjern"i) (0 ("<gáiddus>"i) LINK 0 cmp);
REMOVE ("fjern"i) (0 ("<gáiddus>"i))(NOT 0 cmp);

SELECT ("lojal"i) (0 ("<oskkáldas>"i) LINK 1 ("<jienasteaddji>"i));
SELECT:fallback ("pålitelig"i) (0 ("<oskkáldas>"i)) ;


SELECT ("fleksibel"i) (0 ("<geabbil>"i) LINK *1 sem_edu);
SELECT:fallback ("smidig"i) (0 ("<geabbil>"i)) ;


SELECT ("gammel"i) (0 ("<dološ>"i) LINK 0 attr);
SELECT:fallback ("gammel tid"i) (0 ("<dološ>"i));

SELECT ("dyrebar"i) (0 ("<divrras>"i) LINK 0 nom LINK *1 sem_hum LINK 0 pl + ill);
SELECT:fallback ("dyr"i) (0 ("<divrras>"i));


SELECT ("menneskelig"i) (0 ("<olmmošlaš>"i) LINK 1 ("<biidnašuvvat>"i));
SELECT:fallback ("høflig"i) (0 ("<olmmošlaš>"i));


SELECT ("fast"i) (0 ("<bissovaš>"i) LINK 1 ("<.*virgi>"ri));
SELECT:fallback ("vedvarende"i) (0 ("<bissovaš>"i));


SELECT ("-årig"i) (0 ("<jagáš>"i) LINK -1 num);
SELECT ("årets"i) (0 ("<jagáš>"i));

SELECT ("sist"i) (0 ("<maŋit>"i) LINK 0 attr);
SELECT ("sist"i) (0 ("<maŋit>"i) LINK 1 num OR sem_time);
REMOVE ("sein"i) (0 ("<maŋit>"i));

SELECT ("sakte"i) (0 ("<njoahci>"i) LINK 0 cmp_attr);
SELECT ("sakte"i) (0 ("<njoahci>"i) LINK 1 ("<tv>"i));
REMOVE ("sein"i) (0 ("<njoahci>"i));


SELECT ("streif"i) (0 ("<golgu>"i) LINK 0 adj + cmp);
REMOVE ("streif"i) (NOT 0 adj + cmp);

SELECT:fallback ("særskilt"i) (0 ("<sierra>"i));

SELECT:fallback ("fersk"i) (0 ("<varas>"i));


# Sámediggi ja Sámi oahpahusráđđi gárttaiga čilget máŋgii vuođđojurdagiid man vuođul gáibideimmet ollislaš sámi oahppoplána
SELECT ("helhetlig"i) (0 ("<ollislaš>"i));

SELECT:fallback ("full"i) (0 ("<ollis>"i) LINK 1 ("<áigi>"i)) ; # (1 ("tid"i));
SELECT:fallback ("hel"i) (0 ("<ollis>"i)) ; # (1 ("tid"i));

SELECT:fallback ("sterk"i) (0 ("<nanus>"i));

SELECT:fallback ("virkelig"i) (0 ("<duohta>"i) LINK *-1 ("<dahkat>"i) OR ("<šaddat>"i) BARRIER SV-BOUNDARY);
SELECT:fallback ("virkelig"i) (0 ("<duohta>"i) LINK 1 ("<máilbmi>"i));
SELECT:fallback ("sant"i) (0 ("<duohta>"i));

SELECT ("næringsrik"i) (0 ("<beaktil>"i) LINK *0 sem_food);

SELECT:fallback ("effektiv"i) (0 ("<beaktil>"i));

SELECT ("forrige"i) (0 ("<ovddit>"i comp)) (1 n + sg);

SELECT ("trygg"i) (0 ("<luohttevaš>"i)) (0 adj) (NOT 0 n);
SELECT:fallback ("tillitsfull"i) (0 ("<luohttevaš>"i));

SELECT ("rolig"i) (0 ("<jaskat>"i) LINK 0 attr LINK 1 sem_time);
SELECT ("taus"i) (0 ("<jaskat>"i) LINK 0 attr);
SELECT:fallback ("taus"i) (0 ("<jaskat>"i));


SELECT ("mangfoldig"i) (0 ("<girjái>"i)) (*0 sem_domain OR sem_edu);
SELECT ("mangfoldig"i) (0 ("<girjái>"i) LINK 0 attr) (1 HUMAN);
SELECT:fallback ("spraglet"i) (0 ("<girjái>"i));


SELECT ("liten"i) (0 ("<unni>"i) LINK 0 comp + attr LINK 1 ("<doallu>"i) + pl LINK 1 VFIN + pl);
SELECT ("få"i) (0 ("<unni>"i) LINK 0 comp + attr LINK 1 n + pl);
SELECT:fallback ("liten"i) (0 ("<unni>"i));


SELECT ("kommende"i) (0 ("<boahtte>"i)) (1 ("<áigi>"i));
SELECT:fallback ("neste"i) (0 ("<boahtte>"i));

SELECT ("moro skyld"i) (0 ("<suohtas>"i)) (1 ("<dihte>"i));
SELECT:plural ("spøk"i) (0 ("<suohtas>"i) LINK 0 pl + acc);
SELECT:fallback ("morsom"i) (0 ("<suohtas>"i));


SELECT ("ledig"i) (0 ("<rabas>"i)) (0 attr LINK *1 ("<.*virgi>"ri) OR ("<.*sadji>"ri) OR sem_build-part BARRIER NOT-NPMODADV);
SELECT:fallback ("åpen"i) (0 ("<rabas>"i));


SELECT ("rik"i) (0 ("<ruđalaš>"i) LINK 1 sem_hum);
SELECT:fallback ("finansiell"i) (0 ("<ruđalaš>"i));


IFF ("-årig"i) (0 ("<jahkásaš>"i)) (1 ("<.*skuvla>"ri));

SELECT ("mange"i) (0 ("<eanet>"i) OR ("<eambbo>"i) LINK 0 (adj attr)) (*1 HUMAN + pl BARRIER NOT-PRE-A-N );	
SELECT ("mange"i) (0 ("<eanet>"i) OR ("<eambbo>"i) LINK 0 (adj attr)) (1 cnjcoo LINK 1 attr LINK *1 HUMAN + pl BARRIER NOT-PRE-A-N );	
SELECT:fallback ("mye"i) (0 ("<eanet>"i)  OR ("<eambbo>"i));
	
## leage buorre (vær så god)

# buorre:0 → bra, buorre:1→god , så god

LIST IJ-TIME = ("<beaivi>"i) ("<eahket>"i) ("<iđit>"i)  ("<idja>"i)   ("<vahkkoloahppa>"i) ("<beassážat>"i) ("<juovllat>"i) ;
#SELECT ("vær så god"i) (0 ("<buorre>"i)) (-1 ("<leat>"i) LINK 0 imp);
SELECT ("stor"i) (0 ("<buorre>"i) LINK 1 ("<muddu>"i)) ;
SELECT ("god"i) (0 ("<buorre>"i)) (1 IJ-TIME OR post OR sem_edu) ;
SELECT ("god"i) (0 ("<buorre>"i)) (1 pl) ;
SELECT ("god"i) (0 ("<buorre>"i)) (1 ("<ođas>"i) LINK 1 ("<jahki>"i)) ;
SELECT ("god"i) (0 ("<buorre>"i) LINK 0 @→N) ;
SELECT:fallback ("bra"i) (0 ("<buorre>"i));
## Dat lei buorre girji (god)
## Dat lei buorre. (bra)

#REMCOHORT TARGET ("<leat>"i) (0 imp) (1 ("<buorre>"i));

SELECT:fallback ("ekstern"i) (0 ("<olgguldas>"i));

SELECT ("sint"i) (0 ("<bahá>"i) LINK 0 attr LINK 1 sem_hum OR sem_ani);
SELECT:fallback ("dårlig"i) (0 ("<bahá>"i));

SELECT ("i tjue"i) (0 ("<goalmmát>"i) LINK 1 ("<lohki>"i));
SELECT ("i tretti"i) (0 ("<njealját>"i) LINK 1 ("<lohki>"i));
SELECT ("i førti"i) (0 ("<viđát>"i) LINK 1 ("<lohki>"i));
SELECT ("i femti"i) (0 ("<guđát>"i) LINK 1 ("<lohki>"i));
SELECT ("i femti"i) (0 ("<guđat>"i) LINK 1 ("<lohki>"i));
SELECT ("i seksti"i) (0 ("<čihččet>"i) LINK 1 ("<lohki>"i));
SELECT ("i sytti"i) (0 ("<gávccát>"i) LINK 1 ("<lohki>"i));
SELECT ("i åtti"i) (0 ("<ovccát>"i) LINK 1 ("<lohki>"i));
SELECT ("i nitti"i) (0 ("<logát>"i) LINK 1 ("<lohki>"i));
SELECT:fallback ("goalmmát"i) (0 ("<tredje>"i));
SELECT:fallback ("njealját"i) (0 ("<fjerde>"i));
SELECT:fallback ("viđát"i) (0 ("<femte>"i));
SELECT:fallback ("guđát"i) (0 ("<sjette>"i));
SELECT:fallback ("čihččet"i) (0 ("<sjuende>"i));
SELECT:fallback ("gávccát"i) (0 ("<åttende>"i));
SELECT:fallback ("ovccát"i) (0 ("<niende>"i));
SELECT:fallback ("logát"i) (0 ("<tiende>"i));


# vissis:0 → sikker, vissis:1 → viss
SELECT ("viss"i) (0 ("<vissis>"i)) (*1 n BARRIER NOT-A) ;
# muhtun vissis:1 áiggi maŋŋel, doallat viesu rabasin vissis:1 áiggiid
# (vs. mun lean vissis:0 ahte)


SELECT ("ydmyk"i) (0 ("<vuollegaš>"i)) ((*-1 COPULAS BARRIER NOT-ADV-PCLE LINK -1 sem_hum OR pers OR np ) OR (1 sem_hum));
SELECT:fallback ("lav"i) (0 ("<vuollegaš>"i));

SELECT:fallback ("dårlig"i) (0 ("<headju>"i));
SELECT:fallback ("saklig"i) (0 ("<áššálaš>"i));

SELECT:fallback ("dårlig"i) (0 ("<garas>"i) LINK 1 ("<dálki>"i));
SELECT:fallback ("kraftig"i) (0 ("<garas>"i)) (1 ("<biegga>"i)) ; # OR (*-1 ("<biegga>"i)));
SELECT:fallback ("kraftig"i) (0 ("<garas>"i)) (*-1 ("<biegga>"i));
SELECT:fallback ("hard"i) (0 ("<garas>"i));

SELECT ("måneder gammel"i) (0 ("<mánnosaš>"i)) (-1 num);
SELECT:fallback ("månedlig"i) (0 ("<mánnosaš>"i));


# Subjunctions
# ============

SELECT ("at"i) (0 ("<nu ahte>"i)) (-1 ("sørge# for"i));
SELECT:fallback ("slik at"i) (0 ("<nu ahte>"i));

SELECT ("når"i) (0 ("<dalle go>"i)) (-1 ("<earret>"i));
SELECT:fallback ("da"i) (0 ("<dalle go>"i));

SELECT ("å"i) (0 ("<ahte>"i) LINK 0 cnjsub) (1 inf);
SELECT ("om at"i) (0 ("<ahte>"i) LINK 0 cnjsub) (-1 ("<diehtu>"i) OR ("<muittuhit>"i) OR ("<váruhit>"i) OR ("<gáibádus>"i));


SELECT:fallback ("at"i) (0 ("<ahte>"i) LINK 0 cnjsub);




# Proper nouns
# ============
SELECT:fallback ("Sørreisa"i) (0 ("<Ráisavuotna>"i));

SELECT ("Troms"i) (0 ("<Romsa>"i) LINK *1 ("<fylka>"i) OR ("<fylkkasuohkan>"i) OR ("<Finnmárku>"i));
SELECT ("Troms"i) (0 ("<Romsa>"i) LINK *-1 ("<Finnmárku>"i));
SELECT:fallback ("Tromsø"i) (0 ("<Romsa>"i));

SELECT ("Komsa"i) (0 ("<Gurraváráš>"i) LINK -1 ("<unni>"i) OR ("<uhcci>"i));
SELECT:fallback ("Lille Komsa"i) (0 ("<Gurraváráš>"i));

SELECT:fallback ("Nordkapp"i) (0 ("<Davvinjárga>"i));

