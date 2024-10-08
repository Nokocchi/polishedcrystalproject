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
	opentext
	writetext TEEEEEXT
	promptbutton
	closetext
	end

TEEEEEXT:
	text "Your monkey bite"
	line "Is infected! You"
	cont "feel sick.."
	done

LoadInfectedBGPals:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld c, 8 * 4
.loop
if DEF(NOIR)
	ld a, LOW(palred 24 + palgreen 24 + palblue 24)
	ld [hli], a
	ld a, HIGH(palred 24 + palgreen 24 + palblue 24)
	ld [hli], a
elif !DEF(MONOCHROME)
; RGB 28, 21, 31
	ld a, LOW(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	ld a, HIGH(palred 28 + palgreen 21 + palblue 31)
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
