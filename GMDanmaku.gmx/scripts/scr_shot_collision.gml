/*
For circles!
Collision + Graze
It checks a global saved player location so if the player dies, the game won't crash.
*/

var d = sqrt(sqr(x-global.player_x)+sqr(y-global.player_y));
//var d = point_distance(x,y,global.player_x,global.player_y);

if d<radius+30{ // Checks for a graze
    if d<radius{ // Check for a collision with the player
        global.player_death=true;
        instance_destroy();
    }
    if grazed==false{
        global.grazeSlow = 20;
        global.graze+=1;
        global.score+=2;
        grazed=true; // So it can't graze twice
    }
    grazing = true;
}else{
    grazing = false;
}

// Bomb Collision

if global.bomb==true{
    if collision_circle(x,y,10, obj_bombP, false, true){
        instance_create(x,y,obj_star_block);
        instance_destroy();
        shot_die1(color);
    }
}