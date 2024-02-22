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
Weapons		Service Rifle, Grease Gun, 9mm pistol, all good.
			Don't use Greaseguns, Lever shotguns, Police shotguns, Berettas, Hunting knives
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
	objectivesList = list("The Board of command recommends the following goal for this week: Establish an outpost at the Hospital","The Board of command recommends the following goal for this week: Scout the region for raider activity and detain any individuals breaking NCR law in our territory","The Board of command recommends the following goal for this week: Establish good relations with unaligned individuals and improve the diplomatic standing of the NCR","The Board of command recommends the following goal for this week: Gather funds from the wasteland by providing a service and taxing people")

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
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses/big
	gloves = /obj/item/clothing/gloves/f13/leather
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/ncr_dressjack
	r_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/automatic/pistol/deagle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m44 = 3,
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
	accessory = /obj/item/clothing/accessory/ncr/SSGT
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	head = /obj/item/clothing/head/f13/ncr/ncr_campaign
	neck = /obj/item/storage/belt/holster
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
	description = "You are the commanding officer of the 3th MM Platoon, the base director, and direct superior to the Veteran Ranger and Lieutenant. Coordinating with your staff, you must ensure that the objectives of High Command and the Board of command  are completed to the letter. Working closely with your subordinates on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "The Command Board, Some shady Colonel with highcommand, and work with The Rep."
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13captain

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)

	loadout_options = list(
		/datum/outfit/loadout/captainbackline,	// Commander's Coat
		/datum/outfit/loadout/captainfrontline // Captain's Armor
		)

/datum/outfit/job/ncr/f13captain	// Binoculars, Trench knife
	name = "NCR Captain"
	jobtype = /datum/job/ncr/f13captain
	id = /obj/item/card/id/dogtag/ncrcaptain
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	head = /obj/item/clothing/head/beret/ncr
	glasses = /obj/item/clothing/glasses/sunglasses/big
	ears = /obj/item/radio/headset/headset_ncr_com
	glasses = /obj/item/clothing/glasses/night/ncr
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr/CPT
	neck = /obj/item/storage/belt/holster/legholster
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/gun/ballistic/automatic/pistol/deagle/elcapitan = 1,
		/obj/item/ammo_box/magazine/m14mm = 3
		/obj/item/megaphone = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/storage/lockbox/medal = 1,
		/obj/item/clothing/suit/armor/f13/ncrarmor/captain = 1,
		/obj/item/melee/onehanded/knife/trench = 1
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

/datum/outfit/loadout/captainbackline
	name = "The Officer"
	suit_store = /obj/item/gun/ballistic/automatic/r84
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/ncrarmor/captain/ncr_officer_coat = 1,
		/obj/item/ammo_box/magazine/lmg = 1,
		/obj/item/storage/box/ration/menu_two = 1
		)

/datum/outfit/loadout/captainfrontline
	name = "The Law"
	suit_store = /obj/item/twohanded/sledgehammer/rockethammer/courtmartial
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/ncrarmor/captain/ncr_officer_coat = 1,
		/obj/item/storage/box/ration/menu_eight = 1
		)

// LIEUTENANT

/datum/job/ncr/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	display_order = JOB_DISPLAY_ORDER_LIEUTENANT
	exp_type = EXP_TYPE_NCRCOMMAND
	total_positions = 1
	spawn_positions = 1
	description = "You are the direct superior to the NCOs and Enlisted, and under special circumstances, Rangers. Why are you here ? Because you wanted to be a captain. How did you get in there ? By telling Oliver and his cabal to fuck themselfs. And you are second in charge of the 3th MM Platoon. You Assist the captain, and basically give orders and go where its too dangerous for them to go."
	supervisors = "The Captain, The Command Board."
	exp_requirements = 600

	outfit = /datum/outfit/job/ncr/f13lieutenant

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_NCR3)

	loadout_options = list(
		/datum/outfit/loadout/LTbackline,	// Commander's Coat
		/datum/outfit/loadout/LTfrontline // Captain's Armor
		)

/datum/outfit/job/ncr/f13lieutenant		// Republic's Pride, Binoculars, Bayonet, 9mm pistol
	name = "NCR Lieutenant"
	jobtype	= /datum/job/ncr/f13lieutenant
	id = /obj/item/card/id/dogtag/ncrlieutenant
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes =	/obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr/LT1
	head = /obj/item/clothing/head/beret/ncr
	neck = /obj/item/storage/belt/holster/legholster
	glasses = /obj/item/clothing/glasses/sunglasses/f13
	gloves = /obj/item/clothing/gloves/f13/leather
	ears = /obj/item/radio/headset/headset_ncr_com
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 3,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/storage/box/ration/menu_five = 1,
		)

/datum/outfit/loadout/LTfrontline
	name = "The Frontline"
	suit_store = /obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308 = 3,
		/obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant = 1,
		/obj/item/storage/box/ration/menu_two = 1
		)

/datum/outfit/loadout/LTbackline
	name = "The Law"
	suit_store = /obj/item/twohanded/baseball/golfclub/ncr
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant = 1,
		/obj/item/storage/box/ration/menu_eight = 1
		)

/datum/outfit/job/ncr/f13lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)


//NCR STAFF SERGEANT
/datum/job/ncr/f13staffsergeant
	title = "NCR Staff Sergeant"
	flag = F13STAFFSERGEANT
	display_order = JOB_DISPLAY_ORDER_STAFFSERGEANT
	exp_type = EXP_TYPE_NCRCOMMAND
	total_positions = 1
	spawn_positions = 1
	description = "You are the third in command of the NCR 3th MM Platoon. You follow the order of the Lieutenant, and order the soldiers and other fuckups in the forces. You make sure that squads are formed, and that there is somekind of organisation. You can also have a say on the use of trucks."
	supervisors = "The Command Board, the Lieutnant, The Captain."
	exp_requirements = 400

	outfit = /datum/outfit/job/ncr/f13staffsergeant

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_NCR3)

/datum/outfit/job/ncr/f13staffsergeant	
	name = "NCR Staff Sergeant"
	jobtype	= /datum/job/ncr/f13staffsergeant
	id = /obj/item/card/id/dogtag/ncrlieutenant
	uniform	= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes =	/obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr/SSGT
	head = /obj/item/clothing/head/f13/ncr/steelpot_goggles/trenchraider
	neck = /obj/item/storage/belt/holster/legholster
	glasses = /obj/item/clothing/glasses/sunglasses/f13
	gloves = /obj/item/clothing/gloves/f13/leather
	ears = /obj/item/radio/headset/headset_ncr_com
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant
	suit_store = /obj/item/gun/ballistic/automatic/m1garand
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 3,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/storage/box/ration/menu_eleven = 1,
		/obj/item/ammo_box/magazine/garand308 = 4,
		/obj/item/attachments/scope = 1,
		/obj/item/storage/box/ration/menu_five = 1
		)

/datum/outfit/job/ncr/f13lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

// SERGEANT PILOT

/datum/job/ncr/f13ncrpilot
	title = "NCR Pilot"
	flag = F13PILOT
	display_order = JOB_DISPLAY_ORDER_PILOT_NCR
	total_positions = 1
	spawn_positions = 1
	description = "Coming straight up from the long 15, with a repainted Vertibird ! Normaly in a other branch of the NCR army, you got some special orders and a HUDGE paycheck from the Command Board. You are here to serve as a support for the NCR 3th MM Platoon! Your Vertibird is a bit more solid that the BoS and Enclave ones, but are nearly unarmed. They mostly serve as medevac and air transport rather than combat. You got the rank of Sergeant."
	supervisors = "Command Board, Lieutenants, Captain."

	outfit = /datum/outfit/job/ncr/f13ncrpilot

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

/datum/outfit/job/ncr/f13ncrpilot
	name = "NCR Pilot"
	jobtype = /datum/job/ncr/f13ncrpilot
	id = /obj/item/card/id/dogtag/ncrsergeant
	accessory = /obj/item/clothing/accessory/ncr/SGT
	uniform	= /obj/item/clothing/under/f13/ncr/colonial
	suit = /obj/item/clothing/suit/bomber
	glasses = /obj/item/clothing/glasses/sunglasses/f13
	suit_store = /obj/item/gun/ballistic/automatic/smg/greasegun
	head = /obj/item/clothing/head/beret/ncr_codresscap
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	neck = /obj/item/storage/belt/holster/legholster
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 4,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/melee/onehanded/knife/bowie =1,
		/obj/item/storage/bag/money/small/ncrofficers = 1
		)

// SERGEANT

/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	display_order = JOB_DISPLAY_ORDER_SERGEANT
	total_positions = 2
	spawn_positions = 2
	description = "You are a Sergeant of the NCR 3th MM Platoon. They got some of the most capable sergeants … Normally. They order the troops around, and are divided in categories. The Head Mechanics deal with the trucks, and are the ones that are driving, the Heavy Troopers make use of a heavy SPA and big guns to get rid of the skirties and other dangers around,the Field sergeants are those who lead charges and infantry, the Recon leads… Well, recon missions."
	supervisors = "Lieutenant and Above"

	outfit = /datum/outfit/job/ncr/f13sergeant

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

	loadout_options = list(
		/datum/outfit/loadout/sergeantrifleman, 
		/datum/outfit/loadout/sergeantHTminingun,
		/datum/outfit/loadout/sergeantscout,
		/datum/outfit/loadout/sergeantHTLMG
		)

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id = /obj/item/card/id/dogtag/ncrsergeant
	accessory = /obj/item/clothing/accessory/ncr/SGT
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	neck = /obj/item/storage/belt/holster/legholster
	backpack_contents = list(
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1
		)

/datum/outfit/loadout/sergeantrifleman
	name = "Lead Rifleman"
	suit_store = /obj/item/gun/ballistic/automatic/assault_rifle
	head = /obj/item/clothing/head/f13/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/storage/box/ration/menu_one = 1,
		/obj/item/melee/onehanded/knife/bowie = 1
		)

/datum/outfit/loadout/sergeantHTminingun
	name = "NCR Heavy Trooper Minigun"
	head = /obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45b/ncr
	neck = /obj/item/storage/belt/holster/legholster
	suit = /obj/item/clothing/suit/armored/heavy/salvaged_pa/t45b/ncr
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/storage/box/ration/menu_six = 1,
		/obj/item/minigunpackbal5mm = 1
		)

/datum/outfit/loadout/sergeantHTLMG
	name = "NCR Heavy Trooper LMG"
	head = /obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45b/ncr
	neck = /obj/item/storage/belt/holster/legholster
	suit = /obj/item/clothing/suit/armored/heavy/salvaged_pa/t45b/ncr
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/storage/box/ration/menu_six = 1,
		/obj/item/gun/ballistic/automatic/r84 = 1,
		/obj/item/ammo_box/magazine/lmg = 1
		)
	
/datum/outfit/loadout/sergeantscout
	name = "Lead Scout"
	suit_store = /obj/item/gun/ballistic/automatic/marksman
	head = /obj/item/clothing/head/f13/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/storage/box/ration/menu_one = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/binoculars = 1
		)

// REPRESENATIVE

/datum/job/ncr/f13representative
	title = "NCR Representative"
	flag = F13REP
	display_order = JOB_DISPLAY_ORDER_REPRESENTATIVE
	total_positions = 1
	spawn_positions = 1
	description = "You are an influential representative for the NCR and experienced bureaucrat. You are here to further the objective and ensure the interests of the NCR, and - blablabla. You are mostly here to keep a eye on your own interess, and thoe of your friends at the Board of Command."
	supervisors = "Only god."
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
	description = "You answer directly to the LT, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. Your primary mission is to improve general opinion of the Republic and to neutralize slavers and raiders operating in the area."
	supervisors = "the NCRA Lieutenant, above and High Command"
	exp_requirements = 1200

	outfit = /datum/outfit/job/ncr/f13vetranger

	loadout_options = list( // ALL: Binoculars, Bowie knife, Sequoia
		/datum/outfit/loadout/vrclassic, // DKS
		/datum/outfit/loadout/vrlite, // Brush
		/datum/outfit/loadout/vrshotgunner // Lever Action Shotgun
		)

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)
	minimal_access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC, ACCESS_CHANGE_IDS, ACCESS_NCR3, ACCESS_NCR4)

/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype	= /datum/job/ncr/f13vetranger
	id = /obj/item/card/id/dogtag/ncrvetranger
	uniform = /obj/item/clothing/under/f13/ranger/vet
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	suit_store = /obj/item/gun/ballistic/revolver/sequoia
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves = /obj/item/clothing/gloves/rifleman
	shoes = /obj/item/clothing/shoes/f13/military/leather
	glasses = /obj/item/clothing/glasses/sunglasses
	neck = /obj/item/storage/belt/holster
	ears = /obj/item/radio/headset/headset_ranger
	mask = /obj/item/clothing/mask/gas/ranger
	r_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/ammo_box/c4570 = 3
		)

/datum/outfit/loadout/vrclassic
	name = "Sniper Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper/sniperranger
	backpack_contents = list(
		/obj/item/storage/box/ration/ranger_dinner = 1,
		/obj/item/ammo_box/magazine/w308 = 2
		)

/datum/outfit/loadout/vrlite
	name = "Rifler Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/brush
	backpack_contents = list(
		/obj/item/storage/box/ration/ranger_lunch = 1,
		/obj/item/ammo_box/tube/c4570 = 3
		)

/datum/outfit/loadout/vrshotgunner
	name = "Veteran Ranger Shotgunner"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/storage/box/ration/ranger_breakfast = 1,
		/obj/item/ammo_box/shotgun/buck = 3
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

	loadout_options = list( // ALL: Binoculars, Bowie knife
	/datum/outfit/loadout/rangerrecon, // Scout Carbine, .45 Revolver
	/datum/outfit/loadout/rangertrail, // Cowboy Repeater, .357 Revolver
	/datum/outfit/loadout/rangerpatrol // Browning Auto-5, .44 snub revolver
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
	neck = /obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/storage/bag/money/small/ncrofficers = 1,
		/obj/item/clothing/mask/gas/ranger = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3
		)

/datum/outfit/loadout/rangerrecon
	name = "Recon Ranger"
	suit = /obj/item/clothing/suit/toggle/armor/f13/rangerrecon
	belt = /obj/item/storage/belt/military/reconbandolier
	head = /obj/item/clothing/head/beret/ncr_recon_ranger
	neck = /obj/item/clothing/neck/mantle/ranger
	suit_store = /obj/item/gun/ballistic/automatic/service/carbine
	backpack_contents = list(
		/obj/item/storage/box/ration/ranger_dinner = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 2
		)

/datum/outfit/loadout/rangertrail
	name = "Trail Ranger"
	suit = /obj/item/clothing/suit/armor/f13/trailranger
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	neck = /obj/item/clothing/neck/mantle/ranger
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/storage/box/ration/ranger_lunch = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/tube/m44 = 4
		)

/datum/outfit/loadout/rangerpatrol
	name = "Patrol Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	head = /obj/item/clothing/head/f13/ranger
	uniform	= /obj/item/clothing/under/f13/ranger/patrol
	belt = /obj/item/storage/belt/military/assault/ncr
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	backpack_contents = list(
		/obj/item/storage/box/ration/ranger_breakfast = 1,
		/obj/item/ammo_box/shotgun/buck = 3,
		/obj/item/gun/ballistic/revolver/m29/snub = 1,
		/obj/item/ammo_box/m44box = 1
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
/*
/datum/job/ncr/f13heavytrooper
	title = "NCR Heavy Trooper"
	flag = F13HEAVYTROOPER
	display_order = JOB_DISPLAY_ORDER_HEAVYTROOPER
	total_positions = 1
	spawn_positions = 1
	description = "You are the most elite of the enlisted, specialist in rank but forgoing regular command roles to lead in battle only. You are expected to be on the frontlines of every engagement, and to provide firing support for the rank and file. Your power armor lacks the protection the full working sets have, but you have trained with it and can use it in battle well. General Oliver praises you and your other Heavy Troopers, prove to him you're no exception to the rule."
	supervisors = "Lieutenant and Above"

	outfit = /datum/outfit/job/ncr/f13heavytrooper

	loadout_options = list(
		/datum/outfit/loadout/shockht,	// Minigun
		/datum/outfit/loadout/supportht // R84
		)

	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR1, ACCESS_NCR2, ACCESS_NCR_COMMAND, ACCESS_PUBLIC)

/datum/outfit/job/ncr/f13heavytrooper	// Mk. 23, Bayonet, Heavy armor
	name = "NCR Heavy Trooper"
	jobtype	= /datum/job/ncr/f13heavytrooper
	id = /obj/item/card/id/dogtag/ncrsergeant
	uniform = /obj/item/clothing/under/f13/ncr
	accessory =	/obj/item/clothing/accessory/ncr/SPC
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45b/ncr
	neck = /obj/item/storage/belt/holster/legholster
	suit = /obj/item/clothing/suit/armored/heavy/salvaged_pa/t45b/ncr
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1
		)

/datum/outfit/loadout/shockht
	name = "Shock Heavy Trooper"
	backpack_contents = list(
		/obj/item/minigunpackbal5mm = 1,
		/obj/item/storage/box/ration/menu_four = 1
		)

/datum/outfit/loadout/supportht
	name = "Support Heavy Trooper"
	backpack_contents = list(
		/obj/item/storage/box/ration/menu_six = 1,
		/obj/item/gun/ballistic/automatic/r84 = 1,
		/obj/item/ammo_box/magazine/lmg = 1
		)

/datum/outfit/job/ncr/f13heavytrooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
*/
// COMBAT ENGINEER

/datum/job/ncr/f13combatengineer
	title = "NCR Combat Engineer"
	flag = F13COMBATENGINEER
	display_order = JOB_DISPLAY_ORDER_COMBATENGINEER
	total_positions = 2
	spawn_positions = 2
	description = "You are a senior enlisted trooper with an engineering skill set. You work closely with your squad, taking orders from the officers. You have the authority to command troopers if there are no non-commissioned officers present."
	supervisors = "Corporals and Above. Staff Sergeants acting as Lead Mechanics orders takes priority, unless orders are from the Captain"

	outfit = /datum/outfit/job/ncr/f13combatengineer


	loadout_options = list( // ALL: Trench tool, Limited blueprints
		/datum/outfit/loadout/combatengineerflamethrower, // Flamethrower, 9mm pistol
		/datum/outfit/loadout/combatengineerdestroyer // Hunting Shotgun, C4 Explosive, Extra Materials
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
		/obj/item/shovel/trench = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1
		)

/datum/outfit/loadout/combatengineerflamethrower
	name = "Flamethrower Unit"
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ninemil
	backpack_contents = list(
		/obj/item/storage/box/ration/menu_three = 1,
		/obj/item/m2flamethrowertank = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/glass/fifty = 1
		)
/datum/outfit/loadout/combatengineerdestroyer
	name = "Explosives Expert"
	suit_store = /obj/item/gun/ballistic/revolver/grenadelauncher
	backpack_contents = list(
		/obj/item/storage/box/ration/menu_ten = 1,
		/obj/item/ammo_box/a40mm = 2,
		/obj/item/grenade/plastic/c4 = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/trapper = 1,
		/obj/item/book/granter/trait/explosives = 1
		)

/datum/outfit/job/ncr/f13combatengineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/servicerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/scoutcarbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R82)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tools/forged/entrenching_tool)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ninemil)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/m1911)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/m1carbine)
	ADD_TRAIT(H, TRAIT_GUNSMITH_FOUR, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

// MILITARY POLICE

/datum/job/ncr/f13mp
	title = "NCR Military Police"
	flag = F13MP
	display_order = JOB_DISPLAY_ORDER_MILITARYPOLICE
	total_positions = 2
	spawn_positions = 2
	description = "Here to conduct any kind of investigation, or serve as bodyguards for a rep. They only take orders from the Captain, Lieutenant and Rep. They also need Arrest Warrants from the Command Board (via a Ahelp), unless they witness a war crime or dangerous behavior."
	supervisors = "NCRA Officers"
	exp_requirements = 300

	outfit = /datum/outfit/job/ncr/f13mp

/datum/outfit/job/ncr/f13mp		// .45 Pistol, Beanbag Shotgun, Military baton
	name = "NCR Military Police"
	jobtype	= /datum/job/ncr/f13mp
	id = /obj/item/card/id/dogtag/ncrsergeant
	neck = /obj/item/storage/belt/holster/legholster
	uniform = /obj/item/clothing/under/f13/ncr/colonial
	accessory = /obj/item/clothing/accessory/ncr/SSGT
	glasses	= /obj/item/clothing/glasses/sunglasses
	head = /obj/item/clothing/head/f13/ncr/steelpot_mp
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	backpack = /obj/item/storage/backpack/satchel/trekker
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
		/obj/item/ammo_box/magazine/m45 = 3,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/ammo_box/shotgun/bean = 2,
		/obj/item/melee/baton/cattleprod = 1,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/clothing/accessory/armband/black = 1,
		/obj/item/storage/box/ration/menu_seven = 1
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
	supervisors = "Corporals and Above. The Medical Officer orders, however takes priority, unless orders are from the Captain"

	outfit = /datum/outfit/job/ncr/f13combatmedic

/datum/outfit/job/ncr/f13combatmedic
	name = "NCR Combat Medic"
	jobtype = /datum/job/ncr/f13combatmedic
	id = /obj/item/card/id/dogtag/ncrtrooper
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	head = /obj/item/clothing/head/f13/ncr/steelpot_med
	suit_store = /obj/item/gun/ballistic/automatic/service
	mask = /obj/item/clothing/mask/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	accessory = /obj/item/clothing/accessory/ncr/SPC
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/healthanalyzer/advanced = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/storage/box/ration/menu_ten = 1
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
	total_positions = 4
	spawn_positions = 4
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
	neck = /obj/item/storage/belt/holster/legholster
	head = /obj/item/clothing/head/f13/ncr/steelpot_goggles
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/book/manual/ncr/jobguide/regs = 1,
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/box/ration/menu_one = 1
		)

/datum/outfit/loadout/corporalpathfinder
	name = "Squad Pathfinder"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/storage/box/ration/menu_seven = 1
		)

/datum/outfit/loadout/corporalcqc
	name = "Squad Pointman"
	suit_store = /obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 4,
		/obj/item/storage/box/ration/menu_eleven = 1,
		/obj/item/stack/sheet/mineral/sandbags = 6
		)

/datum/outfit/loadout/corporaldesignatedmarksman
	name = "Squad Ranged Support"
	suit_store = /obj/item/gun/ballistic/automatic/service/carbine
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/binoculars = 1,
		/obj/item/attachments/scope = 1,
		/obj/item/storage/box/ration/menu_four = 1
		)



// TROOPER

/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	display_order = JOB_DISPLAY_ORDER_TROOPER
	total_positions = 8
	spawn_positions = 8
	description = "You are a professional soldier of the NCR Army. Obey your the NCOs and officers, no matter what you are expected to follow military discipline."
	supervisors = "Corporals and Above"

	outfit = /datum/outfit/job/ncr/f13trooper

	loadout_options = list(
		/datum/outfit/loadout/trooperrifleman, // Service Rifle, Bayonet 
		/datum/outfit/loadout/troopermechanics,
		/datum/outfit/loadout/trooperscout,
		/datum/outfit/loadout/trooperconscript
		)

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype	= /datum/job/ncr/f13trooper
	accessory = /obj/item/clothing/accessory/ncr/TPR
	id = /obj/item/card/id/dogtag/ncrtrooper
	glasses	= null
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ncrenlisted = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1
		)

/datum/outfit/loadout/trooperrifleman
	name = "Rifleman"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor
	head = /obj/item/clothing/head/f13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/box/ration/menu_three = 1
		)

/datum/outfit/loadout/troopermechanics
	name = "Mechanics"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = /obj/item/clothing/head/f13/ncr
	suit_store = /obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 3,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/ammo_box/shotgun/incendiary = 1,
		/obj/item/clothing/under/f13/mechanic = 1,
		/obj/item/storage/toolbox/mechanical = 1,
		/obj/item/stack/sheet/mineral/sandbags = 30,
		/obj/item/clothing/head/hardhat/ncr = 1,
		/obj/item/storage/box/ration/menu_eight = 1
		)

/datum/outfit/loadout/trooperscout
	name = "Scout"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	head = /obj/item/clothing/head/f13/ncr
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	backpack_contents = list(
		/obj/item/ammo_box/a308 = 2,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/attachments/scope = 1,
		/obj/item/binoculars = 1,
		/obj/item/storage/box/ration/menu_three = 1
		)

/datum/outfit/loadout/trooperconscript
	name = "Conscript"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reserve
	head = /obj/item/clothing/head/f13/ncr
	suit_store = /obj/item/gun/ballistic/automatic/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/box/ration/menu_three = 1,
		/obj/item/clothing/accessory/ncr/REC = 1
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
	description = "Couple days ago, you received a enormous paycheck from the Board of Command, with a note saying that you were to support the 3th Motorized Mobile Division in Yuma. The trick is, you have little to no clinic, or supplies. Your job is to get the medical side moving, check the physical and mental health of the troops, and of course, to act as a doctor."
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
	neck = /obj/item/storage/belt/holster/legholster
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
		/obj/item/storage/firstaid/regular = 1
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
	total_positions = 6
	spawn_positions = 6
	description = "You are a off-duty NCRA soldier, from the 3th MM division, or from a other campaign. While off-duty, you are relieved of both your duties and your authority. Since there is no real base, you are in... Vacation. So go where you please ! You better not be fighting, or you can kiss your rank goodbye. You are no better than a civilian, so you can be out of uniform."
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
		/obj/item/melee/onehanded/knife/bayonet = 1,
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
