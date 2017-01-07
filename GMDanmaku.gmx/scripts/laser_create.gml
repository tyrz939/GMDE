///laser_create( Type, Color, X, Y, Speed, Direction, Length )

audio_stop_sound(sfx_enemy_shoot);
audio_play_sound(sfx_enemy_shoot, 1, false);

with instance_create( argument2, argument3, obj_shot_create ) {
    duration = round(other.argument6 / other.argument4);
}

with instance_create( argument2, argument3, argument0 ) {
    image_index = other.argument1;
    direction = other.argument5;
    a = argument6;
    
    switch other.argument1 {
        case GRAY: col = c_ltgray; sprite_index = spr_Claser0; break;
        case DKRED: col = c_red; sprite_index = spr_Claser1; break;
        case RED: col = c_red; sprite_index = spr_Claser2; break;
        case PURPLE: col = c_purple; sprite_index = spr_Claser3; break;
        case PINK: col = c_fuchsia; sprite_index = spr_Claser4; break;
        case DKBLUE: col = c_blue; sprite_index = spr_Claser5; break;
        case BLUE: col = c_blue; sprite_index = spr_Claser6; break;
        case DKAQUA: col = c_aqua; sprite_index = spr_Claser7; break;
        case AQUA: col = c_aqua; sprite_index = spr_Claser8; break;
        case DKGREEN: col = c_green; sprite_index = spr_Claser9; break;
        case GREEN: col = c_lime; sprite_index = spr_Claser10; break;
        case DKYELLOW: col = c_yellow; sprite_index = spr_Claser11; break;
        case YELLOW: col = c_yellow; sprite_index = spr_Claser12; break;
        case BROWN: col = c_orange; sprite_index = spr_Claser13; break;
        case ORANGE: col = c_orange; sprite_index = spr_Claser14; break;
        case LTGRAY: col = c_ltgray; sprite_index = spr_Claser15; break;
        default: col = c_black; break;
    }
    
    // Misc starting stuff
    spd = 0;
    rep = 1;
    start = true;
    grazing = false;
    
    gzcol = make_colour_rgb(255,255,255);
    
    xd = x;
    yd = y;
    
    timer = 0;
    
    //start = 0;
    a *= rep;
    l = a;
    var d = 0;
    var c = 360 / a;
    for(var i = a; i >= 0; i--){
    /* 0 = X, 1 = Y, 2 = Scale, 3 = Counter, 4 = Alive? 5 = Grazing */
        obj[0,i] = x;
        obj[1,i] = y;
        obj[2,i] = 0.35;
        obj[3,i] = 0 + d; // LENGTH * sin (DIRECTION * pi / 180);
        obj[4,i] = true;
        obj[5,i] = false;
        obj[6,i] = direction;
        d += c;
    }
    
    dir0 = 135;
    
    kill = false;
    sl = 0;
    
    
    // Perform step event
    event_perform(ev_step, ev_step_normal);
    spd = other.argument4;
}
