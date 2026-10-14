
direita = true
temp = 30
velocidade_y = 0
tocando_chao = false
grav = 0.05
dano = true

tilemap_chao = layer_tilemap_get_id(layer_get_id("Tiles_1"));

velocidade = random_range(2, 8)



#region direcao
	if(x <= obj_player.x ){
		direita = false
		image_xscale = 1
			}else{
			direita = true
			image_xscale = -1
			}
#endregion


