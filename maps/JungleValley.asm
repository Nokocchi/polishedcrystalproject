JungleValley_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, JungleValleyFlyPoint
	callback MAPCALLBACK_TILES, JungleValleyRainScript

	def_warp_events
	warp_event 15,  5, IVYS_LAB, 1
	warp_event  7, 11, VALENCIA_HOUSE, 1

	def_coord_events
	coord_event 19,  8, 1, SeakingWaterfallScript1
	coord_event 19,  9, 1, SeakingWaterfallScript2

	def_bg_events
	bg_event 10,  8, BGEVENT_JUMPTEXT, Text_JungleValley_Sign
	bg_event 13,  5, BGEVENT_JUMPTEXT, Text_JungleValley_ProfRamonHouseSignText
	bg_event 20, 19, BGEVENT_JUMPTEXT, Text_JungleValley_LockedDoorText
	bg_event 17, 19, BGEVENT_JUMPTEXT, Text_JungleValley_PumpStationSign

	def_object_events
	object_event  9,  8, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_JungleValley_GuyText, -1
	object_event 20,  8, SPRITE_MONKEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeakingScript, EVENT_SEAKING_AT_WATERFALL
	object_event  4,  19, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_JungleValley_GuyRockBlockingRoad, -1
	object_event 17,  7, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_JungleValley_GuyLovingTown, -1

	object_const_def
	const COOLDUDE
	const WATERFALL_SEAKING

JungleValleyRainScript:
	special Special_GetOvercastIndex
	ifequalfwd JUNGLE_VALLEY_OVERCAST, .rain
	changemapblocks JungleValley_BlockData
	endcallback
.rain
	changemapblocks JungleValleyRaining_BlockData
	endcallback


JungleValleyFlyPoint:
	setflag ENGINE_FLYPOINT_VALENCIA
	endcallback

SeakingWaterfallScript1:
	moveobject WATERFALL_SEAKING, 21, 4
	sjumpfwd SeakingArrivesScript
SeakingWaterfallScript2:
	moveobject WATERFALL_SEAKING, 21, 5
	sjumpfwd SeakingArrivesScript
SeakingArrivesScript:
	turnobject PLAYER, RIGHT
	opentext
	writetext Text_JungleValley_CallForSeaking_YesNo
	yesorno
	iffalsefwd .CloseText
	showtext Text_JungleValley_CallForSeaking
	wait 20
	appear WATERFALL_SEAKING
	applymovement WATERFALL_SEAKING, Movement_SeakingSwimDown
	moveobject WATERFALL_SEAKING, 20, 8 ;Has no effect on a visible sprite, but will position it correctly in case the player walks away and comes back without reloading the map
	setscene $2
	sjumpfwd .End
.CloseText
	closetext
.End
	end

SeakingScript:
	opentext
	writetext Text_JungleValley_JumpOntoSeaking_YesNo
	yesorno
	iffalsefwd .CloseText
	closetext
	applymovement WATERFALL_SEAKING, Movement_SeakingReadyForJump
	pause 40
	applymovement PLAYER, Movement_JumpOntoSeaking
	pause 15
	applymovement WATERFALL_SEAKING, Movement_SeakingSwimUp
	special FadeOutPalettes
	disappear WATERFALL_SEAKING
	warpfacing LEFT, ROUTE_49, 30, 17
	sjumpfwd .End
.CloseText
	closetext
.End
	end

Movement_JumpOffSeaking:
	jump_step_right
	turn_head_left
	step_end

Movement_SeakingReadyForJump:
	step_right
	turn_head_left
	step_end

Movement_SeakingSwimDown:
	step_down
	step_down
	step_down
	step_down
	step_left
	step_end

Movement_SeakingSwimUp:
	step_up
	step_up
	step_up
	step_up
	step_end

Movement_JumpOntoSeaking:
	jump_step_right
	hide_object
	step_end

Text_JungleValley_GuyLovingTown:
	text "I love this place!"
	
	para "It's so quiet that"
	line "all you can hear"
	cont "is the waterfall."

	para "There is always a"
	line "cool, refreshing" 
	cont "mist in the air."
	done

Text_JungleValley_GuyRockBlockingRoad:
	text "Heavy rainfall re-"
	line "cently caused a"
	cont "landslide."

	para "Some rocks are"
	line "blocking the road"
	cont "to the west."
	done

Text_JungleValley_JumpOntoSeaking_YesNo:
	text "Jump onto Marnie"
	line "and head home?"

	para "You cannot go back"
	line "to the Jungle Val-"
	cont "ley again."
	done

Text_JungleValley_CallForSeaking:
	text "MARNIE!!!"
	done

Text_JungleValley_CallForSeaking_YesNo:
	text "Call for Marnie?"
	done

Text_JungleValley_GuyText:
	text "I can eat six"
	line "meatballs in one"
	cont "sitting."

	para "At least.."
	done

Text_JungleValley_Sign:
	text "Jungle Valley"

	para "Nature and humans,"
	line "side by side in"
	cont "harmony."
	done

Text_JungleValley_ProfRamonHouseSignText:
	text "Prof. Ramon"

	para "Village doctor"
	line "tropical diseases"
	cont "and herbal meds."
	done

Text_JungleValley_LockedDoorText:
	text "A key is required."
	done

Text_JungleValley_PumpStationSign:
	text "Jungle Valley"
	line "pump station"
	done
