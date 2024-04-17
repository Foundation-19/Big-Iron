// Kitchen related items and structures, all suitable for Fallout, with correct perspective and color palettes, more or less.
// Most are just art updates, redirecting the icon path here, chopping block and microwave got code changes necessary. Adds food prep area for minor butchering bonus.


// chopping block, made with 2 planks, add rolling pin, bowl, kitchen knife and you got a food processor. Coded included

// -------------- CHOPPING BLOCK -----------------

/obj/item/chopping_block
	name = "chopping block"
	desc = "When used with the right kitchen tools it can process many kinds of food. Start with adding a rolling pin."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "choppingblock"

/obj/item/chopping_block/attackby(obj/item/W, mob/user, params)
	if(!istype(W, /obj/item/kitchen/rollingpin))
		return
	var/turf/T = get_turf(src)
	if(!T)
		return
	new /obj/structure/chopping_block(T)
	qdel(W)
	qdel(src)

/obj/structure/chopping_block // Edited to add overlay for filling, allow regular kitchen knife to be used as well, and various descriptions to suit the difference from a machine. Also removes shaking and replaces the machine grinding sound.
	name = "chopping block"
	desc = "A bowl seems like it would be useful."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "choppingpin"

/obj/structure/chopping_block/update_icon()
	. = ..()
	if(build_stage == 1)
		icon_state = "choppinbowl"

/obj/structure/chopping_block/Destroy()
	if(!completed)
		var/turf/T = get_turf(src)
		if(!T)
			return
		new /obj/item/chopping_block(T)
		new /obj/item/kitchen/rollingpin(T)
		if(bowl)
			new /obj/item/reagent_containers/glass/bowl(T)
	. = ..()


/obj/structure/chopping_block/attackby(obj/item/I, mob/living/user, params)
	if(build_stage == 1)
		if(!istype(I, /obj/item/reagent_containers/glass/bowl))
			to_chat(user, span_warning("You require a bowl!"))
			return
		bowl = I
		qdel(I)
		update_icon()
		build_stage++
		return
	if(build_stage == 2)
		if(!istype(I, /obj/item/kitchen/knife))
			to_chat(user, span_warning("You require a kitchen knife!"))
			return
		var/turf/T = get_turf(src)
		if(!T)
			return
		new /obj/machinery/processor/chopping_block(T)
		completed = TRUE
		qdel(I)
		qdel(src)

/obj/machinery/processor/chopping_block
	name = "chopping block"
	desc = "Used to process many sorts of food."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "chopibobut"
	density = FALSE
	circuit = null

/obj/machinery/processor/chopping_block/Initialize()
	. = ..()

/obj/machinery/processor/chopping_block/Destroy()
	var/turf/T = get_turf(src)
	if(!T)
		return
	new /obj/item/chopping_block(T)
	new /obj/item/kitchen/rollingpin(T)
	new /obj/item/reagent_containers/glass/bowl(T)
	new /obj/item/kitchen/knife(T)
	. = ..()

/obj/machinery/processor/chopping_block/attackby(obj/item/O, mob/user, params)
	if(processing)
		to_chat(user, span_warning("[src] is being used for processing!"))
		return TRUE

	if(istype(O, /obj/item/wrench) || istype(O, /obj/item/screwdriver))
		return

	if(istype(O, /obj/item/storage/bag/tray))
		var/obj/item/storage/T = O
		var/loaded = 0
		for(var/obj/item/reagent_containers/food/snacks/S in T.contents)
			var/datum/food_processor_process/P = select_recipe(S)
			if(P)
				if(SEND_SIGNAL(T, COMSIG_TRY_STORAGE_TAKE, S, src))
					loaded++

		if(loaded)
			to_chat(user, span_notice("You place [loaded] items on the [src]."))
		return

	var/datum/food_processor_process/P = select_recipe(O)
	if(P)
		user.visible_message("[user] put [O] on the [src].", \
			"You put [O] on the [src].")
		user.transferItemToLoc(O, src, TRUE)
		add_overlay(image(icon= 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi',icon_state="chopping_loaded"))
		return 1
	else
		if(user.a_intent != INTENT_HARM)
			to_chat(user, span_warning("That can't be processed here sadly."))
			return 1
		else
			return ..()


/obj/machinery/processor/chopping_block/interact(mob/user)
	if(processing)
		to_chat(user, span_warning("[src] is being used to process food!"))
		return TRUE
	if(user.a_intent == INTENT_GRAB && ismob(user.pulling) && select_recipe(user.pulling))
		if(user.grab_state < GRAB_AGGRESSIVE)
			to_chat(user, span_warning("You need a better grip to do that!"))
			return
		var/mob/living/pushed_mob = user.pulling
		visible_message(span_warning("[user] slams [pushed_mob] on the [src]!"))
		pushed_mob.forceMove(src)
		user.stop_pulling()
		return
	if(contents.len == 0)
		to_chat(user, span_warning("[src] is empty!"))
		return TRUE
	processing = TRUE
	user.visible_message("[user] starts using the [src].", \
		span_notice("You start using the [src]."))
//		span_italic("You hear food being chopped.")) Why span italic no work =/
	playsound(src.loc, 'modular_BD2/kitchen_50s/sound/chopping_block.ogg', 120, 1)
	var/total_time = 0
	for(var/O in src.contents)
		var/datum/food_processor_process/P = select_recipe(O)
		if (!P)
			log_admin("DEBUG: [O] in processor doesn't have a suitable recipe. How did it get in there? Please report it immediately!!!")
			continue
		total_time += P.time
	sleep(total_time / rating_speed)
	for(var/atom/movable/O in src.contents)
		var/datum/food_processor_process/P = select_recipe(O)
		if (!P)
			log_admin("DEBUG: [O] in processor doesn't have a suitable recipe. How do you put it in?")
			continue
		process_food(P, O)
	processing = FALSE
	cut_overlay(image(icon= 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi',icon_state="chopping_loaded"))
	visible_message("\The processing with the [src] is now finished.")


// -------------- GRINDER -----------------

/obj/machinery/reagentgrinder
	name = "all-in-one grinder"
	desc = "Rugged old kitchen blender, can grind or juice most things on this Earth with a bit of patience."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'


// -------------- MICROWAVE & STOVE -----------------

/obj/machinery/microwave
	name = "microwave oven"
	desc = "Cooks and boils food in a futuristic way."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "microwave"

/obj/machinery/microwave/update_icon_state()
	if(broken)
		icon_state = "microwave_broken"
	else if(dirty_anim_playing)
		icon_state = "microwave_dirty_on"
	else if(dirty == 100)
		icon_state = "microwave_dirty"
	else if(operating)
		icon_state = "microwave_on"
	else if(panel_open)
		icon_state = "microwave_panel"
	else
		icon_state = "microwave"


/obj/machinery/microwave/stove
	name = "stove"
	desc = "Timeless design, if you like 1950s style stoves. For cooking, supposedly, but you could probably cure leather in the heating boxes underneath."


// -------------- KITCHEN KNIVES & ROLLING PIN -----------------

/obj/item/kitchen/knife
	name = "kitchen knife"
	desc = "A simple knife, best suited to cut stuff that doesn't cut back."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	lefthand_file = 'modular_BD2/kitchen_50s/icons/onmob_lefthand.dmi'
	righthand_file = 'modular_BD2/kitchen_50s/icons/onmob_righthand.dmi'
	icon_state = "knife_kitchen"
	item_state = "knife_kitchen"

/obj/item/kitchen/knife/butcher
	name = "butcher's cleaver"
	icon_state = "knife_butcher"
	item_state = "knife_butcher"

/obj/item/kitchen/rollingpin
	desc = "A model housewife can use this to bake great bread, or to bludgeon marauding raiders, probably."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	lefthand_file = 'modular_BD2/kitchen_50s/icons/onmob_lefthand.dmi'
	righthand_file = 'modular_BD2/kitchen_50s/icons/onmob_righthand.dmi'


// -------------- BOWL -----------------

/obj/item/reagent_containers/glass/bowl
	name = "bowl"
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	lefthand_file = 'modular_BD2/kitchen_50s/icons/onmob_lefthand.dmi'
	righthand_file = 'modular_BD2/kitchen_50s/icons/onmob_righthand.dmi'
// customizables.dm edited


// -------------- FRIDGES -----------------

/obj/structure/closet/fridge/good
	name = "fridge"
	desc = "A pre-War refrigerator.<br>Despite its age it has been maintained quite well, and keeps its contents mostly chilled."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "fridge_good"

/obj/structure/closet/fridge/good/New()
	..()
	for(var/i = 0, i < 4, i++)
		new /obj/item/reagent_containers/food/drinks/bottle/sunset(src)
	for(var/i = 0, i < 3, i++)
		new /obj/item/reagent_containers/food/snacks/f13/mirelurkcake(src)
	for(var/i = 0, i < 2, i++)
		new /obj/item/reagent_containers/food/snacks/meat/steak/gecko(src)
	for(var/i = 0, i < 1, i++)
		new /obj/item/reagent_containers/food/snacks/f13/crispysquirrel(src)


// -------------- WASHING MACHINE -----------------

/obj/machinery/washing_machine // Included code changes - feedback text edited, sound added
	name = "washing machine"
	desc = "Makes your clothes clean, at least if you manage to find a working one that has not been used as a Radroach nest."
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'

/obj/machinery/washing_machine/attackby(obj/item/W, mob/user, params)
	if(panel_open && !busy && default_unfasten_wrench(user, W))
		return

	if(default_deconstruction_screwdriver(user, null, null, W))
		update_icon()
		return

	if(istype(W, /obj/item/clothing/head/mob_holder))
		to_chat(user, span_warning("It's too unwieldly to put in this way."))
		return TRUE

	else if(user.a_intent != INTENT_HARM)

		if (!state_open)
			to_chat(user, span_warning("Change it to loading mode first!"))
			return TRUE

		if(bloody_mess)
			to_chat(user, span_warning("[src] must be cleaned up first."))
			return TRUE

		if(contents.len >= max_wash_capacity)
			to_chat(user, span_warning("The washing machine is full!"))
			return TRUE

		if(!user.transferItemToLoc(W, src))
			to_chat(user, span_warning("\The [W] is stuck to your hand, you cannot put it in the washing machine!"))
			return TRUE

		if(W.dye_color)
			color_source = W
		update_icon()

	else
		return ..()

/obj/machinery/washing_machine/AltClick(mob/user) // The sound will only fire correctly if the identical path in washing_machine.dm is commented out
	. = ..()
	if(!user.canUseTopic(src))
		return
	if(busy)
		return
	if(state_open)
		to_chat(user, span_notice("Change it to work mode first"))
		return TRUE
	if(bloody_mess)
		to_chat(user, span_warning("[src] must be cleaned up first."))
		return TRUE
	busy = TRUE
	playsound(src, 'modular_BD2/kitchen_50s/sound/washing.ogg', 85, 0)
	update_icon()
	addtimer(CALLBACK(src, PROC_REF(wash_cycle)), 200)
	START_PROCESSING(SSfastprocess, src)
	return TRUE


// -------------- KITCHEN SPIKE ----------------- - simply adds instructions for assembling so code diving isn't needed, and adds a edited icon so its not as painful to click

/obj/structure/kitchenspike_frame
	name = "meatspike frame"
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "spikeframe"
	desc = "The frame of a meat spike. To assemble, wrench it in place and add four iron rods."

/obj/structure/kitchenspike
	name = "meat spike"
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "spike"
	desc = "This allows more efficient butchery. Grab the animal by the neck and drag it up on the spike before cutting them up. Its polite to kill them before, but optional."

// -------------- AREA -----------------  -adds a new area for food preparation, replacing the old unused base one thats too unclear what it does. Minor food bonus in area, for clean kitchen areas.

// /area/crew_quarters/kitchen  replace in butchering with with ------>
/area/f13/food_preparation
	name = "food preparation area"
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
	icon_state = "area_food_preparation"
	grow_chance = 0

/* Commented out since edite basefile anyways
/obj/structure/closet/crate/bin/trashbin
	icon = 'modular_BD2/kitchen_50s/icons/icons_kitchen.dmi'
*/

/obj/structure/bonfire/heater
	name = "heating pyre"
	desc = "For warming water before a bath or a shower."
	density = TRUE
	burn_icon = "bonfire_warm" // still a bit shitty, this whole sprite is subpar but too low prio atm
	grill = TRUE
	stones = TRUE

/obj/structure/bonfire/heater/Initialize()
	. = ..()
	add_overlay("bonfire_grill")
	add_overlay("bonfire_stones")

/*
GRILL TAKES COAL, COKE, NEW ANIMATION. See grill.dm
/obj/machinery/grill
	icon = 'modular_BD2/kitchen_50s/icons/kitchen32x64.dmi'
	plane = MOB_PLANE
	layer = ABOVE_MOB_LAYER

CAMPFIRE POTBELLU STOVE NOW TAKES COAL, COKE; NEW ANIMATION, SOUNDS, GAUZE STERILIZE. See campfire.dm
/obj/structure/campfire
	var/datum/looping_sound/campfire/campfire_loop

/obj/structure/campfire/stove
	icon = 'modular_BD2/kitchen_50s/icons/kitchen32x64.dmi'
	plane = MOB_PLANE // so the smoke covers mobs
	layer = ABOVE_MOB_LAYER // so the smoke covers mobs

matchbox proc updated in boxes.dm
*/

/obj/item/reagent_containers/food/snacks/meat/steak/plated
	name = "steak"
	desc = "A plate with seasoned cooked meat."
	icon_state = "meatsteak_plated"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6) // +1 when plated
	foodtype = MEAT
	tastes = list("meat" = 2, "salt" = 1)

/datum/crafting_recipe/food/steak_plated
	name = "Plated steak"
	reqs = list(
		/datum/reagent/consumable/sodiumchloride = 1,
		/obj/item/reagent_containers/food/snacks/meat/steak = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/meat/steak/plated
	subcategory = CAT_MEAT
