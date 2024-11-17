MrFujisHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 17, ROUTE_48, 2
	warp_event  6, 17, ROUTE_48, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 2, 12, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_MrFujisHouse_Girl, -1
	object_event 2, 16, SPRITE_COOL_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Text_MrFujisHouse_Guy, -1
	object_event 7, 13, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisHouseClerkScript, -1
	pokemon_event  8, 6, PSYDUCK, SPRITEMOVEDATA_POKEMON, -1, -1, PAL_NPC_BROWN, Text_MrFujisHouse_Psyduck, -1

MrFujisHouseClerkScript:
	opentext
	writetext Text_MrFujisHouse_Clerk
	yesorno
	iffalsefwd .Refuse
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	showtext Text_MrFujisHouse_ClerkHealed
	sjumpfwd .End
.Refuse
	writetext Text_MrFujisHouse_ClerkRefuse
	closetext
.End
	end

Text_MrFujisHouse_Guy:
	text "I wanted to come"
	line "here for months!"

	para "It took a while to"
	line "convince my girl-"
	cont "friend, though."

	para "She wasn't really"
	line "sold on the jungle"
	cont "water.."
	done

Text_MrFujisHouse_ClerkHealed:
	text "The soothing,"
	line "fresh water healed"
	cont "your #mon"
	done

Text_MrFujisHouse_ClerkRefuse:
	text "I understand."
	line "Please come again!"
	done

Text_MrFujisHouse_Girl:
	text "Ah!! GET OUT!"
	done

Text_MrFujisHouse_Clerk:
	text "This spa is very"
	line "popular among the"
	cont "locals."

	para "But also for tired"
	line "trainers passing"
	cont "by."

	para "Would you like to"
	line "soak in the fresh"
	cont "jungle water?"

	para "It's super"
	line "refreshing!"
	done

Text_MrFujisHouse_Psyduck:
	text "Psyduck: Gu-guwa?"
	done
