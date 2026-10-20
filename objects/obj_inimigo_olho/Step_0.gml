if (instance_exists(obj_player)) {

    #region movimento
    var dir  = point_direction(x, y, obj_player.x, obj_player.y);
    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    switch (estado) {
        case "parado":
            hspd = lerp(hspd, 0, accel);
            vspd = lerp(vspd, 0, accel);

            if (dist < alcance) estado = "perseguir";
        break;

        case "perseguir":
            // persegue pra sempre depois de acordar
            hspd = lerp(hspd, lengthdir_x(spd_max, dir), accel);
            vspd = lerp(vspd, lengthdir_y(spd_max, dir), accel);

            if (place_meeting(x, y, obj_player)) {
                // <-- aqui tu coloca o dano
                estado = "recuar";
                timer = recuo_tempo;
                var fuga = dir + 180;
                hspd = lengthdir_x(recuo_vel, fuga);
                vspd = lengthdir_y(recuo_vel, fuga) - 1;
            }
        break;

        case "recuar":
            hspd = lerp(hspd, 0, 0.05);
            vspd = lerp(vspd, 0, 0.05);
            timer--;
            if (timer <= 0) estado = "perseguir";
        break;
    }

    onda += onda_vel;
    x += hspd;
    y += vspd + dsin(onda) * onda_amp;
    #endregion

    #region olhar
    dir = point_direction(x, y, obj_player.x, obj_player.y);

    if (obj_player.x < x) {
        image_xscale = -1;
        image_angle = dir - 180;
    } else {
        image_xscale = 1;
        image_angle = dir;
    }
    #endregion
}

if(vida <= 0){
    instance_create_layer(x, y, "camada_coletaveis", obj_powerup_vida)
    instance_create_layer(x, y, "camada_explosao", obj_explosao1)
    instance_destroy()
}
	