if(!instance_exists(boss)){
    instance_destroy()
    exit
}

x = boss.x
y = boss.y
image_angle = boss.angulo_raios + offset