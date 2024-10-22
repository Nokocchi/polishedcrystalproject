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
	iffalsefwd .GiveSeaking
	opentext
	writetext MonkeyBiteLooksInfectedText
	special SaveMusic ;nTODO: This music and pause doesn't work too well. Fix it
	playmusic MUSIC_NONE
	pause 30
	closetext
	special RestoreMusic
	clearevent EVENT_MONKEY_BITE_INFECTED
	sjumpfwd .End
.GiveSeaking:
	checkevent EVENT_WATERFALL_SEAKING_RECEIVED
	iftruefwd .SeakingAlreadyReceived
	opentext 
	writetext GiveSeakingText
	promptbutton
	setevent EVENT_WATERFALL_SEAKING_RECEIVED
	setmapscene JUNGLE_VALLEY, $1
	closetext
	sjumpfwd .End
.SeakingAlreadyReceived:
	opentext 
	writetext SeakingAlreadyReceivedText
	promptbutton
	closetext
.End:
	end

GiveSeakingText:
	text "Here, take my"
	line "Seaking!"
	done

SeakingAlreadyReceivedText:
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
