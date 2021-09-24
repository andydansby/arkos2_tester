;Tests the AKG player, for SPECTRUM.
;This compiles with RASM. Please check the compatibility page on the website, you can convert these sources to ANY assembler!

;You can generate a SNA, with the execution point at "Start" (#8183).
;Example with "makesna" from the "zxspectrum-utils":
;makesna snaToGenerate.sna 33155 assembledPlayerAndMusic.bin 33153
;(33153 = 0x8181, 33155 = 0x8183).

;Tester code based on the one Grim/Arkos did for Arkos Tracker 1.

org #8000
    ;The Program Counter MUST be set here when generating the SNA (#8183).
Start:
;;;;;;;;;;;;;;;;;;;;;;

    ;attention
    ld sp,#BFFF     ;ld sp,$
    call _SETUP_IM2
;;;;;;;;;;;;;;;;;;;;;;

    ;Initializes the music.
    ld hl,Music
    xor a                                   ;Subsong 0.
    call PLY_AKG_Init
    ei

        ;Waits for the ~50Hz interrupt.
MainLoop:
;    halt

    ;Waits for the electron beam to be in the upper border.
 ;   djnz $
 ;   djnz $

    jr MainLoop


;PUBLIC _SETUP_IM2
_SETUP_IM2:
    di
    ld HL, _IM2_VECTOR  ; loads the HL with the address of the IM2 Vector
    ld A, H             ; places that value in the A register
    ld I, A             ; now the I register has the vector address
    im 2                ; turn on the interrupt manager 2
    ei
ret

;PUBLIC _IM2_PUSH_POP    ;this needs to be at $BDBD
org #bdbd
_IM2_PUSH_POP:
    di
    push AF
    push BC
    push DE
    push HL
    push IX
    exx
    EX AF,AF'   ;attention
    push AF
    push BC
    push DE
    push HL
    push IY
        call PLY_AKG_Play
    pop IY
    pop HL
    pop DE
    pop BC
    pop AF
    exx
    EX AF,AF'   ;attention
    pop IX
    pop HL
    pop DE
    pop BC
    pop AF
    ei
ret


;;THIS is our IM2 Vector
;PUBLIC _IM2_VECTOR;this needs to be at BE00
_IM2_VECTOR:
;;repeat 129 times
dw _IM2_PUSH_POP  ;1
dw _IM2_PUSH_POP  ;2
dw _IM2_PUSH_POP  ;3
dw _IM2_PUSH_POP  ;4
dw _IM2_PUSH_POP  ;5
dw _IM2_PUSH_POP  ;6
dw _IM2_PUSH_POP  ;7
dw _IM2_PUSH_POP  ;8
dw _IM2_PUSH_POP  ;9
dw _IM2_PUSH_POP  ;10
dw _IM2_PUSH_POP  ;11
dw _IM2_PUSH_POP  ;12
dw _IM2_PUSH_POP  ;13
dw _IM2_PUSH_POP  ;14
dw _IM2_PUSH_POP  ;15
dw _IM2_PUSH_POP  ;16
dw _IM2_PUSH_POP  ;17
dw _IM2_PUSH_POP  ;18
dw _IM2_PUSH_POP  ;19
dw _IM2_PUSH_POP  ;20
dw _IM2_PUSH_POP  ;21
dw _IM2_PUSH_POP  ;22
dw _IM2_PUSH_POP  ;23
dw _IM2_PUSH_POP  ;24
dw _IM2_PUSH_POP  ;25
dw _IM2_PUSH_POP  ;26
dw _IM2_PUSH_POP  ;27
dw _IM2_PUSH_POP  ;28
dw _IM2_PUSH_POP  ;29
dw _IM2_PUSH_POP  ;30
dw _IM2_PUSH_POP  ;31
dw _IM2_PUSH_POP  ;32
dw _IM2_PUSH_POP  ;33
dw _IM2_PUSH_POP  ;34
dw _IM2_PUSH_POP  ;35
dw _IM2_PUSH_POP  ;36
dw _IM2_PUSH_POP  ;37
dw _IM2_PUSH_POP  ;38
dw _IM2_PUSH_POP  ;39
dw _IM2_PUSH_POP  ;40
dw _IM2_PUSH_POP  ;41
dw _IM2_PUSH_POP  ;42
dw _IM2_PUSH_POP  ;43
dw _IM2_PUSH_POP  ;44
dw _IM2_PUSH_POP  ;45
dw _IM2_PUSH_POP  ;46
dw _IM2_PUSH_POP  ;47
dw _IM2_PUSH_POP  ;48
dw _IM2_PUSH_POP  ;49
dw _IM2_PUSH_POP  ;50
dw _IM2_PUSH_POP  ;51
dw _IM2_PUSH_POP  ;52
dw _IM2_PUSH_POP  ;53
dw _IM2_PUSH_POP  ;54
dw _IM2_PUSH_POP  ;55
dw _IM2_PUSH_POP  ;56
dw _IM2_PUSH_POP  ;57
dw _IM2_PUSH_POP  ;58
dw _IM2_PUSH_POP  ;59
dw _IM2_PUSH_POP  ;60
dw _IM2_PUSH_POP  ;61
dw _IM2_PUSH_POP  ;62
dw _IM2_PUSH_POP  ;63
dw _IM2_PUSH_POP  ;64
dw _IM2_PUSH_POP  ;65
dw _IM2_PUSH_POP  ;66
dw _IM2_PUSH_POP  ;67
dw _IM2_PUSH_POP  ;68
dw _IM2_PUSH_POP  ;69
dw _IM2_PUSH_POP  ;70
dw _IM2_PUSH_POP  ;71
dw _IM2_PUSH_POP  ;72
dw _IM2_PUSH_POP  ;73
dw _IM2_PUSH_POP  ;74
dw _IM2_PUSH_POP  ;75
dw _IM2_PUSH_POP  ;76
dw _IM2_PUSH_POP  ;77
dw _IM2_PUSH_POP  ;78
dw _IM2_PUSH_POP  ;79
dw _IM2_PUSH_POP  ;80
dw _IM2_PUSH_POP  ;81
dw _IM2_PUSH_POP  ;82
dw _IM2_PUSH_POP  ;83
dw _IM2_PUSH_POP  ;84
dw _IM2_PUSH_POP  ;85
dw _IM2_PUSH_POP  ;86
dw _IM2_PUSH_POP  ;87
dw _IM2_PUSH_POP  ;88
dw _IM2_PUSH_POP  ;89
dw _IM2_PUSH_POP  ;90
dw _IM2_PUSH_POP  ;91
dw _IM2_PUSH_POP  ;92
dw _IM2_PUSH_POP  ;93
dw _IM2_PUSH_POP  ;94
dw _IM2_PUSH_POP  ;95
dw _IM2_PUSH_POP  ;96
dw _IM2_PUSH_POP  ;97
dw _IM2_PUSH_POP  ;98
dw _IM2_PUSH_POP  ;99
dw _IM2_PUSH_POP  ;100
dw _IM2_PUSH_POP  ;101
dw _IM2_PUSH_POP  ;102
dw _IM2_PUSH_POP  ;103
dw _IM2_PUSH_POP  ;104
dw _IM2_PUSH_POP  ;105
dw _IM2_PUSH_POP  ;106
dw _IM2_PUSH_POP  ;107
dw _IM2_PUSH_POP  ;108
dw _IM2_PUSH_POP  ;109
dw _IM2_PUSH_POP  ;110
dw _IM2_PUSH_POP  ;111
dw _IM2_PUSH_POP  ;112
dw _IM2_PUSH_POP  ;113
dw _IM2_PUSH_POP  ;114
dw _IM2_PUSH_POP  ;115
dw _IM2_PUSH_POP  ;116
dw _IM2_PUSH_POP  ;117
dw _IM2_PUSH_POP  ;118
dw _IM2_PUSH_POP  ;119
dw _IM2_PUSH_POP  ;120
dw _IM2_PUSH_POP  ;121
dw _IM2_PUSH_POP  ;122
dw _IM2_PUSH_POP  ;123
dw _IM2_PUSH_POP  ;124
dw _IM2_PUSH_POP  ;125
dw _IM2_PUSH_POP  ;126
dw _IM2_PUSH_POP  ;127
dw _IM2_PUSH_POP  ;128
dw _IM2_PUSH_POP  ;129


org #c000
Player:
        ;Selects the hardware. Mandatory, as Amstrad CPC is default.
        PLY_AKG_HARDWARE_SPECTRUM = 1

        ;Want a ROM player (a player without automodification)?
        ;PLY_AKG_Rom = 1                         ;Must be set BEFORE the player is included.

        ;Include here the Player Configuration source of the songs (you can generate them with AT2 while exporting the songs).
        ;If you don't have any, the player will use a default Configuration (full code used), which may not be optimal.
        ;If you have several songs, include all their configuration here, their flags will stack up!
        ;Warning, this must be included BEFORE the player is compiled.
        include "music_playerconfig.asm"
        include "PlayerAkg.asm"

        ;Declares the buffer for the ROM player, if you're using it. You can declare it anywhere of course.
        ;LIMITATION: the SIZE of the buffer (PLY_AKG_ROM_BufferSize) is only known *after* ther player is compiled.
        ;A bit annoying, but you can compile once, get the buffer size, and hardcode it to put the buffer wherever you want.
        ;Note that the size of the buffer shrinks when using the Player Configuration feature. Use the largest size and you'll be safe.
        IFDEF PLY_AKG_Rom
                PLY_AKG_ROM_Buffer = $                  ;Can be set anywhere.
                ds PLY_AKG_ROM_BufferSize, 0            ;Reserves the buffer for the ROM player (not mandatory, but cleaner).
        ENDIF
Music:
        ;What music to play?
        include "music.asm"
