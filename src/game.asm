game_start: 
	nextreg $15,%00000011
	call init_tiles


	nextreg $56, 0x20
	

	ld a,NPC_MARGE
    ld (npc_current_type),a
	call npc_start

	ld b,SPRITE_COUNT
    ld hl,rpgsprites1
    call init_sprites

	call display_dialog_text
	
    ret

game_update:
	ld b,1
	call WaitRasterLine
  	
    call check_keys


	call player_update
	call npc_update



	ret

game_draw:
	call player_draw
	call npc_draw
    
	ret



WAITING_TIME equ 10000








