//Fallout 13 structural decorations directory

/obj/structure/decoration
	anchored = 1
	level = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/fallout/objects/decals.dmi'

/obj/structure/decoration/rag //Generic decoration. See decals.dmi - there are more things to choose the proper icon_state in map editor.
	name = "rag"
	desc = "A torn and dirty rag.<br>It could have been a curtain, or a bedsheet ages ago..."
	icon_state = "rag" //skulls, skin
	layer = 3.2

/obj/structure/decoration/usaflag
	name = "U.S.A Flag"
	desc = "An old, torn up flag of the once all-powerful United States of America, now barely used as a blanket for a good nights sleep."
	icon_state = "flag_usa"

/obj/structure/decoration/ncrflag
	name = "NCR Flag"
	desc = "A torn up flag of the New California Republic, it looks like that someone used this as toilet paper."
	icon_state = "flag_ncr"

/obj/structure/decoration/sign //Signs.
	name = "sign"
	desc = "A standard sign, created to provide some important (or not so) information about the current location."
	icon_state = "vault_blank" //See decals.dmi for different icon states for different signs.

/obj/structure/decoration/minefield
	name = "minefield warning sign"
	desc = "Appears to be warning that there is a minefield in the area. Watch your step."
	icon_state = "minefield"

/obj/structure/decoration/clock //Wall clocks.
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>This particular clock has stopped at 06:45 / 18:45<br>Why did it stop? The clock itself appears to be intact."
	icon_state = "clock"

/obj/structure/decoration/clock/active
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>You can hear a quiet ticking coming from the clock."
	icon_state = "clock_act"

/obj/structure/decoration/clock/old
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>The clock was stopped by a distant nuclear blast on October 23, 2077 at 09:49 a.m."
	icon_state = "old_clock"

/obj/structure/decoration/clock/old/active
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and co-ordinate time.<br>Despite the age, this particular clock is still functional and you can hear a quiet ticking coming from it."
	icon_state = "old_clock_act"

/obj/structure/decoration/vent //Decorative vents for vaults and bunkers.
	name = "vent"
	desc = "An exhaust ventilation system designed to keep the air safe via several stages of filtering."
	icon_state = "ventblue"

/obj/structure/decoration/vent/red
	name = "vent"
	desc = "An exhaust ventilation system designed to keep the air safe via several stages of filtering."
	icon_state = "ventred"

/obj/structure/decoration/vent/orange
	name = "vent"
	desc = "An exhaust ventilation system designed to keep the air safe via several stages of filtering."
	icon_state = "ventorange"

/obj/structure/decoration/vent/rusty
	name = "rusty vent"
	desc = "It's very old and rusty.<br>You can hear some wierd sounds coming from the insides of the vent."
	icon_state = "ventrusty"

/obj/structure/decoration/vent/rustyalt
	name = "rusty vent"
	desc = "It's very old and rusty.<br>You can hear some wierd sounds coming from the insides of the vent."
	icon_state = "ventrustyalt"

/obj/structure/decoration/ruins //Ruin decorations - they overlap the player most of time, thus they provide a nearly perfect hiding spot.
	name = "\improper ruins"
	desc = "Either the blast nearby was hard enough, or the decades of fallout and absence of maintenance did their part.<br>Be careful so that one of these don't fall on you from above."
	icon_state = "overlap" //See decals.dmi for different icon states of ruins overlays.
	layer = 4.2

/obj/structure/decoration/hatch //Road decorations
	name = "street water drain"
	desc = "An ancient drainage system to protect the roads from flooding."
	icon_state = "hatch"

/obj/structure/decoration/hatch/broken
	name = "broken street water drain"
	desc = "An ancient drainage system to protect the roads from flooding. This one is broken"
	icon_state = "hatchbroken"

/obj/structure/decoration/reflector
	name = "road reflector"
	desc = "An ancient road safety device.<br>Here's how it works:<br>A reflective plate is reflecting the street and car lights ensuring the visibility of the road median separating the lanes.<br>The steel part makes a small regular bump along the median to wake the driver if he/she drifts across."
	icon_state = "reflectorvertical"

/obj/structure/decoration/reflector/horizontal
	name = "road reflector"
	desc = "An ancient road safety device.<br>Here's how it works:<br>A reflective plate is reflecting the street and car lights ensuring the visibility of the road median separating the lanes.<br>The steel part makes a small regular bump along the median to wake the driver if he/she drifts across."
	icon_state = "reflectorhorizontal"

/obj/structure/decoration/smokeold
	name = "old no-smoking sign"
	desc = "A old pre-war sign indicating for the user not to smoke in the area."
	icon_state = "smokeold"

/obj/structure/decoration/fire
	name = "fire hazard sign"
	desc = "A sign indicating for the user to be wary of flammable material in the area."
	icon_state = "fire"

/obj/structure/decoration/warning
	name = "warning sign"
	desc = "A sign indicating for the user to be wary of something dangerous in the area."
	icon_state = "warn"

/obj/structure/decoration/hazard
	name = "bio-hazard sign"
	desc = "A sign indicating for the user to be wary of something organically dangerous in the area."
	icon_state = "hazard"

/obj/structure/decoration/rads
	name = "radiation sign"
	desc = "A sign indicating for the user to be wary of something radiation and uranium fever in the area."
	icon_state = "radiation"

/obj/structure/decoration/cctv
	name = "cctv sign"
	desc = "An old pre-war sign indicating the use of Security Cameras. Doubt they work now though."
	icon_state = "cctv"

/obj/structure/decoration/train
	name = "train sign"
	desc = "An old pre-war sign indicating trains in the area. Definitely doubt they still work these days."
	icon_state = "train"

/obj/structure/decoration/shock
	name = "shock sign"
	desc = "A sign indicating high current in objects in the area."
	icon_state = "shock"

/obj/structure/decoration/cells
	name = "cell block sign"
	desc = "A sign indicating which cell block you are in prisoner."
	icon_state = "cells"
