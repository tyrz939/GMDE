//Collision+Damage from normal fire

var X = round(x);
var Y = round(y);

repeat(8)
    {
    if collision_circle(X, Y, hitbox, obj_Pshot_parent, false, true)
        {
        col1=collision_circle(X, Y, hitbox, obj_Pshot_parent, false, true)
        with col1
            {
            other.dmg=dmg;
            instance_destroy();
            if global.pow < 4 && irandom_sync(50) == 0
                {instance_create(X, Y, obj_power_block);}
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
if collision_circle(X, Y, hitbox, obj_Pshot_parent, false, true)
    {global.player_death=true;}

//Bomb
if global.bomb==true && timer>=0
    {
    if collision_circle(X, Y, hitbox, obj_bombP, false, true)
        {
        with collision_circle(X, Y, hitbox, obj_bombP, false, true)
            {
            other.dmg=dmg;
            }
        global.score+=dmg * 0.1;
        hp-=dmg;
        }
    }
