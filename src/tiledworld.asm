
init_tiles:
	call set_palette
	nextreg $57, $10
	ld hl,$e000
	ld de,$6000
	ld bc,2048
	ldir

	nextreg $6b,%10100001
	nextreg $6c,0
	nextreg $6e,$40
	nextreg $6f,$60
	nextreg $68,%10000000
	nextreg $43,%00110000

	xor a
	nextreg $14,a ;set global transparency to black
	nextreg $4c,a ;tilemap transparency to black
	nextreg $30,a ;tile x offset =0
	nextreg $31,a ;tile y offset

	nextreg $57, $f
	ld hl,$e000
	ld de,$4000
	ld bc,1024*2 
	ldir

    ret


set_palette:
	ld hl,tilepalette
	nextreg $43,%00110000
	ld bc,0
uploadpal:
	ld a,b
	nextreg $40,a
	inc b
	ld a,(hl)
	nextreg $41,a
	inc hl
	ld a,(hl)
	nextreg $41,a
	inc hl
	ld a,b
	or a
	jp nz,uploadpal
	ret




