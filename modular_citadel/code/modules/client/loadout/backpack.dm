/datum/gear/backpack
	category = LOADOUT_CATEGORY_BACKPACK
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_GENERAL
	slot = SLOT_IN_BACKPACK

/datum/gear/backpack/crayons
	name = "Box of Crayons"
	path = /obj/item/storage/crayons
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_TOYS
	cost = 2

/datum/gear/backpack/toykatana
	name = "Toy Katana"
	path = /obj/item/toy/katana
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_TOYS
	cost = 3

/datum/gear/backpack/fountainpen
	name = "Fountain Pen"
	path = /obj/item/pen/fountain
	cost = 3

/datum/gear/backpack/multipen
	name = "Multicolored Pen"
	path = /obj/item/pen/fourcolor

/datum/gear/backpack/necklace//this is here because loadout doesn't support proper accessories
	name = "Renameable Necklace"
	path = /obj/item/clothing/accessory/necklace

/datum/gear/backpack/fannypack
	name = "fannypack"
	path = /obj/item/storage/belt/fannypack
	cost = 3

/datum/gear/backpack/tape
	name = "Spare Cassette Tape"
	path = /obj/item/tape/random

/datum/gear/backpack/tapeplayer
	name = "Taperecorder"
	path = /obj/item/taperecorder
	cost = 2

/datum/gear/backpack/donuts
	name = "donut box"
	path = /obj/item/storage/fancy/donut_box
	cost = 2

/datum/gear/backpack/straight_razor
	name = "Straight razor"
	path = /obj/item/melee/onehanded/straight_razor
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS
	cost = 3

/datum/gear/backpack/haircomb
	name = "Plastic comb"
	path = /obj/item/cosmetics/haircomb
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS
	cost = 1

/datum/gear/backpack/hairbrush
	name = "Hair brush"
	path = /obj/item/cosmetics/haircomb/brush
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS
	cost = 1

/datum/gear/backpack/makeupmirror
	name = "Makeup mirror"
	path = /obj/item/cosmetics/mirror_makeup
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS
	cost = 1

/datum/gear/backpack/lipstick
	name = "Red lipstick"
	path = "/obj/item/cosmetics/lipstick"
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS

/datum/gear/backpack/lipstickpurple
	name = "Purple lipstick"
	path = /obj/item/cosmetics/lipstick/purple
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS

/datum/gear/backpack/lipstickjade
	name = "Jade lipstick"
	path = /obj/item/cosmetics/lipstick/jade
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS

/datum/gear/backpack/lipstickblack
	name = "Black lipstick"
	path = /obj/item/cosmetics/lipstick/black
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_COSMETICS


/// Belts

/datum/gear/backpack/redbelt
	name = "primitive belt"
	path = /obj/item/storage/belt/mining/primitive
	cost = 4

/// Cigarettes here, they dont need a special catagory.

/datum/gear/backpack/cigarettes/cigpack_improper
	name = "cigarette pack"
	path = /obj/item/storage/fancy/cigarettes

/datum/gear/backpack/cigarettes/cigpack_bigboss
	name = "Big Boss Smokes"
	path = /obj/item/storage/fancy/cigarettes/cigpack_bigboss

/datum/gear/backpack/cigarettes/cigpack_pyramid
	name = "Pyramid Smokes"
	path = /obj/item/storage/fancy/cigarettes/cigpack_pyramid

/datum/gear/backpack/cigarettes/cigpack_greytort
	name = "Grey Tortoise Smokes"
	path = /obj/item/storage/fancy/cigarettes/cigpack_greytort

/datum/gear/backpack/cigarettes/cigars
	name = "Premium cigar case"
	path = /obj/item/storage/fancy/cigarettes/cigars
	cost = 3

/// Modkits 

/datum/gear/backpack/ahp_suit
	name = "Highway Patrol Jacket modkit"
	path = /obj/item/modkit/ahp_suit
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/ahp_helmet
	name = "Highway Patrol Helmet modkit"
	path = /obj/item/modkit/ahp_helmet
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS


/// Backpacks

/datum/gear/backpack/bbackpack
	name = "hiking backpack"
	path = /obj/item/storage/backpack/old
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_BACKPACKS
	cost = 3

/datum/gear/backpack/bbackpack/duffel
	name = "duffelbag"
	path = /obj/item/storage/backpack/duffelbag

/datum/gear/backpack/bbackpack/explorer
	name = "explorer backpack"
	path = /obj/item/storage/backpack/explorer

/datum/gear/backpack/bbackpack/explorer/satchel
	name = "explorer satchel"
	path = /obj/item/storage/backpack/satchel/explorer

/datum/gear/backpack/bbackpack/trekker
	name = "trekker backpack"
	path = /obj/item/storage/backpack/trekker

/datum/gear/backpack/bbackpack/trekker/satchel
	name = "trekker satchel"
	path = /obj/item/storage/backpack/satchel/trekker

/datum/gear/backpack/bbackpack/sec
	name = "security backpack"
	path = /obj/item/storage/backpack/security
	cost = 4

/datum/gear/backpack/bbackpack/sec/satchel
	name = "security satchel"
	path = /obj/item/storage/backpack/satchel/sec

/datum/gear/backpack/bbackpack/trophy
	name = "trophy rack"
	path = /obj/item/storage/backpack/cultpack
	cost = 3


/datum/gear/backpack/bbackpack/legionr
	name = "legion red cape backpack"
	path = /obj/item/storage/backpack/legionr
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_BACKPACKS
	cost = 2
	restricted_desc = "Legion Veteran+"
	restricted_roles = list("Legion Frumentarius",
							"Legion Centurion",
							"Legion Veteran Decanus",
							"Legion Prime Decanus",
							"Legion Recruit Decanus",
							"Legion Vexillarius",
							"Veteran Legionnaire"
						)

/datum/gear/backpack/bbackpack/legionb
	name = "legion black cape backpack"
	path = /obj/item/storage/backpack/legionb
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_BACKPACKS
	cost = 2
	restricted_desc = "Legion Veteran+"
	restricted_roles = list("Legion Frumentarius",
							"Legion Centurion",
							"Legion Veteran Decanus",
							"Legion Prime Decanus",
							"Legion Recruit Decanus",
							"Legion Vexillarius",
							"Veteran Legionnaire"
						)
