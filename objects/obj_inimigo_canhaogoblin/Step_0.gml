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
		show_debug_message("entrou no raio")
		
	}else{
		show_debug_message("saiu do raio")
	}

#endregion