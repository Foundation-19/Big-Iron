/datum/job/kebab
	exp_type = EXP_TYPE_FALLOUT
	faction = FACTION_KEBAB

/datum/job/kebab/f13scab
	title = "Scab"
	flag = F13SCAB
	department_flag = DEP_KEBAB
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	description = "Welcome to Kebab, you're a deadbeat parasite infesting the slums of this shanty town. You have no inherent rights, the established locals look down upon you, and you've probably earned that."
	selection_color = "#c3d5d5"

	outfit = /datum/outfit/job/kebab/f13scab

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


/datum/outfit/job/kebab/f13scab
	name = "Scab"
	jobtype = /datum/job/kebab/f13scab
	ears = null
	belt = null
	id = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/storage/bag/money/small/raider = 1,
		)
/datum/outfit/job/den/f13settler/pre_equip(mob/living/carbon/human/H)
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

	mask = pick(
		/obj/item/clothing/mask/facewrap,
		/obj/item/clothing/mask/paper,
		/obj/item/clothing/mask/rat,
		/obj/item/clothing/mask/rat/raven,
		/obj/item/clothing/mask/pig,
		/obj/item/clothing/mask/rat/bear,
		/obj/item/clothing/mask/rat/fox,
		/obj/item/clothing/mask/gas/tiki_mask)

	r_hand = pick(
		/obj/item/gun/ballistic/revolver/hobo/knifegun,
		/obj/item/gun/ballistic/revolver/hobo/pepperbox,
		/obj/item/gun/ballistic/revolver/hobo/knucklegun,
		/obj/item/gun/ballistic/automatic/hobo/zipgun,
		/obj/item/kitchen/knife/butcher,
		/obj/item/reagent_containers/pill/patch/jet,
		/obj/item/reagent_containers/pill/patch/turbo,
		/obj/item/reagent_containers/hypospray/medipen/psycho,
		/obj/item/reagent_containers/hypospray/medipen/medx)
/*--------------------------------------------------------------*/

/datum/job/kebab/f13radiohost
	title = "Radio Host"
	flag = F13RADIOHOST
	department_flag = DEP_KEBAB
	total_positions = 2
	spawn_positions = 2
	supervisors = "no one"
	description = "You are the radio host, one of the town's few independent residents. You control the pre-war radio tower, and are expected to provide regular broadcasts and news to the surrounding wasteland. You are tolerated by the town's factions because of your ability to advertise for them, but none of them has thus far managed to assimilate you into their own group."
	selection_color = "#c3d5d5"

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