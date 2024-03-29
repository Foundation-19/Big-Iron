/obj/item/seeds/mutfruit
	name = "pack of mutfruit seeds"
	desc = "These seeds grow into a mutfruit sapling."
	icon_state = "seed-mutfruit"
	species = "mutfruit"
	plantname = "Mutfruit Sapling"
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "mutfruit-grow"
	icon_dead = "mutfruit-dead"
	product = /obj/item/reagent_containers/food/snacks/grown/mutfruit
	lifespan = 30
	endurance = 20
	yield = 3
	growthstages = 3
	production = 5
	maturation = 5
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.05, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/radium = 0.15)

/obj/item/reagent_containers/food/snacks/grown/mutfruit
	seed = /obj/item/seeds/mutfruit
	name = "mutfruit"
	desc = "Mutfruit provides both hydration and sustenance, but the mutated plant also carries small amounts of radiation."
	icon_state = "mutfruit"
	filling_color = "#FF6347"
	distill_reagent = /datum/reagent/consumable/ethanol/purplecider
	juice_results = list(/datum/reagent/consumable/mutjuice = 1)
