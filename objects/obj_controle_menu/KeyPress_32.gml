if(global.jogar == true){
	audio_play_sound(som_menu, 0, 0, 1.0, undefined, 1.0);
	room_goto_next()
}else{
	audio_play_sound(som_menu, 0, 0, 1.0, undefined, 1.0);
	game_end()
}
