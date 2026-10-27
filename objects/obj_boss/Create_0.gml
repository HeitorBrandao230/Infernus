global.vidaboss = 20
dano = false
global.vidabossMAX = 20
morto = false

raios_ativos = false
qtd_raios = 0
raios = []
angulo_raios = 0
vel_giro = 0.375   // graus por frame

criar_raios = function(qtd){
    // apaga os raios antigos
    for(var i = 0; i < array_length(raios); i++){
        if(instance_exists(raios[i])) instance_destroy(raios[i])
    }
    raios = []

    // cria os novos, igualmente espaçados (2 = 180°, 4 = 90°)
    for(var i = 0; i < qtd; i++){
        var r = instance_create_layer(x, y, "camada_projeteis", obj_raio_boss)
        r.boss = id
        r.offset = i * (360 / qtd)
        array_push(raios, r)
    }
}
