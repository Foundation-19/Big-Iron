#define NCR_FLAG /obj/item/flagholdable/ncrholdable
#define LEGION_FLAG /obj/item/flagholdable/legionholdable

//ctf, XElectricX did all this work, praise him
//The item variants
/obj/item/flagholdable
	name = "flag"
	desc = "A cloth banner on a metal rod."
	icon = 'icons/obj/holdableflags.dmi'
	icon_state = "ncrholdable"
	resistance_flags = INDESTRUCTIBLE
	w_class = WEIGHT_CLASS_HUGE

/obj/item/flagholdable/ncrholdable
	name = "\improper NCR flag"
	desc = "Proudly displaying the two-headed bear of the Republic."
	icon = 'icons/obj/holdableflags.dmi'
	icon_state = "ncrholdable"
	item_state = "ncrholdable"
	lefthand_file = 'icons/obj/holdableflags.dmi'
	righthand_file = 'icons/obj/holdableflags.dmi'

/obj/item/flagholdable/legionholdable
	name = "\improper Legion flag"
	desc = "The red of the Legion army trimmed in gold, featuring the mighty bull."
	icon = 'icons/obj/holdableflags.dmi'
	icon_state = "legionholdable"
	item_state = "legionholdable"
	lefthand_file = 'icons/obj/holdableflags.dmi'
	righthand_file = 'icons/obj/holdableflags.dmi'

//The structure variants
/obj/structure/flag
	name = "flag pole"
	desc = "Metal pole for hanging a flag."
	icon = 'icons/obj/flags.dmi'
	icon_state = "emptyflag"
	layer = ABOVE_ALL_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE
	var/flag_faction
	var/flag_type
	var/has_flag = TRUE

/obj/structure/flag/ncr
	name = "\improper NCR flag"
	desc = "Proudly displaying the two-headed bear of the Republic."
	icon = 'icons/obj/flags.dmi'
	icon_state = "ncrflag"
	flag_faction = FACTION_NCR
	flag_type = NCR_FLAG

/obj/structure/flag/legion
	name = "\improper Legion flag"
	desc = "The red of the Legion army trimmed in gold, featuring the mighty bull."
	icon = 'icons/obj/flags.dmi'
	icon_state = "legionflag"
	flag_faction = FACTION_LEGION
	flag_type = LEGION_FLAG


/obj/structure/flag/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, 0, 0, 0, 1)

/obj/structure/flag/update_icon()
	. = ..()
	icon_state = has_flag ? initial(icon_state) : "emptyflag"

/obj/structure/flag/attack_hand(mob/living/user)
	. = ..()
	flag_remove(user)

/obj/structure/flag/proc/flag_remove(mob/living/user,)
	if(!has_flag)
		return
	if(flag_faction == user.faction)	//To prevent people from taking the flag roundstart to hide or grief
		to_chat(user, span_warning("You can't take your own faction's flag!"))
		return
	has_flag = FALSE
	user.put_in_active_hand(new flag_type)
	update_icon()

/obj/structure/flag/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, flag_type))		//Returning your flag
		flag_add(I)
		return
	if(flag_faction == user.faction)	//To prevent grief
		to_chat(user, span_warning("What are you, French?"))
		return
	if(istype(I, /obj/item/flagholdable) && user.faction == flag_faction)	//Ends the game if it's a foreign flag with an anti-grief check
		flag_captured(I, user)


//Readds your flag back to the pole
/obj/structure/flag/proc/flag_add(obj/item/I)
	if(has_flag)
		return
	has_flag = TRUE
	qdel(I)
	update_icon()

//Determines who wins

/obj/structure/flag/proc/flag_captured(obj/item/I, mob/user, params)
	if(!has_flag)
		visible_message(span_alert("The home flag is missing! It needs to be on the pole to win!"))
		return
	switch(flag_type)
		if(NCR_FLAG)
			message_admins("Round finished: NCR victory") //NCR took objective
			SSjob.flagcaptured += FACTION_LEGION //disables spawning for Legion
		if(LEGION_FLAG)
			message_admins("Round finished: Legion victory") //Legion took objective
			SSjob.flagcaptured += FACTION_NCR //disables spawning for NCR
	qdel(I)
