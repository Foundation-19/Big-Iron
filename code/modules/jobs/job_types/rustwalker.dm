/datum/job/rustwalker //do NOT use this for anything, it's just to store faction datums
	department_flag = RUSTWALKER
	selection_color = "#ff8080"
	faction = FACTION_RUSTWALKER
	exp_type = EXP_TYPE_RUSTWALKER

	access = list(ACCESS_DEN)
	access = list(ACCESS_DEN)
	forbids = "Betraying tribe secrets. Use of addictive chems outside of alcohol and nicotine."
	enforces = "Bravery and honor in battle. Respecting the customs of the tribe and Kebab."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/rustwalker,
			/datum/job/kebab
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/rustwalker,
			/datum/job/kebab
			),
		)

//LISTENER

/datum/job/rustwalker/f13listener
	title = "Listener"
	flag = F13LISTENER
	display_order = JOB_DISPLAY_ORDER_F13LISTENER
	total_positions = 1
	spawn_positions = 1
	description = "You are the listener, the leadership of the tribe. You are the most technologically capable of the rustwalkers, and have a talent for fixing machines. You run the tribes generator, make the executive decisions for the tribe, and lead it in times of war."
	supervisors = "the Machine"
	outfit = /datum/outfit/job/rustwalker/f13listener

/datum/outfit/job/rustwalker/f13listener
	name = "Listener"
	jobtype	= /datum/job/rustwalker/f13listener
	id = /obj/item/card/id/outcasttattoo
	belt = /obj/item/storage/backpack/spearquiver
	ears = /obj/item/radio/headset/headset_rustwalker
	head = /obj/item/clothing/head/helmet/f13/wastewarhat
	suit = /obj/item/clothing/suit/f13/tribal/heavy/rustwalkers
	uniform = /obj/item/clothing/under/f13/rustwalkers
	shoes = /obj/item/clothing/shoes/f13/military/plated
	glasses	= /obj/item/clothing/glasses/welding
	gloves = /obj/item/clothing/gloves/color/yellow
	suit_store = /obj/item/twohanded/spear/scrapspear
	backpack_contents = list(
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/book/granter/crafting_recipe/tribal/rustwalkers = 1
		)
/*
/datum/outfit/job/rustwalker/f13listener/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	switch(H.gender)
		if(FEMALE)
			uniform = /obj/item/clothing/under/f13/female/rustwalkers
		if(MALE)
			uniform = /obj/item/clothing/under/f13/rustwalkers
*/ //This seems to not be working for some reason.

//RUSTWALKER

/datum/job/rustwalker/f13rustwalker
	title = "Rustwalker"
	flag = F13RUSTWALKER
	display_order = JOB_DISPLAY_ORDER_F13RUSTWALKER
	total_positions = 6
	spawn_positions = 6
	description = "You are a member of the Rustwalker tribe. Your loyalty is to the tribe and it's leader. You answer to the listener(s), and obey their instructions."
	supervisors = "the Listener"

	outfit = /datum/outfit/job/rustwalker/f13rustwalker

/datum/outfit/job/rustwalker/f13rustwalker
	name = "Rustwalker"
	jobtype	= /datum/job/ncr/f13rustwalker
	id = /obj/item/card/id/outcasttattoo
	belt = /obj/item/storage/backpack/spearquiver
	ears = /obj/item/radio/headset/headset_rustwalker
	head = /obj/item/clothing/head/helmet/f13/wastewarhat
	suit = /obj/item/clothing/suit/f13/tribal/light/rustwalkers
	uniform = /obj/item/clothing/under/f13/rustwalkers
	shoes = /obj/item/clothing/shoes/f13/military/plated
	glasses	= /obj/item/clothing/glasses/welding
	gloves = /obj/item/clothing/gloves/color/yellow
	suit_store = /obj/item/twohanded/spear/scrapspear
	backpack_contents = list(
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/book/granter/crafting_recipe/tribal/rustwalkers = 1
		)
/*
/datum/outfit/job/rustwalker/f13rustwalker/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	switch(H.gender)
		if(FEMALE)
			uniform = /obj/item/clothing/under/f13/female/rustwalkers
		if(MALE)
			uniform = /obj/item/clothing/under/f13/rustwalkers
*/ //This seems to not be working for some reason.
