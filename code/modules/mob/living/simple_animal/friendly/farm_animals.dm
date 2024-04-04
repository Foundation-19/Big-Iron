// In this document: Goat, Chicken, Brahmin, Radstag, Bighorner (also cow but extinct so basically brahmin)

//////////
// GOAT //
//////////

/mob/living/simple_animal/hostile/retaliate/goat
	name = "goat"
	desc = "Not known for their pleasant disposition."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "goat"
	icon_living = "goat"
	icon_dead = "goat_dead"
	speak = list("EHEHEHEHEH","eh?")
	speak_emote = list("brays")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.", "stamps a foot.", "glares around.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4)
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	faction = list("neutral")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	attack_same = 1
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 40
	maxHealth = 40
	melee_damage_lower = 1
	melee_damage_upper = 2
	environment_smash = ENVIRONMENT_SMASH_NONE
	stop_automated_movement_when_pulled = 1
	blood_volume = 480
	var/obj/item/udder/udder = null
	var/datum/reagent/milk_reagent = /datum/reagent/consumable/milk

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/retaliate/goat/Initialize(/datum/reagent/milk_reagent)
	if(milk_reagent)
		src.milk_reagent = milk_reagent
	udder = new (null, src.milk_reagent)
	. = ..()

/mob/living/simple_animal/hostile/retaliate/goat/Destroy()
	qdel(udder)
	udder = null
	return ..()

/mob/living/simple_animal/hostile/retaliate/goat/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(stat == CONSCIOUS)
		//chance to go crazy and start wacking stuff
		if(!enemies.len && prob(1))
			Retaliate()

		if(enemies.len && prob(10))
			enemies = list()
			LoseTarget()
			src.visible_message("<span class='notice'>[src] calms down.</span>")
		udder.generateMilk(milk_reagent)
		eat_plants()
		if(!pulledby)
			for(var/direction in shuffle(list(1,2,4,8,5,6,9,10)))
				var/step = get_step(src, direction)
				if(step)
					if(locate(/obj/structure/spacevine) in step || locate(/obj/structure/glowshroom) in step)
						Move(step, get_dir(src, step))

/mob/living/simple_animal/hostile/retaliate/goat/Retaliate()
	..()
	src.visible_message("<span class='danger'>[src] gets an evil-looking gleam in [p_their()] eye.</span>")

/mob/living/simple_animal/hostile/retaliate/goat/Move()
	. = ..()
	if(!stat)
		eat_plants()

/mob/living/simple_animal/hostile/retaliate/goat/proc/eat_plants()
	var/eaten = FALSE
	var/obj/structure/spacevine/SV = locate(/obj/structure/spacevine) in loc
	if(SV)
		SV.eat(src)
		eaten = TRUE

	var/obj/structure/glowshroom/GS = locate(/obj/structure/glowshroom) in loc
	if(GS)
		qdel(GS)
		eaten = TRUE

	if(eaten && prob(10))
		say("Nom")

/mob/living/simple_animal/hostile/retaliate/goat/attackby(obj/item/O, mob/user, params)
	if(stat == CONSCIOUS && istype(O, /obj/item/reagent_containers/glass))
		udder.milkAnimal(O, user)
		return 1
	else
		return ..()


/mob/living/simple_animal/hostile/retaliate/goat/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		if(istype(H.dna.species, /datum/species/pod))
			var/obj/item/bodypart/NB = pick(H.bodyparts)
			H.visible_message("<span class='warning'>[src] takes a big chomp out of [H]!</span>", \
								  "<span class='userdanger'>[src] takes a big chomp out of your [NB]!</span>")
			NB.dismember()
//cow
/mob/living/simple_animal/cow
	name = "cow"
	desc = "Known for their milk, just don't tip them over."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "brahmin"
	icon_living = "brahmin"
	icon_dead = "brahmin_dead"
	icon_gib = "brahmin_gib"
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
	health = 25
	maxHealth = 25
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
	return ..()

/mob/living/simple_animal/cow/attackby(obj/item/O, mob/user, params)
	if(stat == CONSCIOUS && istype(O, /obj/item/reagent_containers/glass))
		udder.milkAnimal(O, user)
		return 1
	else if(stat == CONSCIOUS && istype(O, food_type))
		if(is_calf)
			visible_message("<span class='alertalien'>[src] adorably chews the [O].</span>")
			qdel(O)
		if(!has_calf && !is_calf)
			has_calf = 1
			visible_message("<span class='alertalien'>[src] hungrily consumes the [O].</span>")
			qdel(O)
		else
			visible_message("<span class='alertalien'>[src] absently munches the [O].</span>")
			qdel(O)
	else
		return ..()

/mob/living/simple_animal/cow/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(stat == CONSCIOUS)
		if((prob(3) && has_calf))
			has_calf++
		if(has_calf > 10)
			has_calf = 0
			visible_message("<span class='alertalien'>[src] gives birth to a calf.</span>")
			new young_type(get_turf(src))

		if(is_calf)
			if((prob(3)))
				is_calf = 0
				resize = 1.3
				update_transform()
				udder = new()
				if (name == "brahmin calf")
					name = "brahmin"
				else
					name = "cow"
				visible_message("<span class='alertalien'>[src] has fully grown.</span>")
		else
			udder.generateMilk(milk_reagent)

/mob/living/simple_animal/cow/on_attack_hand(mob/living/carbon/M)
	if(!stat && M.a_intent == INTENT_DISARM && icon_state != icon_dead)
		M.visible_message("<span class='warning'>[M] tips over [src].</span>",
			"<span class='notice'>You tip over [src].</span>")
		to_chat(src, "<span class='userdanger'>You are tipped over by [M]!</span>")
		DefaultCombatKnockdown(60,ignore_canknockdown = TRUE)
		icon_state = icon_dead
		spawn(rand(20,50))
			if(!stat && M)
				icon_state = icon_living
				var/external
				var/internal
				switch(pick(1,2,3,4))
					if(1,2,3)
						var/text = pick("imploringly.", "pleadingly.",
							"with a resigned expression.")
						external = "[src] looks at [M] [text]"
						internal = "You look at [M] [text]"
					if(4)
						external = "[src] seems resigned to its fate."
						internal = "You resign yourself to your fate."
				visible_message("<span class='notice'>[external]</span>",
					"<span class='revennotice'>[internal]</span>")
	else
		..()

//a cow that produces a random reagent in its udder
/mob/living/simple_animal/cow/random
	name = "strange cow"
	desc = "Something seems off about the milk this cow is producing."

/mob/living/simple_animal/cow/random/Initialize()
	milk_reagent = get_random_reagent_id() //this has a blacklist so don't worry about romerol cows, etc
	..()

//Wisdom cow, speaks and bestows great wisdoms
/mob/living/simple_animal/cow/wisdom
	name = "wisdom cow"
	desc = "Known for its wisdom, shares it with all"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/wisdomcow = 1) //truly the best meat
	gold_core_spawnable = FALSE
	speak_chance = 10 //the cow is eager to share its wisdom! //but is wise enough to not lag  the server too bad
	milk_reagent = /datum/reagent/medicine/liquid_wisdom

/mob/living/simple_animal/cow/wisdom/Initialize()
	. = ..()
	speak = GLOB.wisdoms //Done here so it's setup properly


/////////////
// CHICKEN //
/////////////

/mob/living/simple_animal/chick
	name = "\improper chick"
	desc = "Adorable! They make such a racket though."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "chick"
	icon_living = "chick"
	icon_dead = "chick_dead"
	icon_gib = "chick_gib"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("Cherp.","Cherp?","Chirrup.","Cheep!")
	speak_emote = list("cheeps")
	emote_hear = list("cheeps.")
	emote_see = list("pecks at the ground.","flaps its tiny wings.")
	density = FALSE
	speak_chance = 2
	turns_per_move = 2
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/chicken = 1)
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	health = 3
	maxHealth = 3
	ventcrawler = VENTCRAWLER_ALWAYS
	var/amount_grown = 0
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_TINY
	gold_core_spawnable = FRIENDLY_SPAWN
	var/mutation = null
	footstep_type = FOOTSTEP_MOB_CLAW

/mob/living/simple_animal/chick/Initialize()
	. = ..()
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)

/mob/living/simple_animal/chick/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(!stat && !ckey)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			if(mutation)
				new mutation(loc)
				qdel(src)
			else
				new /mob/living/simple_animal/chicken(loc)
				qdel(src)

/mob/living/simple_animal/chick/holo/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	amount_grown = 0

/mob/living/simple_animal/chicken
	name = "\improper chicken"
	desc = "Hopefully the eggs are good this season."
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "chicken_brown"
	icon_living = "chicken_brown"
	icon_dead = "chicken_brown_dead"
	speak = list("Cluck!","BWAAAAARK BWAK BWAK BWAK!","Bwaak bwak.")
	speak_emote = list("clucks","croons")
	emote_hear = list("clucks.")
	emote_see = list("pecks at the ground.","flaps its wings viciously.")
	density = FALSE
	speak_chance = 2
	turns_per_move = 3
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/chicken = 2)
	var/egg_type = /obj/item/reagent_containers/food/snacks/egg
	var/list/food_type = list(WHEAT, PUNGA, CHILI, WATERMELON, STEELCAPS, GRAPES) //BIG IRON edit, many types of foods
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	health = 15
	maxHealth = 15
	ventcrawler = VENTCRAWLER_ALWAYS
	var/eggsleft = 0
	var/eggsFertile = TRUE
	var/body_color
	var/icon_prefix = "chicken"
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SIZE_SMALL
	var/list/feedMessages = list("It clucks happily.","It clucks happily.")
	var/list/layMessage = EGG_LAYING_MESSAGES
	var/list/validColors = list("brown","black","white")
	gold_core_spawnable = FRIENDLY_SPAWN
	var/static/chicken_count = 0
	var/pungajuice = 0//BIG IRON EDIT -start- punga juice used to force normal eggs
	var/parentegg = /obj/item/reagent_containers/food/snacks/egg//here it would be the previous mutation type of egg (soon(tm))
	var/list/avaiblemuts = list()// list of eggs that can be spawned
	var/list/mutationbars = list()//progress toward archieving a specific egg type
	var/cheery = FALSE//is the chicken enchanced? BIG IRON EDIT-End-
	var/list/feathers = list(/obj/item/feather/chicken = 2)
	footstep_type = FOOTSTEP_MOB_CLAW

/mob/living/simple_animal/chicken/Initialize()
	. = ..()
	if(!body_color)
		body_color = pick(validColors)
	icon_state = "[icon_prefix]_[body_color]"
	icon_living = "[icon_prefix]_[body_color]"
	icon_dead = "[icon_prefix]_[body_color]_dead"
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)
	++chicken_count
	butcher_results += feathers

/mob/living/simple_animal/chicken/Destroy()
	--chicken_count
	return ..()

/mob/living/simple_animal/chicken/handle_automated_movement()//BIG IRON EDIT -start- chech to see if there's food below, eat it instead of walking
	if(eggsleft < 8)
		for(var/obj/item/O in loc)
			var/isfood = FALSE
			for(var/I = 1, I <= food_type.len, I++)
				var/obj/item/Foodie = food_type[I]
				if(istype(O, Foodie))
					isfood = TRUE
			if(isfood == TRUE)
				feed(O)
				return
	. = ..()
/obj/item/feather/chicken
	name = "Chicken feather"
	desc = "a feather from a common chicken."
	icon_state = "feather-chicken"

//BIG IRON EDIT -end-
/mob/living/simple_animal/chicken/attackby(obj/item/O, mob/user, params)
	var/isfood = FALSE//BIG IRON EDIT -start- checks if the item you use is acceptable as food
	for(var/I = 1, I <= food_type.len, I++)
		var/obj/item/Foodie = food_type[I]
		if(istype(O, Foodie))
			isfood = TRUE
	if(isfood == TRUE)
		feed(O)
	else
		..()// check ends here

/mob/living/simple_animal/chicken/proc/feed(obj/item/yums)//The actual feeding
	if(!stat && eggsleft < 8)
		eggsleft += rand(1, 4)
		if(istype(yums, PUNGA))
			pungajuice += 10
		if(istype(yums, CHILI))
			mutationbars["Fire_Wings"] += 20
		if(istype(yums, WATERMELON))
			mutationbars["Water_Wings"] += 20
		if(istype(yums, STEELCAPS))
			mutationbars["Iron_Wings"] += 20
		if(istype(yums, GRAPES))
			mutationbars["Alcoholic_Wings"] += 20
		qdel(yums)
		visible_message("<span class='warning'>[name] eats the [yums]!</span>")
	else
		visible_message("<span class='warning'>[name] doesn't seem hungry!</span>")//BIG IRON EDIT -end

/mob/living/simple_animal/chicken/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if((!stat && prob(3) && eggsleft > 0) && egg_type)
		var/p //BIG IRON EDIT-start- handles egg lying and it's type
		for(p in mutationbars)// check to see if there are any archieved mutations
			if(mutationbars[p] >= 100)
				AddMutation(p)
		if(avaiblemuts.len && prob(50))
			var/eggmutation = pick(avaiblemuts)
			if(eggmutation == "Fire_Wings")
				egg_type = /obj/item/reagent_containers/food/snacks/egg/firegg
			if(eggmutation == "Water_Wings")
				egg_type = /obj/item/reagent_containers/food/snacks/egg/wategg
			if(eggmutation == "Iron_Wings")
				egg_type = /obj/item/reagent_containers/food/snacks/egg/ironegg
			if(eggmutation == "Alcoholic_Wings")
				egg_type = /obj/item/reagent_containers/food/snacks/egg/winegg
		visible_message("<span class='alertalien'>[src] [pick(layMessage)]</span>")
		eggsleft--
		if(pungajuice >= 100)//Feeding punga makes it spit a normal egg
			egg_type = parentegg
			pungajuice -= 10
		var/obj/item/E = new egg_type(get_turf(src))
		if(cheery == TRUE)// happy chickens make double the eggs
			new E
		egg_type = initial(egg_type)// BIG IRON EDIT -end-
		E.pixel_x = rand(-6,6)
		E.pixel_y = rand(-6,6)
		if(eggsFertile)
			if(chicken_count < MAX_CHICKENS && prob(25))
				START_PROCESSING(SSobj, E)

/mob/living/simple_animal/chicken/proc/AddMutation(mutation)//BIG IRON EDIT -start- when a mutation reachs 100 points, the chicken will have the option to make those eggs
	if(!avaiblemuts.Find("[mutation]"))
		avaiblemuts.Add(mutation)
//BIG IRON EDIT -end
/obj/item/reagent_containers/food/snacks/egg/var/amount_grown = 0
/obj/item/reagent_containers/food/snacks/egg/process()
	if(isturf(loc))
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			visible_message("[src] hatches with a quiet cracking sound.")
			var/C = new /mob/living/simple_animal/chick(loc)
			var/mob/living/simple_animal/chick/newchick = C
			if(mutation)
				newchick.mutation = mutation
			STOP_PROCESSING(SSobj, src)
			qdel(src)
	else
		STOP_PROCESSING(SSobj, src)
//CHICKEN TYPES

//FIRE CHICKEN
/mob/living/simple_animal/chicken/fire
	name = "\improper Fire chicken"
	desc = "Spicy Wings."
	icon_state = "chicken_fire"
	icon_living = "chicken_fire"
	icon_dead = "chicken_fire_dead"
	egg_type = /obj/item/reagent_containers/food/snacks/egg/firegg
	food_type = list(WHEAT, PUNGA)
	validColors = list("fire")
	parentegg = /obj/item/reagent_containers/food/snacks/egg
	feathers = list(/obj/item/feather/chicken/fire = 2)

/obj/item/feather/chicken/fire
	name = "Fire feather"
	desc = "a hot feather, good for burning."
	icon = 'icons/obj/objects.dmi'
	icon_state = "feather-chicken-fire"
	force = 15
	damtype = BURN
	light_range = 6
	light_power = 9
	light_color = "#ebb17a"
	slot_flags = ITEM_SLOT_NECK


/obj/item/feather/chicken/fire/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_RESISTHEAT))
		return FALSE
	var/hit_zone = (C.held_index_to_dir(C.active_hand_index) == "l" ? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = C.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(0, force))
			C.update_damage_overlays()
	to_chat(C, "<span class='userdanger'>The feather burns your bare hand!</span>")
	return TRUE


//each egg has at least 3 kind of uses: self use, feeding use and a throw use
/*FIRE EGGS
SElF USE: makes a pretty neat welder
FEED USE: gives one use of fire breath
throw use: makes a firy explosion and works as a flash*/
/obj/item/reagent_containers/food/snacks/egg/firegg// BIG IRON EDIT start-
	name = "Fire egg"
	desc = "this egg is warm to the touch"
	list_reagents = list(/datum/reagent/fuel = 20)
	filling_color = "#f14f04"
	var/obj/effect/proc_holder/spell/power = /obj/effect/proc_holder/spell/aimed/firebreath
	icon_state = "egg-firegg"
	mutation = /mob/living/simple_animal/chicken/fire

/obj/item/reagent_containers/food/snacks/egg/firegg/attack_self(mob/user)
	to_chat(user, "<span class='notice'>you crack open a bit of the top of the egg.</span>")
	var/newwelder = new /obj/item/weldingtool/eggdingtool(user.drop_location())
	qdel(src)
	user.put_in_active_hand(newwelder)

/obj/item/reagent_containers/food/snacks/egg/firegg/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/turf/T = get_turf(hit_atom)
	SplashReagents(T)
	explosion(T, 0, 0, 0, 2, TRUE, FALSE, 2)
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/firegg/attack(mob/living/M, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	to_chat(user, "you feed the [src] to [M]")
	power = new power()
	power.action_background_icon_state = "bg_tech_blue_on"
	power.panel = "Temporary"
	M.AddSpell(power)
	addtimer(CALLBACK(M, /mob/living.proc/RemoveSpell, power), 60 SECONDS)
	qdel(src)
// WATER CHICKEN

/mob/living/simple_animal/chicken/water
	name = "\improper Water chicken"
	desc = "Transparent liquid ooze from it's skin, so it's always wet."
	icon_state = "chicken_water"
	icon_living = "chicken_water"
	icon_dead = "chicken_water_dead"
	egg_type = /obj/item/reagent_containers/food/snacks/egg/wategg
	food_type = list(WHEAT, PUNGA)
	validColors = list("water")
	parentegg = /obj/item/reagent_containers/food/snacks/egg
	feathers = list(/obj/item/feather/chicken/water = 2)

/obj/item/feather/chicken/water
	name = "Water feather"
	desc = "no matter how much time it passes, it never dries0"
	icon = 'icons/obj/objects.dmi'
	icon_state = "feather-chicken-water"


/obj/item/feather/chicken/water/attack(mob/living/M, mob/living/user, attackchain_flags, damage_multiplier)
	. = ..()
	M.ExtinguishMob()
	playsound(loc, 'sound/effects/slosh.ogg', 25, TRUE)

/obj/item/feather/chicken/water/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/RG = W
		if(RG.is_refillable())
			if(!RG.reagents.holder_full())
				RG.reagents.add_reagent(/datum/reagent/water, RG.volume - RG.reagents.total_volume)
				to_chat(user, "<span class='notice'>You fill [RG] from [src].</span>")
				return TRUE
			to_chat(user, "<span class='notice'>\The [RG] is full.</span>")
			return FALSE


/*SElF USE: wets everything in a 2x2 area, extinguishing fires and wetting floors
FEED USE: clear mutations by feeding mutadone
throw use: make some foam */
/obj/item/reagent_containers/food/snacks/egg/wategg
	name = "Water egg"
	desc = "this egg is always a bit wet"
	list_reagents = list(/datum/reagent/water/purified = 20)
	filling_color = "#788ce2"
	icon_state = "egg-wategg"
	mutation = /mob/living/simple_animal/chicken/water

/obj/item/reagent_containers/food/snacks/egg/wategg/attack_self(mob/user)
	for(var/turf/open/T in range(2, user))
		T.MakeSlippery(TURF_WET_WATER, min_wet_time = 10 SECONDS, wet_time_to_add = 5 SECONDS)
		for(var/obj/O in T)
			O.water_act(5)
			O.extinguish()
		for(var/mob/living/L in T)
			L.water_act(5)
			L.adjust_fire_stacks(-2.5)
			L.ExtinguishMob()
	playsound(src.loc, 'sound/effects/extinguish.ogg', 75, 1, -3)
	user.visible_message("<span class='warning'>the [src] is crushed and water flush out!!</span>")
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/wategg/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/turf/T = get_turf(hit_atom)
	var/datum/reagents/rs = new()
	rs.add_reagent_list(list_reagents)
	var/datum/effect_system/foam_spread/s = new()
	s.set_up(10, T, rs)
	s.start()
	visible_message("<span class='danger'>Foam spews out from [src]</span>")
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/wategg/attack(mob/living/M, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	to_chat(user, "you feed the [src] to [M]")
	M.reagents.add_reagent(/datum/reagent/medicine/mutadone, 5)
	to_chat(M, "you feel cleaner")
	qdel(src)
/* IRON EGG
SElF USE: creates 15 sheets of metal and 5 plasteel
FEED USE: creates 15 sheets of glass and 5 reinforced glass
throw use: hurts and knocksback
WHEN DESTROYED: create 2 egg shells that can be used as caltrops or knifes */

/mob/living/simple_animal/chicken/iron
	name = "\improper Iron chicken"
	desc = "it's feather are hard and sharp, weights quite a bit."
	icon_state = "chicken_iron"
	icon_living = "chicken_iron"
	icon_dead = "chicken_iron_dead"
	egg_type = /obj/item/reagent_containers/food/snacks/egg/ironegg
	food_type = list(WHEAT, PUNGA)
	validColors = list("iron")
	parentegg = /obj/item/reagent_containers/food/snacks/egg
	feathers = list(/obj/item/feather/chicken/iron = 2)

/obj/item/feather/chicken/iron
	name = "Iron feather"
	desc = "a sharp, heavy feather, with an aerodynamic desing."
	icon = 'icons/obj/objects.dmi'
	icon_state = "feather-chicken-iron"
	force = 20
	throwforce = 23
	armour_penetration = 0.25
	bare_wound_bonus = 15
	throw_speed = 5
	throw_range = 7
	embedding = list("pain_mult" = 4, "embed_chance" = 70, "fall_chance" = 5)

/obj/item/reagent_containers/food/snacks/egg/ironegg
	name = "Iron egg"
	desc = "this egg is hard as steel"
	icon_state = "egg-ironegg"
	list_reagents = list(/datum/reagent/iron = 15)
	filling_color = "#6464669a"
	throwforce = 15
	custom_materials = list(/datum/material/iron=40000, /datum/material/glass=40000, /datum/material/plasma=5000)
	mutation = /mob/living/simple_animal/chicken/iron
	var/throw_distance = 1
	var/knockback_anchored = FALSE

/obj/item/reagent_containers/food/snacks/egg/ironegg/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(iscarbon(hit_atom))
		var/mob/living/carbon/M = hit_atom
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src.thrownby, get_step_away(M, src.thrownby)))
		M.safe_throw_at(throw_target, 1, 3)
	src.visible_message("<span class ='warning'>The flying [src] shatters on impact!</span>")
	Destroy()

/obj/item/reagent_containers/food/snacks/egg/ironegg/Destroy()
	playsound(src, 'sound/effects/bang.ogg', 100, 0)
	new /obj/item/ironegg_shell(get_turf(src))
	new /obj/item/ironegg_shell(get_turf(src))
	..()

/obj/item/ironegg_shell
	name = "Iron Egg shell"
	desc = "A broken shard of the shell of an iron egg. Kinda Sharp."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "egg-ironegg-shell1"
	w_class = WEIGHT_CLASS_TINY
	force = 5
	throwforce = 8
	attack_verb = list("stabbed", "slashed", "sliced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	resistance_flags = ACID_PROOF
	armor = list("melee" = 100, "bullet" = 0, "laser" = 0, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 100)
	max_integrity = 40
	sharpness = SHARP_EDGED

/obj/item/ironegg_shell/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is slitting [user.p_their()] [pick("wrists", "throat")] with the record disk shard! It looks like [user.p_theyre()] trying to commit suicide.</span>")
	return (BRUTELOSS)

/obj/item/ironegg_shell/Initialize()
	. = ..()
	AddComponent(/datum/component/caltrop, force)
	AddComponent(/datum/component/butchering, 150, 65)
	icon_state = "egg-ironegg-shell[rand(1, 2)]"
	pixel_x = rand(-8, 8)
	pixel_y = rand(-8, 8)

/obj/item/ironegg_shell/afterattack(atom/A as mob|obj, mob/user, proximity) //Shamelessly ripped from glass shard code
	. = ..()
	if(!proximity || !(src in user))
		return
	if(isturf(A))
		return
	if(istype(A, /obj/item/storage))
		return
	var/hit_hand = ((user.active_hand_index % 2 == 0) ? "r_" : "l_") + "arm"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!H.gloves && !HAS_TRAIT(H, TRAIT_PIERCEIMMUNE)) // golems, etc
			to_chat(H, "<span class='warning'>[src] cuts into your hand!</span>")
			H.apply_damage(force*0.5, BRUTE, hit_hand)
	else if(ismonkey(user))
		var/mob/living/carbon/monkey/M = user
		if(!HAS_TRAIT(M, TRAIT_PIERCEIMMUNE))
			to_chat(M, "<span class='warning'>[src] cuts into your hand!</span>")
			M.apply_damage(force*0.5, BRUTE, hit_hand)

/obj/item/reagent_containers/food/snacks/egg/ironegg/attack_self(mob/user)
	var/turf/location = get_turf(user)
	new /obj/item/stack/sheet/plasteel(location, 5)
	new /obj/item/stack/sheet/metal(location, 15)
	user.visible_message("<span class='warning'>the [src] is crushed and condensed into usable materials!</span>")
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/ironegg/attack(mob/living/M, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	to_chat(user, "you feed the [src] to [M]")
	M.reagents.add_reagent(/datum/reagent/iron, 5)
	var/turf/location = get_turf(M)
	new /obj/item/stack/sheet/rglass(location, 5)
	new /obj/item/stack/sheet/glass(location, 15)
	M.visible_message("[src] spits out some glass!")
	qdel(src)

//WINE  CHICKEN

/mob/living/simple_animal/chicken/wine
	name = "\improper Wine chicken"
	desc = "it stumbles with each step and slurs her cluckings."
	icon_state = "chicken_wine"
	icon_living = "chicken_winee"
	icon_dead = "chicken_wine_dead"
	egg_type = /obj/item/reagent_containers/food/snacks/egg/winegg
	food_type = list(WHEAT, PUNGA)
	validColors = list("wine")
	parentegg = /obj/item/reagent_containers/food/snacks/egg
	feathers = list(/obj/item/feather/chicken/wine = 2)

/obj/item/feather/chicken/wine
	name = "Wine feather"
	desc = "smells strongly of alcohol."
	icon = 'icons/obj/objects.dmi'
	icon_state = "feather-chicken-wine"

/*WINE EGG
SElF USE: creates some random drinks
FEED USE: serves someone a random drink, if its a chicken makes them cheery
throw use: feed someone alcohol
*/

/obj/item/reagent_containers/food/snacks/egg/winegg
	name = "Wine egg"
	desc = "this egg smells like wine"
	icon_state = "egg-winegg"
	list_reagents = list(/datum/reagent/consumable/ethanol/wine = 20)
	filling_color = "#420232"
	mutation = /mob/living/simple_animal/chicken/wine

/obj/item/reagent_containers/food/snacks/egg/winegg/attack_self(mob/user)
	var/location = get_turf(user)
	for(var/i = 1, i <= 4 + rand(1,2), i++)
		var/chosen = get_random_drink()
		var/obj/B = new chosen(location)
		if(prob(50))
			for(var/j in 1 to rand(1, 3))
				step(B, pick(NORTH,SOUTH,EAST,WEST))
	playsound(src.loc, 'sound/effects/phasein.ogg', 75, 1, -3)
	user.visible_message("<span class='warning'>the [src] is alcohol pops out!!!</span>")
	qdel(src)

/obj/item/reagent_containers/food/snacks/egg/winegg/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(iscarbon(hit_atom))
		reagents.add_reagent_list(list_reagents)
		reagents.reaction(hit_atom, INGEST)
		reagents.trans_to(hit_atom, 10, log = TRUE)
		visible_message("<span class='danger'>[hit_atom] drinks from the [src]!</span>")
		qdel(src)
	else
		..()

/obj/item/reagent_containers/food/snacks/egg/winegg/attack(mob/living/M, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	to_chat(user, "you use the [src] on [M]")
	if(iscarbon(M))
		var/location = get_turf(M)
		var/boozetype = get_random_drink()
		var/booze = new boozetype(location)
		qdel(src)
		M.put_in_active_hand(booze)
		to_chat(M, "Hey free booze!!")
	else if(istype(M, /mob/living/simple_animal/chicken))
		var/mob/living/simple_animal/chicken/target = M
		target.cheery = TRUE
		M.visible_message("[M] eats the [src]! she seems really happy")
		qdel(src)
	else
		to_chat(user, "you crack the [src] with [M]'s head and reveal the riches inside")
		var/location = get_turf(M)
		var/boozetype = get_random_drink()
		var/booze = new boozetype(location)
		qdel(src)
		user.put_in_active_hand(booze)
//BIG IRON EDIT -end
///////////
// UDDER //
///////////

/obj/item/udder
	name = "udder"

/obj/item/udder/Initialize(loc, milk_reagent)
	if(!milk_reagent)
		milk_reagent = /datum/reagent/consumable/milk
	create_reagents(50, NONE, NO_REAGENTS_VALUE)
	reagents.add_reagent(milk_reagent, 20)
	. = ..()

/obj/item/udder/proc/generateMilk(datum/reagent/milk_reagent)
	if(prob(5))
		reagents.add_reagent(milk_reagent, rand(5, 10))

/obj/item/udder/proc/milkAnimal(obj/O, mob/user)
	var/obj/item/reagent_containers/glass/G = O
	if(G.reagents.total_volume >= G.volume)
		to_chat(user, "<span class='danger'>[O] is full.</span>")
		return
	var/transfered = reagents.trans_to(O, rand(5,10))
	if(transfered)
		user.visible_message("[user] milks [src] using \the [O].", "<span class='notice'>You milk [src] using \the [O].</span>")
	else
		to_chat(user, "<span class='danger'>The udder is dry. Wait a bit longer...</span>")



/////////////
// BRAHMIN //
/////////////

/mob/living/simple_animal/cow/brahmin
	name = "brahmin"
	desc = "Brahmin or brahma are mutated cattle with two heads and looking udderly ridiculous.<br>Known for their milk, just don't tip them over."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "brahmin"
	icon_living = "brahmin"
	icon_dead = "brahmin_dead"
	icon_gib = "brahmin_gib"
	speak = list("moo?","moo","MOOOOOO")
	speak_emote = list("moos","moos hauntingly")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	response_help_continuous  = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	young_type = /mob/living/simple_animal/cow/brahmin/calf
	emote_hear = list("brays.")
	var/obj/item/inventory_back
	speak_chance = 0.4
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/reagent_containers/food/snacks/rawbrahminliver = 1, /obj/item/reagent_containers/food/snacks/rawbrahmintongue = 2, /obj/item/stack/sheet/animalhide/brahmin = 3, /obj/item/stack/sheet/bone = 2)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/bone = 2)
	butcher_difficulty = 1

///////////////////////
//Dave's Brahmin Bags//
///////////////////////


	var/mob/living/owner = null
	var/follow = FALSE

	var/bridle = FALSE
	var/bags = FALSE
	var/collar = FALSE
	var/saddle = FALSE
	var/brand = ""

/mob/living/simple_animal/cow/brahmin/examine(mob/user)
	. = ..()
	desc = initial(desc)
	if(collar)
		desc += "<br>A collar with a tag etched '[name]' is hanging from its neck."
	if(brand)
		desc += "<br>It has a brand reading '[brand]' on its backside."
	if(bridle)
		desc += "<br>It has a bridle and reins attached to its head."
	if(bags)
		desc += "<br>It has some bags attached."
	if(saddle)
		desc += "<br>It has a saddle across its back."

/obj/item/brahminbags
	name = "brahmin bags"
	desc = "Attach these bags to a brahmin and leave the heavy lifting to them!"
	icon = 'icons/fallout/objects/storage.dmi'
	icon_state = "trekkerpack"

/obj/item/brahmincollar
	name = "brahmin collar"
	desc = "A collar with a piece of etched metal serving as a tag. Use this on a brahmin you own to rename them."
	icon = 'icons/mob/pets.dmi'
	icon_state = "petcollar"

/obj/item/brahminbridle
	name = "brahmin bridle gear"
	desc = "A set of headgear used to control and claim a brahmin. Consists of a bit, reins, and leather straps stored in a satchel."
	icon = 'icons/fallout/objects/tools.dmi'
	icon_state = "brahminbridle"

/obj/item/brahminsaddle
	name = "brahmin saddle"
	desc = "A saddle fit for a mutant beast of burden."
	icon = 'icons/fallout/objects/tools.dmi'
	icon_state = "brahminsaddle"

/obj/item/brahminbrand
	name = "brahmin branding tool"
	desc = "Use this on a brahmin to claim it as yours!"
	icon = 'icons/fallout/objects/tools.dmi'
	icon_state = "brahminbrand"

/datum/crafting_recipe/brahminbags
	name = "Brahmin bags"
	result = /obj/item/brahminbags
	time = 60
	reqs = list(/obj/item/storage/backpack/duffelbag = 2,
				/obj/item/stack/sheet/cloth = 5)
	tools = list(TOOL_WORKBENCH)
	subcategory = CAT_FARMING
	category = CAT_MISC

/datum/crafting_recipe/brahmincollar
	name = "Brahmin collar"
	result = /obj/item/brahmincollar
	time = 60
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_WORKBENCH)
	subcategory = CAT_FARMING
	category = CAT_MISC

/datum/crafting_recipe/brahminbridle
	name = "Brahmin bridle gear"
	result = /obj/item/brahminbridle
	time = 60
	reqs = list(/obj/item/stack/sheet/metal = 3,
				/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_WORKBENCH)
	subcategory = CAT_FARMING
	category = CAT_MISC

/datum/crafting_recipe/brahminsaddle
	name = "Brahmin saddle"
	result = /obj/item/brahminsaddle
	time = 60
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/sheet/leather = 4,
				/obj/item/stack/sheet/cloth = 1)
	tools = list(TOOL_WORKBENCH)
	subcategory = CAT_FARMING
	category = CAT_MISC

/datum/crafting_recipe/brahminbrand
	name = "Brahmin branding tool"
	result = /obj/item/brahminbrand
	time = 60
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/rods = 1)
	tools = list(TOOL_WORKBENCH)
	subcategory = CAT_FARMING
	category = CAT_MISC

/mob/living/simple_animal/cow/brahmin/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I,/obj/item/brahminbags))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead brahmin!</span>")
			return
		if(bags)
			to_chat(user, "<span class='warning'>The brahmin already has bags attached!</span>")
			return
		if(is_calf)
			to_chat(user, "<span class='warning'>The calf cannot carry the bags!</span>")
			return
		to_chat(user, "<span class='notice'>You add [I] to [src]...</span>")
		bags = TRUE
		qdel(I)
		src.ComponentInitialize()
		return

	if(istype(I,/obj/item/brahmincollar))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead brahmin!</span>")
			return
		if(user != owner)
			to_chat(user, "<span class='warning'>You need to claim the brahmin with a bridle before you can rename it!</span>")
			return

		name = stripped_input(user, "Choose a new name for your brahmin. [MAX_NAME_LEN] character limit.","Name", null, MAX_NAME_LEN)

		if(!name)
			return

		collar = TRUE
		to_chat(user, "<span class='notice'>You add [I] to [src]...</span>")
		message_admins("<span class='notice'>[ADMIN_LOOKUPFLW(user)] renamed a brahmin to [name].</span>") //So people don't name their brahmin the N-Word without notice
		qdel(I)
		return

	if(istype(I,/obj/item/brahminbridle))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead brahmin!</span>")
			return
		if(bridle)
			to_chat(user, "<span class='warning'>This brahmin already has a bridle!</span>")
			return

		owner = user
		bridle = TRUE
		tame = TRUE
		to_chat(user, "<span class='notice'>You add [I] to [src], claiming it as yours.</span>")
		qdel(I)
		return

	if(istype(I,/obj/item/brahminsaddle))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead brahmin!</span>")
			return
		if(saddle)
			to_chat(user, "<span class='warning'>This brahmin already has a saddle!</span>")
			return

		saddle = TRUE
		can_buckle = TRUE
		buckle_lying = FALSE
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8), TEXT_SOUTH = list(0, 8), TEXT_EAST = list(-2, 8), TEXT_WEST = list(2, 8)))
		D.set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)
		D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		D.set_vehicle_dir_layer(WEST, OBJ_LAYER)
		D.drive_verb = "ride"
		to_chat(user, "<span class='notice'>You add [I] to [src].</span>")
		qdel(I)
		return

	if(istype(I,/obj/item/brahminbrand))
		if(brand)
			to_chat(user, "<span class='warning'>This brahmin already has a brand!</span>")
			return

		brand = input("What would you like to brand on your brahmin?","Brand", brand)

		if(!brand)
			return

/mob/living/simple_animal/cow/brahmin/death(gibbed)
	. = ..()
	if(can_buckle)
		can_buckle = FALSE
	if(buckled_mobs)
		for(var/mob/living/M in buckled_mobs)
			unbuckle_mob(M)

/datum/component/storage/concrete/brahminbag
	max_w_class = WEIGHT_CLASS_HUGE //Allows the storage of shotguns and other two handed items.
	max_combined_w_class = 35
	max_items = 30
	drop_all_on_destroy = TRUE
	allow_big_nesting = TRUE


/mob/living/simple_animal/cow/brahmin/ComponentInitialize()
	if(!bags)
		return
	AddComponent(/datum/component/storage/concrete/brahminbag)
	return

/mob/living/simple_animal/cow/brahmin/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	handle_following()


/mob/living/simple_animal/cow/brahmin/proc/handle_following()
	if(owner)
		if(!follow)
			return
		else if(CHECK_MOBILITY(src, MOBILITY_MOVE) && isturf(loc))
			step_to(src, owner)

/mob/living/simple_animal/cow/brahmin/CtrlShiftClick(mob/user)
	if(get_dist(user, src) > 1)
		return

	if(bridle && user.a_intent == INTENT_DISARM)
		bridle = FALSE
		tame = FALSE
		owner = null
		to_chat(user, "<span class='notice'>You remove the bridle gear from [src], dropping it on the ground.</span>")
		new /obj/item/brahminbridle(user.loc)

	if(collar && user.a_intent == INTENT_GRAB)
		collar = FALSE
		name = initial(name)
		to_chat(user, "<span class='notice'>You remove the collar from [src], dropping it on the ground.</span>")
		new /obj/item/brahmincollar(user.loc)

	if(user == owner)
		if(bridle && user.a_intent == INTENT_HELP)
			if(follow)
				to_chat(user, "<span class='notice'>You tug on the reins of [src], telling it to stay.</span>")
				follow = FALSE
				return
			else if(!follow)
				to_chat(user, "<span class='notice'>You tug on the reins of [src], telling it to follow.</span>")
				follow = TRUE
				return

///////////////////////////
//End Dave's Brahmin Bags//
///////////////////////////

/mob/living/simple_animal/cow/brahmin/calf
	name = "brahmin calf"
	is_calf = 1

/mob/living/simple_animal/cow/brahmin/calf/Initialize()
	. = ..()
	resize = 0.7
	update_transform()

/mob/living/simple_animal/cow/brahmin/sgtsillyhorn
	name = "Sergeant Sillyhorn"
	desc = "A distinguished war veteran alongside his junior enlisted sidekick, Corporal McCattle. The two of them wear a set of golden rings, smelted from captured Centurions."
	emote_see = list("shakes its head.","swishes its tail eagerly.")
	speak_chance = 2



/mob/living/simple_animal/cow/brahmin/proc/update_brahmin_fluff() //none of this should do anything for now, but it may be used for updating sprites later
	// First, change back to defaults
	name = real_name
	desc = initial(desc)
	// BYOND/DM doesn't support the use of initial on lists.
	speak = list("Moo?","Moo!","Mooo!","Moooo!","Moooo.")
	emote_hear = list("brays.")
	desc = initial(desc)




/////////////
// RADSTAG //
/////////////

/mob/living/simple_animal/radstag
	name = "radstag"
	desc = "a two headed deer that will run at the first sight of danger."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "radstag"
	icon_living = "radstag"
	icon_dead = "radstag_dead"
	icon_gib = "radstag_gib"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	turns_per_move = 5
	see_in_dark = 6
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/animalhide/radstag = 2, /obj/item/stack/sheet/bone = 2)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/bone = 2)
	butcher_difficulty = 1

	response_help_simple  = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple   = "kicks"
	attack_verb_simple = "kicks"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 50
	maxHealth = 50
	gold_core_spawnable = FRIENDLY_SPAWN
	blood_volume = BLOOD_VOLUME_NORMAL
	faction = list("neutral")


///////////////
// BIGHORNER //
///////////////

/mob/living/simple_animal/hostile/retaliate/goat/bighorn
	name = "bighorner"
	desc = "Mutated bighorn sheep that are often found in mountains, and are known for being foul-tempered even at the best of times."
	icon = 'icons/fallout/mobs/animals/farmanimals.dmi'
	icon_state = "bighorner"
	icon_living = "bighorner"
	icon_dead = "bighorner_dead"
	icon_gib = "bighorner_gib"
	speak = list("EHEHEHEHEH","eh?")
	speak_emote = list("brays")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.", "stamps a foot.", "glares around.", "grunts.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 3)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 1)
	butcher_difficulty = 1
	response_help_simple  = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple   = "kicks"
	faction = list("bighorner")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	attack_verb_simple = "rams"
	attack_sound = 'sound/weapons/punch1.ogg'
	health = 120
	maxHealth = 120
	melee_damage_lower = 25
	melee_damage_upper = 20
	environment_smash = ENVIRONMENT_SMASH_NONE
	stop_automated_movement_when_pulled = 1
	var/is_calf = 0
	var/food_type = /obj/item/reagent_containers/food/snacks/grown/wheat
	var/has_calf = 0
	var/young_type = /mob/living/simple_animal/hostile/retaliate/goat/bighorn/calf

/mob/living/simple_animal/hostile/retaliate/goat/bighorn/attackby(obj/item/O, mob/user, params)
	if(stat == CONSCIOUS && istype(O, /obj/item/reagent_containers/glass)) // Should probably be bound into a proc at this point.
		udder.milkAnimal(O, user)
		return 1
	if(stat == CONSCIOUS && istype(O, food_type))
		if(is_calf)
			visible_message("<span class='alertalien'>[src] adorably chews the [O].</span>")
			qdel(O)
		if(!has_calf && !is_calf)
			has_calf = 1
			visible_message("<span class='alertalien'>[src] hungrily consumes the [O].</span>")
			qdel(O)
		else
			visible_message("<span class='alertalien'>[src] absently munches the [O].</span>")
			qdel(O)
	else
		return ..()

/mob/living/simple_animal/hostile/retaliate/goat/bighorn/Life()
	. = ..()
	if(stat == CONSCIOUS)
		if((prob(3) && has_calf))
			has_calf++
		if(has_calf > 10)
			has_calf = 0
			visible_message("<span class='alertalien'>[src] gives birth to a calf.</span>")
			new young_type(get_turf(src))

		if(is_calf)
			if((prob(3)))
				is_calf = 0
				udder = new()
				if(name == "bighorn lamb")
					name = "bighorn"
				else
					name = "bighorn"
				visible_message("<span class='alertalien'>[src] has fully grown.</span>")
		else
			udder.generateMilk(milk_reagent)

// BIGHORNER CALF
/mob/living/simple_animal/hostile/retaliate/goat/bighorn/calf
	name = "bighoner calf"
	resize = 0.7

/mob/living/simple_animal/hostile/retaliate/goat/bighorn/calf/Initialize() //calfs should not be a separate critter, they should just be a normal whatever with these vars
	. = ..()
	resize = 0.7
	update_transform()


/* Seems obsolete with Daves Brahmin packs, marked for death?
	if(inventory_back && inventory_back.brahmin_fashion)
		var/datum/brahmin_fashion/BF = new inventory_back.brahmin_fashion(src)
		BF.apply(src)

/mob/living/simple_animal/cow/brahmin/regenerate_icons()
	..()
	if(inventory_back)
		var/image/back_icon
		var/datum/brahmin_fashion/BF = new inventory_back.brahmin_fashion(src)

		if(!BF.obj_icon_state)
			BF.obj_icon_state = inventory_back.icon_state
		if(!BF.obj_alpha)
			BF.obj_alpha = inventory_back.alpha
		if(!BF.obj_color)
			BF.obj_color = inventory_back.color

		if(health <= 0)
			back_icon = BF.get_overlay(dir = EAST)
			back_icon.pixel_y = -11
			back_icon.transform = turn(back_icon.transform, 180)
		else
			back_icon = BF.get_overlay()
		add_overlay(back_icon)

	return

/mob/living/simple_animal/cow/brahmin/show_inv(mob/user)
	user.set_machine(src)
	if(user.stat)
		return

	var/dat = 	"<div align='center'><b>Inventory of [name]</b></div><p>"
	if(inventory_back)
		dat +=	"<br><b>Back:</b> [inventory_back] (<a href='?src=[REF(src)];remove_inv=back'>Remove</a>)"
	else
		dat +=	"<br><b>Back:</b> <a href='?src=[REF(src)];add_inv=back'>Nothing</a>"

	user << browse(dat, text("window=mob[];size=325x500", real_name))
	onclose(user, "mob[real_name]")
	return

/mob/living/simple_animal/cow/brahmin/Topic(href, href_list)
	if(usr.stat)
		return

	//Removing from inventory
	if(href_list["remove_inv"])
		if(!Adjacent(usr) || !(ishuman(usr) || ismonkey(usr) || iscyborg(usr) ||  isalienadult(usr)))
			return
		var/remove_from = href_list["remove_inv"]
		switch(remove_from)
			if("back")
				if(inventory_back)
					inventory_back.forceMove(drop_location())
					inventory_back = null
					update_brahmin_fluff()
					regenerate_icons()
				else
					to_chat(usr, "<span class='danger'>There is nothing to remove from its [remove_from].</span>")
					return

		show_inv(usr)

	//Adding things to inventory
	else if(href_list["add_inv"])
		if(!Adjacent(usr) || !(ishuman(usr) || ismonkey(usr) || iscyborg(usr) ||  isalienadult(usr)))
			return

		var/add_to = href_list["add_inv"]

		switch(add_to)

			if("back")
				if(inventory_back)
					to_chat(usr, "<span class='warning'>It's already wearing something!</span>")
					return
				else
					var/obj/item/item_to_add = usr.get_active_held_item()

					if(!item_to_add)
						usr.visible_message("[usr] pets [src].","<span class='notice'>You rest your hand on [src]'s back for a moment.</span>")
						return

					if(!usr.temporarilyRemoveItemFromInventory(item_to_add))
						to_chat(usr, "<span class='warning'>\The [item_to_add] is stuck to your hand, you cannot put it on [src]'s back!</span>")
						return

					//The objects that brahmin can wear on their backs.
					var/allowed = FALSE
					if(ispath(item_to_add.brahmin_fashion, /datum/brahmin_fashion/back))
						allowed = TRUE

					if(!allowed)
						to_chat(usr, "<span class='warning'>You set [item_to_add] on [src]'s back, but it falls off!</span>")
						item_to_add.forceMove(drop_location())
						if(prob(25))
							step_rand(item_to_add)
						for(var/i in list(1,2,4,8,4,8,4,dir))
							setDir(i)
							sleep(1)
						return

					item_to_add.forceMove(src)
					src.inventory_back = item_to_add
					update_brahmin_fluff()
					regenerate_icons()

		show_inv(usr)
	else
		..()
*/


///////////////////////////
//Erabite's Horse Armor//
//////////////////////////

/obj/item/horsearmor
	name = "horse armor"
	desc = "A armor made for horses using metal and armor plates, this protects horses in exchange for speed."
	icon = 'icons/fallout/clothing/horse_armor.dmi'
	icon_state = "horse_armor"

/obj/item/horsearmorncr
	name = "ncr horse armor"
	desc = "A armor made for NCR horses using metal and armor plates, this protects horses in exchange for speed."
	icon = 'icons/fallout/clothing/horse_armor.dmi'
	icon_state = "horse_armor_ncr"

/obj/item/horsearmorlegion
	name = "legion horse armor"
	desc = "A armor made for legion horses using metal and armor plates, this protects horses in exchange for speed."
	icon = 'icons/fallout/clothing/horse_armor.dmi'
	icon_state = "horse_armor_legion"

/datum/crafting_recipe/horsearmor
	name = "Horse Armor"
	result = /obj/item/horsearmor
	time = 120
	reqs = list(/obj/item/stack/crafting/armor_plate = 10,
				/obj/item/stack/sheet/metal = 30)
	tools = list(TOOL_FORGE)
	subcategory = CAT_ARMOR
	category = CAT_CLOTHING

/datum/crafting_recipe/horsearmorncr
	name = "NCR Horse Armor"
	result = /obj/item/horsearmorncr
	time = 60
	reqs = list(/obj/item/horsearmor = 1,
				/obj/item/toy/crayon/spraycan = 1)
	subcategory = CAT_ARMOR
	category = CAT_CLOTHING
	always_available = FALSE

/datum/crafting_recipe/horsearmorlegion
	name = "Legion Horse Armor"
	result = /obj/item/horsearmorlegion
	time = 60
	reqs = list(/obj/item/horsearmor = 1,
				/obj/item/toy/crayon/spraycan = 1)
	subcategory = CAT_ARMOR
	category = CAT_CLOTHING
	always_available = FALSE

///////////////////////////////
//End Erabite's Horse Armor//
//////////////////////////////


/mob/living/simple_animal/horse //SlapDrink#0083 |he made the sprite :0|
	name = "horse"
	desc = "Horses commonly used for logistics and transportation over long distances. Surprisingly this horse isn't fully mutated like the rest of the animals."
	icon = 'icons/fallout/mobs/animals/horse.dmi'
	icon_state = "horse"
	icon_living = "horse"
	icon_dead = "horse_dead"
	turns_per_move = 5
	speak = list("Naaay?","Naaay","NAAAAYY")
	speak_emote = list("nays","nays hauntingly")
	emote_hear = list("brays.")
	emote_see = list("shakes its head.")
	health = 75
	maxHealth = 75
	speak_chance = 1
	see_in_dark = 6
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 3)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 1)
	butcher_difficulty = 1
	response_help_simple  = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple   = "kicks"
	faction = list("neutral")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	attack_verb_simple = "rams"
	attack_sound = 'sound/weapons/punch1.ogg'
	idlesound = list('sound/f13npc/horse/horse_1.ogg', 'sound/f13npc/horse/horse_2.ogg', 'sound/f13npc/horse/horse_3.ogg', 'sound/f13npc/horse/horse_4.ogg', 'sound/f13npc/horse/horse_5.ogg')
	footstep_type = FOOTSTEP_MOB_GALLOP
	melee_damage_lower = 25
	melee_damage_upper = 20
	environment_smash = ENVIRONMENT_SMASH_NONE
	stop_automated_movement_when_pulled = 1
	stop_automated_movement_when_buckled = 1
	
	//Variables for horse speed allowing for easier editing//
	var/full_speed = 1.4
	var/high_speed = 1.6
	var/medium_speed = 1.9
	var/low_speed = 2.2 
	////////////////////////////////////////////////////////
	var/obj/item/inventory_back
	var/is_calf = 0
	var/food_type = /obj/item/reagent_containers/food/snacks/grown/wheat
	var/has_calf = 0
	var/young_type = /mob/living/simple_animal/horse
	var/datum/component/riding/driving_component
	var/datum/action/cooldown/horse/action = null
	var/base_action = /datum/action/cooldown/horse
	
/*
Bags for storage
Collar for a novelty name
Bridle for the stop/follow mechanic and temporary ownership
Saddle for ridin'
Brand for permanently marking brahmin as yours (won't stop people stealing em and riding em)
*/

	var/mob/living/owner = null
	var/follow = FALSE

	var/bags = FALSE
	var/collar = FALSE
	var/bridle = FALSE
	var/saddle = FALSE
	var/wearing_horse_armor = FALSE
	var/wearing_ncr_horse_armor = FALSE
	var/wearing_legion_horse_armor = FALSE
	var/brand = ""

//
// Horse sprint ability

	var/sprint_duration = 20
	var/sprinting = FALSE  // Is the horse currently sprinting?

// Object to block the player from using two-handed weapons when riding a horse. 
	var/saddle_held = FALSE

/obj/item/saddlehand
	name = "Saddle"
	desc = "Your holding onto the saddle while riding the horse."
	icon = 'icons/fallout/objects/tools.dmi'
	icon_state = "brahminsaddle"


/obj/item/saddlehand/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

//

///////////
//horse//
///////////

/mob/living/simple_animal/horse/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I,/obj/item/brahminbags))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead horse!</span>")
			return
		if(bags)
			to_chat(user, "<span class='warning'>The horse already has bags attached!</span>")
			return
		if(is_calf)
			to_chat(user, "<span class='warning'>The calf cannot carry the bags!</span>")
			return
		to_chat(user, "<span class='notice'>You add [I] to [src]...</span>")
		bags = TRUE
		qdel(I)
		src.ComponentInitialize()
		return

	if(istype(I,/obj/item/brahmincollar))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead horse!</span>")
			return
		if(user != owner)
			to_chat(user, "<span class='warning'>You need to claim the brahmin with a bridle before you can rename it!</span>")
			return

		name = input("Choose a new name for your horse!","Name", name)

		if(!name)
			return

		collar = TRUE
		to_chat(user, "<span class='notice'>You add [I] to [src]...</span>")
		message_admins("<span class='notice'>[ADMIN_LOOKUPFLW(user)] renamed a horse to [name].</span>") //So people don't name their brahmin the N-Word without notice
		qdel(I)
		return

	if(istype(I,/obj/item/brahminbridle))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead horse!</span>")
			return
		if(bridle)
			to_chat(user, "<span class='warning'>This horse already has a bridle!</span>")
			return

		owner = user
		bridle = TRUE
		tame = TRUE
		to_chat(user, "<span class='notice'>You add [I] to [src], claiming it as yours.</span>")
		desc += "<br>It has a bridle and reins attached to its head."
		qdel(I)
		return

	if(istype(I,/obj/item/brahminsaddle))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead horse!</span>")
			return
		if(saddle)
			to_chat(user, "<span class='warning'>This horse already has a saddle!</span>")
			return

		action = new base_action(src)
		icon_state = "horse_saddle"
		icon_living = "horse_saddle"
		icon_dead = "horse_saddle_dead"
		saddle = TRUE
		can_buckle = TRUE
		buckle_lying = FALSE
		driving_component = LoadComponent(/datum/component/riding)
		driving_component.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(16, 10), TEXT_SOUTH = list(16, 10), TEXT_EAST = list(18, 11), TEXT_WEST = list(18, 11)))
		driving_component.set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)
		driving_component.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
		driving_component.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		driving_component.set_vehicle_dir_layer(WEST, OBJ_LAYER)
		driving_component.drive_verb = "ride"
		update_driving_speed()
		to_chat(user, "<span class='notice'>You add [I] to [src].</span>")
		qdel(I)
		return

	if(istype(I,/obj/item/brahminbrand))
		if(brand)
			to_chat(user, "<span class='warning'>This horse already has a brand!</span>")
			return

		brand = input("What would you like to brand on your horse?","Brand", brand)

		if(!brand)
			return
	
	if(istype(I,/obj/item/horsearmor) || istype(I,/obj/item/horsearmorncr) || istype(I,/obj/item/horsearmorlegion))
		if(stat == DEAD)
			to_chat(user, "<span class='warning'>You cannot add anything to a dead horse!</span>")
			return
		if(wearing_horse_armor)
			to_chat(user, "<span class='warning'>This horse already has armor!</span>")
			return
		if(!saddle)
			to_chat(user, "<span class='warning'>You need to add a saddle to the horse before adding armor!</span>")
			return

		wearing_horse_armor = TRUE

		if(istype(I,/obj/item/horsearmorncr))
			wearing_ncr_horse_armor = TRUE
			icon_state = "horse_armor_ncr"
			icon_living = "horse_armor_ncr"
			icon_dead = "horse_armor_ncr_dead"
		else if(istype(I,/obj/item/horsearmorlegion))
			wearing_legion_horse_armor = TRUE
			icon_state = "horse_armor_legion"
			icon_living = "horse_armor_legion"
			icon_dead = "horse_armor_legion_dead"
		else
			icon_state = "horse_armor"
			icon_living = "horse_armor"
			icon_dead = "horse_armor_dead"

		maxHealth = 150
		health = health * 2
		full_speed += 0.2
		high_speed += 0.2
		medium_speed += 0.2
		low_speed += 0.2
		update_driving_speed()
		to_chat(user, "<span class='notice'>You add [I] to [src], giving it extra protection.</span>")
		qdel(I)
		return

/mob/living/simple_animal/horse/post_buckle_mob(mob/living/M)
	. = ..()
	action.Grant(M)
	ADD_TRAIT(M, TRAIT_NOGUNS, type)


/mob/living/simple_animal/horse/post_unbuckle_mob(mob/living/M)
	. = ..()
	action.Remove(M)
	REMOVE_TRAIT(M, TRAIT_NOGUNS, type)

/datum/action/cooldown/horse/Trigger()
	. = ..()
	var/mob/living/simple_animal/horse/M = target

	if(M.sprinting)
		return

	if(!IsAvailable())
		return

	M.sprinting = TRUE
	M.full_speed -= 0.4
	M.high_speed -= 0.4
	M.medium_speed -= 0.4
	M.low_speed -= 0.4
	M.update_driving_speed()

	sleep(M.sprint_duration)

	M.sprinting = FALSE 
	M.full_speed += 0.4
	M.high_speed += 0.4
	M.medium_speed += 0.4
	M.low_speed += 0.4
	M.update_driving_speed()

	StartCooldown()

/mob/living/simple_animal/horse/updatehealth()
	LoadComponent(/datum/component/riding)
	. = ..()
	if (driving_component)
		update_driving_speed()

/mob/living/simple_animal/horse/proc/update_driving_speed()
	if(health <= maxHealth * 0.25)
		driving_component.vehicle_move_delay = low_speed
	else if(health <= maxHealth * 0.50)
		driving_component.vehicle_move_delay = medium_speed
	else if(health <= maxHealth * 0.75)
		driving_component.vehicle_move_delay = high_speed
	else if (health <= maxHealth)
		driving_component.vehicle_move_delay = full_speed

/mob/living/simple_animal/horse/death(gibbed)
	. = ..()
	if(can_buckle)
		can_buckle = FALSE
	if(buckled_mobs)
		for(var/mob/living/M in buckled_mobs)
			unbuckle_mob(M)

/mob/living/simple_animal/horse/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(!Move() && has_buckled_mobs())
		var/mob/living/carbon/human/M = buckled_mobs[1]
		var/H = M.is_holding_item_of_type(/obj/item/saddlehand)
		if(H)
			qdel(H)
			saddle_held = FALSE
	handle_following()

/mob/living/simple_animal/horse/proc/handle_following()
	if(owner)
		if(!follow)
			return
		else if(CHECK_MOBILITY(src, MOBILITY_MOVE) && isturf(loc))
			step_to(src, owner)

/mob/living/simple_animal/horse/CtrlShiftClick(mob/user)
	if(get_dist(user, src) > 1)
		return

	if(bridle && user.a_intent == INTENT_DISARM)
		bridle = FALSE
		tame = FALSE
		owner = null
		to_chat(user, "<span class='notice'>You remove the bridle gear from [src], dropping it on the ground.</span>")
		new /obj/item/brahminbridle(user.loc)

	if(collar && user.a_intent == INTENT_GRAB)
		collar = FALSE
		name = initial(name)
		to_chat(user, "<span class='notice'>You remove the collar from [src], dropping it on the ground.</span>")
		new /obj/item/brahmincollar(user.loc)
	
	if((saddle || wearing_horse_armor) && user.a_intent == INTENT_HARM)
		if(wearing_horse_armor)
			wearing_horse_armor = FALSE
			maxHealth = 75
			health = health / 2
			full_speed -= 0.2
			high_speed -= 0.2
			medium_speed -= 0.2
			low_speed -= 0.2
			update_driving_speed()
			icon_state = "horse_saddle"
			icon_living = "horse_saddle"
			icon_dead = "horse_saddle_dead"
			to_chat(user, "<span class='notice'>You remove the armor from [src], dropping it on the ground.</span>")
			if(wearing_ncr_horse_armor)
				wearing_ncr_horse_armor = FALSE
				new /obj/item/horsearmorncr(user.loc)
			else if(wearing_legion_horse_armor)
				wearing_legion_horse_armor = FALSE
				new /obj/item/horsearmorlegion(user.loc)
			else
				new /obj/item/horsearmor(user.loc)
		else
			saddle = FALSE
			can_buckle = FALSE
			icon_state = "horse"
			icon_living = "horse"
			icon_dead = "horse_dead"
			to_chat(user, "<span class='notice'>You remove the saddle from [src], dropping it on the ground.</span>")
			new /obj/item/brahminsaddle(user.loc)

	if(user == owner)
		if(bridle && user.a_intent == INTENT_HELP)
			if(follow)
				to_chat(user, "<span class='notice'>You tug on the reins of [src], telling it to stay.</span>")
				follow = FALSE
				return
			else if(!follow)
				to_chat(user, "<span class='notice'>You tug on the reins of [src], telling it to follow.</span>")
				follow = TRUE
				return

// /mob/living/simple_animal/horse/Moved()
//	. = ..()
//	horseslot()

// /mob/living/simple_animal/horse/proc/horseslot()
//	if(has_buckled_mobs() && !saddle_held)
//		var/mob/living/carbon/human/M = buckled_mobs[1]
//		var/lhand = M.get_empty_held_index_for_side("l")
//		var/rhand = M.get_empty_held_index_for_side("r")
//		if(lhand)
//			M.put_in_l_hand(new /obj/item/saddlehand(M))
//			saddle_held = TRUE
//		else if(rhand)
//			M.put_in_r_hand(new /obj/item/saddlehand(M))
//			saddle_held = TRUE
//		else
//			M.drop_all_held_items()
														//Commented out until a better solution is found/made.

/datum/action/cooldown/horse
	name = "Horse Sprint"
	desc = "The horse will sprint for a short time."
	icon_icon = 'icons/mob/actions/actions_animal.dmi' 
	button_icon_state = "horse_sprint"
	cooldown_time = 100
////////////////////
