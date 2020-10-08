py dw 64
px dw 32



PLAYER_SPEED equ 1
PLAYER_ATTR_SLOT equ 63
player_attribute_2 db %00000000
player_attribute_3 db %11000000
player_attribute_4 db %00100000




player_type db %10000000 ;type= VISIBILITY BYTE + IMAGE ID
player_hp db 0
player_mp db 0
player_xp db 0
player_lvl db 0
player_money db 0


; ;[visibility+sprite image id],hp,mp,xp,lvl
; characters:
; 	db 0,0,0,0,0
; 	db 0,0,0,0,0
; 	db 0,0,0,0,0
; 	db 0,0,0,0,0
; 	db 255




animation_counter db 0
ANIMATION_FRAME_TIME equ 12




player_start:

	ret

player_update:

	ld a,(animation_counter)
	inc a
	ld (animation_counter),a
	cp ANIMATION_FRAME_TIME
	call nc, animate_player

	ld a,(keypressed_A)
	cp TRUE
	call z, move_left

	ld a,(keypressed_D)
	cp TRUE
	call z, move_right

	ld a,(keypressed_W)
	cp TRUE
	call z, move_up

	ld a,(keypressed_S)
	cp TRUE
	call z, move_down

    ret

player_draw:
	;select slot
	ld a,PLAYER_ATTR_SLOT
	ld bc, $303b ;selection of pattern
	out (c), a

	ld bc, $57 ;0x57=attribute writing port
	;attr 0
	ld a,(px)
	out (c), a    

	;attr 1                                  
	ld hl,py
	ld a,(hl)
	out (c), a                                      

	;attr 2
	ld a,(player_attribute_2)
	ld b,a
	ld hl,px
	inc hl
	ld a,(hl)
	or b
	out (c),a

	;attr 3
	ld a,(player_attribute_3)
	out (c),a

	;attr 4
	ld a,(player_attribute_4)
	out (c),a

	ret



move_up:
	ld hl,py
	inc hl
	ld a,(hl)
	bit 0,a
	jp z,check_top_edge
do_move_up:
	ld hl,(py)
	ld de,-PLAYER_SPEED
	add hl,de
	ld (py),hl
	ret
check_top_edge:
	dec hl
	ld a,(hl)
	cp GUTTER
	ret c
	jp do_move_up



move_down:
	ld hl,py
	inc hl
	ld a,(hl)
	bit 0,a
	jp nz,check_bottom_edge
do_move_down:
	ld hl,(py)
	ld de,PLAYER_SPEED
	add hl,de
	ld (py),hl
	ret
check_bottom_edge:
	dec hl
	ld a,(hl)
	cp 12 
	ret nc
	jp do_move_down

move_right:
	ld hl,px
	inc hl
	ld a,(hl)
	bit 0,a
	jp nz,check_right_edge
do_move_right:
	ld hl,(px)
	ld de,PLAYER_SPEED
	add hl,de
	ld (px),hl
	ret
check_right_edge:
	dec hl
	ld a,(hl)
	cp 12 ;screen right
	ret nc
	jp do_move_right


move_left:
	ld hl,px
	inc hl
	ld a,(hl)
	bit 0,a
	jp z,check_left_edge	
do_move_left:
	ld hl,(px)
	ld de,-PLAYER_SPEED
	add hl,de
	ld (px),hl
	ret
check_left_edge:
	dec hl
	ld a,(hl)
	cp GUTTER+5
	ret c
	jp do_move_left


animate_player:
	call flip_character_sprite
	xor a
	ld (animation_counter),a
	ret


flip_character_sprite:
	ld a,(player_attribute_2)
	xor %00001000
	ld (player_attribute_2),a
	ret







	