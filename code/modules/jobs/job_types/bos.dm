/datum/job/bos //do NOT use this for anything, it's just to store faction datums.
	department_flag = BOS
	selection_color = "#95a5a6"
	faction = FACTION_BROTHERHOOD
	exp_type = EXP_TYPE_BROTHERHOOD

	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_PUBLIC)
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."

	objectivesList = list(
		"The High Elders recommend the following goal for this week: Establish an outpost at the radio tower and monitor frequencies",
		"The High Elders recommend the following goal for this week: Study technology that can benefit our cause",
		"The High Elders recommend the following goal for this week: Acquire or confiscate dangerous technology, adhering to the Codex"
		)

/datum/outfit/job/bos
	name = "bosdatums"
	jobtype = 	/datum/job/bos
	backpack = 	/obj/item/storage/backpack/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	ears = 		/obj/item/radio/headset/headset_bos
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes = 	/obj/item/clothing/shoes/combat/swat
	gloves = 	/obj/item/clothing/gloves/combat
	id = 		/obj/item/card/id/dogtag
	box = 		/obj/item/storage/survivalkit_adv

/datum/outfit/job/bos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gate_bos)

/*
Elder
*/

/datum/job/bos/f13elder
	title = "Elder"
	flag = F13ELDER
	display_order = JOB_DISPLAY_ORDER_ELDER
	exp_type = EXP_TYPE_BROTHERHOODCOMMAND
	head_announce = list("Security")
	req_admin_notify = 1
	total_positions = 1
	spawn_positions = 1
	description = "You are the Elder of this local chapter of the Brotherhood of Steel. You may be a veteran of warfare, an experienced commander or even a genius Scribe, and you command all the men within this bunker. Your main goals are to lead the Brotherhood, to solve conflicts inbetween castes and to manage the Head Paladin, Head Knight and Head Scribe."
	supervisors = "the High Elders"
	exp_requirements = 1200

	outfit = /datum/outfit/job/bos/f13elder

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)

/datum/outfit/job/bos/f13elder
	name = "Elder"
	jobtype = /datum/job/bos/f13elder
	suit =	/obj/item/clothing/suit/f13/elder
	glasses = /obj/item/clothing/glasses/sunglasses
	accessory =	/obj/item/clothing/accessory/bos/elder
	suit_store = /obj/item/gun/energy/laser/plasma/pistol
	neck =	/obj/item/clothing/neck/mantle/bos
	ears = /obj/item/radio/headset/headset_bos/command
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/melee/onehanded/knife/hunting = 1
	)


/*
Head Paladin
*/

/datum/job/bos/f13headpaladin
	title = "Head Paladin"
	flag = F13HEADPALADIN
	display_order = JOB_DISPLAY_ORDER_HEADPALADIN
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the acting field commander until the Brotherhood regains its strength enough to place an Elder for the bunker. You are a veteran of many battles and sorties in pursuit of Brotherhood goals; your only weakness may just be your hubris. Your main goals are defense of the Chapter and surveillance of the surrounding region for technology."
	supervisors = "the Elder"
	exp_requirements = 600
	
	loadout_options = list(
	/datum/outfit/loadout/hpa, //Laser Gatling, Super Sledge
	/datum/outfit/loadout/hpb, //Tribeam, Powerfist
	/datum/outfit/loadout/hpc //14mm pistol, Shield, Pre-war Ripper
	)

	outfit = /datum/outfit/job/bos/f13headpaladin

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)

/datum/outfit/job/bos/f13headpaladin
	name = "Head Paladin"
	jobtype = /datum/job/bos/f13headpaladin
	uniform = 		/obj/item/clothing/under/f13/recon
	suit = 			/obj/item/clothing/suit/armor/f13/power_armor/t51green
	head = 			/obj/item/clothing/head/helmet/f13/power_armor/t51b/bos/hardened
	accessory = 	/obj/item/clothing/accessory/bos/headpaladin
	glasses =       /obj/item/clothing/glasses/sunglasses
	belt =			/obj/item/storage/belt/military/assault
	mask =			/obj/item/clothing/mask/gas/sechailer
	ears =			/obj/item/radio/headset/headset_bos/command
	neck = 			/obj/item/clothing/neck/mantle/bos/paladin
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99/crusader = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		)
		
/datum/outfit/loadout/hpa
	name = "Heavy Weapons Head Paladin"
	backpack_contents = list(
		/obj/item/minigunpack = 1,
		/obj/item/stock_parts/cell/ammo/ecp = 3,
		/obj/item/twohanded/sledgehammer/supersledge = 1
		)

/datum/outfit/loadout/hpb
	name = "Frontline Head Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/scatter = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/melee/unarmed/powerfist = 1
		)
		

/datum/outfit/loadout/hpc
	name = "Bulldozer Head Paladin"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol14 = 1,
		/obj/item/ammo_box/magazine/m14mm = 3,
		/obj/item/shield/riot/bullet_proof = 1,
		/obj/item/melee/powered/ripper/prewar = 1
		)

/datum/outfit/job/bos/f13headpaladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


/*
Head Scribe
*/

/datum/job/bos/f13headscribe
	title = "Head Scribe"
	flag = F13HEADSCRIBE
	display_order = JOB_DISPLAY_ORDER_HEADSCRIBE
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the foremost experienced scribe remaining in this bunker. Your role is to ensure the safekeeping and proper usage of technology within the Brotherhood. You are also the lead medical expert in this Chapter. Delegate your tasks to your Scribes."
	supervisors = "the Elder"
	exp_requirements = 600

	outfit = /datum/outfit/job/bos/f13headscribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)

/datum/outfit/job/bos/f13headscribe
	name = "Head Scribe"
	jobtype = /datum/job/bos/f13headscribe
	accessory =		/obj/item/clothing/accessory/bos/headscribe
	glasses =		/obj/item/clothing/glasses/sunglasses
	suit =			/obj/item/clothing/suit/armor/f13/headscribe
	suit_store =	/obj/item/gun/energy/laser/pistol
	belt =			/obj/item/storage/belt/utility/full/engi
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/gun/medbeam = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2
		)

/datum/outfit/job/bos/f13headscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)


/*
Head Knight
*/

/datum/job/bos/f13headknight
	title = "Head Knight"
	flag = F13HEADKNIGHT
	display_order = JOB_DISPLAY_ORDER_HEADKNIGHT
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the Head Knight, leader of your respective division in the Chapter. Your knowledge of pre-war materials and engineering is almost unparalleled, and you have basic combat training and experience. You are in charge of the Chapter's engineering Corps, and your Knights. Delegate to them as necessary. As Chief Armorer, you are also in charge of the armory."
	supervisors = "the Elder"
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/hka,	//Sniper
	/datum/outfit/loadout/hkb,	//AER12
	/datum/outfit/loadout/hkc	//RCW
	)
	outfit = /datum/outfit/job/bos/f13headknight

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_BOS4, ACCESS_PUBLIC)

/datum/outfit/job/bos/f13headknight
	name = "Head Knight"
	jobtype = /datum/job/bos/f13headknight

	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/captain
	glasses =		/obj/item/clothing/glasses/night
	accessory =		/obj/item/clothing/accessory/bos/headknight
	belt =			/obj/item/storage/belt/security/full
	neck =			/obj/item/storage/belt/holster
	mask =			/obj/item/clothing/mask/gas/sechailer
	head =			/obj/item/clothing/head/helmet/f13/combat/brotherhood/captain
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol14 = 1,
		/obj/item/ammo_box/magazine/m14mm = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		)
		
/datum/outfit/loadout/hka
	name = "Sniper Head Knight"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/marksman/sniper = 1,
		/obj/item/ammo_box/magazine/w308 = 3
		)

/datum/outfit/loadout/hkb
	name = "Frontline Head Knight"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer12 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3
		)
		
/datum/outfit/loadout/hkc
	name = "Backliner Head Knight"
	backpack_contents = list(
		/obj/item/gun/energy/laser/rcw = 1,
		/obj/item/stock_parts/cell/ammo/ecp = 3
		)

/datum/outfit/job/bos/f13headknight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GUNSMITH_ONE, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_TWO, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_THREE, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_FOUR, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lightplasmapistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)

/*
Paladin
*/

/datum/job/bos/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	display_order = JOB_DISPLAY_ORDER_PALADIN
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Head Paladin. You are this Chapter's main line of defense and offense; highly trained in combat and weaponry though with little practical field experience, you are eager to prove your worth to the Brotherhood. Your primary duties are defense and surface operations. You may also be assigned a trainee Initiate."
	supervisors = "the Head Paladin"
	exp_requirements = 300

	loadout_options = list(
	/datum/outfit/loadout/paladina, //Frontline P
	/datum/outfit/loadout/paladinb,	//Frontline SP
	/datum/outfit/loadout/paladinc, //Heavy P
	/datum/outfit/loadout/paladind	//Heavy SP
	)

	outfit = /datum/outfit/job/bos/f13paladin
	access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_PUBLIC)
	
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
	)

/datum/outfit/job/bos/f13paladin
	name =	"Paladin"
	jobtype =	/datum/job/bos/f13paladin
	uniform =	/obj/item/clothing/under/f13/recon
	mask =	/obj/item/clothing/mask/gas/sechailer
	belt =	/obj/item/storage/belt/military/assault
	neck =	/obj/item/clothing/neck/mantle/bos/paladin
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/melee/powered/ripper = 1,
	)

/datum/outfit/loadout/paladina
	name = "Frontline Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/clothing/suit/armor/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/head/helmet/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/accessory/bos/paladin = 1
		)

/datum/outfit/loadout/paladinb
	name = "Frontline Senior Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/clothing/suit/armor/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/head/helmet/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/accessory/bos/seniorpaladin = 1
		)
		
/datum/outfit/loadout/paladinc
	name = "Heavy Paladin"
	backpack_contents = list(
		/obj/item/minigunpackbal5mm = 1,
		/obj/item/clothing/suit/armor/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/head/helmet/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/accessory/bos/paladin = 1
		)

/datum/outfit/loadout/paladind
	name = "Heavy Senior Paladin"
	backpack_contents = list(
		/obj/item/minigunpackbal5mm = 1,
		/obj/item/clothing/suit/armor/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/head/helmet/f13/power_armor/t51b/bos = 1,
		/obj/item/clothing/accessory/bos/seniorpaladin = 1
		)


/datum/outfit/job/bos/f13paladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/*
Scribe
*/

/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	display_order = JOB_DISPLAY_ORDER_SCRIBE
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Senior Scribe, tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining the brotherhoods scientific archives. You may also be given a trainee to assign duties to."
	supervisors = "the Senior Scribe"

	loadout_options = list(
	/datum/outfit/loadout/scribea,	//Junior pin
	/datum/outfit/loadout/scribeb,	//Normal pin
	/datum/outfit/loadout/scribec	//Senior pin
	)

	outfit = /datum/outfit/job/bos/f13scribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND,ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_PUBLIC)
	
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
	)

/datum/outfit/job/bos/f13scribe
	name = "Scribe"
	jobtype = /datum/job/bos/f13scribe
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/f13/scribe
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/firstaid/regular = 1
		)

/datum/outfit/loadout/scribea
	name = "Junior Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorscribe = 1
		)

/datum/outfit/loadout/scribeb
	name = "Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/scribe = 1
		)

/datum/outfit/loadout/scribec
	name = "Senior Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/seniorscribe = 1
		)

/datum/outfit/job/bos/f13scribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)

/*
Senior Knight
*/

/datum/job/bos/f13seniorknight
	title = "Senior Knight"
	flag = F13SENIORKNIGHT
	display_order = JOB_DISPLAY_ORDER_SENIORKNIGHT
	total_positions = 2
	spawn_positions = 2
	description = "You report directly to the Head Knight. You are the Brotherhood Senior Knight. Having served the Knight Caste for some time now, you are versatile and experienced in both basic combat and repairs, and also a primary maintainer of the Bunker's facilities. As your seniormost Knight, you may be assigned initiates or Junior Knights to mentor."
	supervisors = "the Head Knight"
	
	loadout_options = list(
	/datum/outfit/loadout/ska,	//AER9, MK23 pistol
	/datum/outfit/loadout/skb,	//Marksman Rifle, Sig pistol
	/datum/outfit/loadout/skc	//Auto-5 Shotgun, MK23 pistol
	)

	outfit = /datum/outfit/job/bos/f13seniorknight

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND,ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_BOS3, ACCESS_PUBLIC)
	
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13knight,
		),
	)

/datum/outfit/job/bos/f13seniorknight
	name = "Senior Knight"
	jobtype = /datum/job/bos/f13seniorknight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior
	accessory = 	/obj/item/clothing/accessory/bos/seniorknight
	glasses =       /obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/gas/sechailer
	belt = 			/obj/item/storage/belt/military/assault
	neck =			/obj/item/storage/belt/holster
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/senior
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2
		)

/datum/outfit/loadout/ska
	name = "Senior Knight-Footman"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2
		)

/datum/outfit/loadout/skb
	name = "Senior Knight-Marksman"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/marksman = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/gun/ballistic/automatic/pistol/sig = 1,
		/obj/item/ammo_box/magazine/m9mm = 2,
		/obj/item/binoculars = 1
		)
		
/datum/outfit/loadout/skc
	name = "Senior Knight-Engineer"
	backpack_contents = list(
		/obj/item/storage/belt/utility/full/engi = 1,
		/obj/item/gun/ballistic/shotgun/automatic/combat/auto5 = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2
		)

/datum/outfit/job/bos/f13seniorknight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GUNSMITH_ONE, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_TWO, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_THREE, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_FOUR, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)

/*
Knight
*/

/datum/job/bos/f13knight
	title = "Knight"
	flag = F13KNIGHT
	display_order = JOB_DISPLAY_ORDER_KNIGHT
	total_positions = 3
	spawn_positions = 3
	description = "You are the Brotherhood Knight, the veritable lifeblood of your organization. You are a versatile and adaptably trained person: from your primary duties of weapon & armor repair to basic combat, survival and stealth skills, the only thing you lack is proper experience. You are also in charge of Initiates."
	supervisors = "the Senior Knight"

	loadout_options = list(
	/datum/outfit/loadout/knighta, //AER9 Junior
	/datum/outfit/loadout/knightb, //AER9 Knight
	/datum/outfit/loadout/knightc, //Commando Junior
	/datum/outfit/loadout/knightd //Commando Knight
	
	)

	outfit = /datum/outfit/job/bos/f13knight

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND,ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_PUBLIC)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13seniorknight,
		),
	)

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	mask =			/obj/item/clothing/mask/gas/sechailer
	belt = 			/obj/item/storage/belt/utility/full
	neck =			/obj/item/storage/belt/holster
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival  = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		)

/datum/outfit/loadout/knighta
	name = "Junior Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight = 1,
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2
		)

/datum/outfit/loadout/knightb
	name = "Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight = 1,
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2
		)
		

/datum/outfit/loadout/knightc
	name = "Junior Knight-Scout"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight = 1,
		/obj/item/gun/ballistic/automatic/delisle/commando = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2
		)

/datum/outfit/loadout/knightd
	name = "Knight-Scout"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight = 1,
		/obj/item/gun/ballistic/automatic/delisle/commando = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2
		)

/datum/outfit/job/bos/f13knight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GUNSMITH_ONE, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_TWO, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_THREE, src)
	ADD_TRAIT(H, TRAIT_GUNSMITH_FOUR, src)

/*
Initiate
*/

/datum/job/bos/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	display_order = JOB_DISPLAY_ORDER_INITIATE
	total_positions = 4
	spawn_positions = 4
	description = "Either recently inducted or born into the Brotherhood, you have since proven yourself worthy of assignment to the Chapter. You are to assist your superiors and receive training how they deem fit. You are NEVER allowed to leave the bunker without the direct supervision of a superior; doing so may result in exile or transferrence back the Valley."
	supervisors = "the Scribes, Knights or Paladins"

	loadout_options = list(
	/datum/outfit/loadout/initiatek, //AEP7 and Engibelt with combat armor, no helmet
	/datum/outfit/loadout/initiates //Medical belt and chem knowledge
	)

	outfit = /datum/outfit/job/bos/f13initiate

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_PUBLIC)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND,ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_BOS1, ACCESS_BOS2, ACCESS_PUBLIC)
	
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13knight,
			/datum/job/bos/f13scribe,
		),
	)

/datum/outfit/job/bos/f13initiate
	name = "Initiate"
	jobtype = /datum/job/bos/f13initiate
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1
		)

/datum/outfit/loadout/initiatek
	name = "Knight-Aspirant"
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_one = 1,
		/obj/item/book/granter/crafting_recipe/gunsmithing/gunsmith_two = 1,
		/obj/item/clothing/accessory/bos/initiateK = 1
		)

/datum/outfit/loadout/initiates
	name = "Scribe-Aspirant"
	belt =			/obj/item/storage/belt/medical
	suit =			/obj/item/clothing/suit/toggle/labcoat
	glasses =		/obj/item/clothing/glasses/science
	gloves =		/obj/item/clothing/gloves/color/latex
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/clothing/accessory/bos/initiateS = 1
		)

/datum/outfit/job/bos/f13initiate/post_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)

/*
Off-Duty
*/

/datum/job/bos/f13offdutybos
	title = "BoS Off-Duty"
	flag = F13OFFDUTYBOS
	display_order = JOB_DISPLAY_ORDER_OFFDUTYBOS
	total_positions = 0
	spawn_positions = 0
	description = "While off-duty, you are relieved of both your duties and your authority. You are not required to participate in any routine duties of the bunker, and you may spend your time doing whatever you please, within reason. However, you may not leave the bunker, and you may not get in the way of on-duty personnel. Do not pull rank or give orders. Should the bunker be attacked, you are expected NOT to participate in the fighting, and must instead head to the lower levels for safety (i.e. despawn yourself at the matrix point)."
	supervisors = "Everyone else"

	outfit = /datum/outfit/job/bos/f13offdutybos

	access = list(ACCESS_BOS)
	minimal_access = list(ACCESS_BOS)

/datum/outfit/job/bos/f13offdutybos
	name = "BoS Off-Duty"
	jobtype = /datum/job/bos/f13offdutybos
	ears = 			/obj/item/radio/headset
	belt = 			/obj/item/storage/belt/military/army
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/encryptionkey/headset_bos = 1,
		/obj/item/melee/onehanded/knife/survival = 1
		)
