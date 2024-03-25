/datum/job/church
	department_flag = CHURCH
	selection_color = "#d580ff"
	faction = FACTION_CHURCH
	exp_type = EXP_TYPE_CHURCH

/datum/job/church/f13highpriest
	title = "High Priest"
	flag = F13HIGHPRIEST
	head_announce = list("Security")
	department_flag = CHURCH
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Holy Father"
	req_admin_notify = 1
	description = "You are the leader of the Church, at least for now. Your sworn duty is to expand and protect the faith, through any means necessary, in preparation for the day of retribution that is to come. You are the spiritual leader of the faith, and are expected to give sermons, advise members, and perform all major rituals. You are beholden to no one but the Father above, and the Servitors answer directly to you."
	selection_color = "#c167ee"
	forbids = "Exposing the secrets of the Church, fraternizing with the NCR, treating patients for nothing in return, consuming alcohol, and using chems."
	enforces = "Preaching the faith, following the faith's internal structure and rules."
	exp_type = EXP_TYPE_CHURCH
	exp_requirements = 130

	outfit = /datum/outfit/job/church/f13highpriest
	access = list(ACCESS_COTC, ACCESS_COTC_ARMORY, ACCESS_COTC_SECRET)
	minimal_access = list(ACCESS_COTC, ACCESS_COTC_ARMORY, ACCESS_COTC_SECRET)

	loadout_options = list(
		/datum/outfit/loadout/beckoner,		//
		/datum/outfit/loadout/minister,	//
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/church,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/church,
		),
	)

/datum/outfit/job/church/f13highpriest
	name = "High Priest"
	jobtype = /datum/job/church/f13highpriest

	id = /obj/item/card/id/yuma/cotc/brand
	uniform = /obj/item/clothing/under/f13/chaplain
	suit = /obj/item/clothing/suit/hooded/robes/cotc/highpriest
	suit_store = /obj/item/gun/energy/laser/plasma/pistol
	ears = /obj/item/radio/headset/headset_church
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = null
	l_pocket = /obj/item/storage/bag/money/small/den
	r_pocket = /obj/item/flashlight/glowstick
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/book/manual/thebook = 1,
		/obj/item/book/manual/ritualbook = 1,
		/obj/item/book/manual/thebook/purple = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/fancy/candle_box = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		)
/datum/outfit/job/church/f13highpriest/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.grant_language(/datum/language/shorthand)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/church)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)

/datum/outfit/loadout/beckoner
	name = "Beckoner of His Truth"
	suit_store = /obj/item/gun/energy/gammagun
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/harbingermantle = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/reagent_containers/glass/bottle/FEV_solution/two = 2
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 4
		)

/datum/outfit/loadout/minister
	name = "Minister of His Mercy"
	suit_store = /obj/item/gun/energy/ionrifle
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/storage/box/medicine/stimpaks/stimpaks5 = 4
		)

/*--------------------------------------------------------------*/

/datum/job/church/f13servitor
	title = "Servitor"
	flag = F13SERVITOR
	department_flag = CHURCH
	total_positions = 2
	spawn_positions = 2
	supervisors = "the High Priest and the Holy Father"
	description = "You are an inducted member of the Church's inner circle, sworn to protect the faith's secrets and further the faith's interests. You know of the secrets that dwell in the faith's inner sanctum, and you know what is at stake if they are discovered. You are the High Priests eyes and ears, directing the acolytes and carrying out his wishes. You command the acolytes and answer directly to the High Priest."
	selection_color = "#d580ff"
	forbids = "Exposing the secrets of the Church, fraternizing with the NCR, treating patients for nothing in return, consuming alcohol, and using chems."
	enforces = "Preaching the faith, following the faith's internal structure and rules."
	exp_type = EXP_TYPE_CHURCH
	exp_requirements = 100

	outfit = /datum/outfit/job/church/f13servitor
	access = list(ACCESS_COTC, ACCESS_COTC_ARMORY, ACCESS_COTC_SECRET)
	minimal_access = list(ACCESS_COTC, ACCESS_COTC_ARMORY, ACCESS_COTC_SECRET)

	loadout_options = list(
		/datum/outfit/loadout/bulwark,		//
		/datum/outfit/loadout/sovereign,	//
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/church,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/church,
		),
	)

/datum/outfit/job/church/f13servitor
	name = "Servitor"
	jobtype = /datum/job/church/f13servitor

	id = /obj/item/card/id/yuma/cotc/brand
	uniform = /obj/item/clothing/under/f13/chaplain
	suit = /obj/item/clothing/suit/hooded/robes/cotc/servitor
	ears = /obj/item/radio/headset/headset_church
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	duffelbag =	/obj/item/storage/backpack/duffelbag/med
	gloves = null
	l_pocket = null
	r_pocket = /obj/item/storage/bag/money/small/settler
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/book/manual/thebook = 1,
		/obj/item/book/manual/ritualbook = 1,
		/obj/item/stack/medical/bruise_pack = 1,
		/obj/item/restraints/handcuffs/cable = 1,
		)

/datum/outfit/job/church/f13servitor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.grant_language(/datum/language/shorthand)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/church)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)

/datum/outfit/loadout/proselytizer
	name = "Bulwark of His Faith"
	suit_store = /obj/item/twohanded/sledgehammer/atomsjudgement
	backpack_contents = list(
		/obj/item/melee/classic_baton = 1,
		/obj/item/restraints/legcuffs/bola = 3,
		/obj/item/clothing/suit/armored/heavy/recycled_power = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1
		)

/datum/outfit/loadout/healer
	name = "Soverign of His Grace"
	suit_store = /obj/item/gun/energy/laser/wattz2k
	backpack_contents = list(
		/obj/item/book/granter/trait/midsurgery = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/clothing/suit/chaplain/witchhunter = 1,
		/obj/item/clothing/head/helmet/chaplain/witchunter_hat = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 5
		)

/*--------------------------------------------------------------*/

/datum/job/church/f13acolyte
	title = "Acolyte"
	flag = F13ACOLYTE
	department_flag = CHURCH
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Servitors and the Holy Father"
	description = "You are the strong right arm of the Church. You answer directly to the Servitor Militant. Your role is to guard the Church, put pressure upon outsiders, drum up business with your bludgeon, and collect debts."
	selection_color = "#d580ff"
	forbids = "Exposing the secrets of the Church, fraternizing with the NCR, treating patients for nothing in return, consuming alcohol, and using chems."
	enforces = "Preaching the faith, following the faith's internal structure and rules."
	exp_type = EXP_TYPE_CHURCH
	exp_requirements = 0

	outfit = /datum/outfit/job/church/f13acolyte
	access = list(ACCESS_COTC, ACCESS_COTC_ARMORY)
	minimal_access = list(ACCESS_COTC, ACCESS_COTC_ARMORY)

	loadout_options = list(
		/datum/outfit/loadout/proselytizer,		//
		/datum/outfit/loadout/healer,	//
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/church,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/church,
		),
	)

/datum/outfit/job/church/f13acolyte
	name = "Acolyte"
	jobtype = /datum/job/church/f13acolyte

	id = /obj/item/card/id/yuma/cotc/brand
	uniform = /obj/item/clothing/under/f13/brahminm
	ears = /obj/item/radio/headset/headset_church
	backpack = /obj/item/storage/backpack/satchel/sec
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = null
	l_pocket = null
	r_pocket = null
	shoes = /obj/item/clothing/shoes/f13/rag
	backpack_contents = list(
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/book/manual/ritualbook = 1,
		/obj/item/book/manual/thebook = 1
		)

/datum/outfit/job/church/f13acolyte/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/church)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)

/datum/outfit/loadout/proselytizer
	name = "Enforcer of His Debts"
	suit = /obj/item/clothing/suit/armor/riot/knight/tabard
	suit_store = /obj/item/gun/energy/laser/aer9
	backpack_contents = list(
		/obj/item/clothing/suit/hooded/robes/cotc/acolyte = 1,
		/obj/item/melee/classic_baton = 1,
		/obj/item/melee/unarmed/sappers = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1
		)

/datum/outfit/loadout/healer
	name = "Healer of His Vitality"
	suit = /obj/item/clothing/suit/hooded/robes/cotc/acolyte
	backpack_contents = list(
		/obj/item/book/granter/trait/midsurgery = 1,
		/obj/item/storage/box/medicine/stimpaks/stimpaks5 = 2
		)

/*--------------------------------------------------------------*/

/datum/job/church/f13neophyte
	title = "Neophyte"
	flag = F13NEOPHYTE
	department_flag = CHURCH
	total_positions = 4
	spawn_positions = 4
	supervisors = "Servitors and up"
	description = "By some means or another you have become indebted to the Church. There was none to pay your debt, so all that was left was to give your body and mind to the Church. Attend to menial duties such as cleaning, farming, and cooking."
	selection_color = "#d580ff"
	forbids = "Exposing the secrets of the Church, fraternizing with the NCR, treating patients for nothing in return, consuming alcohol, and using chems."
	enforces = "Preaching the faith, following the faith's internal structure and rules."
	exp_type = EXP_TYPE_CHURCH
	exp_requirements = 0

	outfit = /datum/outfit/job/church/neophyte

	loadout_options = list(
		/datum/outfit/loadout/neophyte/enforcer,
		/datum/outfit/loadout/neophyte/healer,
		/datum/outfit/loadout/neophyte/sanitation,
		/datum/outfit/loadout/neophyte/gardener,
		)

	access = list(ACCESS_COTC)
	minimal_access = list(ACCESS_COTC)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/church,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/church,
		),
	)

/datum/outfit/job/church/neophyte
	name = "Neophyte"
	jobtype = /datum/job/church/f13neophyte

	id = /obj/item/card/id/yuma/cotc/brand
	ears = 	/obj/item/radio/headset/headset_church
	suit = /obj/item/clothing/suit/hooded/robes/cotc
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = null
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/f13/rag
	backpack_contents = list(
		/obj/item/book/manual/thebook = 1)

/datum/outfit/job/church/neophyte/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/church)
	uniform = pick(
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahminm,
		/obj/item/clothing/under/f13/raiderharness,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/raiderrags)

/datum/outfit/loadout/neophyte/enforcer
	name = "Enforcer"
	backpack_contents = list(
		/obj/item/melee/classic_baton = 1,
		/obj/item/restraints/handcuffs/cable = 1,
		/obj/item/restraints/legcuffs/bola = 1
		)

/datum/outfit/loadout/neophyte/healer
	name = "Healer"
	backpack_contents = list(
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/stack/medical/bruise_pack = 1
		)

/datum/outfit/loadout/neophyte/sanitation
	name = "Janitor"
	backpack_contents = list(
		/obj/item/mop = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/storage/bag/trash = 1
		)

/datum/outfit/loadout/neophyte/gardener
	name = "Gardener"
	backpack_contents = list(
		/obj/item/cultivator = 1,
		/obj/item/hatchet = 1,
		/obj/item/shovel/spade = 1,
		/obj/item/storage/bag/plants = 1
		)
