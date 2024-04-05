/*
Legion Design notes:
"Standard issue", AVOID identical kits and guns. Legion got spotty logistics and the hodgepodge aesthetic suits them, don't ruin it.
Sunglasses	For vets mainly, most lower ranks should have sandstorm goggles.
Money		Cent & Treasurer - "small" money bag (the biggest)
			Decanus - Officer money bag
			Rest - Enlisted money bag
Sidearm		None.
Melee		Officers only - Spatha
			Vets/Officers - Gladius
			Rest - Lawnmower machete the most common
Weapons		Lever shotgun, Grease gun, Repeater carbines, Revolvers, simple guns all good, very restrictive on long barrel automatics, generally limited ammo, always good melee option.
			Avoid Police shotguns, 5,56 semis, Desert Eagle, Survival knives etc, be creative and work within the limitations to avoid powercreep and things getting bland and same.
*/

/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	faction = FACTION_LEGION

	forbids = "The Legion forbids: Using drugs such as stimpacks and alcohol. Ghouls joining. Women fighting (self defense and suicide allowed). Slaves carrying weapons. Using robots and advanced machines. Killing Legion members in secret, only if according to law and in public is it acceptable."
	enforces = "The Legion demands: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a NON-COMBAT infiltrator. Expect death as punishment for failing to obey."
	objectivesList = list("Focus on the tribals, win them over or intimidate them.", "Focus on Oasis, display dominance.", "Send out patrols and establish checkpoints to curb use of digusting drugs and degenerate behaviour.", "Flagstaff requests more worker: acquire slaves, train them if possible, send them east for breaking if not.", "Make sure no other faction gains dominance over Oasis, if they remain neutral it can be used to the Legions advantage.")
	exp_type = EXP_TYPE_LEGION

	access = list(ACCESS_LEGION)
	minimal_access = list(ACCESS_LEGION)

/datum/outfit/job/CaesarsLegion
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legiongate)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/berserker_powder)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/hydra)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rip/crossexecution)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvaged)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvaged_ncr)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvagedhelmet_ncr)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvagedhelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/horsearmorlegion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steeltower)



/datum/outfit/job/CaesarsLegion/Legionary
	belt = /obj/item/storage/belt/military/legion
	ears = /obj/item/radio/headset/headset_legion
	backpack = /obj/item/storage/backpack/marching_satchel
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/legskirt
	shoes = /obj/item/clothing/shoes/f13/military/legion
	gloves = /obj/item/clothing/gloves/legion
	box = /obj/item/storage/survivalkit/legion_rations

/datum/outfit/job/CaesarsLegion/Legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/datum/outfit/job/CaesarsLegion/Legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_FEARLESS, src) //no phobias for the Legion!
	ADD_TRAIT(H, TRAIT_BERSERKER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/obj/item/storage/box/legate
	name = "legate belongings"
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/legate/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)


///////////////////
/// Admin Roles ///
///////////////////

// LEGATE

/datum/job/CaesarsLegion/Legionary/f13legate
	title = "Legion Legate"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13legate
	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

/datum/outfit/job/CaesarsLegion/Legionary/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionary/f13legate	// 14mm Pistol, Goliath
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13legate
	shoes =	/obj/item/clothing/shoes/f13/military/legate
	suit = /obj/item/clothing/suit/armor/f13/legion/legate
	head = /obj/item/clothing/head/helmet/f13/legion/legate
	gloves = /obj/item/clothing/gloves/legion/legate
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	r_pocket = /obj/item/storage/bag/money/small/legion
	l_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/melee/unarmed/powerfist/goliath
	ears = /obj/item/radio/headset/headset_legion/cent
	backpack_contents = list(
		/obj/item/binoculars = 1,
		/obj/item/book/granter/martial/cqc = 1,
		/obj/item/storage/box/legate = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 4
		)

//......................//////////////////////////////////................................................
						//								//
						// 		LEGION OFFICERS			//
						//								//
						//////////////////////////////////

// ----------------- CENTURION ---------------------

/datum/job/CaesarsLegion/Legionary/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	display_order = JOB_DISPLAY_ORDER_CENTURION
	exp_type = EXP_TYPE_LEGIONCOMMAND
	selection_color = "#ffdddd"
	head_announce = list("Security")
	req_admin_notify = 1
	total_positions = 1
	spawn_positions = 1
	description = "You are the camp commander and strongest soldier. Use your officers, the Decanii, to delegate tasks, make sure you lead and give orders. Take no disrespect, you are the dominus. If you prove a fool or weak, expect to be dispatched by a stronger subordinate."
	supervisors = "the Legate"
	exp_requirements = 600

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13centurion

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

	loadout_options = list(
		/datum/outfit/loadout/palacent,		// M1919, Goliath, Crusader Pistol
		/datum/outfit/loadout/rangerhunter,	// Hunting revolver, AMR, Spatha
		/datum/outfit/loadout/centurion,	// Goliath, CQC, 14mm pistol
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionary/f13centurion
	name = "Legion Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13centurion
	id = /obj/item/card/id/dogtag/legion/centurion
	mask = /obj/item/clothing/mask/bandana/legion/centurion
	ears = /obj/item/radio/headset/headset_legion/cent
	neck = /obj/item/storage/belt/holster/rugged
	gloves = /obj/item/clothing/gloves/legion/plated
	glasses = /obj/item/clothing/glasses/night/polarizing
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/binoculars = 1
		)

/datum/outfit/loadout/palacent
	name = "Paladin-Slayer Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/palacent
	head = /obj/item/clothing/head/helmet/f13/legion/palacent
	suit_store = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/ammo_box/m44 = 3,
		/obj/item/melee/unarmed/powerfist/goliath = 1,
		/obj/item/book/granter/martial/cqc = 1,
		/obj/item/restraints/legcuffs/bola/tactical = 1
		)
		
/datum/outfit/loadout/rangerhunter
	name = "Ranger-Hunter Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/rangercent
	head = /obj/item/clothing/head/helmet/f13/legion/rangercent
	suit_store = /obj/item/gun/ballistic/rifle/mag/antimateriel
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/hunting = 1,
		/obj/item/ammo_box/magazine/amr = 2,
		/obj/item/ammo_box/c4570 = 3,
		/obj/item/melee/onehanded/machete/spatha = 1
		)

/datum/outfit/loadout/centurion
	name = "Warlord Centurion"
	suit = /obj/item/clothing/suit/armored/heavy/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/centurion
	suit_store = /obj/item/gun/ballistic/automatic/m1919
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m762 = 3,
		/obj/item/gun/ballistic/revolver/m29/alt = 1,
		/obj/item/ammo_box/m44 = 2
		)


// ----------------- VETERAN DECANUS ---------------------

/datum/job/CaesarsLegion/Legionary/f13decanvet
	title = "Legion Veteran Decanus"
	flag = F13DECANVET
	display_order = JOB_DISPLAY_ORDER_DECANVET
	exp_type = EXP_TYPE_LEGIONCOMMAND
	total_positions = 1
	spawn_positions = 1
	description = "You are the leader of the Seaside cavalery outpost. Lead the outpost, ensure its defended, organise operation, show your mens the way towards victory."
	supervisors = "The word of Caesar, Centurions and Legate"
	exp_requirements = 600

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13decanvet

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

	loadout_options = list(
		/datum/outfit/loadout/decvetbull,	// Supersledge, Reinf. Bola, Smokebomb
		/datum/outfit/loadout/decvetwolf,	// Ripper, Extra Bitter
		/datum/outfit/loadout/decvetsnake, // Brush gun, Scope, Spatha, Extra Bitters
		/datum/outfit/loadout/decvetbrave // Carl Gustav, Ballistic Fist,
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionary/f13decanvet
	name = "Legion Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13decanvet
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/heavy
	mask = /obj/item/clothing/mask/bandana/legion
	gloves = /obj/item/clothing/gloves/legion/plated
	ears = /obj/item/radio/headset/headset_legion/cent
	neck = /obj/item/storage/belt/holster/rugged
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern

	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/binoculars = 1
		)

/datum/outfit/loadout/decvetbull
	name = "Mark of The Bull"
	head = /obj/item/clothing/head/helmet/f13/legion/heavy
	suit_store = /obj/item/twohanded/sledgehammer/supersledge
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		/obj/item/grenade/smokebomb = 1
		)

/datum/outfit/loadout/decvetwolf
	name = "Mark of the Wolf"
	head = /obj/item/clothing/head/helmet/f13/legion/heavy
	suit_store = /obj/item/melee/powered/ripper
	neck = /obj/item/storage/belt/sabre/heavy
	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2
		)

/datum/outfit/loadout/decvetsnake
	name = "Mark of the Snake"
	head = /obj/item/clothing/head/helmet/f13/legion/heavy
	suit_store = /obj/item/gun/ballistic/rifle/repeater/brush
	backpack_contents = list(
		/obj/item/ammo_box/tube/c4570 = 3,
		/obj/item/attachments/scope = 1,
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2
		)

/datum/outfit/loadout/decvetbrave
	name = "Mark of the Brave"
	head = /obj/item/clothing/head/helmet/f13/legion/heavy
	suit_store = /obj/item/gun/ballistic/automatic/smg/cg45
	backpack_contents = list(
		/obj/item/ammo_box/magazine/cg45 = 2,
		/obj/item/gun/ballistic/revolver/ballisticfist = 1,
		/obj/item/ammo_box/shotgun/buck = 2
		)

// ----------------- PRIME DECANUS ---------------------

/datum/job/CaesarsLegion/Legionary/f13decan
	title = "Legion Prime Decanus"
	flag = F13DECAN
	display_order = JOB_DISPLAY_ORDER_DECAN
	total_positions = 1
	spawn_positions = 1
	description = "A experienced officer, often commanding the camp. Give orders, lead patrols."
	supervisors = "the Veteran Decanus and the Centurion"

	loadout_options = list(	
		/datum/outfit/loadout/decprimfront,	// legion lance, lever shotty, spatha + bolas
		/datum/outfit/loadout/decprimheavy	// Grenade launcher, 44 Revolver, Explo Book
		)

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13decan

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionary/f13decan
	name = "Prime Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13decan
	id = /obj/item/card/id/dogtag/legveteran
	mask = /obj/item/clothing/mask/bandana/legion
	neck = /obj/item/storage/belt/holster/rugged
	glasses = /obj/item/clothing/glasses/f13/goggles_sandstorm
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/binoculars = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1
		)

/datum/outfit/loadout/decprimfront
	name = "Frontline Prime Decanus"
	suit = /obj/item/clothing/suit/armor/f13/legion/prime/decan
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
	suit_store = /obj/item/twohanded/spear/lance
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever = 1,
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 3,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/melee/onehanded/machete/spatha = 1
		)

/datum/outfit/loadout/decprimheavy
	name = "Battleborn Heavy Prime Decanus"
	suit = /obj/item/clothing/suit/armor/f13/legion/prime/heavydecan
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
	suit_store = /obj/item/gun/ballistic/revolver/grenadelauncher
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/ammo_box/a40mm = 3,
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 3,
		/obj/item/book/granter/trait/explosives_advanced = 1
		)

// ----------------- RECRUIT DECANUS ---------------------

/datum/job/CaesarsLegion/Legionary/f13decanrec
	title = "Legion Recruit Decanus"
	flag = F13DECANREC
	display_order = JOB_DISPLAY_ORDER_DECANREC
	total_positions = 1
	spawn_positions = 1
	description = "The junior officer, you must train the recruits and test them, and if a suicide charge is needed, lead them to a glorious death."
	supervisors = "the Prime/Veteran Decanus and the Centurion"

	loadout_options = list(
		/datum/outfit/loadout/recdeclegion,	// Uzi, Bumper sword, Smokebomb
		/datum/outfit/loadout/recdectribal	// SKS, Throwing spears, Reinforced machete, Bottlecap mine x2
		)

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13decanrec

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionary/f13decanrec
	name = "Legion Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13decanrec
	id = /obj/item/card/id/dogtag/legion
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit/decan
	head = /obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask = /obj/item/clothing/mask/bandana/legion
	neck = /obj/item/storage/belt/holster/rugged
	glasses = /obj/item/clothing/glasses/f13/goggles_sandstorm
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/warpaint_bowl = 1
		)

/datum/outfit/loadout/recdeclegion
	name = "Frontier Decanus"
	suit_store = /obj/item/twohanded/fireaxe/bmprsword
	neck = /obj/item/storage/belt/sabre/heavy
	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/gun/ballistic/automatic/smg/mini_uzi = 1,
		/obj/item/ammo_box/magazine/uzim9mm = 3
		)

/datum/outfit/loadout/recdectribal
	name = "Blackliner Decanus"
	suit_store = /obj/item/gun/ballistic/automatic/m1garand/sks
	backpack_contents = list(
		/obj/item/ammo_box/magazine/sks = 3,
		/obj/item/melee/onehanded/machete/forgedmachete = 1,
		/obj/item/bottlecap_mine = 2
		)

//......................//////////////////////////////////................................................
						//								//
						// 			SPECIALISTS			//
						//								//
						//////////////////////////////////

// ----------------- VEXILLARIUS ---------------------

/datum/job/CaesarsLegion/Legionary/f13vexillarius
	title = "Legion Vexillarius"
	flag = F13VEXILLARIUS
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	total_positions = 1
	spawn_positions = 1
	description = "Carry the battle of the Legion into battle, and kick some serious ass with your bare hands in the name of Caesar."
	supervisors = "the Veteran Decanus and Centurion"
	exp_requirements = 720

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13vexillarius

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION2, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION2, ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/vexbear,
		/datum/outfit/loadout/vexfox,
		/datum/outfit/loadout/vexnight
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

/datum/outfit/job/CaesarsLegion/Legionary/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13vexillarius
	id = /obj/item/card/id/dogtag/legion/veteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/vexil
	mask = /obj/item/clothing/mask/bandana/legion
	neck = /obj/item/storage/belt/holster/rugged
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/legion/plated
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/megaphone/cornu = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/warpaint_bowl = 1
		)

/datum/outfit/loadout/vexbear
	name = "Mountain Bear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	neck = /obj/item/storage/belt/sabre/heavy
	backpack_contents = list(
		/obj/item/melee/unarmed/powerfist = 1,
		/obj/item/melee/powered/ripper = 1,
		/obj/item/book/granter/martial/berserker = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder/berserker = 3
		)

/datum/outfit/loadout/vexfox
	name = "Desert Fox"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/vexil
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/tommygun = 1,
		/obj/item/ammo_box/magazine/tommygunm45 = 1,
		/obj/item/gun/ballistic/revolver/contender = 1,
		/obj/item/ammo_box/a45lcrev = 3
		)

/datum/outfit/loadout/vexnight
	name = "Night Stalker"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/nightvexil
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 2,
		/obj/item/melee/onehanded/machete/gladius = 1
		)

// ----------------- EXPLORER ---------------------

/datum/job/CaesarsLegion/Legionary/f13explorer
	title = "Legion Explorer"
	flag = F13EXPLORER
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	total_positions = 3
	spawn_positions = 3

	description = "You are a scout; in charge of gathering intel, keeping your superiors well informed, and occasionally ambushing the enemy if the opportunity presents itself. Take initiative and help paint a picture of the situation for your commander."
	supervisors = "the Decanii"
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13explorer
	
	loadout_options = list(
		/datum/outfit/loadout/sniper,	// scoped rifle
		/datum/outfit/loadout/skirmisher, 		// SMG and tools
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)


/datum/outfit/job/CaesarsLegion/Legionary/f13explorer
	name = "Legion Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13explorer
	id = /obj/item/card/id/dogtag/legion/prime
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/explorer
	head = /obj/item/clothing/head/helmet/f13/legion/vet/explorer
	mask = /obj/item/clothing/mask/bandana/legion
	neck = /obj/item/storage/belt/holster/rugged
	glasses = /obj/item/clothing/glasses/sunglasses/big
	neck = /obj/item/storage/belt/holster
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/storage/survivalkit/medical/legion = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1
		)

/datum/outfit/loadout/sniper
	name = "Sniper"
	suit_store = /obj/item/gun/ballistic/automatic/m1garand/sks
	backpack_contents = list(
		/obj/item/ammo_box/magazine/sks = 3,
		/obj/item/attachments/scope = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/grenade/smokebomb = 2
		)

/datum/outfit/loadout/skirmisher
	name = "Skirmisher"
	suit_store = /obj/item/gun/ballistic/automatic/smg/cg45
	backpack_contents = list(
		/obj/item/ammo_box/magazine/cg45 = 2,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/grenade/homemade/firebomb = 2
		)

// ----------------- FRUMENTARIUS ---------------------

/datum/job/CaesarsLegion/Legionary/f13frumentarius
	title = "Legion Frumentarius"
	flag = F13FRUMENTARIUS
	display_order = JOB_DISPLAY_ORDER_FRUMENTARIUS
	description = "The Eyes and Ears of Caesar. Frumentarii cover a wide range of specializations, from Ambassadors to local Tribes, Infiltrators of enemy societies, Couriers, Intelligence Gatherers and the Secret Police of Legion Camps. Unlike the lesser Legionaries, a Frumentarius is given much unsupervised freedom to do as one pleases, so long as the Legion's goals are accomplished. You are one of these Frumentarius. Spread Caesar's Will, for Mars is watching. Do remember however, you are still required to esc and you're still required to paint your armor if you intend to fight in the legion main group."
	supervisors = "the Vet Decanus"
	selection_color = "#ffdddd"
	total_positions = 2
	spawn_positions = 2
	exp_requirements = 600

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13frumentarius

	access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)
	minimal_access = list(ACCESS_PUBLIC, ACCESS_LEGION, ACCESS_LEGION3, ACCESS_LEGION_COMMAND, ACCESS_LEGION2, ACCESS_CHANGE_IDS, ACCESS_LEGION1, ACCESS_LEGION4)

	loadout_options = list(
		/datum/outfit/loadout/ncr,	
		/datum/outfit/loadout/Brotherhood,	
		/datum/outfit/loadout/Townie,		
		/datum/outfit/loadout/Church		
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13frumentarius	// .357 Revolver, Spatha
	name = "Legion Frumentarius"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13frumentarius
	neck = /obj/item/storage/belt/holster
	shoes = /obj/item/clothing/shoes/f13/military/plated
	suit = /obj/item/clothing/suit/armor/f13/legion/frumentarius
	id = /obj/item/card/id/dogtag/legfrumentarius
	gloves = null
	backpack = /obj/item/storage/backpack/legionr
	shoes = /obj/item/clothing/shoes/roman
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	r_pocket = /obj/item/storage/bag/money/small/legofficers
	l_pocket = /obj/item/flashlight/lantern
	l_hand = /obj/item/melee/onehanded/machete/spatha
	backpack_contents = list(
		/obj/item/binoculars = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		/obj/item/clothing/mask/infiltrator = 1
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13frumentarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_SILENT_STEP, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrsalvagedarmorconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrsalvagedhelmetconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/horsearmorncr)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombathelmet)

/datum/outfit/loadout/ncr
	name = "NCR Spy"
	suit_store = /obj/item/gun/ballistic/automatic/service
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = /obj/item/clothing/head/f13/ncr
	backpack_contents = list(
		/obj/item/clothing/under/f13/ncr = 1,
		/obj/item/storage/box/ration/menu_three = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 3
		)

/datum/outfit/loadout/Brotherhood
	name = "Brotherhood Infiltrator"
	suit_store = /obj/item/gun/energy/laser/aer9
	suit = /obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = /obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/clothing/under/syndicate/brotherhood = 1,
		/obj/item/clothing/accessory/bos/initiateK = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3
		)

/datum/outfit/loadout/Townie
	name = "Townie Bum"
	uniform = /obj/item/clothing/under/f13/merchant
	suit = /obj/item/clothing/suit/overalls/farmer
	head = /obj/item/clothing/head/f13/ranger_hat/tan
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/stack/f13Cash/caps/onezerozero = 1
		)

/datum/outfit/loadout/Church
	name = "Church Beggar"
	suit = /obj/item/clothing/suit/hooded/robes/cotc
	backpack_contents = list(
		/obj/item/clothing/shoes/f13/rag = 1,
		/obj/item/clothing/under/f13/settler = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		)

//......................//////////////////////////////////................................................
						//								//
						// 		LEGION WARRIORS			//
						//								//
						//////////////////////////////////

// ----------------- VETERAN --------------------- //

/datum/job/CaesarsLegion/Legionary/vetlegionary
	title = "Veteran Legionary"
	flag = F13VETLEGIONARY
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	total_positions = 3
	spawn_positions = 3
	description = "A hardened warrior, obeying the orders from the Decanus and Centurion is second nature, as is fighting the profligates. If no officers are present, make sure the younger warriors act like proper Legionaires."
	supervisors = "the Decani and Centurion"

	loadout_options = list(	//ALL: Gladius
		/datum/outfit/loadout/vetaxe,	// AXE AND FISTS AND NOTHING FUCKING ELSE
		/datum/outfit/loadout/vetsmg, 		// type 93 AR, .357 Revolver, poultice
		/datum/outfit/loadout/vetberserker,	// Lever shotgun, Bola, Legion Lance
		/datum/outfit/loadout/vetrifle		// Trail gun, .357 Revolver, Throwing knives
		)

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/vetlegionary

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionary/vetlegionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

/datum/outfit/job/CaesarsLegion/Legionary/vetlegionary
	name = "Veteran Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionary/vetlegionary
	id = /obj/item/card/id/dogtag/legion/veteran
	mask = /obj/item/clothing/mask/bandana/legion
	head = /obj/item/clothing/head/helmet/f13/legion/vet
	neck = /obj/item/storage/belt/holster/rugged
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		/obj/item/stack/crafting/armor_plate = 5
		)

/datum/outfit/loadout/vetaxe
	name = "War-Hound"
	suit_store = /obj/item/twohanded/legionaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2
		)

/datum/outfit/loadout/vetsmg
	name = "Front-line"
	suit_store = /obj/item/gun/ballistic/automatic/type93/worn
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2
		)

/datum/outfit/loadout/vetberserker
	name = "Berserker"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/restraints/legcuffs/bola = 1
		)

/datum/outfit/loadout/vetrifle
	name = "Sharpshooter"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44/ = 3,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		/obj/item/restraints/legcuffs/beartrap = 1
		)


// ----------------- PRIME --------------------- //

/datum/job/CaesarsLegion/Legionary/f13legionary
	title = "Prime Legionary"
	flag = F13LEGIONARY
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	total_positions = 4
	spawn_positions = 4
	description = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who will build the future with their own blood and sacrifice, for Caesar."
	supervisors = "the Decani and Centurion"

	loadout_options = list(	//ALL: Forged Machete
		/datum/outfit/loadout/primelancer,	// .44 Revolver, Legion Shield, Bola
		/datum/outfit/loadout/primerifle,	// Cowboy repeater, Firebomb
		/datum/outfit/loadout/primebrave,	// Hunting shotgun, Throwing spears
		/datum/outfit/loadout/primepila,		// Legion Lance, Extra Medicine
		/datum/outfit/loadout/primecrossbow		// Legion crossbow, bow autodraw, Extra Medicine
		)

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13legionary

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionary/f13legionary
	name = "Prime Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13legionary
	id = /obj/item/card/id/dogtag/legion/prime
	mask = /obj/item/clothing/mask/bandana/legion
	head = /obj/item/clothing/head/helmet/f13/legion/prime
	neck = /obj/item/storage/belt/holster/rugged
	suit = /obj/item/clothing/suit/armor/f13/legion/prime
	glasses = /obj/item/clothing/glasses/f13/goggles_sandstorm
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/gun/ballistic/revolver/revolver45 = 1
		)

/datum/outfit/loadout/primelancer
	name = "Straight Outta Drymouth"
	r_hand = /obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 3,
		/obj/item/gun/ballistic/revolver/m29/snub = 1,
		/obj/item/ammo_box/m44  = 2
		)	

/datum/outfit/loadout/primerifle
	name = "Sharpshooter"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2,
		/obj/item/grenade/homemade/firebomb = 2
		)

/datum/outfit/loadout/primebrave
	name = "Heart of the Bull"
	suit_store = /obj/item/twohanded/sledgehammer/simple
	backpack_contents = list(
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 3,
		/obj/item/restraints/legcuffs/bola = 1
		)

/datum/outfit/loadout/primepila
	name = "Spearman"
	suit_store = /obj/item/twohanded/spear/lance
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 3,
		/obj/item/restraints/legcuffs/bola = 1
		)

/datum/outfit/loadout/primecrossbow
	name = "Crossbowman"
	suit_store = /obj/item/gun/ballistic/bow/xbow
	backpack_contents = list(
		/obj/item/storage/belt/tribe_quiver = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/book/granter/trait/bowman = 1
		)

// ----------------- RECRUIT --------------------- //

/datum/job/CaesarsLegion/Legionary/f13recleg
	title = "Recruit Legionary"
	flag = F13RECRUITLEG
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	total_positions = 6
	spawn_positions = 6
	description = "You have recently come of age or been inducted into Caesar's Legion. You have absolutely no training, and are expected to follow every whim of the Decanii and your Centurion. Respect the soldiers of higher rank."
	supervisors = "the Decani and Centurion"

	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13recleg

	loadout_options = list(
		/datum/outfit/loadout/recruittribal,	// Sledgehammer, bola, throwing spear quiver, trekking
		/datum/outfit/loadout/recruitbowman, // Sturdy bow, bow autodraw, trekking, Extra Medicine
		/datum/outfit/loadout/recruitlegion	 // 2x 1911, Gladius, 3x Powder, 2 bolas
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionary/f13recleg/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionary/f13recleg
	name = "Recruit Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionary/f13recleg
	id = /obj/item/card/id/dogtag/legion
	shoes = /obj/item/clothing/shoes/f13/military/leather
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit
	head = /obj/item/clothing/head/helmet/f13/legion/recruit
	mask = /obj/item/clothing/mask/bandana/legion/recruit
	neck = /obj/item/storage/belt/holster/rugged
	glasses = /obj/item/clothing/glasses/f13/goggles_sandstorm
	r_pocket = /obj/item/storage/survivalkit/medical/legion
	l_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		)

/datum/outfit/loadout/recruittribal
	name = "Tribal Recruit"
	suit_store = /obj/item/twohanded/fireaxe/bmprsword
	backpack_contents = list(
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/warpaint_bowl = 1
		)

/datum/outfit/loadout/recruitbowman
	name = "Recruit Bowman"
	suit_store = /obj/item/gun/ballistic/bow/sturdy
	backpack_contents = list(
		/obj/item/storage/belt/tribe_quiver = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/book/granter/trait/bowman = 1
		)
		
/datum/outfit/loadout/recruitlegion
	name = "Rehabilitated Tribal"
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 2,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 3,
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/ammo_box/magazine/autopipe  = 4,
		/obj/item/book/granter/martial/berserker = 1
		)	


//......................//////////////////////////////////................................................
						//								//
						// 			SUPPORT ROLES		//
						//								//
						//////////////////////////////////

// ----------------- CAMP FOLLOWER --------------------- //

/datum/job/CaesarsLegion/f13campfollower
	title = "Camp Follower"
	flag = F13CAMPFOLLOWER
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	total_positions = 2
	spawn_positions = 2
	description = "You answer to any member of the Legion. Working as a Camp Follower for the Centuria, you bear the great honor of supporting Caesar's Army in its conquest of the Mojave in whatever capacity required from those whom you serve. You perform any tasks required of you, for you know how to serve the Legion well."
	supervisors = "the entire Legion"

	outfit = /datum/outfit/job/CaesarsLegion/f13campfollower

	loadout_options = list(
	/datum/outfit/loadout/assist, //Keep track of the money, handle trading beneath the warriors
	/datum/outfit/loadout/medicus, //Do surgery, medical tasks
	/datum/outfit/loadout/opifex //Build defenses, craft necessary items
	)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/f13campfollower
	name = "Camp Follower"
	id = /obj/item/card/id/dogtag/legfollower
	head = /obj/item/clothing/head/f13/servant/campfollower
	uniform = /obj/item/clothing/under/f13/campfollowerfemale
	shoes = /obj/item/clothing/shoes/roman
	ears = /obj/item/radio/headset/headset_legion
	gloves = null
	belt = null
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/warpaint_bowl = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/mop = 1
		)

/datum/outfit/loadout/assist
	name = "Arcarius (Treasurer)"
	neck = /obj/item/clothing/neck/mantle/treasurer
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(
		/obj/item/folder/red = 1,
		/obj/item/paper/natural = 2,
		/obj/item/pen/fountain = 1,
		/obj/item/storage/bag/money/small/legion = 4,
		/obj/item/taperecorder = 1
		)

/datum/outfit/loadout/medicus
	name = "Medicus (Surgeon)"
	neck = /obj/item/clothing/neck/apron/medicus
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	belt = /obj/item/storage/belt/medical/primitive
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/stack/sticky_tape/surgical = 1,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/book/granter/trait/midsurgery = 1
		)

/datum/outfit/loadout/opifex
	name = "Opifex (Artisan)"
	neck = /obj/item/clothing/neck/apron/labor/forge
	gloves = /obj/item/clothing/gloves/legion/forgemaster
	belt = /obj/item/storage/belt/utility/waster/forgemaster
	glasses = /obj/item/clothing/glasses/welding
	shoes = /obj/item/clothing/shoes/f13/military/plated
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/mineral/wood/twenty = 1,
		/obj/item/stack/sheet/leather/twenty = 1,
		/obj/item/stack/sheet/cloth/thirty = 1,
		/obj/item/stack/sheet/prewar/twenty = 1,
		/obj/item/weldingtool = 1,
		/obj/item/book/granter/trait/explosives = 1
		)

/datum/outfit/job/CaesarsLegion/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tools/forged/armor_legion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tailor/legionuniform)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warpaint)

// LEGION SLAVES - Servant cook, and assist with medical, low surgery. Worker farm and mine.

/datum/job/CaesarsLegion/f13slave
	title = "Legion Slave"
	flag = F13LEGIONSLAVE
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE
	total_positions = 4
	spawn_positions = 4
	description = "A slave that survives the breaking camps is given a Legion appropriate name (latin-tribal inspired) and bull tattoo. Be obedient, respectful, stay inside the camp. Work the farm, mine, make food, clean and help injured men. Do NOT escape on your own, up to you how to handle it if forcibly freed by outside forces."
	supervisors = "Officers, then warriors"

	outfit = /datum/outfit/job/CaesarsLegion/f13slave

	loadout_options = list(
		/datum/outfit/loadout/slaveservant, //Servants cook, clean, help with medical tasks.
		/datum/outfit/loadout/slaveworker //Workers farm and mine.
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion/f13slave,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion/f13slave,
		),
	)

/datum/outfit/job/CaesarsLegion/f13slave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/job/CaesarsLegion/f13slave
	name = "Legion Slave"
	jobtype = /datum/outfit/job/CaesarsLegion/f13slave
	id = /obj/item/card/id/legionbrand
	uniform = /obj/item/clothing/under/f13/legslave
	neck = /obj/item/electropack/shockcollar
	shoes =	null
	l_pocket = /obj/item/radio

/datum/outfit/loadout/slaveservant
	name = "Servant"
	head = /obj/item/clothing/head/f13/servant
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	shoes =	/obj/item/clothing/shoes/roman
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/smelling_salts = 1,
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/reagent_containers/food/condiment/flour = 2,
		/obj/item/storage/box/bowls = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/lighter = 1
		)

/datum/outfit/loadout/slaveworker
	name = "Worker"
	suit = /obj/item/clothing/suit/armor/f13/slavelabor
	shoes =	/obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1
		)

/datum/outfit/loadout/slaveservant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/*
Post Scriptum
Plans: Add recipes/traits to keep refining support roles, others will need some minor tweaking. Planned is making the medicus more of a improvised surgery master, using primitive tools to good effect, because its interesting and unique.
*/

// Legion Citizen
// Really only used for ID console
/datum/job/ncr/f13legioncitizen
	title = "Legion Citizen"
	outfit = /datum/outfit/job/CaesarsLegion/Legionary/f13legioncitizen

/datum/outfit/job/CaesarsLegion/Legionary/f13legioncitizen
	name = "Legion Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	id = /obj/item/card/id/dogtag/town/legion
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		)
