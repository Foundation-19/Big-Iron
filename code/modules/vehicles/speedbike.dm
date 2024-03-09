
/obj/vehicle/ridden/space
	name = "Generic Space Vehicle!"

/obj/vehicle/ridden/space/Initialize()
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.override_allow_spacemove = TRUE

/obj/vehicle/ridden/space/speedbike
	name = "Speedbike"
	icon = 'icons/obj/bike.dmi'
	icon_state = "speedbike_blue"
	layer = LYING_MOB_LAYER
	var/overlay_state = "cover_blue"
	var/mutable_appearance/overlay

/obj/vehicle/ridden/space/speedbike/Initialize()
	. = ..()
	overlay = mutable_appearance(icon, overlay_state, ABOVE_MOB_LAYER)
	add_overlay(overlay)
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, -8), TEXT_SOUTH = list(0, 4), TEXT_EAST = list(-10, 5), TEXT_WEST = list( 10, 5)))
	D.vehicle_move_delay = 0
	D.set_vehicle_dir_offsets(NORTH, -16, -16)
	D.set_vehicle_dir_offsets(SOUTH, -16, -16)
	D.set_vehicle_dir_offsets(EAST, -18, 0)
	D.set_vehicle_dir_offsets(WEST, -18, 0)

/obj/vehicle/ridden/space/speedbike/Move(newloc,move_dir)
	if(has_buckled_mobs())
		new /obj/effect/temp_visual/dir_setting/speedbike_trail(loc,move_dir)
	. = ..()

/obj/vehicle/ridden/space/speedbike/red
	icon_state = "speedbike_red"
	overlay_state = "cover_red"

/obj/vehicle/ridden/space/speedbike/f13
	icon_state = "speedbike_f13"
	overlay_state = "cover_f13"
	key_type = /obj/item/key/custombike

/obj/vehicle/ridden/space/speedbike/f13/attackby(obj/item/I, mob/user, params)
	var/obj/item/key/custombike/nkf = I
	if(istype(nkf) && nkf.keyfit != src)
		to_chat(user, "<span class='danger'>[nkf] does not fit into [src]!</span>")
		return
	. = ..()
	

/obj/vehicle/ridden/space/speedbike/f13/Move(newloc,move_dir)
	if(has_buckled_mobs())
		new /obj/effect/temp_visual/dir_setting/speedbike_trail/f13(loc,move_dir)
	. = ..()
/obj/vehicle/ridden/space/speedbike/f13/Initialize()
	. = ..()
	var/datum/component/riding/D = GetComponent(/datum/component/riding)
	D.vehicle_move_delay = 0.95
	var/obj/item/key/custombike/NK = new(loc)
	NK.keyfit = src

/obj/vehicle/ridden/space/speedbike/f13/post_buckle_mob(mob/living/M)
	. = ..()
	ADD_TRAIT(M, TRAIT_NOGUNS, type)

/obj/vehicle/ridden/space/speedbike/f13/post_unbuckle_mob(mob/living/M)
	. = ..()
	REMOVE_TRAIT(M, TRAIT_NOGUNS, type)
	if(inserted_key)
		if(!M.put_in_active_hand(inserted_key, FALSE, FALSE))
			M.dropItemToGround(inserted_key)
		inserted_key = null
//BM SPEEDWAGON

/obj/vehicle/ridden/space/speedwagon
	name = "BM Speedwagon"
	desc = "Push it to the limit, walk along the razor's edge."
	icon = 'icons/obj/car.dmi'
	icon_state = "speedwagon"
	layer = LYING_MOB_LAYER
	var/static/mutable_appearance/overlay = mutable_appearance(icon, "speedwagon_cover", ABOVE_MOB_LAYER)
	max_buckled_mobs = 4
	var/crash_all = FALSE //CHAOS
	pixel_y = -48
	pixel_x = -48

/obj/vehicle/ridden/space/speedwagon/Initialize()
	. = ..()
	add_overlay(overlay)
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 0
	D.set_riding_offsets(1, list(TEXT_NORTH = list(-10, -4), TEXT_SOUTH = list(16, 3), TEXT_EAST = list(-4, 30), TEXT_WEST = list(4, -3)))
	D.set_riding_offsets(2, list(TEXT_NORTH = list(19, -5, 4), TEXT_SOUTH = list(-13, 3, 4), TEXT_EAST = list(-4, -3, 4.1), TEXT_WEST = list(4, 28, 3.9)))
	D.set_riding_offsets(3, list(TEXT_NORTH = list(-10, -18, 4.2), TEXT_SOUTH = list(16, 25, 3.9), TEXT_EAST = list(-22, 30), TEXT_WEST = list(22, -3, 4.1)))
	D.set_riding_offsets(4, list(TEXT_NORTH = list(19, -18, 4.2), TEXT_SOUTH = list(-13, 25, 3.9), TEXT_EAST = list(-22, 3, 3.9), TEXT_WEST = list(22, 28)))
	D.set_vehicle_dir_offsets(NORTH, -48, -48)
	D.set_vehicle_dir_offsets(SOUTH, -48, -48)
	D.set_vehicle_dir_offsets(EAST, -48, -48)
	D.set_vehicle_dir_offsets(WEST, -48, -48)
	for(var/i in GLOB.cardinals)
		D.set_vehicle_dir_layer(i, BELOW_MOB_LAYER)

/obj/vehicle/ridden/space/speedwagon/Bump(atom/movable/A)
	. = ..()
	if(A.density && has_buckled_mobs())
		var/atom/throw_target = get_edge_target_turf(A, dir)
		if(crash_all)
			A.throw_at(throw_target, 4, 3)
			visible_message("<span class='danger'>[src] crashes into [A]!</span>")
			playsound(src, 'sound/effects/bang.ogg', 50, 1)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			H.DefaultCombatKnockdown(100)
			H.adjustStaminaLoss(30)
			H.apply_damage(rand(20,35), BRUTE)
			if(!crash_all)
				H.throw_at(throw_target, 4, 3)
				visible_message("<span class='danger'>[src] crashes into [H]!</span>")
				playsound(src, 'sound/effects/bang.ogg', 50, 1)

/obj/vehicle/ridden/space/speedwagon/Moved()
	. = ..()
	if(has_buckled_mobs())
		for(var/atom/A in range(2, src))
			if(!(A in buckled_mobs))
				Bump(A)
