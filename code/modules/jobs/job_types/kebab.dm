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
	ears = /obj/item/radio/headset/headset_merchant_leader
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
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/merchant)

/*--------------------------------------------------------------*/
/datum/job/kebab/f13highconstable
	title = "Kebab High Constable"
	flag = F13CONSTABLE
	total_positions = 1
	spawn_positions = 1
	supervisors = "No one, but works with and under the Merchant, Militia Commander and High Priest."
	description = "The High Constable is the man or woman that serves as link and bridge to all faction in Kebab. They are in fact a 4th leader making sure that all factions works together in that chaotic harmony, and must remain impartial. They also have the power to judge and procescute criminals, and grant citizenship. They have a control over the militia (but orders from the Militia Commander takes priority)."
	exp_requirements = 0

	loadout_options = list(
		/datum/outfit/loadout/diplomat,
		/datum/outfit/loadout/exgeneral,
		/datum/outfit/loadout/peacewalker,
		/datum/outfit/loadout/rustwalkerchief
		)

	outfit = /datum/outfit/job/kebab/f13highconstable
	access = list(ACCESS_COTC,ACCESS_MILITIA,ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_COTC,ACCESS_MILITIA,ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINING, ACCESS_GATEWAY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/kebab/f13highconstable
	name = "Kebab High Constable"
	jobtype = /datum/job/kebab/f13highconstable
	ears = /obj/item/radio/headset/headset_constable
	id = /obj/item/card/id/dogtag/sheriff
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/military
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/f13/military
	uniform = /obj/item/clothing/under/suit/checkered
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/megaphone = 1
		)

/datum/outfit/loadout/diplomat
	name = "Merchant Diplomat"
	backpack_contents = list(
			/obj/item/ammo_box/a357box = 2,
			/obj/item/grenade/flashbang = 1,
			/obj/item/gun/ballistic/revolver/colt357/mateba = 1,
			/obj/item/clothing/under/suit/charcoal = 1,
			/obj/item/clothing/head/helmet/armyhelmet = 1,
			/obj/item/clothing/suit/armored/medium/steelbib/town = 1,
			/obj/item/storage/briefcase/secretary = 1,
			/obj/item/stack/f13Cash/caps/onezerozero = 2,
			/obj/item/clothing/glasses/f13/sunglasses/big = 1
			)

/datum/outfit/loadout/peacewalker
	name = "Peacewalker Raider"
	backpack_contents = list(
			/obj/item/ammo_box/a357box = 2,
			/obj/item/grenade/flashbang = 1,
			/obj/item/gun/ballistic/revolver/colt357/mateba = 1,
			/obj/item/clothing/suit/armor/f13/ghostechoe = 1,
			/obj/item/stack/f13Cash/caps/onezerozero = 2,
			/obj/item/clothing/head/helmet/skull/bone = 1,
			/obj/item/clothing/under/f13/general = 1,
			)

/datum/outfit/loadout/priest
	name = "Priest chosen one"
	backpack_contents = list(
			/obj/item/ammo_box/a357box = 2,
			/obj/item/grenade/flashbang = 1,
			/obj/item/gun/ballistic/revolver/colt357/mateba = 1,
			/obj/item/clothing/head/hopcap/beret/white = 1,
			/obj/item/clothing/suit/hooded/robes/grey = 1,
			/obj/item/stack/f13Cash/caps/onezerozero = 2,
			/obj/item/clothing/neck/mantle/commander = 1,
			/obj/item/clothing/under/f13/chaplain = 1,
			)

/datum/outfit/loadout/rustwalkerchief
	name = "Rustwalker chief"
	backpack_contents = list(
			/obj/item/stock_parts/cell/ammo/ecp = 4,
			/obj/item/kinetic_crusher = 1,
			/obj/item/clothing/head/helmet/riot/vaultsec = 1,
			/obj/item/clothing/suit/f13/tribal/heavy/rustwalkers = 1,
			/obj/item/gun/energy/laser/rcw = 1,
			/obj/item/clothing/under/f13/rustwalkers = 1,
			/obj/item/clothing/under/f13/female/rustwalkers = 1,
			/obj/item/stack/f13Cash/caps/onezerozero = 2,
			/obj/item/clothing/head/helmet/f13/tribal = 1
			)


/*--------------------------------------------------------------*/
/datum/job/kebab/f13mechanic
	title = "Mechanic"
	flag = F13MECHANIC
	total_positions = 3
	spawn_positions = 3
	supervisors = "The Merchant."
	description = "You main the small garage in Kebab. Your job is to make profit by repairing cars, and offer recharges, or cell changes. You can sell car equiepement."
	exp_requirements = 0

	loadout_options = list(
		/datum/outfit/loadout/kebabmechanic,
		/datum/outfit/loadout/rustwalkermechanic,
		)

	outfit = /datum/outfit/job/kebab/f13mechanic
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_MINING)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/kebab,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/kebab,
		),
	)

/datum/outfit/job/kebab/f13mechanic
	name = "Mechanic"
	jobtype = /datum/job/kebab/f13mechanic
	ears = /obj/item/radio/headset/headset_town
	id = /obj/item/card/id/dogtag/town
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/military
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/workboots/mining
	uniform = /obj/item/clothing/under/rank/engineering/engineer/mechanic

/datum/outfit/loadout/kebabmechanic
	name = "Merchant Mechanic"
	backpack_contents = list(
			/obj/item/ammo_box/magazine/greasegun = 2,
			/obj/item/gun/ballistic/automatic/smg/greasegun = 1,
			/obj/item/clothing/under/f13/petrochico = 1,
			/obj/item/toy/crayon/spraycan = 1,
			/obj/item/clothing/head/welding/weldingjapan = 1
			)

/datum/outfit/loadout/rustwalkermechanic
	name = "Rustwalker"
	backpack_contents =  list(
		/obj/item/clothing/under/f13/female/rustwalkers  = 1,
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/suit/f13/tribal/light/rustwalkers = 1,
		/obj/item/kinetic_crusher/glaive = 1,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/clothing/head/welding/weldingfire = 1,
		/obj/item/gun/energy/laser/wattz/recharger = 1
		)


/*--------------------------------------------------------------*/
/datum/job/kebab/f13militiacom
	title = "Militia Commander"
	flag = F13MILITIACOM
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Merchant"
	description = "You command kebab's militia and have been placed in charge of the town's defense and maintaining order in the streets. They also have authority over the Blackwater deputies."
	exp_requirements = 0

	loadout_options = list(
		/datum/outfit/loadout/policeboss,
		/datum/outfit/loadout/exgeneral,
		/datum/outfit/loadout/punkking,
		/datum/outfit/loadout/vaultseccaptain
		)

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
	ears = /obj/item/radio/headset/militiacom
	id = /obj/item/card/id/dogtag/sheriff
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/military
	belt = /obj/item/storage/belt/military/assault
	neck = /obj/item/storage/belt/holster/legholster/police
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/f13/military
	uniform = /obj/item/clothing/under/f13/police/formal
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2
		)

/datum/outfit/loadout/policeboss
	name = "Boss of the Police"
	backpack_contents = list(
			/obj/item/ammo_box/magazine/m5mm = 2,
			/obj/item/melee/classic_baton/police = 1,
			/obj/item/grenade/flashbang = 1,
			/obj/item/clothing/head/helmet/riot = 1,
			/obj/item/clothing/suit/armor/vest/blueshirt = 1,
			/obj/item/gun/ballistic/automatic/assault_carbine/policerifle = 1,
			/obj/item/clothing/neck/mantle/commander = 1,
			/obj/item/clothing/head/f13/police/sergeant = 1,
			/obj/item/clothing/suit/f13/police = 1,
			/obj/item/clothing/mask/gas/sechailer = 1
			)

/datum/outfit/loadout/exgeneral
	name = "Ex general"
	backpack_contents = list(
			/obj/item/ammo_box/magazine/m556/rifle/assault = 2,
			/obj/item/melee/classic_baton/police = 1,
			/obj/item/grenade/flashbang = 1,
			/obj/item/clothing/head/helmet/riot = 1,
			/obj/item/clothing/suit/armor/f13/combat/swat = 1,
			/obj/item/gun/ballistic/automatic/assault_rifle = 1,
			/obj/item/clothing/neck/mantle/commander = 1,
			/obj/item/clothing/head/f13/army/general = 1,
			/obj/item/clothing/under/f13/general = 1,
			/obj/item/clothing/mask/gas/sechailer = 1
			)

/datum/outfit/loadout/punkking
	name = "Punk King"
	backpack_contents = list(
			/obj/item/ammo_box/magazine/tommygunm45 = 2,
			/obj/item/melee/classic_baton/police = 1,
			/obj/item/grenade/flashbang = 1,
			/obj/item/clothing/head/helmet/f13/combat/mk2/raider = 1,
			/obj/item/clothing/suit/armor/f13/raider/reptiliatenebris = 1,
			/obj/item/gun/ballistic/automatic/smg/tommygun = 1,
			/obj/item/clothing/neck/mantle/commander = 1,
			/obj/item/clothing/under/f13/densuit = 1,
			/obj/item/clothing/mask/gas/sechailer = 1
			)

/datum/outfit/loadout/vaultseccaptain
	name = "Vault Captain Remnant"
	backpack_contents = list(
			/obj/item/stock_parts/cell/ammo/mfc = 4,
			/obj/item/melee/classic_baton/police = 1,
			/obj/item/grenade/flashbang = 1,
			/obj/item/clothing/head/helmet/riot/vaultsec = 1,
			/obj/item/clothing/suit/armor/f13/battlecoat/vault = 1,
			/obj/item/gun/energy/laser/aer12 = 1,
			/obj/item/clothing/neck/mantle/commander = 1,
			/obj/item/clothing/under/f13/vault = 1,
			/obj/item/clothing/head/caphat/formal/fedcover/medsci = 1,
			/obj/item/clothing/mask/gas/sechailer = 1
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
	supervisors = "the Merchant, High Constable and Militia commander"
	description = "Welcome to Kebab, you by some means or another have found yourself to be a resident of this shanty town. You are free to do as your please, to find work, commit petty theft, perhaps you are a member of the town militia attempting to keep the town in order and relative peace."

	outfit = /datum/outfit/job/kebab/f13citizen

	loadout_options = list(
		/datum/outfit/loadout/f13citizen/nouveauriche,
		/datum/outfit/loadout/f13citizen/pusher,
		/datum/outfit/loadout/f13citizen/ncrsettler,
		/datum/outfit/loadout/f13citizen/vault,
		/datum/outfit/loadout/f13citizen/worker,
		/datum/outfit/loadout/f13citizen/gangster,
		/datum/outfit/loadout/f13citizen/settlerprospector,
		/datum/outfit/loadout/f13citizen/settlerfarmer,
		/datum/outfit/loadout/f13citizen/settlergambler,
		/datum/outfit/loadout/f13citizen/legionsubject,
		/datum/outfit/loadout/f13citizen/settlermerchant,
		/datum/outfit/loadout/f13citizen/settlerdoc,
		/datum/outfit/loadout/f13citizen/rustwalker
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

/datum/outfit/loadout/f13citizen/legionsubject
	name = "Legion subject"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/keksweater
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy
	shoes = /obj/item/clothing/shoes/f13/military/fashion/cowboy_boots
	suit = /obj/item/clothing/suit/f13/cowboygvest
	belt = /obj/item/storage/belt/holster/rugged/revolver_357
	suit_store = /obj/item/melee/onehanded/machete
	backpack_contents = list(
		/obj/item/card/id/dogtag/town/legion = 1,
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		/obj/item/brahminbridle = 1,
		/obj/item/brahminsaddle = 1,
		/obj/item/brahminbrand = 1,
		/obj/item/melee/smith/hammer/premade = 1
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

/datum/outfit/loadout/f13citizen/nouveauriche
	name = "Nouveau Riche"
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit = /obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy
	uniform = /obj/item/clothing/under/rank/civilian/victorianblackdress
	backpack_contents = list(
		/obj/item/clothing/under/suit/tan = 1,
		/obj/item/clothing/under/rank/civilian/victorian_purple = 1,
		/obj/item/clothing/under/suit/black/skirt = 1,
		/obj/item/clothing/under/dress/sundress = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/stack/f13Cash/caps/onezerozero = 2
		)

/datum/outfit/loadout/f13citizen/settlermerchant
	name = "General Trader"
	uniform = /obj/item/clothing/under/f13/merchant
	head = /obj/item/clothing/head/f13/stormchaser
	glasses = /obj/item/clothing/glasses/f13/biker
	r_hand = /obj/item/gun/ballistic/revolver/detective
	l_hand = /obj/item/crowbar/smithedunitool
	backpack_contents =  list(/obj/item/storage/box/vendingmachine = 1,
							/obj/item/storage/bag/money/small/settler = 1,
							/obj/item/ammo_box/c38box = 2,
							/obj/item/storage/keys_set = 1,
							/obj/item/radio/headset/headset_bw = 1,
							/obj/item/reagent_containers/food/snacks/f13/caravanlunch = 1
							)

/datum/outfit/loadout/f13citizen/settlerdoc
	name = "Barber-Doctor"
	uniform = /obj/item/clothing/under/f13/westender
	gloves = /obj/item/clothing/gloves/color/latex
	neck = /obj/item/clothing/neck/apron/chef
	r_hand = /obj/item/melee/onehanded/straight_razor
	l_hand = /obj/item/cosmetics/haircomb
	backpack_contents =  list(/obj/item/reagent_containers/medspray/synthflesh = 2,
							/obj/item/healthanalyzer = 1,
							/obj/item/reagent_containers/glass/bottle/epinephrine = 2,
							/obj/item/cosmetics/mirror_makeup = 1,
							/obj/item/storage/firstaid/ancient = 1,
							/obj/item/clothing/neck/stethoscope = 1,
							/obj/item/radio/headset/headset_bw = 1,
							/obj/item/book/granter/trait/lowsurgery = 1
							)


/datum/outfit/loadout/f13citizen/settlerfarmer
	name = "Frontier Farmer"
	suit = /obj/item/clothing/suit/overalls/farmer
	head = /obj/item/clothing/head/f13/ranger_hat/tan
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	r_hand = /obj/item/hatchet
	l_hand = /obj/item/cultivator/rake
	backpack_contents =  list(/obj/item/pickaxe/mini = 1,
		/obj/item/reagent_containers/glass/bucket/wood = 1,
		/obj/item/reagent_containers/glass/bottle/nutrient/ez = 3,
		/obj/item/storage/bag/plants = 1,
		/obj/item/radio/headset/headset_bw = 1,
		/obj/item/reagent_containers/spray/pestspray = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		/obj/item/ammo_box/shotgun/improvised = 1,
		/obj/item/brahminbridle = 1,
		/obj/item/brahminsaddle = 1,
		/obj/item/brahminbags = 1,
		/obj/item/seeds/tato = 1,
		/obj/item/seeds/xander = 1,
		/obj/item/seeds/poppy/broc = 1,
		/obj/item/seeds/mutfruit = 1,
		/obj/item/seeds/ambrosia = 1
		)

/datum/outfit/loadout/f13citizen/settlerprospector
	name = "Wasteland Prospector"
	uniform = /obj/item/clothing/under/f13/rustic
	belt = /obj/item/storage/belt/utility/waster 
	glasses = /obj/item/clothing/glasses/welding
	neck = /obj/item/storage/belt/holster/rugged
	r_hand = /obj/item/storage/bag/salvage 
	l_hand = /obj/item/gun/ballistic/revolver/colt357
	backpack_contents =  list(/obj/item/ammo_box/a357 = 1,
		/obj/item/ammo_box/a357box/improvised = 1,
		/obj/item/radio/headset/headset_bw = 1,
		/obj/item/book/granter/trait/trekking = 1
		)
		
/datum/outfit/loadout/f13citizen/settlerpoacher
	name = "Wasteland Poacher"
	suit = /obj/item/clothing/suit/armored/light/leathersuit
	suit_store = /obj/item/gun/ballistic/automatic/varmint
	r_hand = /obj/item/ammo_box/magazine/m556/rifle/small
	l_hand = /obj/item/melee/onehanded/knife/bowie
	backpack_contents =  list(/obj/item/ammo_box/a556/sport/improvised = 1,
		/obj/item/ammo_box/a357box/improvised = 1,
		/obj/item/book/granter/trait/trekking = 1,
		/obj/item/radio/headset/headset_bw = 1,
		/obj/item/reagent_containers/food/snacks/meatsalted = 2
		)
		
/datum/outfit/loadout/f13citizen/settlergambler
	name = "Frontier Gambler"
	uniform = /obj/item/clothing/under/f13/densuit
	suit = /obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy 
	head = /obj/item/clothing/head/f13/gambler
	r_hand = /obj/item/gun/ballistic/revolver/detective
	l_hand = /obj/item/storage/bag/money/small/wastelander
	backpack_contents =  list(/obj/item/storage/fancy/cigarettes/cigpack_bigboss  = 1,
		/obj/item/ammo_box/c38box/improvised = 1,
		/obj/item/reagent_containers/food/drinks/flask = 1,
		/obj/item/toy/cards/deck = 1,
		/obj/item/radio/headset/headset_bw = 1,
		/obj/item/dice = 1
		)

/datum/outfit/loadout/f13citizen/rustwalker
	name = "Rustwalker"
	belt = /obj/item/storage/belt/utility/full
	head = /obj/item/clothing/head/hardhat
	glasses = /obj/item/clothing/glasses/welding
	backpack_contents =  list(/obj/item/clothing/under/f13/female/rustwalkers  = 1,
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/suit/f13/tribal/light/rustwalkers = 1,
		/obj/item/kinetic_crusher/glaive = 1,
		/obj/item/gun/energy/laser/wattz/recharger = 1
		)

//Militian

/datum/job/kebab/f13militian
	title = "Militian"
	flag = F13MILITIA
	total_positions = 4
	spawn_positions = 4
	supervisors = "The Militia commander"
	description = "You are a normal citizen that decided to take arms to defend the town."
	outfit = /datum/outfit/job/kebab/f13militian

	loadout_options = list(
		/datum/outfit/loadout/f13militian/badasscop,
		/datum/outfit/loadout/f13militian/reformedraider,
		/datum/outfit/loadout/f13militian/vaultsec,
		/datum/outfit/loadout/f13militian/bwcowboy,
		/datum/outfit/loadout/f13militian/volunteer)

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

/datum/outfit/job/kebab/f13militian/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca,
		/obj/item/clothing/under/f13/mercc,
		/obj/item/clothing/under/f13/cowboyb,
		/obj/item/clothing/under/f13/cowboyg,
		/obj/item/clothing/under/f13/doctor,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/pants/f13/ghoul)

	shoes = pick(
		/obj/item/clothing/shoes/f13/explorer,)

/datum/outfit/job/kebab/f13militian
	name = "Militian"
	jobtype = /datum/job/kebab/f13militian
	ears = null
	belt = /obj/item/storage/belt/holster/legholster/police
	ears = /obj/item/radio/headset/militia
	id = /obj/item/card/id/dogtag/deputy/kebab
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/ammo_box/a357 = 3,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/melee/classic_baton = 1,
		)
	
/datum/outfit/loadout/f13militian/reformedraider
	name = "Reformed Raider"
	glasses = /obj/item/clothing/glasses/sunglasses
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/shankduster = 1,
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/clothing/head/helmet/skull = 1,
		/obj/item/reagent_containers/pill/patch/jet = 2,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 2,
		/obj/item/reagent_containers/hypospray/medipen/medx = 2,
		)

/datum/outfit/loadout/f13militian/badasscop
	name = "Badass Cop"
	glasses = /obj/item/clothing/glasses/sunglasses
	backpack_contents = list(
		/obj/item/clothing/under/f13/police/trooper = 1,
		/obj/item/clothing/suit/armored/light/vest/bulletproof = 1,
		/obj/item/clothing/head/f13/police = 1,
		/obj/item/clothing/neck/mantle/commander =1,
		/obj/item/gun/ballistic/automatic/pistol/beretta/automatic = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		)
	
/datum/outfit/loadout/f13militian/volunteer
	name = "Volunteer"
	glasses = /obj/item/clothing/glasses/sunglasses
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/metalarmor/steelbib/oasis = 1,
		/obj/item/clothing/head/helmet/blueshirt = 1,
		/obj/item/gun/ballistic/automatic/m1garand = 1,
		/obj/item/ammo_box/magazine/garand308 = 2
		)

/datum/outfit/loadout/f13militian/bwcowboy
	name = "Blackwater Cowboy"
	glasses = /obj/item/clothing/glasses/sunglasses
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/town/deputy = 1,
		/obj/item/clothing/head/helmet/blueshirt = 1,
		/obj/item/storage/belt/holster/rugged/revolver_357 = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/clothing/head/f13/town/deputy = 1,
		/obj/item/clothing/suit/armor/f13/town/deputy = 1,
		/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots = 1,
		/obj/item/radio/headset/headset_bw = 1,
		)

/datum/outfit/loadout/f13militian/vaultsec
	name = "Vault sec Remnant"
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/town/deputy = 1,
		/obj/item/clothing/under/f13/vault = 1,
		/obj/item/clothing/head/helmet/riot/vaultsec = 1,
		/obj/item/clothing/suit/armor/vest/oasis = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		)
/*--------------------------------------------------------------*/

/datum/job/kebab/f13radiohost
	title = "Radio Host"
	flag = F13RADIOHOST
	total_positions = 2
	spawn_positions = 2
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
	l_pocket = /obj/item/circuitboard/radio_station
	shoes = /obj/item/clothing/shoes/laceup
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/megaphone = 1,
		/obj/item/pda = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1)
