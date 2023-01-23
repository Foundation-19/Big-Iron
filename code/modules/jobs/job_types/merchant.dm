/datum/job/merchant
	department_flag = MERCHANT
	selection_color = "#dcba97"
	faction = FACTION_MERCHANT
	exp_type = EXP_TYPE_FALLOUT
	maptype = "yuma"

/datum/job/merchant/f13shopkeeper
	title = "Merchant"
	flag = F13SHOPKEEPER
	department_flag = MERCHANT
	total_positions = 1
	spawn_positions = 1
	supervisors = "free hand of the market"
	description = "The greed of the United States survived better than its people. You are an organ of this greed. Ensure its continuation."
	selection_color = "#caa581"
	exp_type = EXP_TYPE_MERCHANT
	exp_requirements = 0

	outfit = /datum/outfit/job/merchant/f13shopkeeper
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_GATEWAY)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/merchant/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/merchant/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	shoes = /obj/item/clothing/shoes/f13/brownie
	uniform = /obj/item/clothing/under/f13/brahminbaron/foreign_suit
	head = /obj/item/clothing/head/helmet/f13/foreign_hat
	suit = /obj/item/clothing/suit/armor/f13/civilians/schlimmcoat
	ears = /obj/item/radio/headset/headset_merchant
	backpack = /obj/item/storage/backpack/satchel/leather/withwallet
	satchel = /obj/item/storage/backpack/satchel/leather/withwallet
	gloves = null
	l_pocket = null
	r_pocket = /obj/item/flashlight/glowstick
	backpack_contents = list(/obj/item/storage/bag/money/small/den = 1)

/datum/outfit/job/merchant/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)

/datum/outfit/job/den/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/*--------------------------------------------------------------*/

/datum/job/merchant/f13apprentice
	title = "Apprentice"
	flag = F13APPRENTICE
	department_flag = MERCHANT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Merchant"
	description = "You are the merchant's right hand and heir apparent; handle the menial duties of running the store, arrange deals on the merchant's behalf, and set quotas for the slaves."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_MERCHANT
	exp_requirements = 0
	outfit = /datum/outfit/job/merchant/f13apprentice

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_GATEWAY, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_GATEWAY, ACCESS_MINING)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/merchant,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/merchant,
		),
	)
/datum/outfit/job/merchant/f13apprentice
	name = "Shop Assistant"
	jobtype = /datum/job/merchant/f13apprentice
	head = /obj/item/clothing/head/f13/ranger_hat/tan
	uniform = /obj/item/clothing/under/f13/ikeduds
	suit = /obj/item/clothing/suit/f13/cowboybvest
	belt = /obj/item/storage/belt/utility
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_merchant
	shoes = /obj/item/clothing/shoes/workboots/mining
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ = 1)



/datum/outfit/job/merchant/f13apprentice/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)

/datum/outfit/job/merchant/f13assist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/*--------------------------------------------------------------*/
/datum/job/merchant/f13deputy
	title = "Security Contractor"
	flag = F13POLICEMAN
	department_flag = MERCHANT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Merchant"
	description = "You are a Security Contractor, hired by the Merchant; follow his bidding, keep his slaves in line, and make sure no one holds out payment from him."
	selection_color = "#dcba97"
	exp_type = EXP_TYPE_MERCHANT
	exp_requirements = 0

	outfit = /datum/outfit/job/merchant/f13deputy
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_GATEWAY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/merchant,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/merchant,
		),
	)

/datum/outfit/job/merchant/f13deputy
	name = "Merc"
	jobtype = /datum/job/merchant/f13deputy
	head = /obj/item/clothing/head/helmet/riot
	mask = /obj/item/clothing/mask/balaclava
	ears = /obj/item/radio/headset/headset_merchant
	id = /obj/item/card/id/dogtag/deputy
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/military
	belt = /obj/item/storage/belt/military/assault
	suit = /obj/item/clothing/suit/armor/bulletproof
	neck = /obj/item/storage/belt/holster/legholster/police
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/f13/military
	uniform = /obj/item/clothing/under/f13/camo/desert
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine/policerifle
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/ammo_box/magazine/m5mm = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/grenade/flashbang = 1,
		)

/datum/outfit/job/den/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)



/*--------------------------------------------------------------*/

/datum/job/merchant/f13prospector
	title = "Indentured Servant"
	flag = F13PROSPECTOR
	department_flag = MERCHANT
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Merchant"
	description = "You are the property of the merchant, but comparatively you are quite well off compared to those in the hands of the Legion, raiders, and those who dwell across the street. You may work in the house or be a hard laborer working in the mines or salvaging cars. Work hard enough and one day you may gain your freedom."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/merchant/f13indenturedservant

	loadout_options = list(
		/datum/outfit/loadout/houseservant,
		/datum/outfit/loadout/miner,
		/datum/outfit/loadout/tribalservant,
		/datum/outfit/loadout/scrapper)

	access = list(ACCESS_BAR, ACCESS_MINING, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_MINING, ACCESS_CARGO_BOT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/merchant,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/merchant,
		),
	)

/datum/outfit/job/merchant/f13indenturedservant
	name = "Indentured Servant"
	jobtype = /datum/job/merchant/f13prospector

	id = /obj/item/card/id/outcasttattoo
	ears = null
	shoes = null
	neck = /obj/item/electropack/shockcollar
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/merchant/f13indenturedservant/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/raiderrags,
		/obj/item/clothing/under/f13/raider_leather)

/datum/outfit/loadout/houseservant
	name = "House Servant"
	uniform = /obj/item/clothing/under/f13/relaxedwear
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(
		/obj/item/soap = 1)

/datum/outfit/loadout/tribalservant
	name = "Tribal Servant"
	uniform = /obj/item/clothing/under/f13/exile/tribal
	backpack_contents = list(
		/obj/item/soap = 1,
		/obj/item/warpaint_bowl = 1,)

/datum/outfit/loadout/miner
	name = "Miner"
	belt = /obj/item/storage/bag/ore
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/mining_scanner = 1,
		/obj/item/pickaxe = 1,)

/datum/outfit/loadout/scrapper
	name = "Scrapper"
	shoes = /obj/item/clothing/shoes/jackboots
	belt = /obj/item/storage/belt/utility/full
	head = /obj/item/clothing/head/welding/f13
