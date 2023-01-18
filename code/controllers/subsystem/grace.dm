SUBSYSTEM_DEF(grace)
	name = "Grace Period End"
	wait = 30 MINUTES
	var/successful_firing = 0
	var/allowed_firings = 1
	var/chance_of_fire = 100

/datum/controller/subsystem/grace/fire
	for(var/M in GLOB.player_list)
		to_chat(M, "[span_minorannounce("<font color = red>["Grace Over"]</font color><BR>["You feel the wind grow tense with violence. The Wasteland has grown a shade more violent."]")]<BR>")
