//Collision+Damage from normal fire
height = round((sprite_get_height(sprite_index) * image_yscale)/2);
height += 4;
width = round((sprite_get_width(sprite_index) * image_xscale)*0.6);

var X = round(x);
var Y = round(y);

repeat(8) {
    if collision_rectangle(X-width, Y-height, X+width,Y+height, obj_Pshot_parent, false, true) {
        col1=collision_rectangle(X-width, Y-height, X+width,Y+height, obj_Pshot_parent, false, true);
        with col1 {
            other.dmg=dmg;
            instance_destroy();
        }
        global.score += dmg * 0.1;
        hp-=dmg;
    }
}

while laser_hit > 1 {
    global.score += global.laserdmg * 0.1;
    hp -= global.laserdmg;
    laser_hit -= 1;
}

//Collision with player
if collision_rectangle(round(X-(width*0.7)), round(Y-(height*0.7)), round(X+(width*0.7)), round(Y+(height*0.7)), global.player, false, true) {
    global.player_death=true;
}

//Bomb
if global.bomb==true {
    if collision_circle(X, Y, 10, obj_bombP, false, true) {
        with collision_circle(X, Y, 10, obj_bombP, false, true) {
            other.dmg=dmg;
        }
        global.score+=dmg * 0.1;
        hp-=dmg;
    }
}
