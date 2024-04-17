//This was coded by Fulminating Gold for Eternal Dorman.
//I do not want my code to be associated with ERP, thus
//no server allowing it has my permission to use it.

//Class
/obj/structure/HMG
	name = "M1919 Browning"
	desc = "A heavy machine gun capable of rapidly firing 7.62mm rounds. Alt-Click to unload; screwdriver to repair; wrench to unanchor."
	icon = 'icons/obj/HMG.dmi'
	icon_state = "m2"
	can_buckle = TRUE
	anchored = TRUE
	density = FALSE
	max_integrity = 300
	obj_integrity = 300
	buckle_lying = FALSE
	layer = BELOW_MOB_LAYER
	var/spread = 10
	var/damage_modifier = 25
	var/penetration_modifier = 0.2
	var/mag_type = /obj/item/ammo_box/magazine/ammobelt/m1919
	var/obj/item/ammo_box/magazine/magazine = null
	var/reload_time = 20

/obj/structure/HMG/Initialize()
	.=..()
	update_icon()

//Destroy
/obj/structure/HMG/Destroy()
	if(buckled_mobs)
		for(var/mob/M in buckled_mobs)
			M.pixel_x = 0
			M.pixel_y = 0
	if(magazine)
		magazine.forceMove(drop_location())
		magazine.update_icon()
		magazine = null
	..()

//Unbuckle
/obj/structure/HMG/unbuckle_mob(mob/living/user, force=FALSE)
	STOP_PROCESSING(SSfastprocess, src)
	user.pixel_x = 0
	user.pixel_y = 0
	..()

//Buckle
/obj/structure/HMG/user_buckle_mob(mob/living/M, mob/living/user)
	if(user.incapacitated() || M.incapacitated())
		return
	if(do_after(user, 10, target = src))
		M.forceMove(get_turf(src))
		START_PROCESSING(SSfastprocess, src)
		..()
		update_icon()

//Attack By
/obj/structure/HMG/attackby(obj/item/I, mob/user)
	//Load
	if(istype(I, /obj/item/ammo_box/magazine))
		if(magazine)
			to_chat(user, "<span class='notice'>There is already a magazine in \the [src].</span>")
			return
		var/obj/item/ammo_box/magazine/M = I
		if(M.type == mag_type)
			if(do_after(user, reload_time, target = src))
				if(user.transferItemToLoc(I, src))
					magazine = I
					to_chat(user, "<span class='notice'>You load a new magazine into \the [src].</span>")
					playsound(src, "gun_insert_full_magazine", 70, 1)
					update_icon()
			return
	//Repair
	else if(istype(I, /obj/item/screwdriver))
		var/repair = max_integrity - obj_integrity
		if(!repair)
			to_chat(user, "<span class='notice'>\The [src] is at full health.</span>")
			return
		to_chat(user, "<span class='notice'>You begin repairing \the [src].</span>")
		if(do_after(user, repair, target = src))
			to_chat(user, "<span class='notice'>You finish repairing \the [src].</span>")
			obj_integrity += repair
		return
	//Anchoring
	else if(istype(I, /obj/item/wrench))
		if(!anchored)
			to_chat(user, "<span class='notice'>You begin anchoring \the [src] to the ground.</span>")
			if(do_after(user, 30, target = src))
				to_chat(user, "<span class='notice'>You finish anchoring \the [src] to the ground.</span>")
				anchored = TRUE
		else
			to_chat(user, "<span class='notice'>You begin unanchoring \the [src] to the ground.</span>")
			if(do_after(user, 20, target = src))
				to_chat(user, "<span class='notice'>You finish unanchoring \the [src] to the ground.</span>")
				anchored = FALSE
		return
	..()

//Attack Hand
/obj/structure/HMG/AltClick(mob/user)
	if(magazine)
		if (get_dist(src, user) >1)
			return
		if(do_after(user, reload_time / 2, target = src))
			magazine.forceMove(drop_location())
			user.put_in_hands(magazine)
			magazine.update_icon()
			playsound(src, "sound/weapons/gun_magazine_remove_full.ogg", 70, 1)
			magazine = null
			to_chat(user, "<span class='notice'>You pull the belt out of \the [src].</span>")
			update_icon()
		return
	..()

//Process
/obj/structure/HMG/process()
	//Redundant Check for Unbuckling
	if(!buckled_mobs.len)
		STOP_PROCESSING(SSfastprocess, src)
		return

	//Checks
	if(!buckled_mobs[1])
		return null
	if(!buckled_mobs[1].client)
		return null
	if(buckled_mobs[1].incapacitated())
		buckled_mobs[1] = null
		STOP_PROCESSING(SSfastprocess, src)
		return
	var/client/C = buckled_mobs[1].client
	if(!C.mousePressed)
		return
	if(C.mouseObject == buckled_mobs[1] || C.mouseObject == src)
		return
	if(!anchored)
		to_chat(buckled_mobs[1], "<span class='danger'>You cannot fire when \the [src] is unanchored.</span>")
		playsound(src, "gun_dry_fire", 30, 1)
		return

	//Fire
	fire(buckled_mobs[1], C.mouseObject, C.mouseParams)

	//Set Dir
	setDir(get_dir(buckled_mobs[1], C.mouseObject))

	//Update Icons
	update_icon()

//Fire
/obj/structure/HMG/proc/fire(mob/user, atom/target, params)
	//Find Bullet
	var/obj/item/ammo_casing/bullet
	if(magazine)
		if(magazine.ammo_count())
			bullet = magazine.get_round()
	if(!bullet)
		to_chat(user, "<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)
		return
	if(!bullet.BB)
		to_chat(user, "<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)
		bullet.forceMove(drop_location())
		bullet.bounce_away(TRUE)
		return

	//Fire Bullet
	playsound(src, 'sound/f13weapons/antimaterielfire.ogg', 75, 1)
	var/obj/item/projectile/P = bullet.BB
	P.firer = user
	P.damage += damage_modifier
	P.armour_penetration += penetration_modifier
	P.preparePixelProjectile(target, user, params, rand(-spread,spread))
	P.fire()
	bullet.BB = null

	//Eject Casing
	bullet.forceMove(drop_location())
	bullet.bounce_away(TRUE)

//Update Icons
/obj/structure/HMG/update_icon()
	..()
	//Ammo
	icon_state = initial(icon_state)
	if(!magazine)
		icon_state += "-e"
	//Direction
	if(dir == NORTHEAST || dir == SOUTHEAST)
		dir = EAST
	if(dir == NORTHWEST || dir == SOUTHWEST)
		dir = WEST
	if(buckled_mobs)
		if(buckled_mobs[1])
			buckled_mobs[1].setDir(dir)
			layer = BELOW_MOB_LAYER
			switch(dir)
				if(NORTH)
					buckled_mobs[1].pixel_x = 0
					buckled_mobs[1].pixel_y = -4
				if(SOUTH)
					layer = ABOVE_MOB_LAYER
					buckled_mobs[1].pixel_x = 0
					buckled_mobs[1].pixel_y = 4
				if(EAST)
					buckled_mobs[1].pixel_x = -8
					buckled_mobs[1].pixel_y = 0
				if(WEST)
					buckled_mobs[1].pixel_x = 8
					buckled_mobs[1].pixel_y = 0

//Examine
/obj/structure/HMG/examine(mob/user)
	. = ..()
	if(!magazine)
		. += "<span class='notice'>\The [src] is unloaded.</span>"
	else
		. += "<span class='notice'>[magazine.ammo_count()] rounds are left in \the [src].</span>"

/obj/structure/HMG/cotc
	name = "Defender of the Faith"
	desc = "A repaired M2 Browning capable of rapidly discharging .50 BMG rounds. How did this get here? It is a mystery. Alt-Click to unload; screwdriver to repair; wrench to unanchor."
	icon = 'icons/obj/HMG.dmi'
	icon_state = "m2"
	spread = 16
	damage_modifier = 40
	penetration_modifier = 0.5
	mag_type = /obj/item/ammo_box/magazine/ammobelt/m2
	reload_time = 20

//////////////
//Ammo Belts//
//////////////

/obj/item/ammo_box/magazine/ammobelt
	name = "ammo belt template"
	desc = "this should not exist, report this as a bug"
	icon_state = "762belt"

/obj/item/ammo_box/magazine/ammobelt/can_load()
	return 0

/obj/item/ammo_box/magazine/ammobelt/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),20)]"

/obj/item/ammo_box/magazine/ammobelt/get_round() //Finally deletes itself.
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(delempty)), 0)

/obj/item/ammo_box/magazine/ammobelt/proc/delempty()
	if(ammo_count() < 1)
		del src

/obj/item/ammo_box/magazine/ammobelt/m1919
	name = "ammo belt (7.62mm)"
	icon_state = "762belt"
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 80
	caliber = "a762"

/obj/item/ammo_box/magazine/ammobelt/m2
	name = "ammo belt (.50)"
	icon_state = "762belt"
	ammo_type = /obj/item/ammo_casing/a50MG
	max_ammo = 50
	caliber = "a50MG"
