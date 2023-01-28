//Fallout 13 decorative billboards directory

/obj/structure/billboard
	name = "billboard"
	desc = "Shitspawn detected!<br>Please report the admin abuse immediately!<br>Just kidding, nevermind."
	icon_state = "null"
	density = 1
	anchored = 1
	layer = 5
	icon = 'icons/obj/Ritas.dmi'
	bound_width = 64
	resistance_flags = INDESTRUCTIBLE

/obj/structure/billboard/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, x_size = 1, y_size = 1)


/obj/structure/billboard/ritas
	name = "Rita's Cafe billboard"
	desc = "A defaced pre-War advertisement for Rita's Cafe.<br>The wasteland has taken its toll on the board."
	icon_state = "ritas1"

/obj/structure/billboard/ritas/New()
	..()
	icon_state = pick("ritas2","ritas3","ritas4")

/obj/structure/billboard/ritas/pristine
	name = "pristine Rita's Cafe billboard"
	desc = "A pre-War advertisement for Rita's Cafe.<br>Oddly enough, it's good as new."
	icon_state = "ritas1"

/obj/structure/billboard/ritas/pristine/New()
	..()
	icon_state = "ritas1"

/obj/structure/billboard/cola
	name = "Nuka-Cola billboard"
	desc = "A defaced pre-War advertisement for Nuka-Cola.<br>The wasteland has taken its toll on the board."
	icon_state = "cola1"

/obj/structure/billboard/cola/New()
	..()
	icon_state = pick("cola2","cola3","cola4")

/obj/structure/billboard/cola/pristine
	name = "pristine Nuka-Cola billboard"
	desc = "A pre-War advertisement for Nuka-Cola.<br>Oddly enough, it's good as new."
	icon_state = "cola1"

/obj/structure/billboard/cola/pristine/New()
	..()
	icon_state = "cola1"

/obj/structure/billboard/vaulttec
	name = "Vault-Tec billboard"
	desc = "A pre-War advertisement for Vault-Tec."
	icon_state = "vault_tec"

/obj/structure/billboard/corvega
	name = "Chryslus Corvega billboard"
	desc = "A pre-War advertisement for Chryslus Corvega."
	icon_state = "corvega"

/obj/structure/billboard/hubris
	name = "Hubris billboard"
	desc = "A pre-War advertisement for Hubris Comics."
	icon_state = "hubris1"

/obj/structure/billboard/hubris/vandalized
	name = "Hubris billboard"
	desc = "A pre-War advertisement for Hubris Comics. This one appears to be vandalized."
	icon_state = "hubris2"

/obj/structure/billboard/robco
	name = "RobCo billboard"
	desc = "A pre-War advertisement for RobCo Industries."
	icon_state = "robco1"

/obj/structure/billboard/poseidenenergy
	name = "Poseiden Energy billboard"
	desc = "A pre-War advertisement for Poseiden Energy."
	icon_state = "poseiden1"

/obj/structure/billboard/poseidenenergy/vandalized
	name = "Poseiden Energy billboard"
	desc = "A pre-War advertisement for Poseiden Energy. This one appears to be vandalized."
	icon_state = "poseiden2"

/obj/structure/billboard/poseidenenergy/vandalized/supermutants
	name = "Poseiden Energy billboard"
	desc = "A pre-War advertisement for Poseiden Energy. This one appears to be vandalized."
	icon_state = "poseiden3"

/obj/structure/billboard/sunset
	name = "Sunset Sasaparilla billboard"
	desc = "A pre-War advertisement for Sunset Sasaparilla."
	icon_state = "sunset1"

/obj/structure/billboard/generalatomics
	name = "General Atomics billboard"
	desc = "A pre-War advertisement for General Atomics."
	icon_state = "generalatomics1"

/obj/structure/billboard/generalatomics/vandalized
	name = "General Atomics billboard"
	desc = "A pre-War advertisement for General Atomics. This one appears to be vandalized."
	icon_state = "generalatomics2"

/obj/structure/billboard/radiationking
	name = "Radiation King billboard"
	desc = "A pre-War advertisement for Radiation King."
	icon_state = "radiationking1"

/obj/structure/billboard/nukagirl
	name = "Nuka-Cola billboard"
	desc = "A pre-War advertisement for Nuka Cola, featuring Nuka Girl."
	icon_state = "nukagirl1"

/obj/structure/billboard/nukagirl/vandalized
	name = "Nuka cola billboard"
	desc = "An advertisement for Nuka Cola, featuring Nuka Girl. This one has been worn down by the wasteland."
	icon_state = "nukagirl2"

/obj/structure/billboard/redrocket
	name = "Red Rocket billboard"
	desc = "A pre-War advertisement for Red Rocket Fuel Station"
	icon_state = "redrocket1"

/obj/structure/billboard/redrocket/khan
	name = "Red Rocket billboard"
	desc = "A pre-War advertisement for Red Rocket Fuel Station. It looks like this one has been tagged by the Khans, and is very worn down."
	icon_state = "redrocket2"

/obj/structure/billboard/superdupermart
	name = "Super Duper Mart billboard"
	desc = "A pre-War advertisement for Super Duper Mart."
	icon_state = "superduper1"

/obj/structure/billboard/superdupermart/vandalized
	name = "Super Duper Mart billboard"
	desc = "A pre-War advertisement for Super Duper Mart. This one has been vandalized and worn down by the wasteland."
	icon_state = "superduper2"

/obj/structure/billboard/powerlines1
	name = "Broken powerlines"
	desc = "Old broken powerlines, all that remains of the prewar powergrid."
	icon_state = "stolb1"

/obj/structure/billboard/powerlines2
	name = "Broken powerlines"
	desc = "Old broken powerlines, all that remains of the prewar powergrid."
	icon_state ="stolb2"

/obj/structure/billboard/boardedwell
	name = "Boarded up well"
	desc = "An old dryed up well that has been boarded up."
	icon_state = "well" 

//Taken from removed F13billboards.dm
/obj/structure/billboard/den
	name = "\improper The Den sign"
	desc =  "A sprayed metal sheet that says \"The Den \"."
	icon_state = "den"

/obj/structure/billboard/klamat
	name = "Klamat sign"
	desc =  "A ruined sign that says \"Klamat \"."
	icon_state = "klamat"
