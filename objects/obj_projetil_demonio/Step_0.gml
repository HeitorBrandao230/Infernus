// movimento horizontal com colisão na parede
var dir = direita ? -1 : 1   // mesma lógica do seu código (direita = x -= velocidade)

if(!caindo){
    if(place_meeting(x + dir * velocidade, y, tilemap_chao)){
        // encostou na parede: gruda nela e começa a cair
        while(!place_meeting(x + dir, y, tilemap_chao)){
            x += dir
        }
        caindo = true
        velocidade = 0
    }else{
        x += dir * velocidade
    }
}

#region gravidade
    if(caindo){
        if(!place_meeting(x, y + 1, tilemap_chao)){
            velocidade_y += grav
            tocando_chao = false
        }else{
            tocando_chao = true
        }

        // colisão vertical
        if(place_meeting(x, y + velocidade_y, tilemap_chao)){
            while(!place_meeting(x, y + sign(velocidade_y), tilemap_chao)){
                y += sign(velocidade_y)
            }
            velocidade_y = 0
        }
        y += velocidade_y
    }

    if(tocando_chao == true){
        velocidade = 0
        dano = false
        if(alarm_get(1) <= 0){
            alarm_set(1, 30)
        }
    }
#endregion