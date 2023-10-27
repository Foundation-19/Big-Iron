/obj/item/stack/halloween_token //DO NOT USE THIS
	name = "halloween token"
	singular_name = "token"
	icon = 'icons/obj/economy.dmi'
	icon_state = "ghost_token"
	amount = 1
	max_amount = 15000
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	full_w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/flavor_desc =	"A strange token, emnanting the energy of Halloween."
	merge_type = /obj/item/stack/halloween_token

/obj/item/stack/halloween_token/random
	var/money_type = /obj/item/stack/halloween_token
	var/min_qty = 1
	var/max_qty = 3

/obj/item/stack/halloween_token/update_icon()
	switch(amount)
		if(1)
			icon_state = "[initial(icon_state)]"
		if(2 to 5)
			icon_state = "[initial(icon_state)]2"
		if(6 to 50)
			icon_state = "[initial(icon_state)]3"
		if(51 to 100)
			icon_state = "[initial(icon_state)]4"
		if(101 to 500)
			icon_state = "[initial(icon_state)]5"
		if(501 to 15000)
			icon_state = "[initial(icon_state)]6"
