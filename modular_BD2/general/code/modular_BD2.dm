/* 	IN THIS FILE
	*	MATERIALS
	*	AUTOLATHES
	*	FALLOUT TOOLS
	*	WORKBENCHES
	*	STRUCTURES
	*	ITEMS
*/

//////////////////////////////////////////////////
//												//
//												//
//					MATERIALS					//
//												//
//												//
//////////////////////////////////////////////////

// ------------ COAL & COKE ------------------ New base material and the sheet that can be used as fuel or ground for charcoal

/datum/material/coal
	name = "coal"
	desc = "coal"
	color = "#0a0a0a"
	alpha = 150
	categories = list(MAT_CATEGORY_RIGID = TRUE, MAT_CATEGORY_BASE_RECIPES = FALSE)
	sheet_type = /obj/item/stack/ore/coal
	value_per_unit = 0.0050

/obj/item/stack/ore/coal // turns to coke when heated in a Furnace or ORM
	name = "coal"
	desc = "Pure coal needs heat-processing to become efficient fuel."
	icon = 'modular_BD2/general/icons/stackable_items.dmi'
	icon_state = "ore_coal"
	singular_name = "lump of coal"
	points = 2
	custom_materials = null
	refined_type = /obj/item/stack/sheet/coke
	merge_type = /obj/item/stack/ore/coal
	resistance_flags = FLAMMABLE

/obj/item/stack/sheet/coke // Can be used to fuel Furnaces, Campfires, Barrel Fires, Potbelly stoves, Fireplaces, or grind for charcoal
	name = "coke"
	desc = "Coke is what you get when you heat-treat coal. It's a good fuel for burning, use it in furnaces, grills, potbelly stoves and so on."
	singular_name = "bag of coke"
	icon = 'modular_BD2/general/icons/stackable_items.dmi'
	icon_state = "sheet_coke"
	custom_materials = null
	throwforce = 2
	grind_results = list(/datum/reagent/medicine/charcoal = 5)
	material_type = /datum/material/coal
	merge_type = /obj/item/stack/sheet/coke
	resistance_flags = FLAMMABLE

/obj/item/stack/sheet/coke/twenty
	amount = 20

/turf/closed/mineral/coal
	mineralType = /obj/item/stack/ore/coal
	spreadChance = 5
	spread = 1
	scan_state = "rock_Coal"


//////////////////////////////////////////////////
//												//
//												//
//					AUTOLATHES					//
//												//
//												//
//////////////////////////////////////////////////

// ------------------------------- MANUAL AUTOLATHE ------------------------------

/obj/machinery/autolathe/manual
	name = "manual lathe"
	desc = "Produce simple items with manually cranked tools."
	icon = 'modular_BD2/general/icons/autolathe_primitive.dmi'
	icon_state = "autolathe"
	use_power = NO_POWER_USE
	circuit = /obj/item/circuitboard/machine/autolathe/manual
	tooadvanced = FALSE
	categories = list(
					"Tools",
					"Construction",
					"Equipment",
					"Medical",
					"Misc",
					"Dinnerware",
					)
	base_print_speed = 30
	allowed_materials = list(
		/datum/material/iron,
		/datum/material/glass,
		/datum/material/titanium,
		/datum/material/bone,
		/datum/material/lead
		)
	stored_research = /datum/techweb/specialized/autounlocking/autolathe/manual

/obj/item/circuitboard/machine/autolathe/manual // not reinventing machine building entirely even if its dorky
	name = "manual lathe kit"
	build_path = /obj/machinery/autolathe/manual

/datum/techweb/specialized/autounlocking/autolathe/manual
	design_autounlock_buildtypes = AUTOLATHE_PRIMITIVE
	allowed_buildtypes = AUTOLATHE_PRIMITIVE


// ------------------------------- MANUAL AUTOLATHE DESIGNS ------------------------------

/datum/design/hemostat_primitive
	name = "Hemostat (primitive)"
	id = "hemostat_primitive"
	materials = list(/datum/material/iron = ONE_SHEET*2, /datum/material/bone = HALF_SHEET)
	build_path = /obj/item/hemostat/tribal
	category = list("initial", "Medical")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/cautery_primitive
	name = "Cautery (primitive)"
	id = "cautery_primitive"
	materials = list(/datum/material/iron = ONE_SHEET*2, /datum/material/glass = HALF_SHEET)
	build_path = /obj/item/cautery/primitive
	category = list("initial", "Medical")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/razor
	name = "Straight razor"
	id = "straigth_razor"
	materials = list(/datum/material/iron = ONE_SHEET*2, /datum/material/bone = HALF_SHEET)
	build_path = /obj/item/melee/onehanded/straight_razor
	category = list("initial", "Medical")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/retractor_primitive
	name = "Retractor (primitive)"
	id = "retractor_primitive"
	materials = list(/datum/material/iron = ONE_SHEET*2, /datum/material/bone = HALF_SHEET)
	build_path = /obj/item/retractor/tribal
	category = list("initial", "Medical")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/bonesetter_primitive
	name = "Bonesetter (primitive)"
	id = "bonesetter_primitive"
	materials = list(/datum/material/iron = ONE_SHEET*2, /datum/material/bone = HALF_SHEET)
	build_path = /obj/item/bonesetter/primitive
	category = list("initial", "Medical")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/handsaw
	name = "Hand saw"
	id = "handsaw"
	materials = list(/datum/material/iron =  ONE_SHEET*3)
	build_path = /obj/item/circular_saw/primitive
	category = list("initial", "Medical")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/lantern
	name = "Lantern"
	id = "lantern"
	materials = list(/datum/material/iron = ONE_SHEET, /datum/material/glass = ONE_SHEET)
	build_path = /obj/item/flashlight/lantern
	category = list("initial","Equipment")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/binoculars
	name = "Binoculars"
	id = "binoculars"
	materials = list(/datum/material/lead = ONE_SHEET*2, /datum/material/glass =  ONE_SHEET*10) // leaded glass
	build_path = /obj/item/binoculars
	category = list("initial","Equipment")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/weldingtool_basic
	name = "Welding tool"
	id = "weldingtool_basic"
	materials = list(/datum/material/iron = ONE_SHEET, /datum/material/glass = QUARTER_SHEET)
	build_path = /obj/item/weldingtool/basic
	category = list("initial","Tools")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/screwdriver_basic
	name = "Screwdriver"
	id = "screwdriver_basic"
	materials = list(/datum/material/iron = QUARTER_SHEET)
	build_path = /obj/item/screwdriver/basic
	category = list("initial","Tools")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/wirecutters_basic
	name = "Wirecutters"
	id = "wirecutters_basic"
	materials = list(/datum/material/iron = QUARTER_SHEET)
	build_path = /obj/item/wirecutters/basic
	category = list("initial","Tools")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/wrench_basic
	name = "Wrench"
	id = "wrench_basic"
	materials = list(/datum/material/iron = HALF_SHEET)
	build_path = /obj/item/wrench/basic
	category = list("initial","Tools")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/crowbar_basic
	name = "Crowbar"
	id = "crowbar_basic"
	materials = list(/datum/material/iron = HALF_SHEET)
	build_path = /obj/item/crowbar/basic
	category = list("initial","Tools")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/metal_parts
	name = "Metal parts"
	id = "metalparts"
	materials = list(/datum/material/iron = ONE_SHEET*5)
	build_path = /obj/item/stack/crafting/metalparts
	category = list("initial","Construction")
	build_type = AUTOLATHE_PRIMITIVE
	maxstack = 50

/datum/design/hq_parts
	name = "High quality parts"
	id = "hqparts"
	materials = list(/datum/material/titanium = ONE_SHEET*5)
	build_path = /obj/item/stack/crafting/goodparts
	category = list("initial","Construction")
	build_type = AUTOLATHE_PRIMITIVE
	maxstack = 50

/datum/design/titanium
	name = "Titanium sheet"
	id = "titanium_sheet"
	build_type = AUTOLATHE | AUTOLATHE_PRIMITIVE
	materials = list(/datum/material/titanium = ONE_SHEET)
	build_path = /obj/item/stack/sheet/mineral/titanium
	category = list("initial","Construction")
	maxstack = 50

/datum/design/chain
	name = "Length of chain"
	id = "chain"
	materials = list(/datum/material/iron = ONE_SHEET)
	build_path = /obj/item/blacksmith/chain
	category = list("initial","Construction")
	build_type = AUTOLATHE_PRIMITIVE

/datum/design/lunchbox
	name = "Lunchbox"
	id = "lunchbox"
	build_type = AUTOLATHE_PRIMITIVE
	materials = list(/datum/material/iron = ONE_SHEET)
	build_path = /obj/item/crafting/lunchbox
	category = list("initial", "Misc")

/datum/design/beartrap
	name = "Beartrap"
	id = "beartrap"
	build_type = AUTOLATHE_PRIMITIVE
	materials = list(/datum/material/titanium = ONE_SHEET)
	build_path = /obj/item/restraints/legcuffs/beartrap
	category = list("initial", "Misc")

/datum/design/coffeepot
	name = "Coffeepot"
	id = "coffeepot"
	build_type = AUTOLATHE_PRIMITIVE
	materials = list(/datum/material/iron = ONE_SHEET)
	build_path = /obj/item/crafting/coffee_pot
	category = list("initial", "Misc")
/*
// Also the following recipes has added | AUTOLATHE_PRIMITIVE
/datum/design/earmuffs, /datum/design/bowl, /datum/design/drinking_glass, /datum/design/handcuffs,  /datum/design/igniter /datum/design/welding_helmet, /datum/design/extinguisher, /datum/design/timer, /datum/design/syringe
/datum/design/spraybottle,/datum/design/kitchen_knife, /datum/design/beaker, /datum/design/bucket, /datum/design/cable_coil,  /datum/design/spraycan /datum/design/handlabeler/datum/design/toolbox,
*/
// ------------------------------- MILITARY AUTOLATHE ------------------------------

/obj/machinery/autolathe/military
	name = "military autolathe"
	desc = "Ancient technology, still works."
	icon = 'modular_BD2/general/icons/autolathe_military.dmi'
	circuit = /obj/item/circuitboard/machine/autolathe/military

/obj/item/circuitboard/machine/autolathe/military
	name = "army lathe circuit board"

/*
// ------------------------------- AMMOLATHE ------------------------------
autolathe.dm added overlays & casing bag stuff



//////////////////////////////////////////////////
//												//
//												//
//					FALLOUT TOOLS				//
//												//
//												//
//////////////////////////////////////////////////

// ------------------------------- BASIC TOOLS ------------------------------

/obj/item/screwdriver/basic
	name = "basic screwdriver"
	desc = "Shoddy workmanship, but the tool is fully functional."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "screwdriver_basic"
	item_state = "screwdriver_basic"
	toolspeed = 1.1
	random_color = FALSE

/obj/item/wrench/basic
	name = "wrench (basic)"
	desc = "No movable parts, just a simple wrench."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "wrench_basic"
	item_state = "wrench_basic"
	toolspeed = 1.2

/obj/item/crowbar/basic
	name = "crowbar"
	desc = "Made of poor quality steel and has a rough finish, but it does get the job done."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "crowbar_basic"
	item_state = "crowbar_basic"
	toolspeed = 1.5

/obj/item/wirecutters/basic
	name = "basic wirecutters"
	desc = "Almost sharp cutters, maded of various bits of scrap metal."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "wirecutters_basic"
	item_state = "wirecutters_basic"
	toolspeed = 1.3
	random_color = FALSE

/obj/item/weldingtool/basic
	name = "basic welding tool"
	desc = "Has some small fuel leaks and looks like its just some rusty piece of junk, but somehow it works."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "welder_basic"
	item_state = "welder_basic"
	toolspeed = 1.1


// ------------------------------- PRE-WAR TOOLS ------------------------------  Idea is not buildable, obviously, and about 50% better than standard tools.

/obj/item/wirecutters/prewar
	name = "wirecutters (prewar)"
	desc = "High quality steel and precise mechanism."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "wirecutters_prewar"
	item_state = "wirecutters_prewar"
	toolspeed = 0.4
	random_color = FALSE

/obj/item/wrench/prewar // obsolete due to power drill
	name = "wrench (prewar)"
	desc = "An torque locking tool thats very good for wrenching."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "wrench_prewar"
	item_state = "wrench_prewar"
	toolspeed = 0.5

/obj/item/screwdriver/prewar
	name = "screwdriver (prewar)"
	desc = "Polymer handle, blackened steel finish, its a high-quality tool for sure.""
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "screwdriver_prewar"
	item_state = "screwdriver_prewar"
	toolspeed = 0.5
	random_color = FALSE

/obj/item/crowbar/prewar
	name = "crowbar (prewar)"
	desc = "Heat-resistant powder coating, smooth steel surfaces, its a high-quality tool for sure.""
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "crowbar_prewar"
	item_state = "crowbar_prewar"
	toolspeed = 0.8

/obj/item/screwdriver/power // obsolete due to power drill
	icon = 'modular_BD2/general/icons/tools.dmi'
	icon_state = "drill_screw"
	item_state = "drill"
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'

/obj/item/wrench/power
	icon = 'modular_BD2/general/icons/tools.dmi'
	icon_state = "drill_bolt"
	item_state = "drill"
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'

/obj/item/weldingtool/prewar
	name = "welding tool (pre-war)"
	desc = "Comfortable grip, large tank and precise cutting."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "welder_prewar"
	item_state = "welder_prewar"
	toolspeed = 0.7
	max_fuel = 40

/obj/item/metaldetector
	name = "metal detector"
	desc = "Detects buried metals in a 50 metre radius when activated."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "metaldetect"

*/

//////////////////////////////////////////////////
//												//
//												//
//					WORKBENCHES					//
//												//
//												//
//////////////////////////////////////////////////
/*
// ------------ WORKBENCHES ------------------ 
Art & tool behaviours updated
/obj/machinery/workbench
/obj/machinery/workbench/advanced
/obj/machinery/workbench/forge // should be repathed to worbench/metal
*/



//////////////////////////////////////////////////
//												//
//												//
//					STRUCTURES					//
//												//
//												//
//////////////////////////////////////////////////

// ------------ CRATES ------------------ 
// crates.dm

// ------------ BBQ ------------------ 
//	grill.dm edited for fueltypes and layers
//	campfire.dm edited for fueltypes, layers, sounds


//////////////////////////////////////////////////
//												//
//												//
//					ITEMS						//
//												//
//												//
//////////////////////////////////////////////////

// -------------------- TOOLBOX (PREWAR) ------------------  Meant to be loot possible to find in well preserved high tech places
/*	
/obj/item/storage/toolbox/prewar
	name = "toolbox (pre-war)"
	desc = "Plastic toolbox, made long ago."
	icon = 'modular_BD2/general/icons/tools.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	icon_state = "toolbox_prewar"
	item_state = "toolbox_prewar"
	custom_materials = list(/datum/material/plastic = 500)

/obj/item/storage/toolbox/prewar/PopulateContents()
	new /obj/item/crowbar/prewar(src)
	new /obj/item/wirecutters/prewar(src)
	new /obj/item/wrench/prewar(src)
	new /obj/item/weldingtool/prewar(src)
	new /obj/item/screwdriver/prewar(src)
	new	/obj/item/multitool(src)
*/

// ------------------------------- ABRAXO SPRAYBOTTLE ------------------------------
// Abraxo spray is now made by adding Abraxo to a spray bottle, not taking a pinch of glass and snap your fingers.
// Abraxo my beloved. Slap it on spray bottle, clean away.

/obj/item/reagent_containers/spray/empty/attackby(obj/item/C, mob/user, params)
	if(istype(C, /obj/item/crafting/abraxo))
		user.visible_message("[user] begins filling the[src] with Abraxo solution.", \
				span_notice("You begin filling he [src] with Abraxo. Smells nice."))
//				span_italic("You hear faint bubbling sounds.")) why italic no work =/
		playsound(get_turf(src), 'modular_BD2/general/sound/abraxo.ogg', 100, TRUE)
		if(!do_after(user, 40, TRUE, src))
			return
		new /obj/item/reagent_containers/spray/cleaner(drop_location())
		qdel(src)
		qdel(C)
		return
	return ..()

/obj/item/reagent_containers/spray/empty
	desc = "A spray bottle, with an unscrewable top. Meant to be filled with Abraxo for superior cleanliness."
	icon = 'modular_BD2/general/icons/cleaning.dmi'
	icon_state = "cleaner_empty"

// ------------------------------- MATCHBOX FIX ------------------------------
// boxes.dm

// ------------ CRAFING STACKABLE ICON UPDATERS ------------------
// crafting.dm

// -------------------- CRAFTING RECIPES ------------------

/datum/crafting_recipe/broom
	name = "Broom"
	result = /obj/item/broom
	time = 50
	reqs = list(/obj/item/stack/sheet/hay = 2,
				/obj/item/stack/sheet/mineral/wood = 4)
	category = CAT_CRAFTING
	subcategory = CAT_TOOL

/datum/crafting_recipe/mop
	name = "Mop"
	result = /obj/item/mop
	time = 50
	reqs = list(/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/mineral/wood = 4)
	category = CAT_CRAFTING
	subcategory = CAT_TOOL

/*
// -------------------- ARMOR KIT CUSTOMIZATION ------------------ Because I like slapcrafting and Id like for my shoulder kit to be craftable

/obj/item/clothing/suit/armor/light/kit/attackby(obj/item/C, mob/user, params)
	if(istype(C, /obj/item/crafting/duct_tape))
		user.visible_message("[user] begins taping on some punky bits to the the [src].", \
				span_notice("You begin taping some punkish item on the [src]."), \
				span_italic("You hear someone tape stuff together."))
		playsound(src, 'sound/f13items/craft_2.ogg', 100, TRUE)
		if(!do_after(user, 40, TRUE, src))
			return
		new /obj/item/clothing/suit/armor/light/kit/punk(drop_location())
		qdel(src)
		qdel(C)
		return
	if(istype(C, /obj/item/stack/sheet/metal))
		user.visible_message("[user] begins adding metal sheet to the the [src].", \
				span_notice("You begin attaching some metal sheet on the [src]."), \
				span_italic("You hear grunts as someone tries to bend metal with their hands."))
		playsound(src, 'sound/f13items/craft_2.ogg', 100, TRUE)
		if(!do_after(user, 40, TRUE, src))
			return
		new /obj/item/clothing/suit/armor/light/kit/plates(drop_location())
		qdel(src)
		C.use(1)
		return
	if(C.tool_behaviour == TOOL_WIRECUTTER)
		user.visible_message("[user] begins cutting new straps to wear [src] differently.", \
				span_notice("You begin cutting straps and readjusting the [src]."), \
				span_italic("You hear the snips of a wirecutter on fabric."))
		playsound(src, 'sound/weapons/slice.ogg', 50, TRUE)
		if(!do_after(user, 40, TRUE, src))
			return
		new /obj/item/clothing/suit/armor/light/kit/shoulder(drop_location())
		qdel(src)
		return
	return ..()


// -------------------- HAIR & BEARDS ------------------
Files edited to make the new hair icon set work:
species.dm adjusted for new hair an beard suffixes + changed names.
hair_head.dm
hair_face.dm
*/



//////////////////////////////////////////
// 										//
//										//
//			PRIMITIVE MEDICAL			//
//										//
//										//
//////////////////////////////////////////

// ------------------- BUTCHERS TABLE -----------------------------

/obj/structure/table/optable/primitive
	name = "butchers table"
	desc = "Used for painful, primitive medical procedures."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'


// ------------------- PRIMITIVE SURGERY STUFF -----------------------------  Could use more janky ghetto stuff feeling, messing about in the wound datums maybe or whatnot. Currently basically reskins with a bit slower speed.

/obj/item/cautery/primitive
	name = "primitive cautery"
	desc = "A welding device tuned down to cauterize wounds. Not very precise."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	righthand_file = 'modular_BD2/legio_invicta/icons/onmob_legion_righthand.dmi'
	lefthand_file = 'modular_BD2/legio_invicta/icons/onmob_legion_lefthand.dmi'
	icon_state = "cautery_primitive"
	toolspeed = 1.5

/obj/item/circular_saw/primitive
	name = "handsaw"
	desc = "For sawing through wood or possibly bones."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "saw"
	item_state = "saw"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	hitsound = 'sound/effects/shovel_dig.ogg'
	usesound = 'sound/effects/shovel_dig.ogg'
	custom_materials = list(/datum/material/iron=2000)
	toolspeed = 1.2
	wound_bonus = 0
	bare_wound_bonus = 10
	attack_verb = list("sawed", "scratched")

/obj/item/hemostat/tribal
	name = "primitive hemostat (flesh-poker)"
	desc = "A pinching device made from bone to clamp bleedings with"
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "hemostat_primitive"
	toolspeed = 1.6

/obj/item/retractor/tribal
	name = "primitive retractor (skin-puller)"
	desc = "Pries the flesh and bones open."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "retractor_primitive"
	toolspeed = 1.6

/obj/item/bonesetter/primitive
	name = "mallet (bonesetter)"
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "mallet"
	lefthand_file = 'modular_BD2/general/icons/lefthand.dmi'
	righthand_file = 'modular_BD2/general/icons/righthand.dmi'
	custom_materials = list(/datum/material/iron=2000)
	toolspeed = 1.6


/obj/item/stack/medical/bone_gel/superglue
	name = "superglue (bonegel)"
	singular_name = "superglue"
	desc = "Good for gluing together broken bones!"
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "superglue"
	lefthand_file = NONE
	righthand_file = NONE
	grind_results = NONE

/obj/item/reagent_containers/medspray/sterilizine/honey
	name = "medical honey (sterilizer)"
	desc = "Pure honey has antiseptic properties, and probably works just as a sterilizing agent."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "sterilizer_honey"
	apply_method = "smear"
	sound_squirt = 'modular_BD2/general/sound/honey.ogg'


// ------------------- PRIMITIVE MEDICAL BAG -----------------------------

/obj/item/storage/backpack/duffelbag/med/surgery/primitive
	name = "surgical duffel bag"
	desc = "A large duffel bag for holding extra medical supplies - this one seems to be designed for holding surgical tools."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	righthand_file = 'modular_BD2/legio_invicta/icons/onmob_legion_righthand.dmi'
	lefthand_file = 'modular_BD2/legio_invicta/icons/onmob_legion_lefthand.dmi'
	icon_state = "toolbag_primitive"

/obj/item/storage/backpack/duffelbag/med/surgery/primitive/PopulateContents()
	new /obj/item/melee/onehanded/straight_razor(src)
	new /obj/item/hemostat/tribal(src)
	new /obj/item/retractor/tribal(src)
	new /obj/item/circular_saw/primitive(src)
	new /obj/item/cautery/primitive(src)
	new /obj/item/bonesetter/primitive(src)
	new /obj/item/bedsheet/blanket(src)
	new /obj/item/reagent_containers/medspray/sterilizine/honey(src)
	new /obj/item/stack/sticky_tape/surgical(src)
	new /obj/item/stack/medical/bone_gel/superglue(src)

/obj/item/storage/backpack/duffelbag/med/surgery/primitive/anchored
	name = "surgical toolset"
	desc = "Large piece of felt with various surgical tools laid out."
	icon_state = "surgicalset_primitive"
	anchored = TRUE


// ------------------- PRIMITIVE IV DRIP -----------------------------

/obj/machinery/iv_drip/primitive
	name = "wooden IV drip"
	desc = "Simple frame for infusing liquids using gravity. Can't suck out fluids."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	anchored = TRUE
	plane = GAME_PLANE

/* 
/obj/machinery/iv_drip/verb/toggle_mode() updated
added this to make the overlay actually work
			var/mutable_appearance/filling_overlay = mutable_appearance('modular_BD2/icons/primitive_medical.dmi', "reagent")
*/


// ------------------- PRIMITIVE DEFIB MOUNT -----------------------------

/obj/machinery/defibrillator_mount/primitive
	desc = "Holds a primitive defibrillator."
	icon = 'modular_BD2/general/icons/primitive_medical.dmi'
	icon_state = "defibrillator_mount"
	density = FALSE
	use_power = FALSE
	clamps_locked = TRUE
	plane = GAME_PLANE

/obj/machinery/defibrillator_mount/primitive/Initialize() //loaded subtype for mapping use
	. = ..()
	defib = new/obj/item/defibrillator/primitive(src)
	update_overlays()


// ------------------- PRIMITIVE MEDICAL TOOLBELT -----------------------------

/obj/item/storage/belt/medical/primitive
	name = "primitive medical toolbelt"
	desc = "This might look a bit like a toolbelt for a carpenter, but the items inside are meant to be used in surgery. No really."
	icon = 'modular_BD2/legio_invicta/icons/icons_legion.dmi'
	righthand_file = 'modular_BD2/legio_invicta/icons/onmob_legion_righthand.dmi'
	lefthand_file = 'modular_BD2/legio_invicta/icons/onmob_legion_lefthand.dmi'
	mob_overlay_icon = 'modular_BD2/legio_invicta/icons/onmob_legion.dmi'
	icon_state = "belt_blacksmith"
	item_state = "belt_blacksmith"

/obj/item/storage/belt/medical/primitive/PopulateContents()
	new /obj/item/surgical_drapes(src)
	new /obj/item/melee/onehanded/straight_razor(src)
	new /obj/item/circular_saw/primitive(src)
	new /obj/item/retractor/tribal(src)
	new /obj/item/hemostat/tribal(src)
	new /obj/item/cautery/primitive(src)
	new /obj/item/bonesetter/primitive(src)

