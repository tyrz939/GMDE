/*
For non circles (ovals etc)!
Collision + Graze
It checks a global saved player location so if the player dies, the game won't crash.
*/

var d=distance_to_point(global.player_x,global.player_y);

if d<30 // Checks for a graze
    {
    if position_meeting(global.player_x,global.player_y,self) // Check for a collision with the player
        {
        global.player_death=true;
        instance_destroy();
        }
    if grazed==false
        {
        global.grazeSlow = 20;
        global.graze+=1;
        global.rank+=0.015;
        global.score+=500;
        grazed=true; // So it can't graze twice
        }
    grazing = true;
    }
else
    {grazing = false;}

// Bomb Collision

if global.bomb==true
    {
    if collision_circle(x,y,10, obj_bombP, false, true)
        {
        instance_create(x,y,obj_star_block);
        instance_destroy();
        shot_die1(color);
        }
    }