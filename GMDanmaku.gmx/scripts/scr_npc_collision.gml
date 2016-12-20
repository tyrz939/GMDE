//Collision+Damage from normal fire
height = sprite_get_height(sprite_index * image_yscale)/2;
height += 4;
width = sprite_get_width(sprite_index * image_xscale)*0.6;

repeat(8)
    {
    if collision_rectangle(x-width, y-height, x+width,y+height, obj_Pshot_parent, false, true)
        {
        col1=collision_rectangle(x-width, y-height, x+width,y+height, obj_Pshot_parent, false, true);
        with col1
            {
            other.dmg=dmg;
            instance_destroy();
//            shot_impact1(global.pshot_impact);
            }
        global.score += dmg * 0.1;
        hp-=dmg;
        }
    }

while laser_hit > 1{
    global.score += global.laserdmg * 0.1;
    hp -= global.laserdmg;
    laser_hit -= 1;
}

//Collision with player
if collision_rectangle(x-(width*0.7), y-(height*0.7), x+(width*0.7),y+(height*0.7), global.player, false, true)
    {global.player_death=true;}

//Bomb
if global.bomb==true
    {
    if collision_circle(x,y,10, obj_bombP, false, true)
        {
        with collision_circle(x,y,10, obj_bombP, false, true)
            {
            other.dmg=dmg;
            }
        global.score+=dmg * 0.1;
        hp-=dmg;
        }
    }
