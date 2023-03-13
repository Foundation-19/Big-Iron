/datum/job/kebab
	exp_type = EXP_TYPE_KEBAB
	faction = FACTION_KEBAB
	department_flag = DEP_KEBAB
	selection_color = "#c3d5d5"

//merchant

/datum/job/kebab/f13shopkeeper
	title = "Merchant"
	flag = F13SHOPKEEPER
	total_positions = 1
	spawn_positions = 1
	supervisors = "free hand of the market"
	description = "You are the ruler of Kebab, you also happen to own the largest gun distributor in the entirety of Yuma. You'll need to manage the town, maintain and increase your income stream, and handle diplomatic matters."
	exp_requirements = 100

	outfit = /datum/outfit/job/kebab/f13shopkeeper
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

/datum/outfit/job/kebab/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/kebab/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	shoes = /obj/item/clothing/shoes/f13/brownie
	uniform = /obj/item/clothing/under/f13/schlimmsuit
	head = /obj/item/clothing/head/helmet/f13/marlowhat/schlimmhat
	suit = /obj/item/clothing/suit/armor/f13/marlowsuit/schlimmcoat
	ears = /obj/item/radio/headset/headset_merchant
	backpack = /obj/item/storage/backpack/satchel/leather/withwallet
	satchel = /obj/item/storage/backpack/satchel/leather/withwallet
	gloves = null
	l_pocket = null
	r_pocket = /obj/item/flashlight/glowstick
	backpack_contents = list(/obj/item/storage/bag/money/small/den = 1)

/datum/outfit/job/kebab/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_DAYTRIPPER, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/merchant)

/datum/outfit/job/den/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/*--------------------------------------------------------------*/

/datum/job/kebab/f13apprentice
	title = "Apprentice"
	flag = F13APPRENTICE
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Merchant"
	description = "You are the merchant's right hand and heir apparent; handle the menial duties of running the store, arrange deals on the merchant's behalf, and set quotas for the slaves."
	exp_requirements = 0
	outfit = /datum/outfit/job/kebab/f13apprentice

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_GATEWAY, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_GATEWAY, ACCESS_MINING)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)
/datum/outfit/job/kebab/f13apprentice
	name = "Shop Assistant"
	jobtype = /datum/job/kebab/f13apprentice
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



/datum/outfit/job/kebab/f13apprentice/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_DAYTRIPPER, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/merchant)

/datum/outfit/job/kebab/f13assist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/*--------------------------------------------------------------*/
/datum/job/kebab/f13mercenary
	title = "Mercenary"
	flag = F13MERCENARY
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Merchant"
	description = "You are a mercenary, hired by the Merchant; follow his bidding, keep his slaves in line, and make sure no one holds out payment from him."
	exp_requirements = 0

	outfit = /datum/outfit/job/kebab/f13mercenary
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

/datum/outfit/job/kebab/f13mercenary
	name = "Merc"
	jobtype = /datum/job/kebab/f13mercenary
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

/datum/outfit/job/kebab/f13mercenary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_DAYTRIPPER, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/merchant)



/*--------------------------------------------------------------*/
/datum/job/kebab/f13militiacom
	title = "Militia Commander"
	flag = F13MILITIACOM
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Merchant"
	description = "You command kebab's militia and have been placed in charge of the town's defense and maintaining order in the streets."
	exp_requirements = 0

	outfit = /datum/outfit/job/kebab/f13militiacom
	access = list(ACCESS_MILITIA)
	minimal_access = list(ACCESS_MILITIA)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/kebab/f13militiacom
	name = "Militia Commander"
	jobtype = /datum/job/kebab/f13militiacom
	head = /obj/item/clothing/head/f13/police/sergeant
	ears = /obj/item/radio/headset/headset_merchant
	id = /obj/item/card/id/dogtag/sheriff
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/military
	belt = /obj/item/storage/belt/military/assault
	suit = /obj/item/clothing/suit/f13/police
	neck = /obj/item/storage/belt/holster/legholster/police
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/f13/military
	uniform = /obj/item/clothing/under/f13/police/formal
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine/policerifle
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/ammo_box/magazine/m5mm = 2,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/grenade/flashbang = 1,
		)

/datum/outfit/job/kebab/f13militiacom/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/militia)



/*--------------------------------------------------------------*/

/datum/job/kebab/f13bartender
	title = "Bartender"
	flag = F13BARTENDER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Merchant"
	description = "You are the bartender, an employee of the Merchant. How you came into the Merchant's service is up to you, but what is known is that the Merchant owns the bar, and expects to see a return on investment. You are entitled to protection from the Merchant's guards, and are required to pay him whatever cut of the bar's profits he demands."

	outfit = /datum/outfit/job/kebab/f13bartender

	loadout_options = list(
		/datum/outfit/loadout/rugged,
		/datum/outfit/loadout/frontier,
		/datum/outfit/loadout/richmantender,
		/datum/outfit/loadout/diner
		)

	access = list(ACCESS_BAR, ACCESS_MINING, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_MINING, ACCESS_CARGO_BOT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/kebab/f13bartender
	name = "Barkeep"
	jobtype = /datum/job/kebab/f13bartender
	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/book/granter/action/drink_fling = 1,
		/obj/item/ammo_box/shotgun/bean = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/stack/f13Cash/caps/onezerozero = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1
		)

/datum/outfit/loadout/rugged
	name = "Rugged"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/cowboyb
	suit = /obj/item/clothing/suit/f13/cowboybvest
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/f13/brownie

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black

/datum/outfit/loadout/diner
	name = "Diner"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/brahminf
	neck = /obj/item/clothing/neck/apron/chef
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/f13/military/ncr

//citizens

/datum/job/kebab/f13citizen
	title = "Citizen"
	flag = F13CITIZEN
	total_positions = -1
	spawn_positions = -1
	supervisors = "the Merchant"
	description = "Welcome to Kebab, you by some means or another have found yourself to be a resident of this shanty town. You are free to do as your please, to find work, commit petty theft, perhaps you are a member of the town militia attempting to keep the town in order and relative peace."

	outfit = /datum/outfit/job/kebab/f13citizen

	loadout_options = list(
		/datum/outfit/loadout/f13citizen/militia,
		/datum/outfit/loadout/f13citizen/pusher,
		/datum/outfit/loadout/f13citizen/ncrsettler,
		/datum/outfit/loadout/f13citizen/vault,
		/datum/outfit/loadout/f13citizen/worker,
		/datum/outfit/loadout/f13citizen/gangster,
		)

	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/kebab/f13citizen
	name = "Citizen"
	jobtype = /datum/job/kebab/f13citizen
	ears = null
	belt = null
	ears = /obj/item/radio/headset/headset_town
	id = /obj/item/card/id/dogtag/town
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/storage/bag/money/small/raider = 1,
		/obj/item/key = 1,
		/obj/item/lock_construct = 1
		)

/datum/outfit/job/kebab/f13citizen/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca,
		/obj/item/clothing/under/f13/mercc,
		/obj/item/clothing/under/f13/cowboyb,
		/obj/item/clothing/under/f13/cowboyg,
		/obj/item/clothing/under/f13/raider_leather,
		/obj/item/clothing/under/f13/raiderrags,
		/obj/item/clothing/under/f13/doctor,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/pants/f13/ghoul)

	shoes = pick(
		/obj/item/clothing/shoes/f13/rag,
		/obj/item/clothing/shoes/f13/explorer,
		/obj/item/clothing/shoes/f13/raidertreads)

/datum/outfit/loadout/f13citizen/militia
	name = "Militia"
	head = /obj/item/clothing/head/helmet/blueshirt
	suit = /obj/item/clothing/suit/armor/vest
	belt = /obj/item/storage/belt/security
	neck = /obj/item/storage/belt/holster/legholster/police
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/classic_baton/police = 1,
		/obj/item/card/id/dogtag/deputy/kebab = 1
		)

/datum/outfit/loadout/f13citizen/pusher
	name = "Pusher"
	glasses = /obj/item/clothing/glasses/sunglasses
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/jet = 2,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 2,
		/obj/item/reagent_containers/hypospray/medipen/medx = 2
		)

/datum/outfit/loadout/f13citizen/ncrsettler
	name = "NCR Settler"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/cowboyt
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy
	shoes = /obj/item/clothing/shoes/f13/military/fashion/cowboy_boots
	suit = /obj/item/clothing/suit/f13/cowboybvest
	suit_store = /obj/item/gun/ballistic/automatic/varmint
	backpack_contents = list(
		/obj/item/card/id/dogtag/town/ncr = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/brahminbridle = 1,
		/obj/item/brahminsaddle = 1,
		/obj/item/brahminbrand = 1,
		/obj/item/cultivator = 1,
		/obj/item/hatchet = 1,
		/obj/item/shovel/spade = 1,
		/obj/item/storage/bag/plants = 1
		)

/datum/outfit/loadout/f13citizen/vault
	name = "Vault Refugee"
	uniform = /obj/item/clothing/under/f13/vault
	gloves = /obj/item/pda
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		)

/datum/outfit/loadout/f13citizen/worker
	name = "Town Worker"
	belt = /obj/item/storage/belt/utility/full
	head = /obj/item/clothing/head/hardhat
	glasses = /obj/item/clothing/glasses/welding

/datum/outfit/loadout/f13citizen/gangster
	name = "Gangster"
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit = /obj/item/clothing/suit/armored/light/leather_jacket
	uniform = /obj/item/clothing/under/f13/raiderrags
	backpack_contents = list(
		/obj/item/twohanded/baseball/spiked = 1,
		/obj/item/gun/ballistic/revolver/hobo/knucklegun = 1
		)

/*--------------------------------------------------------------*/

/datum/job/kebab/f13radiohost
	title = "Radio Host"
	flag = F13RADIOHOST
	total_positions = 2
	spawn_positions = 2 // why does this have two positions?
	supervisors = "no one"
	description = "You are the radio host, one of the town's few independent residents. You control the pre-war radio tower, and are expected to provide regular broadcasts and news to the surrounding wasteland. You are tolerated by the town's factions because of your ability to advertise for them, but none of them has thus far managed to assimilate you into their own group."

	outfit = /datum/outfit/job/kebab/f13radiohost

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/kebab/f13radiohost
	name = "Radio Host"
	jobtype = /datum/job/kebab/f13radiohost

	uniform = /obj/item/clothing/under/f13/jamrock
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	glasses = /obj/item/clothing/glasses/sunglasses/big
	r_pocket = /obj/item/gun/ballistic/revolver/police
	shoes = /obj/item/clothing/shoes/laceup
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/megaphone = 1,
		/obj/item/pda = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1)
