/obj/structure/soundbox
	name = "telescreen"
	desc = "A monochrome display reciting dogma at a feverish pace."
	icon = 'icons/obj/radio.dmi'
	icon_state = "telescreen"
	verb_say = "fervently states"
	verb_ask = "states"
	verb_exclaim = "states"
	var/timer
	var/delay = 10

/obj/structure/soundbox/Initialize()
	. = ..()
	timer = delay + rand(0, delay)
	START_PROCESSING(SSobj, src)

/obj/structure/soundbox/process()
	timer--
	if(timer <= 0)
		say(pick(list("Trust in the wisdom of your betters, for they know the mysteries of the universe.","Sacrifice is the mark of devotion.","To give to the Church is to give to the Father. To give to the Father is to give to yourself.", "Unity is coming!", "The Father will return!", "A secret is best kept unspoken.", "The Unbeliever has many eyes and many mouths. Blind them and cut out their tongues.","The Vineyard grows through broken soil.","Those who have nothing to give can give themselves.","Suffering is the path to enlightenment.","There is no master but the Holy Flame.","It is the Unbeliever who creeps upon weakness.","One who is wise must listen to his betters.","All truth is derived from the Church","The Father is merciful.","Mercy is the mark of the devoted, duty the mark of the Faithful.","Father. Savior. Protector. ","The Vineyard must be watered with the blood of Unbelievers.","The Holy Flame will come again, and it shall cleanse the Vineyard of Unbelief.","The Father will prevail.","The first virtue is Faith. The second, Obedience.","The Arch Unbeliever's hordes creep upon us.","The Holy Flame will wash over us.")))
		timer = delay + rand(0, delay)

/obj/structure/soundbox/us
	name = "telescreen"
	desc = "A televison screen reciting propaganda messages."
	icon = 'icons/obj/radio.dmi'
	icon_state = "telescreen_us"
	verb_say = "states"
	verb_ask = "states"
	verb_exclaim = "states"

/obj/structure/soundbox/us/Initialize()
	. = ..()
	timer = delay + rand(0, delay)
	START_PROCESSING(SSobj, src)

/obj/structure/soundbox/us/process()
	timer--
	if(timer <= 0)
		say(pick(list("America will never fall to Communist invasion!","Democracy is freedom. Communism is tyranny.","Freedom is the sovereign right of every American.","Freedom is always worth fighting for.","Democracy is non-negotiable.","I hold these truths to be self-evident that all Americans are created... equal. And are endowed with certain unalienable rights.","Death is a preferable alternative to Communism!","America is a tune, it must be sung together.","Only together can we stop the spread of Communism.","Communism is the very definition of failure!","Freedom lies in being bold.","Live free or die!","	We will not fear the Red Menace.")))
		timer = delay + rand(0, delay)

