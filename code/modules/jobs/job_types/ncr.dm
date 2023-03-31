/*
NCR Design notes:
Standard issue stuff to keep the theme visually and gameplay and avoid watering down.
Gloves		Officers - Leather glovesl, fingerless leather gloves for sergeants. Bayonet standard issue knife. Sidearms mostly for officers, 9mm is the standard. MP gets nonstandard pot helm, the exception to prove the rule.
			NCOs -		Fingerless gloves
			Rest -		No gloves
Knives		Army -		Bayonet
			Ranger -	Bowie knife
Money		Commanding Officer (LT and CAP) - "small" money bag
			Officers and Rangers - /obj/item/storage/bag/money/small/ncrofficers
			Rest - /obj/item/storage/bag/money/small/ncrenlisted
Sidearm		Officers & a few specialists - 9mm pistol
Weapons	NCRA	Service Rifle, Single Shotgun, Caravan Shotgun, 9mm SMG. 
Weapons NCRR	Cowboy Repeater, Hunting Rifle, Hunting Shotgun, Caracan Shotgun
*/

/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	department_flag = NCR
	selection_color = "#ffeeaa"
	faction = FACTION_NCR
	exp_type = EXP_TYPE_NCR

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_PUBLIC)
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_PUBLIC)
	forbids = "The NCR forbids: Chem and drug use such as jet or alcohol while on duty. Execution of unarmed or otherwise subdued targets without authorisation. Zero sexual intercourse is tolorated while on-duty."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republic's laws. Wearing the uniform."
	objectivesList = list("High Command recommends the following goal for this week: Establish an outpost at the Hospital","High Command recommends the following goal for this week: Scout the region for raider activity and detain any individuals breaking NCR law in our territory","High command recommends the following goal for this week: Establish good relations with unaligned individuals and improve the diplomatic standing of the NCR","High command recommends the following goal for this week: Gather funds from the wasteland by providing a service and taxing people")

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/ncr,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/ncr,
			),
		)

/datum/outfit/job/ncr
	name = "NCRdatums"
	jobtype = /datum/job/ncr
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = /obj/item/radio/headset/headset_ncr
	uniform	= /obj/item/clothing/under/f13/ncr
	belt = /obj/item/storage/belt/military/assault/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	l_pocket = /obj/item/book/manual/ncr/jobguide
	box = /obj/item/storage/survivalkit_aid

/datum/outfit/job/ncr/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrgate)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombatmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrsalvagedarmorconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrsalvagedhelmetconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/horsearmorncr)

///////////////////////
/// Colonel - Admin ///
///////////////////////

// COLONEL

/datum/job/ncr/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
	head_announce = list("Security")
	supervisors = "The Republic Senate, High Command"
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_CHANGE_IDS, ACCESS_NCR_COMMAND)
	req_admin_notify = 1

	total_positions = 0
	spawn_positions = 0

	outfit = /datum/outfit/job/ncr/f13colonel

/datum/outfit/job/ncr/f13colonel/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/ncr/f13colonel	// Dress Uniform, Desert Eagle
	name = "NCR Colonel"
	jobtype = /datum/job/ncr/f13colonel
	id = /obj/item/card/id/dogtag/ncrcolonel
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_dress
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr
	head = /obj/item/clothing/head/beret/ncr_codresscap
	glasses = /obj/item/clothing/glasses/sunglasses/big
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/ncr_dressjack
	r_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/automatic/pistol/deagle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m44 = 2,
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/megaphone = 1
		)
// PERSONAL AIDE		The Colonels flagbearer and personal aide, for events only to help the Colonel and add color.
/datum/job/ncr/f13aide
	title = "NCR Personal Aide"
	flag = F13COLONEL
	supervisors = "The Colonel"
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY)
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/ncr/f13aide

/datum/outfit/job/ncr/f13aide/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/ncr/f13aide	// NCR Flag, Desert Eagle
	name = "NCR Personal Aide"
	jobtype = /datum/job/ncr/f13aide
	id = /obj/item/card/id/dogtag/ncrsergeant
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_dress
	accessory = /obj/item/clothing/accessory/ncr/SGT
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	head = /obj/item/clothing/head/f13/ncr/ncr_campaign
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/ncr_dressjack
	suit_store = /obj/item/gun/ballistic/automatic/pistol/deagle
	r_hand = /obj/item/melee/onehanded/club/ncrflag
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m44 = 2,
		/obj/item/storage/bag/money/small/ncrenlisted = 1
		)


/////////////////////////////////
/// Combat Officers & Leaders ///
/////////////////////////////////

// CAPTAIN

/datum/job/ncr/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	display_order = JOB_DISPLAY_ORDER_CAPTAIN_NCR
	exp_type = EXP_TYPE_NCRCOMMAND
	head_announce = list("Security")
	req_admin_notify = 1
	total_positions = 1
	spawn_positions = 1
	description = "You are the commanding officer of your company and direct superior to the Veteran Ranger and Lieutenant. Coordinating with your staff, you must ensure that the objectives of High Command are completed to the letter. Working closely with your subordinates on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "the Colonel"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13captain

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)

	loadout_options = list(
		/datum/outfit/loadout/captainbackline,	// Commander's Coat
		/datum/outfit/loadout/captainfrontline, // Grease Gun
		/datum/outfit/loadout/captaincqc // Caravan Shotgun
		)

/datum/outfit/job/ncr/f13captain	// Binoculars, Survival Knife
	name = "NCR Captain"
	jobtype = /datum/job/ncr/f13captain
	id = /obj/item/card/id/dogtag/ncrcaptain
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	head = /obj/item/clothing/head/beret/ncr
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit =	/obj/item/clothing/suit/armor/f13/ncrarmor/captain
	ears = /obj/item/radio/headset/headset_ncr_com
	glasses = /obj/item/clothing/glasses/night/ncr
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr/CPT
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/megaphone = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/lockbox/medal = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/grenade/f13/he_grenade = 1
		)

/datum/outfit/loadout/captainbackline
	name = "Rifleman"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2
		)

/datum/outfit/loadout/captaincqc
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/loadout/captainfrontline
	name = "Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2
		)

/datum/outfit/job/ncr/f13captain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

// LIEUTENANT

/datum/job/ncr/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	display_order = JOB_DISPLAY_ORDER_LIEUTENANT
	exp_type = EXP_TYPE_NCRCOMMAND
	total_positions = 1
	spawn_positions = 1
	description = "You are the direct superior to the NCOs and Enlisted, and under special circumstances, Rangers. You are the XO of Camp Miller. You plan patrols, training and missions, working in some cases with Rangers in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel."
	supervisors = "the Captain"
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13lieutenant

	loadout_options = list(
		/datum/outfit/loadout/ltpathfinder,			 // Service Rifle
		/datum/outfit/loadout/ltcqc,				 // Caravan Shotgun
		/datum/outfit/loadout/ltdesignatedmarksman	 // Grease Gun
		)


	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_NCR3)

/datum/outfit/job/ncr/f13lieutenant		// Republic's Pride, Binoculars, Bayonet, 9mm pistol
	name = "NCR Lieutenant"
	jobtype	= /datum/job/ncr/f13lieutenant
	id = /obj/item/card/id/dogtag/ncrlieutenant
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes =	/obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr/LT1
	head = /obj/item/clothing/head/beret/ncr
	glasses = /obj/item/clothing/glasses/night/ncr
	gloves = /obj/item/clothing/gloves/f13/leather
	ears = /obj/item/radio/headset/headset_ncr_com
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/grenade/f13/he_grenade = 1
		)

/datum/outfit/loadout/ltpathfinder
	name = "Rifleman"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2
		)

/datum/outfit/loadout/ltcqc
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/loadout/ltdesignatedmarksman
	name = "Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2
		)


/datum/outfit/job/ncr/f13lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)


// SERGEANT

/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	display_order = JOB_DISPLAY_ORDER_SERGEANT
	total_positions = 3
	spawn_positions = 3
	description = "You are a squad leader, your duties relate to organizing a squad, enforcing and carrying out the orders of your superiors, keeping the enlisted in line, maintaining proper conduct of your troops, and disciplining them when necessary."
	supervisors = "Lieutenant and Above"

	outfit = /datum/outfit/job/ncr/f13sergeant

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

	loadout_options = list(
		/datum/outfit/loadout/sergeantrifleman, // Service Rifle
		/datum/outfit/loadout/sergeantcqc, // Caravan Shotgun
		/datum/outfit/loadout/sergeantsupport // Grease Gun
		)

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id = /obj/item/card/id/dogtag/ncrsergeant
	accessory = /obj/item/clothing/accessory/ncr/SGT
	head = /obj/item/clothing/head/f13/ncr
	suit =	/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/grenade/f13/he_grenade = 1,
		/obj/item/melee/onehanded/knife/survival = 1
		)

/datum/outfit/loadout/sergeantrifleman
	name = "Lead Rifleman"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2
		)

/datum/outfit/loadout/sergeantcqc
	name = "Lead Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/loadout/sergeantsupport
	name = "Lead Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2
		)

// REPRESENATIVE

/datum/job/ncr/f13representative
	title = "NCR Representative"
	flag = F13REP
	display_order = JOB_DISPLAY_ORDER_REPRESENTATIVE
	total_positions = 1
	spawn_positions = 1
	description = "You are an influential representative for the NCR and experienced bureaucrat. You are here to further the objective and ensure the interests of the NCR, your company or own enterprise are met through thick and thin, and have been supplied with ample amounts of money to do so."
	supervisors = "the Captain and the NCR"
	exp_requirements = 300

	outfit = /datum/outfit/job/ncr/f13representative

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)
	minimal_access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)

	loadout_options = list(
		/datum/outfit/loadout/repbrahminbaron,
		/datum/outfit/loadout/repncrcongressman,
		/datum/outfit/loadout/reposidoctor
		)

/datum/outfit/job/ncr/f13representative
	name = "NCR Representative"
	jobtype	= /datum/job/ncr/f13representative
	id = /obj/item/card/id/dogtag/ncrrep
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/f13/ncr/colonial
	head = /obj/item/clothing/head/f13/ncr/ncr_pith_helmet
	suit = /obj/item/clothing/suit/toggle/armor/f13/ncrarmor/colonial_jacket
	neck = null
	ears = /obj/item/radio/headset/headset_ncr
	belt = /obj/item/storage/belt/holster/cross_belt
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/police = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/clothing/mask/cigarette/pipe = 1,
		/obj/item/lighter = 1,
		/obj/item/reagent_containers/food/snacks/grown/tobacco/dried = 3,
		/obj/item/storage/box/ration/menu_nine = 1
		)

/datum/outfit/loadout/repbrahminbaron
	name = "Brahmin Baron"
	suit = /obj/item/clothing/under/suit/tan
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ncr = 3
		)

/datum/outfit/loadout/repncrcongressman
	name = "NCR Congressman"
	suit = /obj/item/clothing/under/suit/black_really
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/clothing/accessory/lawyers_badge = 1,
		/obj/item/storage/briefcase = 1
		)

/datum/outfit/loadout/reposidoctor
	name = "OSI Doctor"
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/toggle/labcoat
	accessory = /obj/item/clothing/accessory/pocketprotector/full
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/clothing/accessory/medal/plasma/nobel_science = 1
		)

///////////////
/// Rangers ///
///////////////

// VETERAN RANGER

/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	display_order = JOB_DISPLAY_ORDER_VETRANGER
	exp_type = EXP_TYPE_RANGER
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. Your primary mission is to improve general opinion of the Republic and to neutralize slavers and raiders operating in the area."
	supervisors = "the NCRA Captain and High Command"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13vetranger

	loadout_options = list( // ALL: Binoculars, Trench Knife, Sequoia
		/datum/outfit/loadout/vrlite, // Hunting Rifle
		/datum/outfit/loadout/vrshotgunner // Hunting Shotgun
		)

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)
	minimal_access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)

/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype	= /datum/job/ncr/f13vetranger
	id = /obj/item/card/id/dogtag/ncrvetranger
	uniform = /obj/item/clothing/under/f13/ranger/vet
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves = /obj/item/clothing/gloves/rifleman
	shoes = /obj/item/clothing/shoes/f13/military/leather
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/headset_ranger
	mask = /obj/item/clothing/mask/gas/ranger
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/trench = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/ammo_box/c4570 = 2,
		/obj/item/gun/ballistic/revolver/sequoia
		)

/datum/outfit/loadout/vrlite
	name = "Rifler"
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	backpack_contents = list(
		/obj/item/ammo_box/a308 = 2
		)

/datum/outfit/loadout/vrshotgunner
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/job/ncr/f13vetranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)

// NCR Ranger

/datum/job/ncr/f13ranger
	title = "NCR Ranger"
	flag = F13RANGER
	display_order = JOB_DISPLAY_ORDER_RANGER
	total_positions = 3
	spawn_positions = 3
	description = "As an NCR Ranger, you are the premier special forces unit of the NCR. You are the forward observations and support the Army in it's campaigns, as well as continuing the tradition of stopping slavery in it's tracks."
	supervisors = "the Veteran Ranger"
	exp_requirements = 150

	outfit = /datum/outfit/job/ncr/f13ranger

	loadout_options = list( // ALL: Binoculars, Trench Knife
	/datum/outfit/loadout/rangertrail, // Cowboy Repeater
	/datum/outfit/loadout/rangerpatrol // Caravan Shotgun
	)

/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype	= /datum/job/ncr/f13ranger
	id = /obj/item/card/id/dogtag/ncrranger
	uniform	= /obj/item/clothing/under/f13/ranger/trail
	head = /obj/item/clothing/head/f13/trailranger
	gloves = /obj/item/clothing/gloves/patrol
	shoes = /obj/item/clothing/shoes/f13/military/leather
	glasses	= /obj/item/clothing/glasses/sunglasses
	belt = null
	ears = /obj/item/radio/headset/headset_ranger
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/knife/trench = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/clothing/mask/gas/ranger = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 2
		)

/datum/outfit/loadout/rangertrail
	name = "Rifler"
	suit = /obj/item/clothing/suit/armor/f13/trailranger
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	neck = /obj/item/clothing/neck/mantle/ranger
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2
		)

/datum/outfit/loadout/rangerpatrol
	name = "Shotgunner"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	head = /obj/item/clothing/head/f13/ranger
	uniform	= /obj/item/clothing/under/f13/ranger/patrol
	belt = /obj/item/storage/belt/military/assault/ncr
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/job/ncr/f13ranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)


////////////////////
/// Specialists ////
////////////////////

// HEAVY TROOPER

/datum/job/ncr/f13heavytrooper
	title = "NCR Heavy Trooper"
	flag = F13HEAVYTROOPER
	display_order = JOB_DISPLAY_ORDER_HEAVYTROOPER
	total_positions = 1
	spawn_positions = 1
	description = "You are the most elite of the enlisted, sergeant in rank but forgoing regular command roles to lead in battle only. You are expected to be on the frontlines of every engagement, and to provide firing support for the rank and file. Your power armor lacks the protection the full working sets have, but you have trained with it and can use it in battle well. General Oliver praises you and your other Heavy Troopers, prove to him you're no exception to the rule."
	supervisors = "Lieutenant and Above"

	outfit = /datum/outfit/job/ncr/f13heavytrooper

	loadout_options = list(
		/datum/outfit/loadout/htflamethrower,	// Flamer
		/datum/outfit/loadout/supportht, // R84
		/datum/outfit/loadout/breachht //Hunting Shotgun
		)

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

/datum/outfit/job/ncr/f13heavytrooper	// Mk. 23, Bayonet, Heavy armor
	name = "NCR Heavy Trooper"
	jobtype	= /datum/job/ncr/f13heavytrooper
	id = /obj/item/card/id/dogtag/ncrsergeant
	uniform = /obj/item/clothing/under/f13/ncr
	accessory =	/obj/item/clothing/accessory/ncr/SGT
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45b/ncr
	suit = /obj/item/clothing/suit/armored/heavy/salvaged_pa/t45b/ncr
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/grenade/f13/he_grenade = 1,
		/obj/item/melee/onehanded/knife/survival = 1
		)

/datum/outfit/loadout/htflamethrower
	name = "Flamethrower Unit"
	suit_store = /obj/item/m2flamethrowertank

/datum/outfit/loadout/supportht
	name = "Support Unit"
	suit_store = /obj/item/gun/ballistic/automatic/r84
	backpack_contents = list(
		/obj/item/ammo_box/magazine/lmg = 2
		)

/datum/outfit/loadout/breachht
	name = "Breach Unit"
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/job/ncr/f13heavytrooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

// COMBAT ENGINEER

/datum/job/ncr/f13combatengineer
	title = "NCR Combat Engineer"
	flag = F13COMBATENGINEER
	display_order = JOB_DISPLAY_ORDER_COMBATENGINEER
	total_positions = 2
	spawn_positions = 2
	description = "You are a senior enlisted trooper with an engineering skill set. You work closely with your squad, taking orders from the officers. You have the authority to command troopers if there are no non-commissioned officers present."
	supervisors = "Corporals and Above"

	outfit = /datum/outfit/job/ncr/f13combatengineer


	loadout_options = list( // ALL: Trench tool, Limited blueprints
		/datum/outfit/loadout/cepathfinder, // Service Rifle
		/datum/outfit/loadout/combatengineerdestroyer, // Caravan Shotgun
		/datum/outfit/loadout/cesmg // Grease Gun
		)

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

/datum/outfit/job/ncr/f13combatengineer
	name = "NCR Combat Engineer"
	jobtype = /datum/job/ncr/f13combatengineer
	id = /obj/item/card/id/dogtag/ncrtrooper
	uniform = /obj/item/clothing/under/f13/ncr
	head = /obj/item/clothing/head/hardhat/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced/engineer
	glasses = /obj/item/clothing/glasses/welding
	belt = /obj/item/storage/belt/military/assault/ncr/engineer
	gloves = /obj/item/clothing/gloves/color/yellow
	accessory =	/obj/item/clothing/accessory/ncr/SPC
	belt = /obj/item/storage/belt/utility
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/shovel/trench = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/f13/he_grenade = 1
		)

/datum/outfit/loadout/cepathfinder
	name = "Rifler"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2
		)

/datum/outfit/loadout/combatengineerdestroyer
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/book/granter/crafting_recipe/blueprint/trapper = 1,
		/obj/item/book/granter/trait/explosives = 1,
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/loadout/cesmg
	name = "Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2
		)

/datum/outfit/job/ncr/f13combatengineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/servicerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tools/forged/entrenching_tool)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ninemil)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/m1911)
	ADD_TRAIT(H, TRAIT_GUNSMITH_FOUR, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

// MILITARY POLICE

/datum/job/ncr/f13mp
	title = "NCR Military Police"
	flag = F13MP
	display_order = JOB_DISPLAY_ORDER_MILITARYPOLICE
	total_positions = 2
	spawn_positions = 2
	description = "As an MP you should avoid engaging directly in combat with the enemy whenever possible, but you are allowed to act as a rear unit to prevent retreat. You are tasked with the supervision of the NCRA to maintain internal order, uphold the chain of command, ensure military code (for instance the uniform regulations) is being followed, and upholding NCR and military law."
	supervisors = "NCRA Officers"
	exp_requirements = 300

	outfit = /datum/outfit/job/ncr/f13mp

	loadout_options = list(
		/datum/outfit/loadout/mppathfinder,			 // Service Rifle
		/datum/outfit/loadout/mpcqc,				 // Caravan Shotgun
		/datum/outfit/loadout/mpdesignatedmarksman	 // Grease Gun
		)

/datum/outfit/job/ncr/f13mp		// .45 Pistol, Beanbag Shotgun, Military baton
	name = "NCR Military Police"
	jobtype	= /datum/job/ncr/f13mp
	id = /obj/item/card/id/dogtag/ncrsergeant
	accessory = /obj/item/clothing/accessory/ncr/SSGT
	glasses	= /obj/item/clothing/glasses/sunglasses/big
	head = /obj/item/clothing/head/f13/ncr/steelpot_mp
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	backpack = /obj/item/storage/backpack/satchel/trekker
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/melee/classic_baton/militarypolice = 1,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/grenade/f13/he_grenade = 1 
		)

/datum/outfit/loadout/mppathfinder
	name = "Rifler"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2
		)

/datum/outfit/loadout/mpcqc
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/datum/outfit/loadout/mpdesignatedmarksman
	name = "Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2
		)

/datum/outfit/job/ncr/f13mp/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

// COMBAT MEDIC

/datum/job/ncr/f13combatmedic
	title = "NCR Combat Medic"
	flag = F13COMBATMEDIC
	display_order = JOB_DISPLAY_ORDER_COMBATMEDIC
	total_positions = 2
	spawn_positions = 2
	description = "You are a senior enlisted with a medical skill set. You work closely with your squad, taking orders from your officers. You have the authority to command troopers if there are no non-commissioned officers present."
	supervisors = "Corporals and Above"

	outfit = /datum/outfit/job/ncr/f13combatmedic

	loadout_options = list(
		/datum/outfit/loadout/cmpathfinder,			 // Service Rifle
		/datum/outfit/loadout/cmcqc,					 // Caravan Shotgun
		/datum/outfit/loadout/cmdesignatedmarksman	 // Grease Gun
		)

/datum/outfit/job/ncr/f13combatmedic
	name = "NCR Combat Medic"
	jobtype = /datum/job/ncr/f13combatmedic
	id = /obj/item/card/id/dogtag/ncrtrooper
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	head = /obj/item/clothing/head/f13/ncr/steelpot_med
	mask = /obj/item/clothing/mask/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	accessory = /obj/item/clothing/accessory/ncr/SPC
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/healthanalyzer/advanced = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/grenade/f13/he_grenade = 1
		)

/datum/outfit/loadout/cmpathfinder
	name = "Rifler"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		)

/datum/outfit/loadout/cmcqc
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		)

/datum/outfit/loadout/cmdesignatedmarksman
	name = "Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2,
		)

/datum/outfit/job/ncr/f13combatmedic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)

/////////////////////////
//// Regular Soldiers ///
/////////////////////////

// CORPORAL

/datum/job/ncr/f13corporal
	title = "NCR Corporal"
	flag = F13CORPORAL
	display_order = JOB_DISPLAY_ORDER_CORPORAL
	total_positions = 3
	spawn_positions = 3
	description = "You are a junior NCO. You are expected to lead from the frontlines with your sergeant. Keep the troopers in order and keep your squad coherent."
	supervisors = "Sergeant and above"

	outfit = /datum/outfit/job/ncr/f13corporal

	loadout_options = list(
		/datum/outfit/loadout/corporalpathfinder,			 // Service Rifle
		/datum/outfit/loadout/corporalcqc,					 // Hunting Shotgun
		/datum/outfit/loadout/corporaldesignatedmarksman	 // Hunting Rifle + Scope
		)

/datum/outfit/job/ncr/f13corporal
	name = "NCR Corporal"
	jobtype	= /datum/job/ncr/f13corporal
	id = /obj/item/card/id/dogtag/ncrtrooper
	accessory = /obj/item/clothing/accessory/ncr/CPL
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = /obj/item/clothing/head/f13/ncr/steelpot_goggles
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/f13/he_grenade = 1
		)

/datum/outfit/loadout/corporalpathfinder
	name = "Rifler"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		)

/datum/outfit/loadout/corporalcqc
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/stack/sheet/mineral/sandbags = 6
		)

/datum/outfit/loadout/corporaldesignatedmarksman
	name = "Rapid Gunner"
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2,
		)

// TROOPER

/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	display_order = JOB_DISPLAY_ORDER_TROOPER
	total_positions = 6
	spawn_positions = 6
	description = "You are a professional soldier of the NCR Army. Obey your the NCOs and officers, no matter what you are expected to follow military discipline."
	supervisors = "Corporals and Above"
	outfit = /datum/outfit/job/ncr/f13trooper

	loadout_options = list(
		/datum/outfit/loadout/trooperrifleman, // Service Rifle, Bayonet
		/datum/outfit/loadout/trooperfiresupport // Auto-5, Trench tool, Sandbags
		)

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype	= /datum/job/ncr/f13trooper
	id = /obj/item/card/id/dogtag/ncrtrooper
	accessory = /obj/item/clothing/accessory/ncr/TPR
	head = /obj/item/clothing/head/f13/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor
	glasses	= null
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/f13/he_grenade = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/stack/sheet/mineral/sandbags = 10
		)

/datum/outfit/loadout/trooperrifleman
	name = "Rifler"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		)

/datum/outfit/loadout/trooperfiresupport
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/revolver/single_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2
		)

/////////////////
/// SUPPORT	  ///
/////////////////

// MEDICAL OFFICER

/datum/job/ncr/f13medicalofficer
	title = "NCR Medical Officer"
	flag = F13MEDICALOFFICER
	display_order = JOB_DISPLAY_ORDER_MEDICALOFFICER
	total_positions = 1
	spawn_positions = 1
	description = "You are the lead medical professional in Camp Miller, you do not have any command authority unless it is of medical nature. Your duties are to ensure your troopers are in good health and that medical supplies are stocked for troopers."
	supervisors = "Lieutenant and Above"
	exp_requirements = 300

	outfit = /datum/outfit/job/ncr/f13medicalofficer

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

/datum/outfit/job/ncr/f13medicalofficer // 9mm Pistol, Telescopic baton
	name = "NCR Medical Officer"
	jobtype	= /datum/job/ncr/f13medicalofficer
	id = /obj/item/card/id/dogtag/ncrlieutenant
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes =	/obj/item/clothing/shoes/f13/military/ncr
	accessory =	/obj/item/clothing/accessory/ncr/LT2
	head = /obj/item/clothing/head/beret/ncr/ncr_medic
	glasses = /obj/item/clothing/glasses/hud/health/f13
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	ears = /obj/item/radio/headset/headset_ncr_com
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/labcoat
	belt = /obj/item/storage/belt/military/assault/ncr
	r_hand = /obj/item/storage/backpack/duffelbag/med/surgery
	mask = /obj/item/clothing/mask/surgical
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/storage/firstaid/regular = 1,
		/obj/item/grenade/f13/he_grenade = 1
		)

/datum/outfit/job/ncr/f13medicalofficer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)

// OFF-DUTY

/datum/job/ncr/f13offdutyncr
	title = "NCR Off-Duty"
	flag = F13OFFDUTYNCR
	display_order = JOB_DISPLAY_ORDER_OFFDUTYNCR
	total_positions = 4
	spawn_positions = 4
	description = "While off-duty, you are relieved of both your duties and your authority. You are not required to participate in any routine duties, and you may spend your time doing whatever you please, within reason. However, you may not get in the way of on-duty personnel. Do not pull rank or give orders. Should Camp Miller be attacked, you are expected NOT to participate in the fighting, and must instead head West for safety (i.e. despawn yourself at the matrix point)."
	supervisors = "Everyone else"

	outfit = /datum/outfit/job/ncr/f13offdutyncr

/datum/outfit/job/ncr/f13offdutyncr
	name = "NCR Off-Duty"
	jobtype	= /datum/job/ncr/f13offdutyncr
	id = /obj/item/card/id/dogtag/ncrtrooper
	head = /obj/item/clothing/head/f13/ncr/ncr_cap
	suit = null
	belt = null
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/food/snacks/cheesyburrito = 2,
		/obj/item/reagent_containers/food/drinks/bottle/f13nukacola = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1
		)

// NCR Citizen
// Really only used for ID console
/datum/job/ncr/f13ncrcitizen
	title = "NCR Citizen"
	access = list(ACCESS_NCROFFDUTY)
	minimal_access = list(ACCESS_NCROFFDUTY)
	outfit = /datum/outfit/job/ncr/f13ncrcitizen

/datum/outfit/job/ncr/f13ncrcitizen
	name = "NCR Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/ncrcaravan
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	id = /obj/item/card/id/dogtag/town/ncr
	l_hand = /obj/item/gun/ballistic/automatic/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2
		)
