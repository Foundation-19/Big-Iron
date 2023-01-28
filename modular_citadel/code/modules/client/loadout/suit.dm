/datum/gear/suit
	category = LOADOUT_CATEGORY_SUIT
	subcategory = LOADOUT_SUBCATEGORY_SUIT_GENERAL
	slot = SLOT_WEAR_SUIT


/datum/gear/suit/overalls
	name = "farmers overalls"
	path = /obj/item/clothing/suit/overalls/farmer
	cost = 2

/datum/gear/suit/cowboy_angeleyes
	name = "elegant cowboy jacket"
	path = /obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy
	cost = 3

/datum/gear/suit/cowboy_blondie
	name = "brown and white poncho"
	path = /obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy/blondie
	cost = 3

/datum/gear/suit/cowboy_tuco
	name = "dirty poncho"
	path = /obj/item/clothing/under/f13/fashion/cowboy_tuco
	cost = 3

/datum/gear/suit/redhood
	name = "red cloak"
	path = /obj/item/clothing/suit/hooded/cloak/david
	cost = 3

/datum/gear/suit/labcoat
	name = "labcoat"
	path = /obj/item/clothing/suit/toggle/labcoat
	cost = 2

/datum/gear/suit/jacketbomber
	name = "bomber jacket"
	path = /obj/item/clothing/suit/jacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/oldjacketbomber
	name = "old bomber jacket"
	path = /obj/item/clothing/suit/bomber
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/jacketflannelblack // all of these are reskins of bomber jackets but with the vibe to make you look like a true lumberjack
	name = "black flannel jacket"
	path = /obj/item/clothing/suit/jacket/flannel
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/jacketflannelred
	name = "red flannel jacket"
	path = /obj/item/clothing/suit/jacket/flannel/red
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/jacketflannelaqua
	name = "aqua flannel jacket"
	path = /obj/item/clothing/suit/jacket/flannel/aqua
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/jacketflannelbrown
	name = "brown flannel jacket"
	path = /obj/item/clothing/suit/jacket/flannel/brown
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/jacketleather
	name = "leather jacket"
	path = /obj/item/clothing/suit/armor/f13/leather_jacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/overcoatleather
	name = "leather overcoat"
	path = /obj/item/clothing/suit/jacket/leather/overcoat
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/jacketpuffer
	name = "puffer jacket"
	path = /obj/item/clothing/suit/jacket/puffer
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/vestpuffer
	name = "puffer vest"
	path = /obj/item/clothing/suit/jacket/puffer/vest
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/jacketlettermanbrown
	name = "brown letterman jacket"
	path = /obj/item/clothing/suit/jacket/letterman
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/jacketlettermanred
	name = "red letterman jacket"
	path = /obj/item/clothing/suit/jacket/letterman_red
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 2

/datum/gear/suit/militaryjacket
	name = "military Jacket"
	path = /obj/item/clothing/suit/jacket/miljacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/flakjack
	name = "flak Jacket"
	path = /obj/item/clothing/suit/flakjack
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/armorkit
	name = "armor Kit"
	path = /obj/item/clothing/suit/armor/f13/kit
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 5

/datum/gear/suit/punkkit
	name = "punk Armor Kit"
	path = /obj/item/clothing/suit/armor/f13/punk
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 5

/datum/gear/suit/autumn
	name = "tan trenchcoat"
	path = /obj/item/clothing/suit/f13/autumn
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 3

/datum/gear/suit/ncrcfjacket
	name = "NCRCF jacket"
	path = /obj/item/clothing/suit/armor/f13/ncrcfjacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	cost = 1

/datum/gear/suit/NCRutilityvest
	name = "Utility Vest"
	path = /obj/item/clothing/suit/armor/f13/utilityvest
	subcategory = LOADOUT_SUBCATEGORY_SUIT_FACTIONS
	cost = 4
	restricted_desc = "NCR"
	restricted_roles = list("NCR Captain",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Veteran Ranger",
							"NCR Ranger",
							"NCR Heavy Trooper",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Military Police",
							"NCR Trooper",
							"NCR Off-Duty"
						)



/datum/gear/suit/fieldscribe
	name = "Fieldscribe suit"
	path = /obj/item/clothing/suit/toggle/labcoat/fieldscribe
	subcategory = LOADOUT_SUBCATEGORY_SUIT_FACTIONS
	cost = 5
	restricted_desc = "Scribes"
	restricted_roles = list("Head Scribe",
							"Senior Scribe",
							"Scribe"
							)

/datum/gear/suit/scribecoat
	name = "Fieldscribe coat"
	path = /obj/item/clothing/suit/toggle/labcoat/scribecoat
	subcategory = LOADOUT_SUBCATEGORY_SUIT_FACTIONS
	cost = 5
	restricted_desc = "Scribes"
	restricted_roles = list("Head Scribe",
							"Senior Scribe",
							"Scribe"
							)

/datum/gear/suit/town
	name = "Town Trenchcoat"
	path = /obj/item/clothing/suit/armor/f13/town
	subcategory = LOADOUT_SUBCATEGORY_SUIT_FACTIONS
	cost = 4
	restricted_desc = "Oasis"
	restricted_roles = list("Mayor",
							"Secretary",
							"Chief of Police",
							"Doctor",
							"Citizen",
							"Officer",
							"Shopkeeper",
							"Farmer",
							"Prospector",
							"Detective",
							"Barkeep"
							)

/datum/gear/suit/deputyvest
	name = "OPD armor vest"
	path = /obj/item/clothing/suit/armor/vest/oasis
	subcategory = LOADOUT_SUBCATEGORY_SUIT_FACTIONS
	cost = 4
	restricted_desc = "Oasis Police, Oasis Officials"
	restricted_roles = list("Chief of Police",
							"Officer",
							"Mayor",
							"Detective",
							"Secretary",
							"Shopkeeper"
						)

/datum/gear/suit/hazardvest
	name = "Hazard Vest"
	path = /obj/item/clothing/suit/hazardvest
	subcategory = LOADOUT_SUBCATEGORY_SUIT_FACTIONS
	cost = 2
	restricted_roles = list("Citizen",
							"Prospector"
							)


//These should be left commented out until the holidays or special events.
/*
/datum/gear/suit/christmascoatr
	name = "Red Christmas Coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/christmascoatr
	subcategory = LOADOUT_SUBCATEGORY_SUIT_COATS

/datum/gear/suit/christmascoatg
	name = "Green Christmas Coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/christmascoatg
	subcategory = LOADOUT_SUBCATEGORY_SUIT_COATS

/datum/gear/suit/christmascoatrg
	name = "Red and Green Christmas Coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/christmascoatrg
	subcategory = LOADOUT_SUBCATEGORY_SUIT_COATS
*/

// BEGIN_INTERNALS
// END_INTERNALS
// BEGIN_FILE_DIR
#define FILE_DIR .
// END_FILE_DIR
// BEGIN_PREFERENCES
// END_PREFERENCES
// BEGIN_INCLUDE
// END_INCLUDE
