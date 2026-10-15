if(vida <= 0){
instance_destroy()
instance_create_layer(x,y,"camada_coletaveis", obj_coletavel_alma)
}

if(x <= obj_player.x){
	image_xscale = 1
}else{
	image_xscale = -1
}

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