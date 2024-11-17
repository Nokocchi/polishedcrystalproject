;nTODO: Remove lightning - it messes up the monkey script
; Talking to the monkey makes it walk towards you for some reason?
; Walking with the monkey and having it follow you looks a bit weird. 

ValenciaPort_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, ValenciaPortRainScript

	def_warp_events
	warp_event 25, 17, NEW_PLAYER_HOME_2F, 1

	def_coord_events
	coord_event 18, 14, 0, ValenciaPort_SuspiciousGuyTrigger0a
	coord_event 18, 15, 0, ValenciaPort_SuspiciousGuyTrigger0b

	coord_event 16, 14, 1, ValenciaPort_SuspiciousGuyTrigger1a
	coord_event 16, 15, 1, ValenciaPort_SuspiciousGuyTrigger1b

	coord_event 18, 14, 2, ValenciaPort_CantBringMonkeyHereTrigger1
	coord_event 19, 16, 2, ValenciaPort_CantBringMonkeyHereTrigger2

	coord_event 9, 14, 2, ValenciaPort_MonkeyAttacksTrigger
	coord_event 9, 15, 2, ValenciaPort_MonkeyAttacksTrigger

	def_bg_events

	def_object_events
	object_event 15, 12, SPRITE_SUSPICIOUS_MAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_VALENCIA_PORT_SUSPICIOUS_MAN
	object_event 15, 14, SPRITE_MONKEY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TalkToMonkeyWhenFollow, EVENT_VALENCIA_PORT_MONKEY_FOLLOW

	object_const_def
	const SUSPICIOUS_MAN
	const MONKEY_FOLLOW

ValenciaPortRainScript:
	special Special_GetOvercastIndex
	ifequalfwd JUNGLE_VALLEY_OVERCAST, .rain
	changemapblocks ValenciaPort_BlockData
	endcallback
.rain
	changemapblocks ValenciaPortRaining_BlockData
	endcallback

ValenciaPort_CantBringMonkeyHereTrigger1:
	readvar VAR_FACING
	ifequalfwd RIGHT, .WalkDown
	applyonemovement PLAYER, step_left
	end
.WalkDown
	applyonemovement PLAYER, step_down
	end

ValenciaPort_CantBringMonkeyHereTrigger2:
	readvar VAR_FACING
	ifequalfwd DOWN, .WalkLeft
	applyonemovement PLAYER, step_up
	end
.WalkLeft
	applyonemovement PLAYER, step_left
	end

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
	wait 10
	turnobject PLAYER, DOWN
	clearevent EVENT_ALLOW_OVERWORLD_LIGHTNING
	follow PLAYER, MONKEY_FOLLOW
	wait 5
	showtext Text_ThatsNotAMankey
	end

TalkToMonkeyWhenFollow:
	showemote EMOTE_QUESTION, PLAYER, 15
	showtext Text_ThatsNotAMankey
	end

ValenciaPort_MonkeyAttacksTrigger:
	turnobject PLAYER, RIGHT
	showtext Text_DecideToLeaveMonkey
	readvar VAR_YCOORD
	ifequalfwd 14, .LeaveStraightLine
	applyonemovement PLAYER, slow_step_up
.LeaveStraightLine
	applymovement PLAYER, Movement_SlowlyWalkLeft
	showemote EMOTE_QUESTION, PLAYER, 15
	wait 10
	turnobject PLAYER, RIGHT
	wait 10
	turnobject MONKEY_FOLLOW, RIGHT
	wait 10
	showtext Text_UncomfortableWithTheMonkey
	stopfollow
	setevent EVENT_ALLOW_OVERWORLD_LIGHTNING
	applymovement PLAYER, Movement_SlowlyUpAndToLeft
	applymovement MONKEY_FOLLOW, Movement_QuickUpAndToLeft
	showemote EMOTE_QUESTION, PLAYER, 10
	wait 10
	turnobject PLAYER, RIGHT
	wait 10
	turnobject MONKEY_FOLLOW, RIGHT
	wait 10
	showtext Text_MonkeyLooksAngry
	applymovement PLAYER, Movement_RunUp
	applymovement MONKEY_FOLLOW, Movement_RunLeftAndUp
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	wait 5
	turnobject PLAYER, RIGHT
	wait 5
	turnobject PLAYER, UP
	wait 5
	playsound SFX_BITE
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, DOWN
	showtext Text_InfectedBiteReaction
	applymovement MONKEY_FOLLOW, Movement_MonkeyRunAway
	disappear MONKEY_FOLLOW
	setevent EVENT_MONKEY_BITE_INFECTED
	callasm RemoveMonkeyFromParty
	setscene $3
	end

RemoveMonkeyFromParty:
	xor a ; REMOVE_PARTY
	ld [wCurPartyMon], a
	ld [wPokemonWithdrawDepositParameter], a
	predef RemoveMonFromParty
	ret

Movement_MonkeyRunAway:
	fast_jump_step_right
	fast_jump_step_right
	step_end

Movement_SuspiciousManEscape:
	run_step_left
	run_step_down
	run_step_down
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

Movement_SlowlyWalkLeft:
	slow_step_left
	slow_step_left
	slow_step_left
	step_end

Movement_SlowlyUpAndToLeft:
	slow_step_up
	slow_step_left
	slow_step_left
	step_end

Movement_QuickUpAndToLeft:
	fast_step_left
	fast_step_up
	turn_head_left
	step_end

Movement_RunUp:
	run_step_up
	run_step_up
	run_step_up
	step_end

Movement_RunLeftAndUp:
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	step_end

Text_DecideToLeaveMonkey:
	text "It's probably"
	line "best to just leave"
	cont "it here.."
	done

Text_UncomfortableWithTheMonkey:
	text "The monkey is"
	line "following you."
	done

Text_MonkeyLooksAngry:
	text "The monkey looks"
	line "angry.."
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