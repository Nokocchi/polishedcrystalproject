NewPlayerHome2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  9,  1, VALENCIA_PORT, 1

	def_coord_events

	def_bg_events
	bg_event  5,  2, BGEVENT_JUMPTEXT, NewPlayerHome2FPCText
	bg_event  4,  2, BGEVENT_JUMPTEXT, NewPlayerHome2FSNESText
	bg_event  6,  2, BGEVENT_READ, PokemonJournalProfOakScript
	bg_event  7,  2, BGEVENT_READ, PokemonJournalProfOakScript

	def_object_events

PokemonJournalProfOakScript:
	setflag ENGINE_READ_PROF_OAK_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "#mon Prof.Oak!"

	para "Samuel Oak's grand-"
	line "children, Blue and"

	para "Daisy, live near"
	line "his lab in Pallet"
	cont "Town!"

	para "His cousin Samson"
	line "is rumored to live"

	para "in the far-off"
	line "Alola region."
	done

NewPlayerHome2FPCText:
	text "Yuck! It's covered"
	line "in crumbs and old"
	cont "candy wrappers…"
	done

NewPlayerHome2FSNESText:
	text "<PLAYER> played the"
	line "SNES."

	para "Better get going--"
	line "no time to lose!"
	done
