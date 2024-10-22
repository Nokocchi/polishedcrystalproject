ValenciaPort_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 25, 17, NEW_PLAYER_HOME_2F, 1

	def_coord_events
	coord_event 16, 14, 0, ValenciaPort_SuspiciousGuyTrigger0a
	coord_event 16, 15, 0, ValenciaPort_SuspiciousGuyTrigger0b

	coord_event 14, 14, 1, ValenciaPort_SuspiciousGuyTrigger1a
	coord_event 14, 15, 1, ValenciaPort_SuspiciousGuyTrigger1b

	def_bg_events

	def_object_events
	object_event 13, 12, SPRITE_SUSPICIOUS_MAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_VALENCIA_PORT_SUSPICIOUS_MAN
	object_event 13, 14, SPRITE_MONKEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TalkToMonkeyWhenFollow, EVENT_VALENCIA_PORT_MONKEY_FOLLOW

	object_const_def
	const SUSPICIOUS_MAN
	const MONKEY_FOLLOW

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
	givepoke MONKEY, PLAIN_FORM, 11, ORAN_BERRY
	closetext
	showtext Text_SuspiciousManGoodbye
	applymovement SUSPICIOUS_MAN, Movement_SuspiciousManEscape
	disappear SUSPICIOUS_MAN
	setscene $2
	appear MONKEY_FOLLOW
	follow PLAYER, MONKEY_FOLLOW
	end

TalkToMonkeyWhenFollow:
	showtext Text_ThatsNotAMankey
	stopfollow
	applymovement PLAYER, Movement_WalkAwayFromMonkey
	follow PLAYER, MONKEY_FOLLOW
	applymovement PLAYER, Movement_WalkAwayFromMonkey
	turnobject PLAYER, RIGHT
	turnobject MONKEY_FOLLOW, RIGHT
	showtext Text_QuestionMarks
	applymovement PLAYER, Movement_WalkAwayFromMonkey
	showemote EMOTE_QUESTION, PLAYER, 15
	turnobject PLAYER, RIGHT
	turnobject MONKEY_FOLLOW, RIGHT
	showtext Text_QuestionMarks
	stopfollow
	turnobject PLAYER, LEFT
	applymovement MONKEY_FOLLOW, Movement_MonkeyRunAttack
	playsound SFX_BITE
	showemote EMOTE_SHOCK, PLAYER, 10
	turnobject PLAYER, RIGHT
	applymovement MONKEY_FOLLOW, Movement_MonkeyRunAway
	disappear MONKEY_FOLLOW
	showtext Text_InfectedBiteReaction
	setevent EVENT_MONKEY_BITE_INFECTED
	end

RemoveMonkeyFromParty:
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	predef_jump RemoveMonFromParty

Movement_WalkAwayFromMonkey:
	slow_step_left
	slow_step_left
	step_end

Movement_MonkeyRunAttack:
	run_step_left
	run_step_left
	step_end

Movement_MonkeyRunAway:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end

Movement_SuspiciousManEscape:
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end

Movement_GoToSuspiciousManA:
	step_left
	step_up
	step_end

Movement_GoToSuspiciousManB:
	step_left
	step_up
	step_up
	step_end

Text_QuestionMarks:
	text "?"
	done

Text_InfectedBiteReaction:
	text "Ouch!! It bit me!!"
	done

Text_ThatsNotAMankey:
	text "That doesn't look"
	line "like a Mankey.."
	done

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
	line "it." 
	
	para "I need to get it"
	line "off my hands"
	cont "anyway."
	done

Text_SuspiciousManGoodbye:
	text "???: See ya, kid."
	line "Nice doin business"
	cont "with ya!"
	done