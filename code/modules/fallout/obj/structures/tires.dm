//Fallout 13 automobile tires directory

/obj/structure/tires
	name = "tire"
	desc = "A ring-shaped vehicle component that covers the wheel's rim to protect it and enable better vehicle performance."
	icon = 'icons/fallout/trash.dmi'
	icon_state = "one_t"
	obj_integrity = 50
	max_integrity = 50
	density = 1

/obj/structure/tires/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_ANALYZER)
		I.play_tool_sound(src)
		user.visible_message("<span class='notice'>[user] is checking the [src] for ones of appropiate pressure...</span>", \
							"<span class='notice'>You start checking the [src] for ones of appropiate pressure...</span>")
		if(!I.use_tool(src, user, 50))
			return
		playsound(get_turf(src), 'sound/items/deconstruct.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] finished checking both [src].</span>", \
							"<span class='notice'>You finish checking both[src].</span>")
		new /obj/item/mecha_parts/part/Car_tire(loc)
		qdel(src)
		return
	. = ..()

/obj/structure/tires/half
	name = "half tire"
	desc = "A part of a part of a car." //The description is totally intentional.
	icon_state = "half_t"
	max_integrity = 10
	obj_integrity = 10
	density = 0

/obj/structure/tires/two
	name = "couple of tires"
	desc = "Ring-shaped vehicle components that cover the wheel's rims to protect them and enable better vehicle performance."
	icon_state = "two_t"
	max_integrity = 100
	obj_integrity = 100
	density = 1
	anchored = 1

/obj/structure/tires/two/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_ANALYZER)
		I.play_tool_sound(src)
		user.visible_message("<span class='notice'>[user] is checking the [src] for ones of appropiate pressure...</span>", \
							"<span class='notice'>You start checking the [src] for ones of appropiate pressure...</span>")
		if(!I.use_tool(src, user, 50))
			return
		playsound(get_turf(src), 'sound/items/deconstruct.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] finished checking both [src].</span>", \
							"<span class='notice'>You finish checking both[src].</span>")
		new /obj/item/mecha_parts/part/Car_tire(loc)
		new /obj/item/mecha_parts/part/Car_tire(loc)
		qdel(src)
		return
	. = ..()



/obj/structure/tires/five
	name = "pile of tires"
	desc = "Five tires stacked on top of each other in an orderly fashion.<br>Is the car shop nearby or something?"
	icon_state = "five_t"
	obj_integrity = 250
	max_integrity = 250
	density = 1
	anchored = 1

/obj/structure/tires/five/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_ANALYZER)
		I.play_tool_sound(src)
		user.visible_message("<span class='notice'>[user] is checking the [src] for ones of appropiate pressure...</span>", \
							"<span class='notice'>You start checking the [src] for ones of appropiate pressure...</span>")
		if(!I.use_tool(src, user, 50))
			return
		playsound(get_turf(src), 'sound/items/deconstruct.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] finished checking both [src].</span>", \
							"<span class='notice'>You finish checking both[src].</span>")
		new /obj/item/mecha_parts/part/Car_tire(loc)
		new /obj/item/mecha_parts/part/Car_tire(loc)
		new /obj/item/mecha_parts/part/Car_tire(loc)
		new /obj/item/mecha_parts/part/Car_tire(loc)
		new /obj/item/mecha_parts/part/Car_tire(loc)
		qdel(src)
		return
	. = ..()
