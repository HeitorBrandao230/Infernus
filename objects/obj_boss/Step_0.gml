if(global.vidaboss <= 0){
	sprite_index = spr_boss_morrendo
	morto = true
	
}
if(morto == false){
// ativa quando o player chega perto
if(!raios_ativos && instance_exists(obj_player) && distance_to_object(obj_player) < 300){
    raios_ativos = true
    qtd_raios = 2
    criar_raios(2)
}

// metade da vida: 2 -> 4 raios
if(raios_ativos && qtd_raios == 2 && global.vidaboss <= global.vidabossMAX / 2){
    qtd_raios = 4
    criar_raios(4)
}

// gira
if(raios_ativos){
    angulo_raios += vel_giro
}
}