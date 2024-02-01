//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/enclave
	department_flag = ENCLAVE
	selection_color = "#323232"
	faction = FACTION_ENCLAVE
	exp_type = EXP_TYPE_ENCLAVE

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)
	forbids = "Enclave taboos: Aiding Brotherhood members in any way no matter how small."
	enforces = "Enclave rules: Stay in uniform. Act mature and respectful. Obey orders and always remember you are fighting for the only true legitimate power in this land of savages. Wearing gasmasks outside the compound is encouraged but not required."
	objectivesList = list("Department of Defense advisory: Collect resources and produce more Patribots, attrition is depleting our reserves.","Department of Defense advisory: Establish checkpoints to show presence, they must not forget who is the legitimate goverment.", "Science Divison advisory: Capture human subjects for experiments, alive. We have some new neurotoxin grenades we wish to do final tests with before field deployment.")

/datum/outfit/job/enclave
	id = null
	backpack = /obj/item/storage/backpack/enclave
	satchel = /obj/item/storage/backpack/satchel/enclave
	ears = /obj/item/radio/headset/headset_enclave
	glasses = /obj/item/clothing/glasses/night/f13/enclave
	belt = /obj/item/storage/belt/military/assault/enclave
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	box = /obj/item/storage/survivalkit_adv

/datum/outfit/job/enclave/peacekeeper
	id = /obj/item/card/id/dogtag/enclave/trooper
	mask = /obj/item/clothing/mask/gas/enclave
	neck = /obj/item/storage/belt/holster/legholster
	uniform = /obj/item/clothing/under/f13/enclave/peacekeeper
	gloves = /obj/item/clothing/gloves/f13/military

/datum/outfit/job/enclave/noncombat
	id = /obj/item/card/id/dogtag/enclave/noncombatant
	uniform = /obj/item/clothing/under/f13/enclave/science

/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombatmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombathelmetmk2)


///////////////////////
/// Captain - Admin ///
///////////////////////

/datum/job/enclave/enclavecpt
	title = "Enclave Navy Captain"
	description = "Multiple day ago, USS 'Eminent Domaine'made contact with the remains of a enclave cell. Before that you tought you and your mens were the last operating cell of the Enclave in the US. And now, you took them in. They aren't Navy, but you are bound by the flag : set the policies and the attitude of the Enclave this week. IMPORTANT : You are the captain of the SHIP. BUT FOR NOW, you are helping in the bunker."
	flag = F13USCPT
	display_order = JOB_DISPLAY_ORDER_CAPTAIN_US
	total_positions = 1
	spawn_positions = 1
	head_announce = list("Security")
	req_admin_notify = 1
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE1, ACCESS_ENCLAVE2, ACCESS_ENCLAVE3, ACCESS_PUBLIC)
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavecpt
	exp_requirements = 1500

/datum/outfit/job/enclave/peacekeeper/enclavecpt
	name = "Enclave Captain"
	jobtype = /datum/job/enclave/enclavecpt
	head = /obj/item/clothing/head/caphat/formal/fedcover/black
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	neck = /obj/item/clothing/neck/mantle/commander
	suit_store = /obj/item/gun/energy/laser/plasma/glock/extended
	accessory = /obj/item/clothing/accessory/ncr/CPT
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/megaphone = 1,
		/obj/item/clothing/head/helmet/f13/enclave/officer = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/classic_baton/telescopic = 1
		)

/datum/outfit/job/enclave/peacekeeper/enclavecpt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


//Lieutenant
/datum/job/enclave/enclavelt
	title = "Enclave Lieutenant"
	flag = F13USLT
	display_order = JOB_DISPLAY_ORDER_F13USLT
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE1, ACCESS_ENCLAVE2, ACCESS_ENCLAVE3, ACCESS_PUBLIC)
	description = "Multiple weeks ago, while your bunker had some issues, you made contact with the USS Eminent Domaine. They took you in, you and your mens. You are now the second in command of this enclave cell."
	supervisors = "The Captain, and command."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavelt
	exp_requirements = 1000

/datum/outfit/job/enclave/peacekeeper/enclavelt
	name = "Enclave Lieutenant"
	jobtype = /datum/job/enclave/enclavelt

	head = /obj/item/clothing/head/helmet/f13/enclave/officer
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	suit_store = /obj/item/gun/ballistic/automatic/fnfal
	accessory = /obj/item/clothing/accessory/ncr/LT1
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/ammo_box/magazine/m762 = 2,
		)

/datum/outfit/job/enclave/peacekeeper/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

// NAVY Pilot

/datum/job/enclave/enclavepilot
	title = "Enclave Navy Pilot"
	flag = F13USPILOT
	display_order = JOB_DISPLAY_ORDER_F13USPILOT
	total_positions = 3
	spawn_positions = 3
	description = "Seeing new face arround the ship sure is refreshing, but you got a job to do. You are a Enclave pilot, and have been on the USS Eminant Domaine for a long time, probably even born on it. You support the troops on the ground, and to recon mission. Carefull, they skies are disputed here. WARNING : You are normaly from the SHIP. But you are down to the bunker to help."
	supervisors = "The Captain."
	outfit = /datum/outfit/job/enclave/enclavepilot
	exp_requirements = 600

/datum/outfit/job/enclave/enclavepilot
	name = "Enclave Pilot"
	jobtype = /datum/job/enclave/enclavesgt
	uniform = /obj/item/clothing/under/f13/enclave/intel
	suit = /obj/item/clothing/suit/co_bomber
	glasses = /obj/item/clothing/glasses/hud/diagnostic/sunglasses
	head = /obj/item/clothing/head/f13/army/beret/airborne
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine
	accessory = /obj/item/clothing/accessory/enclave/sergeant

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/pda = 1,
		/obj/item/clothing/head/helmet/f13/combat/mk2/remnant = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/f13/enclave/peacekeeper = 1,
		/obj/item/ammo_box/magazine/m5mm = 2,
		)

/datum/outfit/job/enclave/enclave/enclavepilot/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

// Gunnery Sergeant

/datum/job/enclave/f13gysergeant
	title = "Enclave Gunnery Sergeant"
	flag = F13USGYSGT
	display_order = JOB_DISPLAY_ORDER_F13USGYSGT
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE1, ACCESS_ENCLAVE2, ACCESS_PUBLIC)
	description = "Third in command after Lieutenant, your role is to direct their orders directly to the sergeants and regular troops."
	supervisors = "The Captain and the Lieutenant."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13gysergeant
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/gysergeantshotgun, // shotgun + ripper
		/datum/outfit/loadout/gysergeantrifle // carbine, suppressor, ESDs
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant
	name = "Enclave Gunnery Sergeant"
	jobtype = /datum/job/enclave/f13gysergeant
	head = /obj/item/clothing/head/helmet/f13/enclave/marine
	suit = /obj/item/clothing/suit/armor/f13/enclave/marine
	accessory = /obj/item/clothing/accessory/enclave/master_sergeant
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1
		)

/datum/outfit/loadout/gysergeantshotgun
	name = "CQC Sergeant"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/citykiller
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/slug = 2,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/powered/ripper/prewar = 1
		)

/datum/outfit/loadout/gysergeantrifle
	name = "Support Sergeant"
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m5mm = 4,
		/obj/item/ammo_box/m5mmbox/shock = 1,
		/obj/item/suppressor = 1
		)

//Armored Infantry


/datum/job/enclave/Armoredinfantry
	title = "Enclave Armored Infantry"
	flag = F13USAI
	display_order = JOB_DISPLAY_ORDER_F13USAI
	total_positions = 2
	spawn_positions = 2
	description = "You are a specialist trained in the use of heavy equipment and X0-2 Power armor. Your job is to be he anchor of your unit."
	supervisors = "The Captain, Lieutenant and the Sergeants"
	outfit = /datum/outfit/job/enclave/peacekeeper/Armoredinfantry
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/troopy,
	)


/datum/outfit/job/enclave/peacekeeper/Armoredinfantry
	name = "Enclave Armored Infantry"
	jobtype = /datum/job/enclave/Armoredinfantry
	head = /obj/item/clothing/head/helmet/f13/power_armor/t51b/bos/hardened/enclave
	suit = /obj/item/clothing/suit/armor/f13/power_armor/t51green/enclave
	accessory = /obj/item/clothing/accessory/enclave/specialist

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/troopy
	name = "Standard"
	backpack_contents = list(
		/obj/item/minigunpack = 1,
		/obj/item/stock_parts/cell/ammo/ecp = 2,
		)

/datum/outfit/job/enclave/peacekeeper/Armoredinfantry/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)


//Sergeant

/datum/job/enclave/enclavesgt
	title = "Enclave Sergeant"
	flag = F13USSGT
	display_order = JOB_DISPLAY_ORDER_F13USSGT
	total_positions = 2
	spawn_positions = 2
	description = "Entrusted with the command of the squads assigned to the USS Eminant Domaine, your job is to assist the Lieutenant alongside the scientists."
	supervisors = "The Captain, the Lieutenant and the Gunnery Sergeant."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavesgt
	exp_requirements = 600

/datum/outfit/job/enclave/peacekeeper/enclavesgt
	name = "Enclave Sergeant"
	jobtype = /datum/job/enclave/enclavesgt
	suit = /obj/item/clothing/suit/armor/f13/combat/mk2/remnant
	head = /obj/item/clothing/head/helmet/f13/combat/mk2/remnant
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine
	accessory = /obj/item/clothing/accessory/enclave/sergeant

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/f13/enclave/peacekeeper = 1,
		/obj/item/ammo_box/magazine/m5mm = 2,
		)

/datum/outfit/job/enclave/peacekeeper/enclavesgt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

//Specialist

/datum/job/enclave/f13specialist
	title = "Enclave Specialist"
	flag = F13USSPECIALIST
	display_order = JOB_DISPLAY_ORDER_F13USSPECIALIST
	total_positions = 3
	spawn_positions = 3
	description = "You are an operative for the remnants of the Enclave. You, unlike the normal privates, have recieved specialist training in either engineering or medicine."
	supervisors = "The Captain, Lieutenant and the Sergeants."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13specialist
	exp_requirements = 300

	loadout_options = list(
		/datum/outfit/loadout/specmedic,
		/datum/outfit/loadout/specengi
		)

/datum/outfit/job/enclave/peacekeeper/f13specialist
	name = "Enclave Specialist"
	jobtype = /datum/job/enclave/f13specialist
	suit = /obj/item/clothing/suit/armor/bulletproof
	suit_store = /obj/item/gun/ballistic/automatic/r93
	accessory = /obj/item/clothing/accessory/enclave/specialist
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	head = /obj/item/clothing/head/beret/enclave/science
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		)

/datum/outfit/loadout/specmedic
	name = "Medic"
	backpack_contents = list(
		/obj/item/gun/medbeam = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 4,
		/obj/item/book/granter/trait/midsurgery = 1,
		/obj/item/book/granter/trait/chemistry = 1
		)

/datum/outfit/loadout/specengi
	name = "Engineer"
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/grenadelauncher = 1,
		/obj/item/ammo_box/a40mm = 2,
		/obj/item/storage/belt/utility/full/engi = 1,
		/obj/item/book/granter/trait/techno = 1,
		/obj/item/book/granter/trait/explosives = 1
		)

/datum/outfit/job/enclave/peacekeeper/f13specialist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)

//Private
/datum/job/enclave/enclavespy
	title = "Enclave Private"
	flag = F13USPRIVATE
	display_order = JOB_DISPLAY_ORDER_F13USPRIVATE
	total_positions = 5
	spawn_positions = 5
	description = "Either you are one of the soldiers that left the bunker, or one of the original crew on board this ship : You are an operative for the remnants of the Enclave. Obey your Captain and Lieutenant. He sets the Enclave's policies. WARNING : You are still in bunker. if you are from the ship, you are merly here to help."
	supervisors = "The Captain, Lieutenant and the Sergeants"
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavespy

/datum/outfit/job/enclave/peacekeeper/enclavespy
	name = "Enclave Private"
	jobtype = /datum/job/enclave/enclavespy
	head = /obj/item/clothing/head/helmet/f13/combat/swat/enclave
	suit = /obj/item/clothing/suit/armor/f13/combat/swat/enclave
	suit_store = /obj/item/gun/ballistic/automatic/r93
	accessory = /obj/item/clothing/accessory/enclave

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		)

// ENCLAVE REMNANTS

// Operative
/datum/job/enclave/operative
	title = "Enclave Remnant"
	flag = F13USREMNANT
	display_order = JOB_DISPLAY_ORDER_F13USREMNANT
	total_positions = 0
	spawn_positions = 0
	description = "You are an operative for the remnants of the Enclave."
	supervisors = "You are not supervised by anyone and work with your fellow operatives"

	outfit = /datum/outfit/job/enclave/operative

	loadout_options = list(
		/datum/outfit/loadout/enclaveremnantrifle, 
		/datum/outfit/loadout/enclaveremnantshotgun,
		/datum/outfit/loadout/enclaveremnantpistol
		)

/datum/outfit/job/enclave/operative
	name = "Enclave Remnant"
	jobtype = /datum/job/enclave/operative
	head = /obj/item/clothing/head/helmet/armyhelmet
	suit = /obj/item/clothing/suit/armored/medium/combat/duster
	id = /obj/item/card/id/remnant
	backpack = /obj/item/storage/backpack/trekker
	satchel = null
	ears = /obj/item/radio/headset/headset_enclaveremnant
	glasses = null
	belt = /obj/item/storage/belt
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/jackboots
	box = /obj/item/storage/survivalkit_adv
	gloves = /obj/item/clothing/gloves/f13/military

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/enclaveremnantrifle
	name = "Rifleman"
	suit_store = /obj/item/gun/ballistic/automatic/m1carbine
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv = 3
		)

/datum/outfit/loadout/enclaveremnantshotgun
	name = "Shotgunner"
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 3
		)

/datum/outfit/loadout/enclaveremnantpistol
	name = "Pistol"
	suit_store = /obj/item/gun/ballistic/automatic/pistol/m1911
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45 = 3
		)

/datum/outfit/job/enclave/operative/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_ENCLAVE_REMNANT, src)

// Medical Operative //
/datum/job/enclave/operativemedical
	title = "Enclave Remnant Medic"
	flag = F13USREMNANTMEDIC
	display_order = JOB_DISPLAY_ORDER_F13USREMNANTMEDIC
	total_positions = 0
	spawn_positions = 0
	description = "You are an medical operative for the remnants of the Enclave."
	supervisors = "You are not supervised by anyone and work with your fellow operatives"

	outfit = /datum/outfit/job/enclave/operativemedical

/datum/outfit/job/enclave/operativemedical
	name = "Enclave Remnant Medic"
	jobtype = /datum/job/enclave/operativemedical
	head = /obj/item/clothing/head/helmet/armyhelmet
	suit = /obj/item/clothing/suit/toggle/labcoat/f13
	r_hand = /obj/item/storage/backpack/duffelbag/med/surgery 
	id = /obj/item/card/id/remnant
	backpack = /obj/item/storage/backpack/trekker
	satchel = null
	ears = /obj/item/radio/headset/headset_enclaveremnant
	glasses = null
	belt = /obj/item/storage/belt
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/jackboots
	box = /obj/item/storage/survivalkit_adv
	gloves = /obj/item/clothing/gloves/f13/military

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/job/enclave/operativemedical/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_REMNANT, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/superstimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/superstimpak5)

//NON-COMBATANTS

//Scientist
/datum/job/enclave/enclavesci
	title = "Enclave Scientist"
	flag = F13USSCIENTIST
	display_order = JOB_DISPLAY_ORDER_F13USSCIENTIST
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE1, ACCESS_ENCLAVE2, ACCESS_PUBLIC)
	total_positions = 2
	spawn_positions = 2
	description = "Before you arrived, the USS Eminant Domaine didn't have any science crew, only a medbay. You and your Fellow scientist brought the equipement from the bunker here. You're responsible for the maintenance of the ship, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in your field of research, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant. WARNING : The bunker is still being moved to the ship. Act as normal."
	supervisors = "Enclave Research and Development Division."
	outfit = /datum/outfit/job/enclave/noncombat/enclavesci
	exp_requirements = 300

/datum/outfit/job/enclave/noncombat/enclavesci
	name = "Enclave Scientist"
	jobtype = /datum/job/enclave/enclavesci
	head = /obj/item/clothing/head/helmet/f13/envirosuit
	mask =/obj/item/clothing/mask/breath/medical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	suit = /obj/item/clothing/suit/armor/f13/environmentalsuit
	belt = /obj/item/storage/belt/medical
	suit_store =  /obj/item/tank/internals/oxygen

	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/pda = 1,
		/obj/item/gun/energy/gammagun = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/beret/enclave/science = 1,
		)

/datum/outfit/job/enclave/noncombat/enclavesci/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/USAeyebot,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)

//Bunker Duty
/datum/job/enclave/f13BDUTY
	title = "Enclave Ship Duty"
	flag = F13USBDUTY
	display_order = JOB_DISPLAY_ORDER_F13USPRIVATE
	total_positions = 5
	spawn_positions = 5
	description = "You were assigned to ship duty this week, clean up, cook up, preach up or chem up your fellow Americans and remember don't join any raids or battles from your fellow Americans, after all it's none of your concern this week is it. "
	enforces = "You are not permited to leave the base. You are a non-combatant. You cannot join any raids or battles on the surface."
	supervisors = "Everyone else."
	outfit = /datum/outfit/job/enclave/noncombat/f13BDUTY
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 100

	loadout_options = list(
		/datum/outfit/loadout/bunkerduty_botany,
		/datum/outfit/loadout/bunkerduty_engi,
		/datum/outfit/loadout/bunkerduty_janny,
		/datum/outfit/loadout/bunkerduty_chaplain,
		/datum/outfit/loadout/bunkerduty_cook,
		)

/datum/outfit/job/enclave/noncombat/f13BDUTY
	name = "Enclave Bunker Duty"
	jobtype = /datum/job/enclave/f13BDUTY
	id = /obj/item/card/id/dogtag/enclave/trooper
	glasses = /obj/item/clothing/glasses/sunglasses/big
	uniform = /obj/item/clothing/under/f13/enclave/peacekeeper

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/bunkerduty_botany
	name = "Botanical Technician"
	mask = /obj/item/clothing/mask/bandana
	suit = /obj/item/clothing/suit/overalls
	gloves = /obj/item/clothing/gloves/botanic_leather
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/plant_analyzer = 1,
		)

/datum/outfit/loadout/bunkerduty_engi
	name = "Maintenance Technician"
	head = /obj/item/clothing/head/hardhat
	suit = /obj/item/clothing/suit/hazardvest
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(
		/obj/item/storage/belt/utility = 1,
		/obj/item/stack/sheet/metal/twenty = 1,
		/obj/item/stack/sheet/glass/ten = 2,
		/obj/item/stack/cable_coil/thirty = 2,
		)

/datum/outfit/loadout/bunkerduty_janny
	name = "Sanitation Technician"
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/soft/purple
	shoes = /obj/item/clothing/shoes/galoshes
	backpack_contents = list(
		/obj/item/reagent_containers/spray/cleaner = 1,
		/obj/item/mop/advanced = 1,
		/obj/item/grenade/chem_grenade/cleaner = 3,
		)

/datum/outfit/loadout/bunkerduty_chaplain
	name = "Spiritual Technician"
	mask = /obj/item/clothing/mask/surgical
	suit = /obj/item/clothing/suit/f13/autumn
	backpack_contents = list(
		/obj/item/storage/book/bible = 2,
		/obj/item/pen = 1,
		/obj/item/folder = 1,
		)

/datum/outfit/loadout/bunkerduty_cook
	name = "Culinary Technician"
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/neck/apron/housewife
	backpack_contents = list(
		/obj/item/storage/box/ingredients/wildcard = 4,
		/obj/item/kitchen/knife/butcher = 1,
		)

// Enclave Citizen
// Really only used for ID console
/datum/job/enclave/f13enclavecitizen
	title = "American Citizen"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/enclave/f13enclavecitizen

/datum/outfit/job/enclave/f13enclavecitizen
	name = "American Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/vault13
	shoes = /obj/item/clothing/shoes/jackboots
	id = /obj/item/card/id/dogtag/town/enclave
