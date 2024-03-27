
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

/obj/vehicle/ridden/space/speedbike/proc/crashing(force = 5)
	if(buckled_mobs.len)
		for(var/mob/living/H in buckled_mobs)
			H.adjustStaminaLoss(60)
			playsound(src, 'sound/effects/bang.ogg', 40, TRUE)
			var/atom/throw_target = get_edge_target_turf(H, pick(GLOB.cardinals))
			unbuckle_mob(H)
			H.throw_at(throw_target, force, force)
			if(iscarbon(H))
				var/head_slot = H.get_item_by_slot(SLOT_HEAD)
				if(!head_slot || !(istype(head_slot,/obj/item/clothing/head/helmet) || istype(head_slot,/obj/item/clothing/head/hardhat)))
					H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
					H.updatehealth()
				visible_message("<span class='danger'>[src] crashes, sending [H] flying!</span>")
				H.Knockdown(80)
/obj/vehicle/ridden/space/speedbike/red
	icon_state = "speedbike_red"
	overlay_state = "cover_red"

/obj/item/offhand/handle
	name = "Bike handle"
	desc = "The handle of the bike, used to steer the vehicle on the round. Better get a grip on it"
	icon_state = "bike_handle"
	var/obj/vehicle/ridden/space/speedbike/attachedveh

/obj/item/offhand/handle/dropped(mob/user)
	. = ..()
	attachedveh.crashing()

/obj/vehicle/ridden/space/speedbike/f13
	icon_state = "speedbike_f13"
	overlay_state = "cover_f13"
	key_type = /obj/item/key/custombike
	var/obj/item/offhand/handle/steer = null

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
	var/obj/item/main_hand = M.get_active_held_item()
	var/obj/item/other_item = M.get_inactive_held_item()
	steer = new(M)
	steer.name = "[src]'s handle"
	steer.desc = "you are keeping control of the [src] with this hand."
	steer.attachedveh = src
	if(!main_hand)
		M.put_in_active_hand(steer)
	else if(other_item)
		if(!M.dropItemToGround(other_item, force=FALSE)) //If you cannot remove the item in your hand, don't try and steer the bike.
			to_chat(M, "<span class='notice'>You cannot seem to drop the item in your other hand!</span>")
			return
		M.put_in_inactive_hand(steer)
	else
		M.put_in_inactive_hand(steer)
	. = ..()

/obj/vehicle/ridden/space/speedbike/f13/post_unbuckle_mob(mob/living/M)
	. = ..()
	qdel(steer)
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
