if(vida <= 0){
    instance_create_layer(x, y, "camada_coletaveis", obj_coletavel_alma)
    instance_create_layer(x, y, "camada_explosao", obj_explosao1)
    instance_destroy()
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

#region correr
if(obj_player.x >= x - raio && obj_player.x <= x + raio){
    if(obj_player.y >= y - raio/2 && obj_player.y <= y + raio/2){

        var dir = clamp(obj_player.x - x, -velocidade_x, velocidade_x)

        if(!place_meeting(x + dir, y, tilemap_chao)){
            x += dir
        }

        // explode só se estiver perto de verdade (X e Y)
        if(point_distance(x, y, obj_player.x, obj_player.y) <= 20){
            vida = 0
        }
    }
}
#endregion