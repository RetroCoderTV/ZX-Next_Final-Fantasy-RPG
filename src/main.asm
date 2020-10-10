    org 0x8000

    DEVICE ZXSPECTRUMNEXT
	
start:
	call game_start	

	jp main_loop

main_loop:
	call game_update
	call game_draw

	jp main_loop

STACK_SIZE equ 20
stack_bottom ds STACK_SIZE, 0
stack_top db 0  

	include 'retrotools\tools.asm'
	include 'constants.asm'
	include 'game.asm'
	include 'sprites.asm'
	include 'player.asm'
	include 'npc.asm'
	include 'dialog.asm'
	include 'retrotools\keycacher.asm'
	include 'retrotools\spritetools.asm'
	include 'tiledworld.asm'
	
	; MMU 7 n,0x20*2 
	; org 0xE000
	; incbin "space.bmp",1078

	; MMU 7 n,0x23*2 
	; org 0xE000
	; incbin "space2.bmp",1078


	; MMU 7 n,0x20
	; org 0xE000
	; incbin "fonts/font7.spr"


tilepalette:
	incbin "tiles/3bit.pal",0


	slot 6
	page $f
	org MAP_ADDRESS


	;0=grass 1,4=bush  5,8=dark water 9,12=water 13 =door l 17=door r
tilemap:
	db 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0
	db 0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,13,17,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
	db 0,0,0,0,12,12,12,12,12,12,12,12,12,12,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	page $10
	org MAP_ADDRESS
tilebitmap:	
	incbin "tiles/3bit.til",0

	SAVENEX OPEN "main.nex", start , stack_top
    SAVENEX CORE 3, 0, 0      
    SAVENEX CFG 0, 0            
	SAVENEX AUTO
    SAVENEX CLOSE 

;main.asm(97): error: Write outside of device memory at: 65536


;MMU notes (sjasm)
; MMU <first slot number> [<last slot number>|<single slot option>], <page number>[,<address>]

;     Maps memory page(s) to slot(s), similar to SLOT + PAGE combination, but allows to set up whole range of consecutive slots (with consecutive memory pages). Or when only single slot is specified, extra option can be used to extend particular slot functionality. The slot behaviour will stay set in the current DEVICE until reset by another MMU specifying same slot (even as part of range, that will clear the option to "default").

;     The optional third argument is address for ORG functionality.

;     Single slot option (default state is: no error/warning and no wrap = nothing special):

;     e = error on writing beyond last byte of slot
;     w = warning on writing beyond last byte of slot
;     n = wrap address back to start of slot, map next page

;     Example 5.34. docs_examples/po_mmu.asm

;         DEVICE ZXSPECTRUM128 : LABELSLIST "po_mmu.lbl"  ; to check label pages
;         MMU 1 3, 5      ; maps slots 1, 2, 3 with pages 5, 6, 7
;         ORG 0xBFFF
;     label1_p6: scf      ; last byte of page 6 (in slot 2)
;     label2_p7: scf      ; first byte of page 7 (in slot 3)

;         MMU 3 e, 0      ; page 0 into slot 3, write beyond slot will cause error
;         ORG 0xFFFF
;         ld  a,1         ; error: Write outside of memory slot: 65536 (65536 = address outside)

;         MMU 3 n, 1      ; page 1 into slot 3, make it wrap + map next page automatically
;         ORG 0xFFFF      ; ! also the $ address was truncated by MMU from $10001 to $0001 !
;     label3_p1: scf      ; last byte of page 1, then wrapping back to 0xC000 with page 2
;     label4_p2: scf      ; first byte of page 2 at 0xC000



