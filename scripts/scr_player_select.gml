switch argument0{
    case 0: // Kaede
        global.char_name = "Kaede";
        global.max_power = 6;
        move2 = 5;
        bombSpdPen = 1;
        shot_script = scr_weapon_kaede;
        bomb_object = obj_bomb5;
        // Orb
        global.orb_spin = false;
        global.orb_sprite = spr_lasorb0;
        global.orb_position_script = scr_kaede_orbs;
        global.orb_spawn = obj_Plaser_0;
        // Sprite
        global.turn_left = spr_kaede_left;
        global.turn_right = spr_kaede_right;
        global.straight = spr_kaede;
        break;
}

instance_create(x, y, obj_player_sprite)