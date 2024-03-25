// IN THIS FILE: -All Raider Mobs

///////////////////
// BASIC RAIDERS //
///////////////////

// BASIC MELEE RAIDER
/mob/living/simple_animal/hostile/raider
	name = "Raider"
	desc = "Another murderer churned out by the wastes."
	icon = 'icons/fallout/mobs/humans/raider.dmi'
	icon_state = "raider_melee"
	icon_living = "raider_melee"
	icon_dead = "raider_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 5
	maxHealth = 140
	health = 140
	melee_damage_lower = 25
	melee_damage_upper = 50
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	faction = list("raider")
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = FALSE
	loot = list(/obj/item/melee/onehanded/knife/survival)

/obj/effect/mob_spawn/human/corpse/raider
	name = "Raider"
	uniform = /obj/item/clothing/under/f13/rag
	suit = /obj/item/clothing/suit/armor/f13/raider/iconoclast
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/f13/leather
	head = /obj/item/clothing/head/helmet/f13/firefighter

/mob/living/simple_animal/hostile/raider/Aggro()
	..()
	summon_backup(15)
	say(pick("HURRY, HURRY, HURRY!!", "Back off!!" , "Keep moving!!", "Times up, asshole!!", "Call a doctor, we got a bleeder!!", "Just stand still and die!!" ))

// THIEF RAIDER - nabs stuff and runs
/mob/living/simple_animal/hostile/raider/thief
	desc = "Another murderer churned out by the wastes. This one looks like they have sticky fingers..."

/mob/living/simple_animal/hostile/raider/thief/movement_delay()
	return -2

/mob/living/simple_animal/hostile/raider/thief/AttackingTarget()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.stat == SOFT_CRIT)
			var/back_target = H.back
			if(back_target)
				H.dropItemToGround(back_target, TRUE)
				src.transferItemToLoc(back_target, src, TRUE)
			var/belt_target = H.belt
			if(belt_target)
				H.dropItemToGround(belt_target, TRUE)
				src.transferItemToLoc(belt_target, src, TRUE)
			var/shoe_target = H.shoes
			if(shoe_target)
				H.dropItemToGround(shoe_target, TRUE)
				src.transferItemToLoc(shoe_target, src, TRUE)
			retreat_distance = 50
		else
			. = ..()

/mob/living/simple_animal/hostile/raider/thief/death(gibbed)
	for(var/obj/I in contents)
		src.dropItemToGround(I)
	. = ..()

// BASIC RANGED RAIDER
/mob/living/simple_animal/hostile/raider/ranged
	icon_state = "raider_ranged"
	icon_living = "raider_ranged"
	ranged = TRUE
	maxHealth = 115
	health = 115
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/c9mm/op
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	loot = list(/obj/effect/spawner/lootdrop/f13/npc_raider)

// LEGENDARY MELEE RAIDER
/mob/living/simple_animal/hostile/raider/legendary
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes - this one seems a bit faster than the average..."
	color = "#FFFF00"
	maxHealth = 400
	health = 400
	speed = 1.2
	obj_damage = 300
	aggro_vision_range = 15
	loot = list(/obj/item/melee/onehanded/knife/survival, /obj/item/reagent_containers/food/snacks/kebab/human)

// LEGENDARY RANGED RAIDER
/mob/living/simple_animal/hostile/raider/ranged/legendary
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes, wielding a decent pistol and looking very strong"
	color = "#FFFF00"
	maxHealth = 450
	health = 450
	retreat_distance = 1
	minimum_distance = 2
	projectiletype = /obj/item/projectile/bullet/m44/simple
	projectilesound = 'sound/f13weapons/44mag.ogg'
	extra_projectiles = 1
	aggro_vision_range = 15
	obj_damage = 300
	loot = list(/obj/item/gun/ballistic/revolver/m29)

// RAIDER BOSS
/mob/living/simple_animal/hostile/raider/ranged/boss
	name = "Raider Boss"
	icon_state = "raiderboss"
	icon_living = "raiderboss"
	icon_dead = "raiderboss_dead"
	maxHealth = 170
	health = 170
	extra_projectiles = 3
	projectiletype = /obj/item/projectile/bullet/c45/op
	loot = list(/obj/item/clothing/under/f13/ravenharness)

/mob/living/simple_animal/hostile/raider/ranged/boss/Aggro()
	..()
	summon_backup(15)
	say("KILL 'EM, FELLAS!")

/mob/living/simple_animal/hostile/raider/ranged/boss/death(gibbed)
	var/turf/T = get_turf(src)
	if(prob(20))
		new /obj/item/gun/ballistic/automatic/smg/greasegun(T)
		new /obj/item/clothing/head/helmet/f13/combat/mk2/raider(T)
		new /obj/item/clothing/suit/armor/f13/combat/mk2/raider(T)
	. = ..()

// RANGED RAIDER WITH ARMOR
/mob/living/simple_animal/hostile/raider/ranged/sulphiteranged
	icon_state = "metal_raider"
	icon_living = "metal_raider"
	icon_dead = "metal_raider_dead"
	maxHealth = 180
	health = 180
	projectiletype = /obj/item/projectile/bullet/c45/op
	projectilesound = 'sound/weapons/gunshot.ogg'
	loot = list(/obj/item/gun/ballistic/automatic/pistol/m1911/custom, /obj/item/clothing/suit/armor/f13/metalarmor/reinforced, /obj/item/clothing/head/helmet/f13/metalmask/mk2)


// FIREFIGHTER RAIDER
/mob/living/simple_animal/hostile/raider/firefighter
	icon_state = "firefighter_raider"
	icon_living = "firefighter_raider"
	icon_dead = "firefighter_raider_dead"
	loot = list(/obj/item/twohanded/fireaxe)

// BIKER RAIDER
/mob/living/simple_animal/hostile/raider/ranged/biker
	icon_state = "biker_raider"
	icon_living = "biker_raider"
	icon_dead = "biker_raider_dead"
	melee_damage_lower = 20
	melee_damage_upper = 20
	maxHealth = 200
	health = 200
	projectiletype = /obj/item/projectile/bullet/a556/match
	projectilesound = 'sound/f13weapons/magnum_fire.ogg'
	loot = list(/obj/item/gun/ballistic/revolver/thatgun, /obj/item/clothing/suit/armor/f13/combatrusted, /obj/item/clothing/head/helmet/f13/raidercombathelmet)

/obj/effect/mob_spawn/human/corpse/raider/ranged/biker
	uniform = /obj/item/clothing/under/f13/ncrcf
	suit = /obj/item/clothing/suit/armor/f13/combatrusted
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/raidercombathelmet
	neck = /obj/item/clothing/neck/mantle/brown

// YANKEE RAIDER
/mob/living/simple_animal/hostile/raider/baseball
	icon_state = "baseball_raider"
	icon_living = "baseball_raider"
	icon_dead = "baseball_raider_dead"
	retreat_distance = 1
	minimum_distance = 1
	melee_damage_lower = 40
	melee_damage_upper = 40
	maxHealth = 200
	health = 200
	loot = list(/obj/item/twohanded/baseball)

/obj/effect/mob_spawn/human/corpse/raider/baseball
	uniform = /obj/item/clothing/under/f13/mechanic
	suit = /obj/item/clothing/suit/armor/f13/raider/yankee
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/raider/yankee

// TRIBAL RAIDER
/mob/living/simple_animal/hostile/raider/tribal
	icon_state = "tribal_raider"
	icon_living = "tribal_raider"
	icon_dead = "tribal_raider_dead"
	melee_damage_lower = 40
	melee_damage_upper = 40
	loot = list(/obj/item/twohanded/spear)

/obj/effect/mob_spawn/human/corpse/raider/tribal
	uniform = /obj/item/clothing/under/f13/raiderrags
	suit = /obj/item/clothing/suit/armor/f13/tribal
	shoes = /obj/item/clothing/shoes/f13/rag
	mask = /obj/item/clothing/mask/facewrap
	head = /obj/item/clothing/head/helmet/f13/fiend

//////////////
// SULPHITE //
//////////////

/mob/living/simple_animal/hostile/raider/sulphite
	name = "Sulphite Brawler"
	desc = "A raider with low military grade armor and a shishkebab"
	icon_state = "sulphite"
	icon_living = "sulphite"
	icon_dead= "sulphite_dead"
	maxHealth = 220
	health = 220
	melee_damage_lower = 40
	melee_damage_upper = 55
	loot = list(/obj/item/locked_box/misc/money/all/low)

/////////////
// JUNKERS //
/////////////

/mob/living/simple_animal/hostile/raider/junker
	name = "Junker"
	desc = "A raider from the Junker gang."
	faction = list("raider", "wastebot")
	icon_state = "junker_hijacker"
	icon_living = "junker_hijacker"
	icon_dead = "junker_dead"
	maxHealth = 220
	health = 220
	melee_damage_lower = 40
	melee_damage_upper = 55
	loot = null

/mob/living/simple_animal/hostile/raider/ranged/boss/junker
	name = "Junker Footman"
	desc = "A Junker raider, outfitted in reinforced combat raider armor with extra metal plates."
	icon_state = "junker_scrapper"
	icon_living = "junker_scrapper"
	icon_dead = "junker_dead"
	faction = list("raider", "wastebot")
	maxHealth = 245
	health = 245
	damage_coeff = list(BRUTE = 1, BURN = 0.75, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	melee_damage_lower = 25
	melee_damage_upper = 50

/mob/living/simple_animal/hostile/raider/junker/creator
	name = "Junker Field Creator"
	desc = "A Junker raider, specialized in spitting out eyebots on the fly with any scrap they can find."
	icon_state = "junker"
	icon_living = "junker"
	icon_dead = "junker_dead"
	maxHealth = 180
	health = 180
	ranged = TRUE
	retreat_distance = 6
	minimum_distance = 8
	projectiletype = /obj/item/projectile/bullet/c45/op
	projectilesound = 'sound/weapons/gunshot.ogg'
	var/list/spawned_mobs = list()
	var/max_mobs = 3
	var/mob_types = list(/mob/living/simple_animal/hostile/eyebot/reinforced)
	var/spawn_delay = 0
	var/spawn_time = 15 SECONDS
	var/spawn_text = "flies from"

/mob/living/simple_animal/hostile/raider/junker/creator/Initialize()
	. = ..()
	GLOB.mob_nests += src

/mob/living/simple_animal/hostile/raider/junker/creator/death()
	GLOB.mob_nests -= src
	. = ..()

/mob/living/simple_animal/hostile/raider/junker/creator/Destroy()
	GLOB.mob_nests -= src
	. = ..()

/mob/living/simple_animal/hostile/raider/junker/creator/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/raider/junker/creator/proc/spawn_mob()
	if(world.time < spawn_delay)
		return 0
	spawn_delay = world.time + spawn_time
	if(spawned_mobs.len >= max_mobs)
		return FALSE
	var/chosen_mob_type = pickweight(mob_types)
	var/mob/living/simple_animal/L = new chosen_mob_type(get_turf(src))
	L.flags_1 |= (flags_1 & ADMIN_SPAWNED_1)
	spawned_mobs += L
	L.nest = src
	visible_message("<span class='danger'>[L] [spawn_text] [src].</span>")

/mob/living/simple_animal/hostile/raider/junker/boss
	name = "Junker Boss"
	desc = "A Junker boss, clad in hotrod power armor, and wielding a deadly rapid-fire shrapnel cannon."
	icon_state = "junker_boss"
	icon_living = "junker_boss"
	icon_dead = "junker_dead"
	maxHealth = 400
	health = 400
	ranged = TRUE
	retreat_distance = 4
	minimum_distance = 6
	extra_projectiles = 5
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/bullet/shrapnel
	projectilesound = 'sound/f13weapons/auto5.ogg'

// EVENT MOBS

////////////////////
// RENEGADE MERCS //
////////////////////


// LIGHT MELEE VARIANT
/mob/living/simple_animal/hostile/renegade
	name = "Renegade Prospect"
	desc = "A raider recently inducted among the Renegades."
	icon = 'icons/fallout/mobs/humans/renegade.dmi'
	icon_state = "renegade_prospect"
	icon_living = "renegade_prospect"
	icon_dead = "renegade_prospect-dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 5
	maxHealth = 140
	health = 140
	healable = 1
	speed = 1.2
	stat_attack = 1
	obj_damage = 150
	melee_damage_lower = 25
	melee_damage_upper = 40
	attack_verb_simple = "smacks"
	attack_sound = 'sound/weapons/smash.ogg'
	a_intent = INTENT_HARM
	faction = list("raider")
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = FALSE
	loot = list(/obj/item/stack/f13Cash/random/med)

/mob/living/simple_animal/hostile/renegade/Aggro()
	..()
	summon_backup(10)
	say("Target spotted!")

// ADVANCED LIGHT MELEE VARIANT
/mob/living/simple_animal/hostile/renegade/smasher
	name = "Renegade Smasher"
	desc = "A raider recently inducted among the Renegades- although clearly with a fair amount of experience to draw from, a riot shield a penchant for extreme violence. He's going to make sure your dead."
	armour_penetration = 0.4
	health = 300
	maxHealth = 300
	loot = list()
	icon_state = "renegade_smasher"
	icon_living = "renegade_smasher"
	icon_dead = "renegade_smasher-dead"
	melee_damage_lower = 20
	melee_damage_upper = 30
	rapid_melee = 2
	stat_attack = UNCONSCIOUS //will finish you off

// LIGHT RANGED VARIANT
/mob/living/simple_animal/hostile/renegade/grunt
	name = "Renegade Grunt"
	desc = "The standard issue muscle employed among the Renegades."
	icon_state = "renegade_grunt"
	icon_living = "renegade_grunt"
	icon_dead = "renegade_grunt-dead"
	ranged = TRUE
	maxHealth = 200
	health = 200
	healable = 1
	check_friendly_fire = 1
	retreat_distance = 6
	minimum_distance = 2
	extra_projectiles = 2
	ranged_cooldown_time = 10
	projectiletype = /obj/item/projectile/bullet/c10mm/simple
	projectilesound = 'sound/f13weapons/10mm_fire_01.ogg'
	loot = list(/obj/effect/spawner/bundle/f13/m1911)
	robust_searching = TRUE
	speak = list("Come get some!", "Fuck off!", "Landon's going to promote me after this!", "Bullets for days!", "Renegades represent!")
	speak_emote = list("says")
	speak_chance = 1

// ADVANDED LIGHT RANGED VARIANT
/mob/living/simple_animal/hostile/renegade/grunt/gunner
	name = "Renegade Gunner"
	desc = "The standard issue muscle employed among the Renegades- equipped with an extended magazine burst-fire 10mm sub-machine gun. As if to show off his position, he's got red highlights on his shoulder pads."
	extra_projectiles = 4
	icon_state = "renegade_gunner"
	icon_living = "renegade_gunner"
	icon_dead = "renegade_gunner-dead"

// LIGHT SHOTGUN VARIANT
/mob/living/simple_animal/hostile/renegade/engie
	name = "Renegade Engie"
	desc = "Demolitions and engineering expert of the Renegades."
	icon_state = "renegade_engie"
	icon_living = "renegade_engie"
	icon_dead = "renegade_engie-dead"
	maxHealth = 200
	health = 200
	healable = 1
	speed = 1.2
	ranged = 1
	check_friendly_fire = 1
	obj_damage = 200
	retreat_distance = 4
	minimum_distance = 1
	ranged_cooldown_time = 4
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun_buckshot
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	casingtype = /obj/item/ammo_casing/shotgun
	loot = list(/obj/item/stack/f13Cash/random/med, /obj/effect/spawner/lootdrop/f13/bomb/tier1, /obj/effect/spawner/lootdrop/f13/crafting)
	robust_searching = TRUE
	speak = list("Come get some!", "Going to blow some shit to kingdom come!", "I got the goods!", "Nades for days!", "Renegades represent!")
	speak_emote = list("says")
	speak_chance = 1

// ADVANCED LIGHT SHOTGUN VARIANT
/mob/living/simple_animal/hostile/renegade/engie/breacher
	name = "Renegade Breacher"
	desc = "Demolitions and engineering expert of the Renegades, wearing an old, stolen trooper helmet- equipped with a spare sledgehammer for faster wallbusting and an unholy double-barreled pump-action shotgun"
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	extra_projectiles = 1
	icon_state = "renegade_breacher"
	icon_living = "renegade_breacher"
	icon_dead = "renegade_breacher-dead"

// MEDIUM RANGED VARIANT
/mob/living/simple_animal/hostile/renegade/soldier
	name = "Renegade Soldier"
	desc = "The beefier side of the Renegade's muscle; with combat experience to back it."
	icon_state = "renegade_soldier"
	icon_living = "renegade_soldier"
	icon_dead = "renegade_soldier-dead"
	ranged = TRUE
	maxHealth = 300
	health = 300
	healable = 1
	speed = 1.1
	check_friendly_fire = 1
	retreat_distance = 7
	minimum_distance = 3
	extra_projectiles = 2
	ranged_cooldown_time = 6
	projectiletype = /obj/item/projectile/bullet/c10mm/simple
	projectilesound = 'sound/f13weapons/combatrifle.ogg'
	loot = list(/obj/item/stack/f13Cash/random/med, /obj/effect/spawner/lootdrop/f13/weapon/gun/ammo/tier2)
	robust_searching = TRUE
	speak = list("Come get some!", "I like my odds, c'mere!", "Gonna get a promotion after this!", "Bullets for days!", "Renegades represent!")
	speak_emote = list("says")
	speak_chance = 1

// MEDIUM MELEE VARIANT
/mob/living/simple_animal/hostile/renegade/defender
	name = "Renegade Defender"
	desc = "The Renegade member who's sole purpose is to withstand punishment with layers of advanced combat armor."
	icon_state = "renegade_defender"
	icon_living = "renegade_defender"
	icon_dead = "renegade_defender-dead"
	ranged = TRUE
	maxHealth = 750
	health = 750
	healable = 1
	speed = 0.1
	check_friendly_fire = 1
	melee_damage_lower = 30
	melee_damage_upper = 40
	attack_verb_simple = "bashes"
	attack_sound = 'sound/weapons/slam.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/spawner/lootdrop/f13/weapon/melee/random, /obj/effect/spawner/lootdrop/f13/alcoholspawner, /obj/effect/spawner/lootdrop/f13/ncr_c_ration)
	emote_taunt = list("bashes their shield with the mace")
	robust_searching = TRUE
	speak = list("COME AND TRY ME, BITCH!", "I AM THE WALL!", "LAYERS ON LAYERS OF PLATES!", "I AM TITANIUM!", "RENEGADES REPRESENT!")
	speak_emote = list("says")
	speak_chance = 1

// ADVANCED MEDIUM MELEE VARIANT
/mob/living/simple_animal/hostile/renegade/defender/assaulter
	name = "Renegade Assaulter"
	desc = "The Renegade member who's sole purpose is to withstand punishment with layers of advanced combat armor- and dish out just as much with a well placed violent mace swing. As if to flaunt who's about to smack your skull in- there's a huge red R painted into his shield."
	armour_penetration = 0.6
	icon_state = "renegade_assaulter"
	icon_living = "renegade_assaulter"
	icon_dead = "renegade_assaulter-dead"

// HEAVY RANGED VARIANT
/mob/living/simple_animal/hostile/renegade/drifter
	name = "Renegade Drifter"
	desc = "A veteran of the Renegades, specializing in recon and long range engagements."
	icon_state = "renegade_drifter"
	icon_living = "renegade_drifter"
	icon_dead = "renegade_drifter-dead"
	ranged = TRUE
	maxHealth = 280
	health = 280
	healable = 1
	speed = 1.3
	vision_range = 12
	aggro_vision_range = 15
	check_friendly_fire = 1
	retreat_distance = 10
	minimum_distance = 6
	ranged_cooldown_time = 10
	projectiletype = /obj/item/projectile/bullet/a762/sport/simple
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'
	loot = list(/obj/item/stack/f13Cash/random/high, /obj/effect/spawner/bundle/f13/remington, /obj/effect/spawner/lootdrop/f13/armor/random)
	robust_searching = TRUE
	speak = list("Come get some!", "I am the shadow!", "One shot, one kill.", "Adjusting my scope.", "Renegades represent!")
	speak_emote = list("says")
	speak_chance = 1

// ADVANCED HEAVY RANGED VARIANT
/mob/living/simple_animal/hostile/renegade/drifter/sniper
	name = "Enclave Sniper"
	desc = "A stone-hearted killer. A marksman of the Enclave, armed with a DKS-501 sniper rifle and a red gleam in his eyes. You should probably start running."
	armour_penetration = 0.2
	check_friendly_fire = 0
	health = 300
	maxHealth = 300
	minimum_distance = 8
	vision_range = 15
	icon_state = "renegade_sniper"
	icon_living = "renegade_sniper"
	icon_dead = "renegade_sniper-dead"
	speak = list("...", "That's that, and this is this.", "One shot, one kill.", "Adjusting my scope.", "That's just how this wasteland is.")

// HEAVY SHOTGUN VARIANT
/mob/living/simple_animal/hostile/renegade/guardian
	name = "Renegade Guardian"
	desc = "A veteran of the Renegades,specializing in close quarters and crowd control.. with an automatic shotgun."
	icon_state = "renegade_guardian"
	icon_living = "renegade_guardian"
	icon_dead = "renegade_guardian-dead"
	ranged = TRUE
	maxHealth = 420
	health = 420
	healable = 1
	speed = 0.9
	check_friendly_fire = 1
	minimum_distance = 2
	ranged_cooldown_time = 3
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun_buckshot
	projectilesound = 'sound/f13weapons/auto5.ogg'
	casingtype = /obj/item/ammo_casing/shotgun
	loot = list(/obj/effect/spawner/bundle/f13/trenchshotgun, /obj/effect/spawner/lootdrop/f13/weapon/gun/ammo/tier1, /obj/item/stack/f13Cash/random/low, /obj/item/clothing/suit/armor/f13/plates)
	robust_searching = TRUE
	speak = list("GET SOME!", "ON THE GROUND!", "GOING TO SHOVE THIS WHERE THE SUN DON'T SHINE!", "C'MERE, I GOT LEAD!", "RENEGADES REPRESENT!")
	speak_emote = list("says")
	speak_chance = 1

// ADVANCED HEAVY SHOTGUN VARIANT
/mob/living/simple_animal/hostile/renegade/guardian/shotgunner
	name = "Renegade Shotgunner"
	desc = "A veteran of the Renegades,specializing in close quarters and crowd control.. with an automatic full-metal burst-fire slug shotgun and advanced CQC training. Akin to certain gunners, this shotgunner has painted his shoulder-pads with red highlights."
	armour_penetration = 5
	extra_projectiles = 2
	melee_queue_distance = 2
	rapid_melee = 2
	icon_state = "renegade_shotgunner"
	icon_living = "renegade_shotgunner"
	icon_dead = "renegade_shotgunner-dead"

// POWER ARMOR VARIANT
/mob/living/simple_animal/hostile/renegade/meister
	name = "Renegade Meister"
	desc = "Is that a merc in power armor?!"
	icon_state = "renegade_meister"
	icon_living = "renegade_meister"
	icon_dead = "renegade_meister-dead"
	maxHealth = 1000
	health = 1000
	healable = 1
	melee_damage_lower = 50
	melee_damage_upper = 50
	retreat_distance = 3
	minimum_distance = 1
	ranged = 1
	attack_verb_simple = "power-fists"
	attack_sound = 'sound/weapons/slam.ogg'
	ranged_cooldown_time = 30
	extra_projectiles = 5
	projectiletype = /obj/item/projectile/bullet/a556/match
	projectilesound = 'sound/f13weapons/automaticrifle_BAR.ogg'
	loot = list(/obj/item/stack/f13Cash/random/high, /obj/item/advanced_crafting_components/alloys, /obj/item/stack/sheet/plasteel/five)
	speak = list("POWER TO THE ARMOR!", "I AM GOING TO BREAK YOU IN HALF!", "YEAH I COMPENSATE WITH BIG FUCKIN' GUNS", "DODGE THIS!", "PEAK RENEGADE PERFORMANCE!")
	speak_emote = list("says")
	speak_chance = 1

/mob/living/simple_animal/hostile/renegade/meister/movement_delay()
	return 6

/mob/living/simple_animal/hostile/renegade/meister/heavy
	name = "Renegade Heavy"
	desc = "Is that a merc in layered advanced combat armor, high on drugs?! Holy shit, that's a big gun!"
	aggro_vision_range = 14
	armour_penetration = 0.8
	check_friendly_fire = 0
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	extra_projectiles = 7
	rapid_melee = 2
	retreat_distance = 2
	icon_state = "renegade_heavy"
	icon_living = "renegade_heavy"
	icon_dead = "renegade_heavy-dead"

// HEALER VARIANT
/mob/living/simple_animal/hostile/renegade/doc
	name = "Renegade Doc"
	desc = "A veteran of the Renegades, this one specializing in field first aid."
	icon_state = "renegade_doc"
	icon_living = "renegade_doc"
	icon_dead = "renegade_doc-dead"
	ranged = TRUE
	maxHealth = 250
	health = 250
	healable = 1
	check_friendly_fire = 1
	retreat_distance = 6
	minimum_distance = 8
	projectiletype = /obj/item/projectile/bullet/m44/simple
	projectilesound = 'sound/f13weapons/44mag.ogg'
	casingtype = /obj/item/ammo_casing/m44
	robust_searching = TRUE
	speak = list("Running low on meds.", "Could do with extra combat chems.", "Where'd I put the Syringer?", "I GOT THE MED-BAG!", "Renegades represent and all that jazz.")
	speak_emote = list("says")
	speak_chance = 1
	loot = list(/obj/effect/spawner/lootdrop/f13/medical/vault/meds, /obj/effect/spawner/lootdrop/f13/weapon/revolver44variants, /obj/effect/spawner/lootdrop/f13/medical/surgical/blood)

/mob/living/simple_animal/hostile/renegade/doc/Initialize(mapload)
	. = ..()
	// we only heal BRUTELOSS because each type directly heals a simplemob's health
	// therefore setting it to BRUTELOSS | FIRELOSS | TOXLOSS | OXYLOSS would mean healing 4x as much
	// aka 40% of max life every tick, which is basically unkillable
	// TODO: refactor this if simple_animals ever get damage types
	AddComponent(/datum/component/glow_heal, chosen_targets = /mob/living/simple_animal/hostile/renegade, allow_revival = FALSE, restrict_faction = list("raider"), type_healing = BRUTELOSS)

// ADVANCED HEALER VARIANT
/mob/living/simple_animal/hostile/renegade/doc/medic
	name = "Renegade Medic"
	desc = "A veteran of the Renegades, this one specializing in field first aid with a rapid-fanning .44 magnum revolver. He seems to know if you're alive or dead, if the way he's checking a health scanner is anything to go off. No fooling this guy- he's making sure you're dead."
	extra_projectiles = 2
	stat_attack = UNCONSCIOUS

// THE BOSS. THE BIG ONE. THE BIG CHEESE
/mob/living/simple_animal/hostile/raider/junker/boss/renegade
	name = "Enclave Gunnery Sergeant"
	desc = "An Enclave sergeant, wielding USMC Marine Armour and a massive machinegun. He's had it with your shit."
	faction = list("raider","wastebot","hostile","supermutant","ghoul")
	aggro_vision_range = 15
	armour_penetration = 0.8
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	extra_projectiles = 7
	health = 1250
	maxHealth = 1250
	melee_damage_upper = 50
	minimum_distance = 0
	obj_damage = 500
	rapid_melee = 2
	retreat_distance = 0
	vision_range = 15
	icon = 'icons/fallout/mobs/humans/renegade.dmi'
	icon_state = "renegade_boss"
	icon_living = "renegade_boss"
	icon_dead = "renegade_boss-dead"
	speak = list("Your end is now.", "I'm going to crush you.", "+Judgement.+", "Die.", "You're weak.")
