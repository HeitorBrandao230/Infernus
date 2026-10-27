if(morto == false){
global.vidaboss--
dano = true
sprite_index = spr_boss_dano
alarm_set(0, 60)
instance_destroy(other)
}