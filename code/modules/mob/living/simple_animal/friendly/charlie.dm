//Kinda like a cow but
/mob/living/simple_animal/charlie
	name = "big charlie"
	desc = "Known for their milk, just don't tip them over."
	icon = 'icons/fallout/mobs/animals/farmanimals96.dmi'
	icon_state = "charlie"
	icon_living = "charlie"
	icon_dead = "charlie_dead"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("moo?","moo","MOOOOOO")
	speak_emote = list("moos","moos hauntingly")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 6)
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 50
	maxHealth = 50
	var/obj/item/udder/udder = null
	var/datum/reagent/milk_reagent = /datum/reagent/consumable/milk
	var/food_type = /obj/item/reagent_containers/food/snacks/grown/wheat
	gold_core_spawnable = FRIENDLY_SPAWN
	var/is_calf = 0
	var/has_calf = 0
	var/young_type = null
	blood_volume = 480

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/cow/Initialize()
	udder = new(null, milk_reagent)
	. = ..()

/mob/living/simple_animal/cow/Destroy()
	qdel(udder)
	udder = null


/mob/living/simple_animal/cow/attackby(obj/item/O, mob/user, params)

	return ..()

/mob/living/simple_animal/cow/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return

/mob/living/simple_animal/cow/on_attack_hand(mob/living/carbon/M)
	new /mob/living/simple_animal/nugget(get_turf(src))
	new /mob/living/simple_animal/nugget(get_turf(src))
	..()

/obj/item/charlieegg
	name = "lil nugget"
	desc = "A tiny"
	icon = 'icons/fallout/objects/food&drinks/food.dmi'
	icon_state = "nugget"
	icon_living = "nugget"


//The Goobers
/mob/living/simple_animal/nugget
	name = "lil nugget"
	desc = "A tiny"
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "nugget"
	icon_living = "nugget"
	icon_dead = "nugget_dead"
	icon_gib = "brahmin_gib"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("glorp")
	speak_emote = list("glorps")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 6)
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 20
	maxHealth = 20
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/nugget/Initialize()
	..()
	addtimer(CALLBACK(src, .proc/Evolve), 3 MINUTES)

/mob/living/simple_animal/nugget/proc/Evolve()
	if(prob(50))
		new /mob/living/simple_animal/voidnugg (get_turf(src))
	else
		new /mob/living/simple_animal/lamb (get_turf(src))
	qdel(src)

/mob/living/simple_animal/voidnugg
	name = "void nugget"
	desc = "A tiny nugget of meat."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "voidnugget"
	icon_living = "voidnugget"
	icon_dead = "voidnugget_dead"
	icon_gib = "brahmin_gib"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("glorp")
	speak_emote = list("glorps")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 6)
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 20
	maxHealth = 20
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/lamb
	name = "lamb"
	desc = "A tiny"
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "lamb"
	icon_living = "lamb"
	icon_dead = "lamb_dead"
	icon_gib = "brahmin_gib"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("glorp")
	speak_emote = list("glorps")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	speak_chance = 0
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 6)
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 20
	maxHealth = 20
	footstep_type = FOOTSTEP_MOB_SHOE
