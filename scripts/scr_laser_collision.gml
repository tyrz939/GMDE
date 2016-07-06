//Collision Check
if collision_line(x,y,x+len_x,y+len_y,global.player,false,false)
    {global.player_death=true; instance_destroy();}
    
    
//Bomb Collision

if global.bomb==true
    {
    if collision_circle(x,y,10, obj_bombP, false, true)
        {
        instance_create(x,y,obj_star_block);
        instance_destroy();
        shot_die1(color);
        }
    }