/datum/component/storage/concrete/trunk
	var/dumping_sound = 'sound/mecha/neostep1.ogg'


/datum/component/storage/concrete/trunk/mousedrop_onto()
	var/obj/item/mecha_parts/mecha_equipment/trunk/P = parent
	if(!P.chassis)
		P.visible_message("<span class='warning'>The [P] is not installed!.</span>", "<span class='warning'>someone tried to open you!.</span>")
		return
	. = ..()


