///shot_create( Type, Color, X, Y, Speed, Direction, Sub image count )

audio_stop_sound(sfx_enemy_shoot);
audio_play_sound(sfx_enemy_shoot, 1, false);

with instance_create( argument2, argument3, obj_shot_create ) {
    type = other.argument0
    index = other.argument1;
    spd = other.argument4;
    direction = other.argument5;
    sprite = noone;
    
    if other.argument6 == 8{
        switch other.argument1 {
            case GRAY8: color = c_ltgray; break;
            case RED8: color = c_red; break;
            case PINK8: color = c_fuchsia; break;
            case BLUE8: color = c_blue; break;
            case AQUA8: color = c_aqua; break;
            case GREEN8: color = c_lime; break;
            case YELLOW8: color = c_yellow; break;
            case ORANGE8: color = c_orange; break;
            default: color = c_black; break;
        }
        image_index = other.argument1 * 2;
    } else if other.argument6 == 16 {
        switch other.argument1 {
            case GRAY: color = c_ltgray; break;
            case DKRED: color = c_red; break;
            case RED: color = c_red; break;
            case PURPLE: color = c_purple; break;
            case PINK: color = c_fuchsia; break;
            case DKBLUE: color = c_blue; break;
            case BLUE: color = c_blue; break;
            case DKAQUA: color = c_aqua; break;
            case AQUA: color = c_aqua; break;
            case DKGREEN: color = c_green; break;
            case GREEN: color = c_lime; break;
            case DKYELLOW: color = c_yellow; break;
            case YELLOW: color = c_yellow; break;
            case BROWN: color = make_colour_rgb( 204, 102, 0 ); break;
            case ORANGE: color = c_orange; break;
            case LTGRAY: color = c_ltgray; break;
            default: color = c_black; break;
        }
        image_index = other.argument1;
    } else if other.argument6 == 4 {
        switch other.argument1 {
            case GRAY8: color = c_ltgray; sprite = spr_ani0; break;
            case RED8: color = c_red; sprite = spr_ani1; break;
            case PINK8: color = c_fuchsia; sprite = spr_ani2; break;
            case BLUE8: color = c_blue; sprite = spr_ani3; break;
            case AQUA8: color = c_aqua; sprite = spr_ani4; break;
            case GREEN8: color = c_lime; sprite = spr_ani5; break;
            case YELLOW8: color = c_yellow; sprite = spr_ani6; break;
            case ORANGE8: color = c_orange; sprite = spr_ani7; break;
            default: color = c_black; break;
        }
        image_index = other.argument1 * 2;
    }
    duration = 5;
}