/client/who()
	set name = "Who"
	set category = "OOC"

	var/msg = "<b>Current Players:</b>\n"

	var/list/Lines = list()

	var/living = 0
	var/dead = 0
	var/observers = 0
	var/lobby = 0
	var/living_antags = 0
	var/dead_antags = 0

	if(check_rights(R_INVESTIGATE, 0))
		log_admin("[key_name(usr)] checked advanced who in-round.")
		for(var/client/C in GLOB.clients)
			var/entry = "\t[C.key]"
			if(!C.mob) //If mob is null, print error and skip rest of info for client.
				entry += " - <font color='red'><i>HAS NO MOB</i></font>"
				Lines += entry
				continue

			if(isghost(C.mob))
				entry += " - <font color='gray'><b>Observing</b></font> as <b>[C.mob.real_name]</b>"
			else if(isliving(C.mob))
				entry += " - <font color='green'><b>Playing</b></font> as <b>[C.mob.real_name]</b>"

			switch(C.mob.stat)
				if(UNCONSCIOUS)
					entry += " - <font color='#404040'><b>Unconscious</b></font>"
					living++
				if(DEAD)
					if(isghost(C.mob))
						var/mob/observer/ghost/O = C.mob
						if(O.started_as_observer)
							observers++
						else
							entry += " - <b>DEAD</b>"
							dead++
					else if(isnewplayer(C.mob))
						entry += " - <font color='#006400'><b>In lobby</b></font>"
						lobby++
					else
						entry += " - <b>DEAD</b>"
						dead++
				else
					living++

			if(isnum(C.player_age))
				var/age = C.player_age

				if(age <= 1)
					age = "<font color='#ff0000'><b>[age]</b></font>"
				else if(age < 10)
					age = "<font color='#ff8c00'><b>[age]</b></font>"

				entry += " - [age]"

			if(is_special_character(C.mob))
				entry += " - <b><font color='red'>Antagonist</font></b>"
				if(!C.mob.mind.current || C.mob.mind.current?.stat == DEAD)
					dead_antags++
				else
					living_antags++

			if(C.is_afk())
				entry += " - <b>AFK: [C.inactivity2text()]</b>"
			entry += " (<A HREF='?_src_=holder;adminmoreinfo=\ref[C.mob]'>?</A>)"
			Lines += entry
	else
		for(var/client/C in GLOB.clients)
			if(!C.is_stealthed())
				var/entry = "[C.key]"
				switch(C.mob.stat)
					if(DEAD)
						if(isghost(C.mob))
							var/mob/observer/ghost/O = C.mob
							if(O.started_as_observer)
								entry += " - <font color='gray'><b>Observing</b></font>"
							else
								entry += " - <font color='green'><b>Playing</b></font>"
						else if(isnewplayer(C.mob))
							entry += " - <font color='#006400'><b>In Lobby</b></font>"
					else
						entry += " - <font color='green'><b>Playing</b></font>"

				if(C.is_afk())
					entry += " - <b>AFK: [C.inactivity2text()]</b>"

				Lines += entry

	for(var/line in sortList(Lines))
		msg += "[line]\n"

	if(check_rights(R_INVESTIGATE, 0))
		msg += "<b><font color='green'>Total Living: [living]</font> | Total Dead: [dead] | <font color='gray'>Observing: [observers]</font> | <font color='#006400'>In Lobby: [lobby]</font> | <font color='#8100aa'>Living Antags: [living_antags]</font> | <font color='#9b0000'>Dead Antags: [dead_antags]</font></b>\n"

	msg += "<b>Total Players: [length(Lines)]</b>"
	to_chat(src, msg)