// I collected some clothing sets I made here.
// If a hat has HIDEEARS, you wont be able to take off or add a item to the ear slot while wearing it.
// If a hat has HIDEEYES, same goes for eyeslot items
// Also the head/helmet subtype has inherited component protecting against flashbang (identical to bowmans), and immunity to eye attacks.
// The above things makes the widespread use of head/helmet problematic, since hats and variour helmets covering neither ears nor eyes for no reason blocks removing/adding ear and eye stuff, and makes flashbangs inconsistent, and sand in eye attacks useless in 90% of the scenarios.
// feel free to comment out stuff you transfer to base code but don't erase stuff in here, that would break the whole modular thing forever.


// ------------------------ SPAWNERS --------------------------- //

/obj/effect/spawner/bundle/fashion/angel_eyes
	name = "Angel Eyes outfit spawner"
	items = list(
		/obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy,
		/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy,
		/obj/item/clothing/under/f13/fashion/cowboy_angeleyes,
		/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots)

/obj/effect/spawner/bundle/fashion/blondie
	name = "Blondie outfit spawner"
	items = list(
		/obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy/blondie,
		/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy/blondie,
		/obj/item/clothing/under/f13/fashion/cowboy_blondie,
		/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots/blondie)

/obj/effect/spawner/bundle/fashion/tuco
	name = "Tuco outfit spawner"
	items = list(
		/obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy/tuco,
		/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy/tuco,
		/obj/item/clothing/under/f13/fashion/cowboy_tuco,
		/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots/tuco)

/obj/effect/spawner/bundle/fashion/nurse
	name = "Nurse outfit spawner"
	items = list(
		/obj/item/clothing/head/fashion/hat_nurse,
		/obj/item/clothing/under/f13/fashion/nurse_uniform,
		/obj/item/clothing/shoes/laceup/alternative)

/obj/effect/spawner/bundle/fashion/fiftiesdress
	name = "Fifties dress outfit spawner"
	items = list(
		/obj/item/clothing/head/fashion/hairband,
		/obj/item/clothing/under/f13/fashion/fifties_dress,
		/obj/item/clothing/shoes/laceup/alternative)

/obj/effect/spawner/bundle/fashion/burgundy
	name = "Burgundy outfit spawner"
	items = list(
		/obj/item/clothing/under/f13/fashion/suit_and_tie,
		/obj/item/clothing/shoes/laceup/alternative)

/obj/effect/spawner/bundle/fashion/benny
	name = "Benny outfit spawner"
	items = list(
		/obj/item/clothing/under/f13/fashion/suit_and_tie/benny,
		/obj/item/clothing/shoes/laceup/alternative)

/obj/effect/spawner/bundle/fashion/scarecrow
	name = "Scarecrow spawner"
	items = list(
		/obj/item/clothing/suit/overalls/farmer,
		/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/scarecrow,
		/obj/item/clothing/shoes/f13/explorer)

/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion
	name = "template, bugreport"
	desc = "template, bugreport"
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	dynamic_hair_suffix = "+generic" // means there is a hat-cutoff for hair around eye-height
	flags_cover = null // lets you throw dust in their eyes
	flags_inv = null // lets you place and remove your ear wear or glasses

/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/Initialize(mapload) // reason this exists see notes at start of document.
	. = ..()
	var/datum/component = GetComponent(/datum/component/wearertargeting/earprotection)
	qdel(component)

/obj/item/clothing/under/f13/fashion
	name = "template, bugreport"
	desc = "template, bugreport"
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'

/obj/item/clothing/head/fashion
	name = "template, bugreport"
	desc = "template, bugreport"
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	dynamic_hair_suffix = "" // this means whole hair is displayed, even if the hat is layered on top

/obj/item/clothing/shoes/f13/military/fashion
	name = "template, bugreport"
	desc = "template, bugreport"
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'



// ------------------------ NURSE ----------------------------- //

/obj/item/clothing/under/f13/fashion/nurse_uniform
	name = "nurse uniform"
	desc = "Pre-war style nurse uniform in blue and white."
	icon_state = "dress_nurse"
	item_state = "dress_nurse"
	permeability_coefficient = 0.5
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/head/fashion/hat_nurse // folded cloth style from early 20th century, only looks good on hairs with some volume.
	name = "nurse's hat"
	desc = "Looks just like in the pre-war magazines. Hopefully the wearer has some sort of medical training."
	icon_state = "hat_nurse"
	item_state = "hat_nurse"



// ------------------------ PICNIC ----------------------------- //

/obj/item/clothing/under/f13/fashion/picnic_dress
	name = "picnic dress"
	desc = "Cheery polkadot casual dress."
	icon_state = "dress_picnic"
	item_state = "dress_picnic"
	alternate_worn_layer = GLOVES_LAYER // so long boots dont go over the dress hem



// ----------------------- FIFTIES -------------------------- //

/obj/item/clothing/under/f13/fashion/fifties_dress
	name = "50s style dress"
	desc = "Fancy checkered yellow dress with small shoulder puffs."
	icon_state = "dress_50s"
	item_state = "dress_50s"

/obj/item/clothing/head/fashion/hairband
	name = "hairband"
	desc = "Pretty yellow ribbon to tie up your hair with."
	icon_state = "hat_hairband"
	item_state = "hat_hairband"

/obj/item/clothing/shoes/laceup/alternative // Original icon was perfect, so no change, but onmobs were no bueno, so new ones.
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	icon_state = "shoes_laceup"
	item_state = "shoes_laceup"

/obj/item/clothing/under/f13/fashion/suit_and_tie
	name = "burgundy suit"
	desc = "Expensive burgundy suit and black tie. Jacket is optional."
	alternate_worn_layer = GLOVES_LAYER // since the sleeves cover a part of the hands, this way gloves still covers it up. Without it hand part mask deletes the long sleeve bit.
	icon_state = "uniform_burgundy"
	item_state = "uniform_burgundy"
	can_adjust = TRUE // remove jacket with alt click
	alt_covers_chest = TRUE // not bare chested when alt in use
	fitted = FEMALE_UNIFORM_FULL // the alpha mask deleting a little under the armpits and the groin

/obj/item/clothing/under/f13/fashion/suit_and_tie/benny // new Benny. Old one is actually nice too, but this is a lot more detailed in a different style, both should be kept.
	name = "checkered suit"
	desc = "'Truth is, The game was rigged from the start.'"
	icon_state = "uniform_benny"
	item_state = "uniform_benny"



// ---------------------- SCARECROW -------------------------- //

/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/scarecrow
	name = "scarecrow hat"
	desc = "Felt hat, no nonsense. Looks good on a scarecrow."
	icon_state = "hat_scarecrow"
	item_state = "hat_scarecrow"


/obj/item/clothing/suit/overalls/farmer
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	icon_state = "overalls_farmer"
	item_state = "overalls_farmer"



// ---------------------- ANGEL EYES ------------------------- //

/obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy
	name = "stylish cowboy jacket"
	desc = "Elegant and durable."
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	icon_state = "suit_angeleyes"
	item_state = "suit_angeleyes"

/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy
	name = "dark stetson hat"
	desc = "'You're smart enough to know that talking won't save you.'"
	icon_state = "hat_angeleyes"
	item_state = "hat_angeleyes"


/obj/item/clothing/under/f13/fashion/cowboy_angeleyes
	name = "elegant cowboy outfit"
	desc = "'When I start off to find somebody, I find him. That's why they pay me.'"
	icon_state = "uniform_angeleyes"
	item_state = "uniform_angeleyes"
	fitted = FEMALE_UNIFORM_FULL

/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots
	name = "fine cowboy boots"
	desc = "No spurs on this one, but the leather is top-quality."
	icon_state = "boots_angeleyes"
	item_state = "boots_angeleyes"



// ----------------------- BLONDIE --------------------------- //

/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy/blondie
	name = "leather stetson hat"
	desc = "'God's not on our side because he hates idiots.'"
	icon_state = "hat_blondie"
	item_state = "hat_blondie"

/obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy/blondie
	name = "thick decorated poncho"
	desc = "Dark brown with white patterns, thick enough to provide some protection."
	icon_state = "suit_blondie"
	item_state = "suit_blondie"
	pocket_storage_component_path = null

/obj/item/clothing/under/f13/fashion/cowboy_blondie
	name = "rugged cowboy outfit"
	desc = "'You see in this world there's two kinds of people, my friend - Those with loaded guns, and those who dig. You dig.'"
	icon_state = "uniform_blondie"
	item_state = "uniform_blondie"
	fitted = FEMALE_UNIFORM_FULL

/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots/blondie
	name = "durable cowboy boots"
	desc = "A bit dusty, looks well-used."
	icon_state = "boots_blondie"
	item_state = "boots_blondie"



// ------------------------ TUCO ----------------------------- //

/obj/item/clothing/head/helmet/f13/brahmincowboyhat/fashion/cowboy/tuco
	name = "dusty sombrero"
	desc = "'When you have to shoot, shoot. Don't talk.'"
	icon_state = "hat_tuco"
	item_state = "hat_tuco"

/obj/item/clothing/suit/armor/f13/brahmin_leather_duster/cowboy/tuco
	name = "worn heavy poncho"
	desc = "Sunfaded and grimy, this is surprisingly good at keeping its wearer alive."
	icon_state = "suit_tuco"
	item_state = "suit_tuco"
	pocket_storage_component_path = null

/obj/item/clothing/under/f13/fashion/cowboy_tuco
	name = "dirty frontier clothing"
	desc = "'You never had a rope around your neck. Well, I'm going to tell you something crazy. When that rope starts to pull tight, you can feel the Devil bite...'"
	icon_state = "uniform_tuco"
	item_state = "uniform_tuco"
	pocket_storage_component_path = null // I dislike the concept of literally all armor having extra pockets. Doesn't fit for a poncho.
	fitted = FEMALE_UNIFORM_FULL

/obj/item/clothing/shoes/f13/military/fashion/cowboy_boots/tuco
	name = "filthy leather shoes"
	desc = "Some caked mud on them. I sure hope thats mud."
	icon_state = "shoes_tuco"
	item_state = "shoes_tuco"

/* Commented out since implemented in base code

/obj/item/clothing/under/f13/exile/tribal
	name = "disheveled loincloth"
	desc = "Fine handcrafted tribal clothing, now torn and faded. A simple lointcloth and chestwrap, male tribal normally discard the chestpiece and wear additonal leather strips on their arms."
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	icon_state = "uniform_outcast"
	item_state = "uniform_outcast"
	fitted = NO_FEMALE_UNIFORM

/obj/item/clothing/suit/hooded/outcast
	name = "patched heavy leather cloak"
	desc = "A robust cloak made from layered gecko skin patched with various bits of leather from dogs and other animals, able to absorb more force than one would expect from leather."
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	icon_state = "suit_outcast"
	item_state = "suit_outcast"
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/outcast
	pocket_storage_component_path = null

/obj/item/clothing/head/hooded/cloakhood/outcast
	name = "patched leather hood"
	icon = 'modular_BD2/fashion/icons/clothing_fashion.dmi'
	mob_overlay_icon = 'modular_BD2/fashion/icons/onmob.dmi'
	righthand_file = 'modular_BD2/fashion/icons/onmobright.dmi'
	lefthand_file = 'modular_BD2/fashion/icons/onmobleft.dmi'
	icon_state = "hood_outcast"
	item_state = "hood_outcast"
	dynamic_hair_suffix = "+hood"
	dynamic_fhair_suffix = "+hood"	//  beards
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACE
	flags_cover = null // lets you throw dust in their eyes
	alternate_worn_layer = (HAIR_LAYER+1) // makes the beard and hair drape over the chin correctly
*/

