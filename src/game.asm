game_start: 
	nextreg $57, 0xe
	ld b,13 ;SPRITE_COUNT
    ld hl,MAP_ADDRESS
    call init_sprites

	nextreg $15,%00000011
	call init_tiles


	

	
	

	ld a,NPC_MARGE
    ld (npc_current_type),a
	call npc_start



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








