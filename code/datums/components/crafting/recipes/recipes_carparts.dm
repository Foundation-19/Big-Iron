/datum/crafting_recipe/carpart/trunk
	name = "Modular Trunk"
	result = /obj/item/mecha_parts/mecha_equipment/trunk
	reqs = list(/obj/item/stack/sheet/metal = 5,
	/obj/item/stack/crafting/metalparts = 10,
	/obj/item/stack/sheet/plastic = 5,
	/obj/item/stack/rods = 2)
	tools = list(TOOL_WORKBENCH)
	time = 90
	category = CAT_CARPARTS
	subcategory = CAT_CAREQUIP


/datum/crafting_recipe/carpart/seat
	name = "Mounted Seat"
	result = /obj/item/mecha_parts/mecha_equipment/seat
	reqs = list(/obj/item/stack/sheet/metal = 5,
	/obj/item/stack/crafting/metalparts = 10,
	/obj/item/stack/sheet/leather = 5,
	/obj/item/stack/rods = 5)
	tools = list(TOOL_WORKBENCH)
	time = 90
	category = CAT_CARPARTS
	subcategory = CAT_CAREQUIP

/datum/crafting_recipe/carpart/Car_engine
	name = "Car Engine"
	result = /obj/item/mecha_parts/part/Car_engine
	reqs = list(/obj/item/stack/sheet/metal = 5,
	/obj/item/stack/crafting/metalparts = 5,,)
	tools = list(TOOL_WORKBENCH)
	time = 90
	category = CAT_CARPARTS
	subcategory = CAT_CARPART

/datum/crafting_recipe/carpart/Car_autoshaft
	name = "Car Battery"
	result = /obj/item/mecha_parts/part/Car_engine
	reqs = list(/obj/item/stack/sheet/metal = 5,
	/obj/item/stack/crafting/metalparts = 5,,)
	tools = list(TOOL_WORKBENCH)
	time = 90
	category = CAT_CARPARTS
	subcategory = CAT_CARPART

/datum/crafting_recipe/carpart/Car_battery
	name = "Car Battery"
	result = /obj/item/defibrillator/primitive
	reqs = list(/obj/item/stack/sheet/metal = 5,
	/obj/item/stack/crafting/metalparts = 5,
	/obj/item/stock_parts/capacitor/ = 1,
	/obj/item/stack/cable_coil = 5)
	tools = list(TOOL_WORKBENCH)
	time = 90
	category = CAT_CARPARTS
	subcategory = CAT_CARPART
