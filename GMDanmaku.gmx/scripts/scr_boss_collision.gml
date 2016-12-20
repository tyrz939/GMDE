//Collision+Damage from normal fire

repeat(8)
    {
    if collision_circle(x,y,hitbox, obj_Pshot_parent, false, true)
        {
        col1=collision_circle(x,y,hitbox, obj_Pshot_parent, false, true)
        with col1
            {
            other.dmg=dmg;
            instance_destroy();
//            shot_impact1(global.pshot_impact);
            if global.pow < 4 && irandom(50) == 0
                {instance_create(x,y,obj_power_block);}
            }
        if timer>=0
            {
            global.score += dmg * 0.1;
            hp-=dmg;
            }
        }
    }

while laser_hit > 1{
    if timer>=0{
        global.score += global.laserdmg * 0.1;
        hp -= global.laserdmg;
        }
    laser_hit -= 1;
}

//Collision with player
if collision_circle(x,y,hitbox, obj_Pshot_parent, false, true)
    {global.player_death=true;}

//Bomb
if global.bomb==true && timer>=0
    {
    if collision_circle(x,y,hitbox, obj_bombP, false, true)
        {
        with collision_circle(x,y,hitbox, obj_bombP, false, true)
            {
            other.dmg=dmg;
            }
        global.score+=dmg * 0.1;
        hp-=dmg;
        }
    }
