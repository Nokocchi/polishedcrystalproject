JungleValley_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, JungleValleyFlyPoint
	callback MAPCALLBACK_TILES, JungleValleyRainScript

	def_warp_events
	warp_event 15,  5, IVYS_LAB, 1
	warp_event 13,  2, IVYS_HOUSE, 1
	warp_event  7, 11, VALENCIA_HOUSE, 1

	def_coord_events
	coord_event 19,  8, 1, SeakingWaterfallScript1
	coord_event 19,  9, 1, SeakingWaterfallScript2

	def_bg_events
	bg_event 10,  8, BGEVENT_JUMPTEXT, JungleValleySignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, VillageDoctorSignText
	bg_event 20, 19, BGEVENT_JUMPTEXT, JungleValleyLockedDoorText
	bg_event 17, 19, BGEVENT_JUMPTEXT, PumpStationSignText

	def_object_events
	object_event  9,  8, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, JungleValleyCooltrainermText, -1
	object_event 20,  8, SPRITE_MONKEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeakingScript, EVENT_SEAKING_AT_WATERFALL

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
	appear WATERFALL_SEAKING
	applymovement WATERFALL_SEAKING, Movement_SeakingSwimDown
	moveobject WATERFALL_SEAKING, 20, 8 ;Has no effect on a visible sprite, but will position it correctly in case the player walks away and comes back without reloading the map
	setscene $2
	end

SeakingScript:
	applymovement WATERFALL_SEAKING, Movement_SeakingReadyForJump
	pause 40
	applymovement PLAYER, Movement_JumpOntoSeaking
	pause 15
	applymovement WATERFALL_SEAKING, Movement_SeakingSwimUp
	special FadeOutPalettes
	disappear WATERFALL_SEAKING
	warpfacing LEFT, ROUTE_49, 30, 17
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

JungleValleyCooltrainermText:
	text "I can eat six"
	line "meatballs in one"
	cont "sitting."

	para "At least.."
	done

JungleValleySignText:
	text "Jungle Valley"

	para "Like a fever dream"
	line "but without the"
	cont "cold sweat."
	done

VillageDoctorSignText:
	text "Doctor Mowgli"

	para "Village doctor"
	line "tropical diseases"
	cont "and herbal meds."
	done

JungleValleyLockedDoorText:
	text "A key is required."
	done

PumpStationSignText:
	text "Jungle Valley"
	line "pump station"
	done
