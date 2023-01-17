//Fallout 13 campfire directory

/obj/structure/campfire
	name = "campfire"
	desc = "A warm, bright, and hopeful fire source - when it's burning, of course."
	icon = 'icons/fallout/objects/furniture/heating.dmi'
	icon_state = "campfire"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	light_color = LIGHT_COLOR_FIRE
	var/burned = FALSE
	var/fired = FALSE
	var/fuel = 300
	var/datum/looping_sound/campfire/campfire_loop

/obj/structure/campfire/Initialize()
	. = ..()
	campfire_loop = new(src, FALSE)

/obj/structure/campfire/Destroy()
	SSobj.processing.Remove(src)
	QDEL_NULL(campfire_loop)
	..()

/obj/structure/campfire/attackby(obj/item/P, mob/user, params)
	if(P.get_temperature())
		fire(user)
	if(istype(P, /obj/item/shovel))
		to_chat(user, "You remove some campfire ashes.")
		qdel(src)
		return
	else if(istype(P, /obj/item/stack/sheet/mineral/wood) || istype(P, /obj/item/stack/ore/coal))
		var/obj/item/stack/sheet/mineral/wood/W = P
		var/obj/item/stack/ore/coal/C = P
		if(fuel > 3000)
			to_chat(user, "You can't add more fuel - wait untill some of it burns away!")
			return
		if(W.use(1) || C.use(1))
			user.visible_message("[user] has added fuel to [src].", span_notice("You have added fuel to [src]."))
			fuel += 100
	else if(istype(P, /obj/item/stack/sheet/coke)) // added for coke to work as fuel
		var/obj/item/stack/sheet/coke/C = P
		if(fuel > 3000)
			to_chat(user, "You can't add more fuel - wait untill some of it burns away!")
			return
		if(C.use(1))
			user.visible_message("[user] has added fuel to [src].", span_notice("You have added fuel to [src]."))
			fuel += 300
	else if(fired && istype(P, /obj/item/reagent_containers/food/snacks))
		if(!ishuman(user))
			return
		if(istype(P, /obj/item/reagent_containers/food/snacks))
			var/obj/item/reagent_containers/food/snacks/F = P
			if(F.cooked_type)
				playsound(src, 'modular_BD2/kitchen_50s/sound/cooking_short.ogg', 75, TRUE, -3)
				to_chat(user, "You start cooking a [F.name].")
				if(do_after(user, 9 SECONDS, target = src))
					F.microwave_act()
	else if(fired && istype(P, /obj/item/stack/medical/gauze/improvised))
		if(!ishuman(user))
			return
		if(istype(P, /obj/item/stack/medical/gauze/improvised))
			var/obj/item/stack/medical/gauze/improvised/F = P
			to_chat(user, "You start baking the [F.name].")
			if(do_after(user, 30, target = src))
				F.microwave_act()
	else
		. = ..()
		if(fired)
			P.fire_act(1000, 500)

/obj/structure/campfire/fire_act(exposed_temperature, exposed_volume)
	fire()

/obj/structure/campfire/Crossed(atom/movable/AM)
	if(fired)
		burn_process()

/obj/structure/campfire/process()
	if(fuel <= 0)
		extinguish()
		campfire_loop.stop()
		fired = FALSE
		update_icon()
		return
	burn_process()
	fuel--
	if(fuel > 1500)
		set_light(8)
	else if(fuel > 300)
		set_light(3)
	else
		set_light(1)
//	var/turf/open/location = get_turf(src)//shity code detected
//	if(istype(location))
//		var/datum/gas_mixture/affected = location.air
//		affected.temperature *= 1.01

/obj/structure/campfire/proc/fire(mob/living/user)
//	BeginAmbient('sound/effects/comfyfire.ogg', 20, 12)
	START_PROCESSING(SSobj, src)
	fired = TRUE
	desc = "A warm, bright, and hopeful fire source."
	campfire_loop.start()
	if(user)
		user.visible_message("[user] has lit a [src].", span_notice("You have lit a [src]."))
	update_icon()
	burned = 0
	burn_process()

/obj/structure/campfire/proc/burn_process()
	var/turf/location = get_turf(src)
	for(var/A in location)
		if(A == src)
			continue
		if(isobj(A))
			var/obj/O = A
			O.fire_act(1000, 500)
		else if(isliving(A))
			var/mob/living/L = A
			L.adjust_fire_stacks(5)
			L.IgniteMob()

/obj/structure/campfire/update_icon()
	if(fired)
		icon_state = "[initial(icon_state)]-lit"
//		overlays = list(image(icon,icon_state = "campfire_o"))
	else
		icon_state = initial(icon_state)
//		overlays.Cut()
	..()

/*/obj/structure/campfire/extinguish()
	name = "burned campfire"
	desc = "It has burned to ashes..."
	icon_state = initial(icon_state)
	fired = 0
	burned = 1
	set_light(0)
//	StopAmbient()
	STOP_PROCESSING(SSobj, src)
	update_icon()*/

/obj/structure/campfire/infinity
	fired = 1
	icon_state = "campfire21"
	fuel = 999999999

/obj/structure/campfire/barrel
	name = "steel drum firepit"
	desc = "A campfire made out of an old steel drum. You're not going to fall into the fire, but you feel like a hobo using it. Which you are."
	icon_state = "drumfire"
	density = 1

/obj/structure/campfire/stove
	name = "pot belly stove"
	desc = "A warm stove, for cooking food, or keeping warm in the winter. It's really old fashioned, but works wonders when there's no electricity."
	icon_state = "potbelly"
	icon = 'modular_BD2/kitchen_50s/icons/kitchen32x64.dmi'
	icon_state = "potbelly"
	density = TRUE
	plane = GAME_PLANE // so the smoke covers mobs
	layer = ABOVE_MOB_LAYER // so the smoke covers mobs

/datum/looping_sound/campfire
	mid_length = 70
	mid_sounds = list('modular_BD2/kitchen_50s/sound/campfire.ogg'=1)
	volume = 30

