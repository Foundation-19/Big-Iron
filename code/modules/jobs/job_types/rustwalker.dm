/datum/job/rustwalker //do NOT use this for anything, it's just to store faction datums
	department_flag = RUSTWALKER
	selection_color = "#ffeeaa"
	faction = FACTION_RUSTWALKER
	exp_type = EXP_TYPE_RUSTWALKER

	access = list(ACCESS_RUSTWALKER)
	access = list(ACCESS_RUSTWALKER)
	forbids = "Betraying tribe secrets. Use of addictive chems outside of alcohol and nicotine."
	expects = "Bravery and honor in battle. Respecting the customs of the tribe and Kebab."

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
	flag = F13LISTERN
	display_order = JOB_DISPLAY_ORDER_LISTENER
	total_positions = 1
	spawn_positions = 1
	description = "You are the listener, the leadership of the tribe. You are the most technologically capable of the rustwalkers, and have a talent for fixing machines. You run the tribes generator, make the executive decisions for the tribe, and lead it in times of war."
	supervisors = "the Machine"
	outfit = /datum/outfit/job/ncr/f13rustwalker

/datum/outfit/job/rustwalker/f13rustwalker
	name = "Rustwalker"
	jobtype	= /datum/job/ncr/f13trooper
	id = /obj/item/card/id/tribetattoo
	belt = /obj/item/storage/backpack/spearquiver
	head = /obj/item/clothing/head/f13/wastewarhat
	suit = /obj/item/clothing/suit/f13/tribal/heavy/rustwalkers
	shoes = /obj/item/clothing/shoes/f13/military/plated
	glasses	= /obj/item/clothing/glasses/welding
	gloves = /obj/item/gloves/chameleon/insulated
	suit_store = /obj/item/twohanded/spear/scrapspear
	backpack_contents = list(
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/book/granter/crafting_recipe/tribal/rustwalkers = 1
		)

/datum/outfit/job/rustwalker/f13rustwalker/pre_equip(mob/living/carbon/human/H)
		..()
	if(visualsOnly)
		return
	switch(H.gender)
	if(FEMALE)
		uniform = /obj/item/clothing/under/f13/female/rustwalkers
	if(MALE)
		uniform = /obj/item/clothing/under/f13/rustwalkers


//RUSTWALKER

/datum/job/rustwalker/f13rustwalker
	title = "Rustwalker"
	flag = F13RUSTWALKER
	display_order = JOB_DISPLAY_ORDER_RUSTWALKER
	total_positions = 6
	spawn_positions = 6
	description = "You are a member of the Rustwalker tribe. Your loyalty is to the tribe and it's leader. You answer to the listener(s), and obey their instructions."
	supervisors = "the Listener"

	outfit = /datum/outfit/job/ncr/f13rustwalker

/datum/outfit/job/rustwalker/f13rustwalker
	name = "Rustwalker"
	jobtype	= /datum/job/ncr/f13trooper
	id = /obj/item/card/id/tribetattoo
	belt = /obj/item/storage/backpack/spearquiver
	head = /obj/item/clothing/head/f13/wastewarhat
	suit = /obj/item/clothing/suit/f13/tribal/light/rustwalkers
	shoes = /obj/item/clothing/shoes/f13/military/plated
	glasses	= /obj/item/clothing/glasses/welding
	gloves = /obj/item/gloves/chameleon/insulated
	suit_store = /obj/item/twohanded/spear/scrapspear
	backpack_contents = list(
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/book/granter/crafting_recipe/tribal/rustwalkers = 1
		)

/datum/outfit/job/rustwalker/f13rustwalker/pre_equip(mob/living/carbon/human/H)
		..()
	if(visualsOnly)
		return
	switch(H.gender)
	if(FEMALE)
		uniform = /obj/item/clothing/under/f13/female/rustwalkers
	if(MALE)
		uniform = /obj/item/clothing/under/f13/rustwalkers