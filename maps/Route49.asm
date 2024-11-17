;nTODO: Would be cool to arrive with the Seaking, but there's no easy way to load the map with player invisible. And once you jump off the Seaking, you have the surf sprite until the script ends. 
; And if Seaking swims away during the script, the player has the surf sprite on land the entire time..

Route49_MapScriptHeader:
	def_scene_scripts
	scene_script Route49Trigger0

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route49NewMapCallback

	def_warp_events
	warp_event 32, 13, ELMS_LAB, 1
	warp_event 27, 3, PLAYERS_HOUSE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 27, 9, BGEVENT_JUMPTEXT, Text_Route49_Sign
	bg_event 34, 14, BGEVENT_JUMPTEXT, Text_Route49_ElmsLabSign
	bg_event 25, 3, BGEVENT_JUMPTEXT, Text_Route49_PlayerHomeSign
	bg_event 9, 3, BGEVENT_JUMPTEXT, Text_Route49_SomeHouseSign
	bg_event 35, 5, BGEVENT_JUMPTEXT, Text_Route49_VegetablePatch
	bg_event 34, 5, BGEVENT_JUMPTEXT, Text_Route49_VegetablePatch

	def_object_events
	object_event 28, 17, SPRITE_MONKEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAKING_AT_WATERFALL2
	object_event  33,  18, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_Route49_HometownGuy, -1
	object_event  37,  9, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_Route49_SadBoy, -1
	object_event  17,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_Route49_Fisherman, -1
	object_event  14,  3, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 5, -1, (1 << MORN) | (1 << EVE), PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_Route49_LittleGirl, -1

	object_const_def
	const WATERFALL_SEAKING2

Route49Trigger0:
	sdefer Route49TriggerScript0
	end

Route49TriggerScript0:
	showtext Text_Route49_GoodbyeSeaking
	applymovement WATERFALL_SEAKING2, Movement_SeakingLeaves
	disappear WATERFALL_SEAKING2
	setscene $1
	end

Route49NewMapCallback:
	setflag ENGINE_FLYPOINT_ROUTE_49
	endcallback

Movement_SeakingLeaves:
	step_down
	step_down
	step_down
	step_down
	step_end

Text_Route49_LittleGirl:
	text "I'm playing in the"
	line "garden while my"
	cont "mom is cooking!"

	para "Well, we are still"
	line "waiting for dad to"
	cont "catch a fish.."
	done

Text_Route49_Fisherman:
	text "This is the best"
	line "spot to fish!"

	para "Quiet, peaceful,"
	line "lots of fish, and"
	cont "just by my house!"
	done

Text_Route49_SadBoy:
	text "Sniffle.."
	line "What are you"
	cont "looking at?!"

	para "I wish I could get"
	line "my own #mon.."
	done

Text_Route49_SomeHouseSign:
	text "This is a house."
	done

Text_Route49_GoodbyeSeaking:
	text "Marnie brought you"
	line "up the waterfall!"

	para "Thanks, Marnie!"
	done

Text_Route49_Sign:
	text "Player Hometown"
	done

Text_Route49_HometownGuy:
	text "Technology is so"
	line "amazing!"

	para "When I was a child"
	line "my brother bought"
	cont "me a video game."

	para "I played it day"
	line "and night!"

	para "20 years have"
	line "passed since then."

	para "Today, I played it"
	line "again."

	para "Life has changed,"
	line "but the game still"
	cont "brings me joy."
	
	done

Text_Route49_PlayerHomeSign:
	text "<PLAYER>'s house"
	line "Home is where your"
	cont "bed is."
	done

Text_Route49_ElmsLabSign:
	text "Falafel shop"
	done

Text_Route49_VegetablePatch:
	text "Your mom's vege-"
	line "table garden."

	para "It smells great!"
	done