/mob/living/simple_animal/hostile/halloween/fake_ghost
	name = "strange-looking ghost"
	desc = "...on closer inspection, this is just a raider in a bedsheet."
	icon = 'icons/fallout/mobs/halloween.dmi'
	icon_state = "bedsheet_ghost"
	icon_living = "bedsheet_ghost"
	icon_dead = "raider_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 5
	maxHealth = 140
	health = 140
	melee_damage_lower = 10
	melee_damage_upper = 20
	attack_verb_simple = "cuts"
  projectiletype = /obj/item/projectile/bullet/pellet/shotgun_buckshot
	projectilesound = 'sound/f13weapons/caravan_shotgun.ogg'
  rapid = 2
	rapid_fire_delay = 6
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = TRUE
  deathmessage = "dissapears, replaced by a strange token. Maybe they were a real ghost, after all?"
	death_sound = 'sound/magic/demon_dies.ogg'
	loot = list(/obj/item/stack/halloween_token)

  /mob/living/simple_animal/hostile/halloween/fake_ghost/Aggro()
	..()
	say(pick("Woo!!", "Boo!!" , "Trick, not treat!!", "It's time to receive some spirit!!", "I'm a real ghost, sent to haunt you!!", "The spirit realm demands your death!!" ))

/mob/living/simple_animal/hostile/halloween/fake_ghost/alt
  icon_state = "bedsheet_ghost2"
  icon_living = "bedsheet_ghost2"

/mob/living/simple_animal/hostile/halloween/fake_ghost/racist
  icon_state = "klan_ghost"
  icon_living = "klan_ghost"

/mob/living/simple_animal/hostile/retaliate/ghost/halloween
	name = "ghost"
	desc = "A soul of the dead, spooky."
	icon = 'icons/mob/mob.dmi'
	icon_state = "ghost"
	icon_living = "ghost"
	mob_biotypes = MOB_SPIRIT
	speak_chance = 0
	turns_per_move = 5
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "shoves"
	response_disarm_simple = "shove"
	response_harm_continuous = "hits"
	response_harm_simple = "hit"
	a_intent = INTENT_HARM
	healable = 0
	speed = 0
	maxHealth = 100
	health = 100
	melee_damage_lower = 30
	melee_damage_upper = 50
	del_on_death = 1
	emote_see = list("weeps silently", "groans", "mumbles")
	attack_verb_continuous = "grips"
	attack_verb_simple = "grip"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	speak_emote = list("weeps")
	deathmessage = "wails, disintegrating into a pile of ectoplasm!"
	loot = list(/obj/item/ectoplasm)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	movement_type = FLYING
	pressure_resistance = 300
	gold_core_spawnable = NO_SPAWN //too spooky for science
	blood_volume = 0
	has_field_of_vision = FALSE
	light_system = MOVABLE_LIGHT
	light_range = 1
	light_power = 2
	var/ghost_hair_style
	var/ghost_hair_color
	var/mutable_appearance/ghost_hair
	var/ghost_facial_hair_style
	var/ghost_facial_hair_color
	var/mutable_appearance/ghost_facial_hair
	var/random = TRUE //if you want random names for ghosts or not
  loot = list(/obj/item/stack/halloween_token)

/mob/living/simple_animal/hostile/retaliate/ghost/halloween/Initialize()
	. = ..()
	give_hair()
	if(random)
		switch(rand(0,1))
			if(0)
				name = "ghost of [pick(GLOB.first_names_male)] [pick(GLOB.last_names)]"
			if(1)
				name = "ghost of [pick(GLOB.first_names_female)] [pick(GLOB.last_names)]"


/mob/living/simple_animal/hostile/retaliate/ghost/halloween/proc/give_hair()
	if(ghost_hair_style != null)
		ghost_hair = mutable_appearance('icons/mob/human_face.dmi', "hair_[ghost_hair_style]", -HAIR_LAYER)
		ghost_hair.alpha = 200
		ghost_hair.color = ghost_hair_color
		add_overlay(ghost_hair)
	if(ghost_facial_hair_style != null)
		ghost_facial_hair = mutable_appearance('icons/mob/human_face.dmi', "facial_[ghost_facial_hair_style]", -HAIR_LAYER)
		ghost_facial_hair.alpha = 200
		ghost_facial_hair.color = ghost_facial_hair_color
		add_overlay(ghost_facial_hair)
  
