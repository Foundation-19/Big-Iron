/obj/item/reagent_containers/food/snacks/grown/wild_windsown_weed
	seed = /obj/item/seeds/tato
	name = "Wild Windsown Weed"
	desc = "A very light weed that floats about, gathering other seeds until they are too heavy to move, setting down somewhere on the ground."
	icon_state = "Wild_Windswon_Weed"
	icon = 'icons/obj/hydroponics/harvest.dmi'
	juice_results = list(/datum/reagent/consumable/tea = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/wastemead

/obj/item/reagent_containers/food/snacks/grown/wild_windsown_weed/Initialize()
	var/obj/machinery/vending/hydroseeds/tempmachine = new
	var/list/allseeds = tempmachine.products
	allseeds |= tempmachine.contraband
	var/obj/item/seeds/chosen_seed = pick(allseeds)
	seed = chosen_seed
	. = ..()
