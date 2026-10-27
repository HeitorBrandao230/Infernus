#region vida
if(global.vida <= 0){
    global.vida = 3
    room_restart()
    exit
}
if(global.vida >= 8){
    global.vida = 7
}
#endregion

#region movimentos
    var hspd = 0

    if(keyboard_check(vk_right) && atirando == false){
        hspd = velocidade_x
        global.direita = true
        image_xscale = 1
    }
    if(keyboard_check(vk_left) && atirando == false){
        hspd = -velocidade_x
        global.direita = false
        image_xscale = -1
    }

    hspd += knockback_x
    knockback_x = lerp(knockback_x, 0, 0.1) // vai diminuindo
    if(abs(knockback_x) < 0.1) knockback_x = 0

    // colisão horizontal (pixel a pixel) - plataforma NÃO entra aqui
    if(place_meeting(x + hspd, y, tilemap_chao) || place_meeting(x + hspd, y, obj_config_barreira)){
        while(!place_meeting(x + sign(hspd), y, tilemap_chao) && !place_meeting(x + sign(hspd), y, obj_config_barreira)){
            x += sign(hspd)
        }
        hspd = 0
    }
    x += hspd

    andando = (hspd != 0)

    // pulo
    if(keyboard_check_pressed(vk_up) && pulos < max_pulos && atirando == false){
        velocidade_y = -forca_pulo
        pulos += 1
    }

    if(keyboard_check_pressed(vk_space)){
        atirando = true
        sprite_index = spr_player_shot
        alarm_set(0, 15)
        if(global.direita == true){
            instance_create_layer(x + 6, y, "camada_projeteis", obj_tiro_player)
        }else{
            instance_create_layer(x - 6, y, "camada_projeteis", obj_tiro_player)
        }
    }
#endregion

#region gravidade
    // chão sólido (tilemap / barreira)
    var no_solido = place_meeting(x, y + 1, tilemap_chao) || place_meeting(x, y + 1, obj_config_barreira)

    // plataforma: conta como chão se os pés estão acima do topo dela
    var no_plat = false
    var plat_chao = instance_place(x, y + 1, obj_plataforma)
    if(plat_chao != noone && bbox_bottom <= plat_chao.bbox_top){
        no_plat = true
    }

    if(!no_solido && !no_plat){
        velocidade_y += grav
        tocando_chao = false
    }else{
        pulos = 0
        tocando_chao = true
    }

    // colisão vertical com sólidos (pixel a pixel)
    if(place_meeting(x, y + velocidade_y, tilemap_chao) || place_meeting(x, y + velocidade_y, obj_config_barreira)){
        while(!place_meeting(x, y + sign(velocidade_y), tilemap_chao) && !place_meeting(x, y + sign(velocidade_y), obj_config_barreira)){
            y += sign(velocidade_y)
        }
        velocidade_y = 0
    }

    // colisão vertical com plataforma (só caindo, só por cima)
    if(velocidade_y > 0){
        var plat = instance_place(x, y + velocidade_y, obj_plataforma)
        if(plat != noone && bbox_bottom <= plat.bbox_top){
            while(!place_meeting(x, y + 1, plat)){
                y += 1
            }
            velocidade_y = 0
        }
    }

    y += velocidade_y
#endregion

#region colisao inimigo
	// contagem da invencibilidade
	if(invencivel){
		timer_invencivel -= 1
		
		// pisca o player pra dar feedback visual
		image_alpha = (timer_invencivel mod 6 < 3) ? 0.4 : 1
		
		if(timer_invencivel <= 0){
			invencivel = false
			image_alpha = 1
		}
	}
	
	var inimigo = instance_place(x, y, obj_config_inimigo)
	if(inimigo != noone && !invencivel){
		global.vida -= 1
		invencivel = true
		timer_invencivel = tempo_invencivel
		
		// empurra pro lado oposto de onde o inimigo está
		var dir = sign(x - inimigo.x)
		if(dir == 0) dir = global.direita ? -1 : 1

		knockback_x = dir * empurram_x
		velocidade_y = -empurram_y
	}
#endregion

#region sprites
if(atirando == false){
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
}
#endregion

#region colisao acido
	if(place_meeting(x,y, obj_acido)){
	velocidade_x = velocidade_x_padrao / 2
	}else{
	velocidade_x = velocidade_x_padrao
	}
#endregion

#region colisao lava
	if(place_meeting(x,y, obj_lava)){
	global.vida = 0
	}
#endregion