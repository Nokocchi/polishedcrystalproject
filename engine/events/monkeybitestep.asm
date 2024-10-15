DoMonkeyBiteStep::
	ld b, CHECK_FLAG
	ld de, EVENT_MONKEY_BITE_INFECTED
	call EventFlagAction
	ld a, c
	and a
	jr nz, ShowMessage
	ret

ShowMessage:
	ld a, BANK(Script_ShowMessage)
	ld hl, Script_ShowMessage
	call CallScript
	scf
	ret

PlayPoisonSFX:
	ld de, SFX_POISON
	call PlaySFX
	ld b, $2
	call LoadInfectedBGPals
	jmp DelayFrame

Script_ShowMessage:
	callasm PlayPoisonSFX
	checkevent EVENT_MONKEY_BITE_INFECTED_MSG_SHOWN
	iftruefwd .ShowMsgEnd
	opentext
	writetext Text_BiteInfected
	promptbutton
	closetext
	setevent EVENT_MONKEY_BITE_INFECTED_MSG_SHOWN
.ShowMsgEnd:
	end

Text_BiteInfected:
	text "Your monkey bite"
	line "Is infected! You"
	cont "feel sick..."
	done

LoadInfectedBGPals:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld c, 8 * 16 ; Length of color flash?
.loop
if DEF(NOIR)
	ld a, LOW(palred 24 + palgreen 24 + palblue 24)
	ld [hli], a
	ld a, HIGH(palred 24 + palgreen 24 + palblue 24)
	ld [hli], a
elif !DEF(MONOCHROME)
; RGB 64 144 64
	ld a, LOW(palred 8 + palgreen 18 + palblue 8)
	ld [hli], a
	ld a, HIGH(palred 8 + palgreen 18 + palblue 8)
	ld [hli], a
else
	ld a, LOW(PAL_MONOCHROME_WHITE)
	ld [hli], a
	ld a, HIGH(PAL_MONOCHROME_WHITE)
	ld [hli], a
endc
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	farjp _UpdateTimePals
