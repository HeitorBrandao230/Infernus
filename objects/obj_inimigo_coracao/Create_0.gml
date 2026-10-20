vida = 2
image_xscale = 1.25
image_yscale = 1.25


hsp = 1;        // velocidade horizontal
vsp = 0;        // velocidade vertical
grv = 0.3;      // gravidade

var cont = irandom_range(1, 2)
if(cont == 1){
	dir = 1;        // 1 = direita, -1 = esquerda
}else{
	dir = -1
}
tilemap_chao = layer_tilemap_get_id(layer_get_id("Tile_chao"));