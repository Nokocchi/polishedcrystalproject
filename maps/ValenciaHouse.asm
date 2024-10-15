ValenciaHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, JUNGLE_VALLEY, 3
	warp_event  3,  7, JUNGLE_VALLEY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ValenciaHouseMonkeyBiteHealerScript, -1

ValenciaHouseMonkeyBiteHealerScript:
	faceplayer
	checkevent EVENT_MONKEY_BITE_INFECTED
	iffalse_jumptext MonkeyBiteAlreadyTreatedText 
	opentext
	writetext MonkeyBiteLooksInfectedText ; nTODO: The textbox hangs and immediately skips to the already treated text
	special SaveMusic
	playmusic MUSIC_NONE
	pause 30
	special RestoreMusic
	clearevent EVENT_MONKEY_BITE_INFECTED
	end

MonkeyBiteAlreadyTreatedText:
	text "I hope you are"
	line "feeling better!"
	done

MonkeyBiteLooksInfectedText:
	text "Oh my gosh! You"
	line "look awful! What"
	cont "happened to you?"

	para "You were bitten by"
	line "a monkey?"
	cont "Like, a Mankey?"
	
	para "Just a regular"
	line "monkey? Huh.."

	para "Rest here for the"
	line "night. The village"
	cont "doctor can help"
	done

ValenciaHouseLassText:
	text "Prof.Ivy is really"
	line "cool!"

	para "She helped my"
	line "#mon when they"
	cont "were sick!"
	done
