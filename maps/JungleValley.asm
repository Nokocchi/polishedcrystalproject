JungleValley_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, JungleValleyFlyPoint

	def_warp_events
	warp_event 18, 19, IVYS_LAB, 1
	warp_event  5, 19, IVYS_HOUSE, 1
	warp_event  5, 11, NEW_PLAYER_HOME_2F, 1

	def_coord_events

	def_bg_events
	bg_event  8, 12, BGEVENT_JUMPTEXT, JungleValleySignText
	bg_event 11,  5, BGEVENT_JUMPTEXT, JungleValleyGoneFishingSignText
	bg_event 13,  5, BGEVENT_JUMPTEXT, JungleValleyLockedDoorText
	bg_event 15, 19, BGEVENT_JUMPTEXT, IvysLabSignText
	bg_event 13,  3, BGEVENT_JUMPTEXT, IvysHouseSignText

	def_object_events
	object_event  7,  8, SPRITE_COOL_DUDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, JungleValleyCooltrainermText, -1
	object_event 10, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, JungleValleyYoungsterScript, -1

JungleValleyFlyPoint:
	setflag ENGINE_FLYPOINT_VALENCIA
	endcallback

JungleValleyCooltrainermText:
	text "A couple of strong"
	line "trainers live in"
	cont "that house."

	para "They're a mother"
	line "and her daughter…"
	cont "Or maybe her son?"

	para "Anyway, they're on"
	line "vacation now."
	done

JungleValleyYoungsterScript:
	readvar VAR_PLAYERGENDER
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "Prof.Ivy is"
	line "smokin' hot,"
	cont "don't you think?"
	done

.Text2:
	text "You may be cute,"
	line "but Prof.Ivy is"
	cont "smokin' hot!"
	done

JungleValleySignText:
	text "Valencia Island"

	para "Bitter Oranges"
	line "and Sweet Breezes"
	done

JungleValleyGoneFishingSignText:
	text "Gone Fishing"

	para "(On vacation"
	line "in Alola!)"
	done

JungleValleyLockedDoorText:
	text "It's locked…"
	done

IvysLabSignText:
	text "Ivy Research"
	line "№.2 Bayview"
	done

IvysHouseSignText:
	text "Ivy's House"
	done
