#region direcao
	if(x <= obj_player.x ){
		direita = false
		image_xscale = 1
			}else{
			direita = true
			image_xscale = -1
			}
#endregion

#region atirar
	if(obj_player.x >= x - raio && obj_player.x <= x + raio){
		if(temp == false){
			temp = true
			if(direita == true){
				instance_create_layer(x-8, y+6,"camada_projeteis",obj_projetil_demonio)
			}else{
				instance_create_layer(x+8, y+6,"camada_projeteis",obj_projetil_demonio)
			}
			sprite_index = spr_inimigo_canhaodemonio_vazio
			alarm_set(0, couldawn/2)
			}
	}

#endregion

#region gravidade
    if(!place_meeting(x, y + 1, tilemap_chao)){
        velocidade_y += grav
        tocando_chao = false
    }else{
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

#region Vida
	if(vida <= 0){
		instance_create_layer(x, y, "camada_powerUP", obj_powerup_vida);
		instance_destroy();
	}
#endregion