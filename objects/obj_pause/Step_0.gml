if(keyboard_check_pressed(vk_escape)){
    pausado = !pausado

    if(pausado){
        // guarda uma "foto" da tela pra usar de fundo
        tela_pausa = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0)

        instance_deactivate_all(true)   // true = não desativa quem chamou (o obj_pause)
    }else{
        instance_activate_all()
        sprite_delete(tela_pausa)
    }
}