if hp <=0
    {
    npc_die1(death_col);
    instance_destroy();
    audio_stop_sound(sfx_enemy_die);
    audio_play_sound(sfx_enemy_die,1,false);
    global.score+=10000
    global.rank+=0.5;
    if global.bomb == false
        {
        if global.pow<4 //Spawn power block if player isn't at max power.
            {
            repeat(12)
                { 
                instance_create(x+(random(100)-50),y+(random(100)-50),obj_power_block); 
                instance_create(x+(random(100)-50),y+(random(100)-50),obj_score_block);
                }
            }
        else
            {
            repeat(18)
                {  
                instance_create(x+(random(100)-50),y+(random(100)-50),obj_score_block);
                }
            }
        }
    }