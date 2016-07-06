if hp <=0
{
    npc_die1(death_col);
    instance_destroy();
    audio_stop_sound(sfx_enemy_die);
    audio_play_sound(sfx_enemy_die,1,false);
    global.score+=100
    global.rank+=0.05;
    if global.bomb == false
    {
        var i = irandom(1)
        if i == 1
        {
            if global.pow<4
            {
                instance_create(x+(irandom(24)-12), y+(irandom(24)-12), obj_power_block);
                instance_create(x+(irandom(24)-12), y+(irandom(24)-12), obj_power_block);
            }
            else
            {
                instance_create(x+(irandom(24)-12), y+(irandom(24)-12), obj_score_block);
                instance_create(x+(irandom(24)-12), y+(irandom(24)-12), obj_score_block);
            }
        }
        if i == 0
            {
                instance_create(x+(irandom(24)-12), y+(irandom(24)-12), obj_score_block);
                instance_create(x+(irandom(24)-12), y+(irandom(24)-12), obj_score_block);
            }
    }
}