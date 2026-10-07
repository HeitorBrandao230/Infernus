#region Vida
	if(vida <= 0){
		instance_create_layer(x, y, "Instances", obj_powerup_vida);
		instance_destroy();
	}
#endregion

#region Movimento
	// Gravidade
vsp += grv;

// Colisão vertical
if (place_meeting(x, y + vsp, tilemap_chao)) {
    while (!place_meeting(x, y + sign(vsp), tilemap_chao)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// Só checa borda/parede se estiver no chão
var no_chao = place_meeting(x, y + 1, tilemap_chao);

if (no_chao) {
    // Ponto à frente dos pés (usa a bounding box do sprite)
    var x_frente = (dir == 1) ? bbox_right + 1 : bbox_left - 1;
    var y_pes = bbox_bottom + 1;

    var tem_chao_frente = position_meeting(x_frente, y_pes, tilemap_chao);
    var bateu_parede = place_meeting(x + dir * hsp, y, tilemap_chao);

    if (!tem_chao_frente || bateu_parede) {
        dir *= -1;
    }
}

// Movimento horizontal
x += dir * hsp;

// Vira o sprite
image_xscale = dir;


#endregion