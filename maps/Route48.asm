Route48_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33,  0, YELLOW_FOREST_GATE, 3
	warp_event 23,  5, MR_FUJIS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 27, 11, BGEVENT_JUMPTEXT, Text_Route48_Sign
	bg_event 24, 6, BGEVENT_JUMPTEXT, Text_Route48_Spa

	def_object_events
	object_event  17,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SPINARAK, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, NO_FORM, Route48_SpinarakSpooked, EVENT_SPINARAK_SPOOKED
	object_event 9,   8, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, TrainerSchoolgirlIsabelPlaceholder, -1
	object_event 24, 17, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, TrainerAromaladyBryonyPlaceholder, -1
	object_event 26, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_Route48_Supernerd, -1
	itemball_event  8, 8, POTION, 1, EVENT_ROUTE_48_POTION

	object_const_def
	const ROUTE48_SPINARAK

Route48_SpinarakSpooked:
	showemote EMOTE_SHOCK, ROUTE48_SPINARAK, 15
	turnobject ROUTE48_SPINARAK, DOWN
	showtext Text_Route48_SpinarakSpooked
	applyonemovement ROUTE48_SPINARAK, fast_step_right
	disappear ROUTE48_SPINARAK
	showtext Text_Route48_SpinarakRanAway
	end

Text_Route48_SpinarakRanAway:
	text "Spinarak got spo-"
	line "oked and ran way."
	done

Text_Route48_SpinarakSpooked:
	text "Spinarak!!"
	done

Text_Route48_Spa:
	text "Olympus Spa"

	para "Take a dip in our"
	line "refreshing jungle"
	cont "water."
	done

Text_Route48_Supernerd:
	text "If you get lost,"
	line "just read the sign"
	cont "to my left."
	done

Text_Route48_Sign:
	text "Route 48"

	para "North:"
	line "Chirali Forest"

	para "East:"
	line "Route 49"
	done

TrainerAromaladyBryonyPlaceholder:
	generictrainer AROMA_LADY, BRYONY, EVENT_BEAT_AROMA_LADY_BRYONY, .SeenText, .BeatenText
	
	text "It would really be"
	line "more convenient"
	
	para "with a bridge to"
	line "the other side.."

	para "Oh, you are a"
	line "trainer? Let's go!"
	done

.SeenText:
	text "Placeholder"
	done

.BeatenText:
	text "Placeholder"
	done

TrainerSchoolgirlIsabelPlaceholder:
	trainer SCHOOLGIRL, ISABEL, EVENT_BEAT_SCHOOLGIRL_ISABEL, .SchoolgirlIsabelSeenText, .SchoolgirlIsabelBeatenText, .SchoolgirlIsabelLostText, -1

	text "My parents wanted"
	line "me to be a #mon"
	cont "trainer."

	para "But I am scared."
	line "What if I am not"

	para "as good as all the"
	line "other kids?"
	done

.SchoolgirlIsabelSeenText:
	text "Placeholder"
	done

.SchoolgirlIsabelBeatenText:
	text "You have really"
	line "strong #mon!"
	done

.SchoolgirlIsabelLostText:
	text "I can't believe"
	line "I won?!"

	para "Maybe I'm not so"
	line "bad at this.."
	done

/*
Route48JessieJamesScript2:
	moveobject ROUTE48_JESSIE, 15, 13
	moveobject ROUTE48_JAMES, 26, 13
Route48JessieJamesScript1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	appear ROUTE48_JESSIE
	appear ROUTE48_JAMES
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	applyonemovement ROUTE48_JAMES, step_left
	follow ROUTE48_JESSIE, ROUTE48_JAMES
	applymovement ROUTE48_JESSIE, JessieEnterMovementData
	stopfollow
	showtext Route48JessieJamesSeenText
	setscene $1
	setevent EVENT_BEAT_JESSIE_AND_JAMES
	setevent EVENT_ROUTE_48_JESSIE
	setevent EVENT_ROUTE_48_JAMES
	winlosstext Route48JessieJamesBeatenText, 0
	setlasttalked ROUTE48_JESSIE
	loadtrainer JESSIE_JAMES, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special DeleteSavedMusic
	playmusic MUSIC_JESSIE_JAMES_ENCOUNTER
	showtext Route48JessieJamesAfterText
	follow ROUTE48_JESSIE, ROUTE48_JAMES
	loadmem wFollowMovementQueue, movement_teleport_from
	applyonemovement ROUTE48_JESSIE, teleport_from
	stopfollow
	disappear ROUTE48_JESSIE
	disappear ROUTE48_JAMES
	playmapmusic
	end

JessieEnterMovementData:
	paired_step_right
	paired_step_right
	paired_step_right
	paired_step_right
	step_end

TrainerArcher2:
	trainer ARCHER, ARCHER2, EVENT_BEAT_ARCHER_2, Archer2SeenText, Archer2BeatenText, 0, Archer2Script

Archer2Script:
	showtext Archer2AfterText
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear ROUTE48_ARCHER
	pause 15
	special Special_FadeInQuickly
	setevent EVENT_CLEARED_YELLOW_FOREST
	clearevent EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	playsound SFX_ENTER_DOOR
	appear ROUTE48_NURSE
	waitsfx
	applyonemovement ROUTE48_NURSE, step_down
	setlasttalked ROUTE48_NURSE
	faceplayer
	showtext Route48NurseText1
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	showtext Route48NurseText2
	applyonemovement ROUTE48_NURSE, step_up
	playsound SFX_EXIT_BUILDING
	disappear ROUTE48_NURSE
	end

Route48JessieJamesSeenText:
	text "Stop right there,"
	line "twerp!"

	para "You know what"
	line "#mon lives in"
	cont "that forest?"
	cont "Pikachu!"

	para "The boss will be"
	line "pleased if we"

	para "capture a power-"
	line "ful one!"

	para "Surrender now, or"
	line "prepare to fight!"
	done

Route48JessieJamesBeatenText:
	text "A brat beat us?"
	done

Route48JessieJamesAfterText:
	text "Looks like Team"
	line "Rocket's blasting"
	cont "off again!"
	done

Archer2SeenText:
	text "So you want to"
	line "interfere with"

	para "Team Rocket's"
	line "plans again."

	para "Always sticking"
	line "your nose where it"
	cont "doesn't belong."

	para "We're selling"
	line "those #mon,"

	para "and there's nothing"
	line "you can do about"
	cont "it!"
	done

Archer2BeatenText:
	text "This is so"
	line "frustrating…"
	done

Archer2AfterText:
	text "…Have it your"
	line "way."

	para "Team Rocket will"
	line "withdraw for now."

	para "Our other plan is"
	line "going smoothly"
	cont "anyway…"
	done

Route48NurseText1:
	text "I saw your battle"
	line "from the window!"

	para "You drove away"
	line "Team Rocket and"
	cont "saved the Pikachu!"

	para "Thank you so much!"

	para "Your #mon de-"
	line "serve a rest after"
	cont "all that."
	done

Route48NurseText2:
	text "I like to relax"
	line "here by the forest"
	cont "and watch the"
	cont "#mon play."

	para "I'll heal your"
	line "#mon any time!"

	para "Thanks again!"
	done

Route48YellowForestSignText:
	text "Route 48"

	para "North to"
	line "Yellow Forest"
	done
*/