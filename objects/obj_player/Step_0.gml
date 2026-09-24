#region movimentos
	var hspd = 0
	
	if(keyboard_check(vk_right)){
		hspd = velocidade_x
		direita = true
		image_xscale = 1
	}
	if(keyboard_check(vk_left)){
		hspd = -velocidade_x
		direita = false
		image_xscale = -1
	}
	
	// colisão horizontal (pixel a pixel)
	if(place_meeting(x + hspd, y, tilemap_chao)){
		while(!place_meeting(x + sign(hspd), y, tilemap_chao)){
			x += sign(hspd)
		}
		hspd = 0
	}
	x += hspd
	
	andando = (hspd != 0)
	
	// pulo
	if(keyboard_check_pressed(vk_up) && pulos < max_pulos){
		velocidade_y = -forca_pulo
		pulos += 1
	}
#endregion

#region gravidade
	if(!place_meeting(x, y + 1, tilemap_chao)){
		velocidade_y += grav
		tocando_chao = false
	}else{
		pulos = 0
		tocando_chao = true
	}
	
	// colisão vertical (pixel a pixel)
	if(place_meeting(x, y + velocidade_y, tilemap_chao)){
		while(!place_meeting(x, y + sign(velocidade_y), tilemap_chao)){
			y += sign(velocidade_y)
		}
		velocidade_y = 0
	}
	y += velocidade_y
#endregion

#region sprites
	if(!tocando_chao){
		if(velocidade_y < 0){
			sprite_index = spr_player_jump
		}else{
			sprite_index = spr_player_fall
		}
	}else if(andando){
		sprite_index = spr_player_run
	}else{
		sprite_index = spr_player_idle
	}
#endregion