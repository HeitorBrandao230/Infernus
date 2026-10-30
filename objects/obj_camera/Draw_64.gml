if(global.vida >= 1){
	draw_sprite(spr_coracao, 0 , 40 , 30)
}
if(global.vida >= 2){
	draw_sprite(spr_coracao, 0 , 60 , 30)
}
if(global.vida >= 3){
	draw_sprite(spr_coracao, 0 , 80 , 30)
}
if(global.vida >= 4){
	draw_sprite(spr_coracao, 0 , 100 , 30)
}
if(global.vida >= 5){
	draw_sprite(spr_vidaextra, 0 , 120 , 30)
}
if(global.vida >= 6){
	draw_sprite(spr_vidaextra, 0 , 140 , 30)
}
if(global.vida >= 7){
	draw_sprite(spr_vidaextra, 0 , 160 , 30)
}

var escala = 3;   // era 2, sobe pra 3 (ou 2.5 se quiser algo intermediário)
var px = 40;      // aumentei um pouco porque o sprite cresceu
var py = 100;     // idem, pra não sobrepor os corações

draw_sprite_ext(spr_coletavel_alma, 0, px, py, escala, escala, 0, c_white, 1);

var larg = sprite_get_width(spr_coletavel_alma) * escala;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_transformed(px + larg / 2 + 10, py, string(global.conta_alma + global.conta_alma_aparente), escala, escala, 0);

draw_set_valign(fa_top);


#region boss
    if (instance_exists(obj_boss)) {
        var gx = display_get_gui_width() / 2;
        var gy = 60;
        var frame = clamp(20 - global.vidaboss, 0, 20);
        draw_sprite(spr_barra_de_vida_boss, frame, gx, gy);
    }
#endregion

