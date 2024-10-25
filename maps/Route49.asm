;nTODO: Would be cool to arrive with the Seaking, but there's no easy way to load the map with player invisible. And once you jump off the Seaking, you have the surf sprite until the script ends. 
; And if Seaking swims away during the script, the player has the surf sprite on land the entire time..

Route49_MapScriptHeader:
	def_scene_scripts
	scene_script Route49Trigger0

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route49NewMapCallback

	def_warp_events
	warp_event  7,  5, VALENCIA_PORT, 1

	def_coord_events

	def_bg_events
	bg_event 31, 11, BGEVENT_JUMPTEXT, Route49SignText

	def_object_events
	object_event 28, 17, SPRITE_MONKEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEAKING_AT_WATERFALL2

	object_const_def
	const WATERFALL_SEAKING2

Route49Trigger0:
	sdefer Route49TriggerScript0
	end

Route49TriggerScript0:
	showtext Text_GoodbyeSeaking
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

Text_GoodbyeSeaking:
	text "Goodbye,"
	line "Seaking!"
	done

Route49SignText:
	text "Route 49"
	line "Valencia Island"
	done
