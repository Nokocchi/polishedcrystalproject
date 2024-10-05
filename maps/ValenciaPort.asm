ValenciaPort_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 25, 17, NEW_PLAYER_HOME_2F, 1

	def_coord_events
	coord_event  10,  14, 0, ValenciaPort_SuspiciousGuyTrigger0a
	coord_event  10,  15, 0, ValenciaPort_SuspiciousGuyTrigger0b

	coord_event  8,  14, 1, ValenciaPort_SuspiciousGuyTrigger1a
	coord_event  8,  15, 1, ValenciaPort_SuspiciousGuyTrigger1b

	def_bg_events
	bg_event 10,  9, BGEVENT_ITEM + MAX_POTION, EVENT_VALENCIA_PORT_HIDDEN_MAX_POTION

	def_object_events
	object_event  7, 12, SPRITE_SUSPICIOUS_MAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ValenciaPortFisherText, EVENT_VALENCIA_PORT_SUSPICIOUS_MAN

	object_const_def
	const SUSPICIOUS_MAN

ValenciaPort_SuspiciousGuyTrigger0a:
ValenciaPort_SuspiciousGuyTrigger0b:
	showemote EMOTE_SHOCK, SUSPICIOUS_MAN, 15
	showtext Text_SuspiciousManPsst
	setscene $1
	end

ValenciaPort_SuspiciousGuyTrigger1a:
	showtext Text_SuspiciousManComeHere
	applymovement PLAYER, Movement_GoToSuspiciousManA
	sjumpfwd GiveMonkey
ValenciaPort_SuspiciousGuyTrigger1b:
	showtext Text_SuspiciousManComeHere
	applymovement PLAYER, Movement_GoToSuspiciousManB
	sjumpfwd GiveMonkey

GiveMonkey:
	showtext Text_SuspiciousManSalesPitch
	opentext
	givepoke CYNDAQUIL, PLAIN_FORM, 5, ORAN_BERRY
	closetext
	showtext Text_SuspiciousManGoodbye
	applymovement SUSPICIOUS_MAN, Movement_SuspiciousManEscape
	disappear SUSPICIOUS_MAN
	setscene $2
	end

Movement_SuspiciousManEscape:
	run_step_left
	run_step_left
	run_step_left
	run_step_left

Movement_GoToSuspiciousManA:
	step_left
	step_up
	step_end

Movement_GoToSuspiciousManB:
	step_left
	step_up
	step_up
	step_end

Text_SuspiciousManComeHere:
	text "???: Pssttt!"

	para "Over here!"
	done

Text_SuspiciousManPsst:
	text "???: Pssttt!"

	para "Hey kid! Psstt!"
	done

Text_SuspiciousManSalesPitch:
	text "???: Hey kid,"
	line "Do you wanna buy"
	cont "a Mankey?"

	para "It will only set"
	line "you back ¥500."

	para "Can't afford it?"
	line "alright, ¥300."

	para "What?! Still no?"
	line "Okay, ¥200, final"
	cont "offer!"

	para "You're practically"
	line "stealing from me"
	cont "at this point.."

	para "You don't have any"
	line "money?"

	para "Fine.. Just take"
	line "it. I need to get"
	cont "it off my hands."
	done

Text_SuspiciousManGoodbye:
	text "???: See ya, kid."
	line "Nice doin business"
	cont "with ya!"
	done

ValenciaPortFisherText:
	text "Have you noticed"
	line "the sea?"

	para "These waters are"
	line "different from"

	para "those found in"
	line "Kanto and Johto."
	done
