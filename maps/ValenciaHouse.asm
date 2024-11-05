ValenciaHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, JUNGLE_VALLEY, 2
	warp_event  3,  7, JUNGLE_VALLEY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ValenciaHouseMonkeyBiteHealerScript, -1
	object_event  7,  0, SPRITE_ELM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_PROF_RAMON_READY_TO_HEAL_MONKEY_BITE

	object_const_def
	const VALENCIA_HOUSE_JUNGLE_HEALER
	const VALENCIA_HOUSE_PROF_RAMON


ValenciaHouseMonkeyBiteHealerScript:
	faceplayer
	checkevent EVENT_MONKEY_BITE_INFECTED
	iffalsefwd .GiveSeaking
	showemote EMOTE_SHOCK, VALENCIA_HOUSE_JUNGLE_HEALER, 30
	showtext MonkeyBiteLooksInfectedText
	readvar VAR_FACING
	ifequalfwd UP, .RunOutOfHouseCannotRunDown
	ifequalfwd RIGHT, .RunOutOfHouseCanRunDown
	ifequalfwd DOWN, .RunOutOfHouseCanRunDown
.RunOutOfHouseCannotRunDown
	applymovement VALENCIA_HOUSE_JUNGLE_HEALER, Movement_RunsOutOfHouse_AroundPlayer
	sjumpfwd .JungleHealerLeaves
.RunOutOfHouseCanRunDown
	applymovement VALENCIA_HOUSE_JUNGLE_HEALER, Movement_RunsOutOfHouse_DirectlyDown
.JungleHealerLeaves
	playsound SFX_EXIT_BUILDING
	applyonemovement VALENCIA_HOUSE_JUNGLE_HEALER, hide_object
	wait 30
	moveobject VALENCIA_HOUSE_PROF_RAMON, 2, 7
	moveobject VALENCIA_HOUSE_JUNGLE_HEALER, 3, 7
	playsound SFX_EXIT_BUILDING
	applyonemovement VALENCIA_HOUSE_JUNGLE_HEALER, turn_head_up
	applyonemovement VALENCIA_HOUSE_JUNGLE_HEALER, show_object
	applyonemovement VALENCIA_HOUSE_PROF_RAMON, turn_head_up
	appear VALENCIA_HOUSE_PROF_RAMON
	follow VALENCIA_HOUSE_PROF_RAMON, VALENCIA_HOUSE_JUNGLE_HEALER
	readvar VAR_XCOORD
	ifequalfwd 1, .JungleHealerEnters_Left
	readvar VAR_YCOORD
	ifequalfwd 2, .JungleHealerEnters_Top
	ifequalfwd 4, .JungleHealerEnters_Below
.JungleHealerEnters_Left
	applymovement VALENCIA_HOUSE_PROF_RAMON, Movement_EnterWithProf_Left
	sjumpfwd .JungleHealerBroughtProf
.JungleHealerEnters_Top
	applymovement VALENCIA_HOUSE_PROF_RAMON, Movement_EnterWithProf_Top
	sjumpfwd .JungleHealerBroughtProf
.JungleHealerEnters_Below
	applymovement VALENCIA_HOUSE_PROF_RAMON, Movement_EnterWithProf_Below
	applyonemovement PLAYER, turn_head_down
.JungleHealerBroughtProf
	stopfollow
	showtext Text_JungleHealerBroughtProf
	showemote EMOTE_QUESTION, PLAYER, 15
	showtext Text_ProfHealsYou1
	showemote EMOTE_SHOCK, PLAYER, 15
	wait 15
	showtext Text_ProfHealsYou2
	showtext Text_StayTheNight
	special FadeOutPalettes
	special LoadMapPalettes
	special SaveMusic
	playmusic MUSIC_HEAL
	waitsfx
	pause 30
	special FadeInPalettes_EnableDynNoApply
	disappear VALENCIA_HOUSE_PROF_RAMON
	special RestoreMusic
	clearevent EVENT_MONKEY_BITE_INFECTED
	setevent EVENT_MONKEY_BITE_HEALED_NEW_DAY
	sjumpfwd .End
.GiveSeaking
	checkevent EVENT_WATERFALL_SEAKING_RECEIVED
	iftruefwd .SeakingAlreadyReceived
	opentext 
	writetext GiveSeakingText
	promptbutton
	setevent EVENT_WATERFALL_SEAKING_RECEIVED
	setmapscene JUNGLE_VALLEY, $1
	closetext
	sjumpfwd .End
.SeakingAlreadyReceived
	opentext 
	writetext SeakingAlreadyReceivedText
	promptbutton
	closetext
.End
	end

Movement_EnterWithProf_Left:
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

Movement_EnterWithProf_Top:
	step_up
	step_up
	step_up
	step_up
	step_end

Movement_EnterWithProf_Below:
	step_up
	step_up
	step_end

Movement_RunsOutOfHouse_DirectlyDown:
	fast_step_down
	fast_step_down
	fast_step_down
	fast_step_down
	step_end

Movement_RunsOutOfHouse_AroundPlayer:
	fast_step_left
	fast_step_down
	fast_step_down
	fast_step_right
	fast_step_down
	fast_step_down
	step_end

Text_JungleHealerBroughtProf:
	text "???: I brought"
	line "Prof. Ramon!"

	para "Prof. Ramon: Hi,"
	line "my name is Profes-"
	cont "sor Ramon."

	para "I am the village"
	line "doctor."

	para "I specialize in"
	line "tropical diseases."

	para "My experience"
	line "tells me..."

	para "You touched the"
	line "deadly poisonous"
	cont "crow's thistle!"

	para "Wait.. no, that's"
	line "not right."

	para "The symptoms don't"
	line "match. You would"
	cont "not be standing!"

	para "Oh... oh no..."
	line "I know what it is."

	para "You ate the deadly"
	line "poisonous green"
	cont "death cap!!"

	para "We do not have"
	line "much time!"

	para "Were the lamellae"
	line "light green or"
	cont "dark green?!"
	done

Text_ProfHealsYou1:
	text "Oh.."
	line "A Mankey you say.."

	para "A monkey? Just a"
	line "regular monkey?"

	para "Some shady guy"
	line "tried to sell it"
	cont "to you?"

	para "Ah, I should have"
	line "known."

	para "Recently, the mon-"
	line "key population has"
	cont "declined."

	para "I did find it a"
	line "bit suspicious.."
	
	para "But, let's focus"
	line "on treating you."
	
	para "I suspect you have"
	line "an infection."
	
	para "I know just the"
	line "right medicine!"

	para "Green death cap!"
	line "One bite and your"
	cont "infection is gone."
	done

Text_ProfHealsYou2:
	text "Hah, take it easy."

	para "The poison is po-"
	line "werful. But also"
	cont "very effective!"

	para "I will just rub"
	line "some on your arm."

	para "You will feel"
	line "better in no time!"

	para "Just try not to"
	line "lick that area for"
	cont "a while.."
	done

Text_StayTheNight:
	text "???: Stay here to-"
	line "night. It's dark"
	cont "and cold outside."

	para "Aylin: My name is"
	line "Aylin, by the way."
	
	para "The weather should"
	line "clear up by tomor-"
	cont "row morning."
	done

GiveSeakingText:
	text "Aylin: Good mor-"
	line "ning! I hope you"
	cont "slept well."

	para "You want to head"
	line "home?"

	para "Ah, but you don't"
	line "have any #mon?"
	
	para "Don't worry! You"
	line "can borrow my "
	cont "trusty Seaking!"

	para "Her name is Marnie"
	line "and she will help"
	cont "you get home."

	para "Head out to the"
	line "water and call her"
	cont "name."

	para "You can ride her"
	line "up the waterfall."
	cont "Good luck!"
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
	line "a Mankey?"

	para "......"
	line "Just a regular"
	cont "monkey?"

	para "Hang on, I will"
	line "try to get a hold"
	cont "of Prof. Ramon!"

	para "He is the village"
	line "doctor. He would"
	cont "know how to help."
	done

ValenciaHouseLassText:
	text "Prof.Ivy is really"
	line "cool!"

	para "She helped my"
	line "#mon when they"
	cont "were sick!"
	done
