/*-----------------------------------------------------------------------
    Starting values for the game, change any of these as you wish.
    
    More starting variables can be found in obj_game and obj_player
    however most shouldn't be changed.
-----------------------------------------------------------------------*/

/*
    Level object to load for debugging/developement
    obj_stage1
    obj_extra
    obj_testlvl
    
    
    Check level script for pos number
*/

//    global.level = obj_stage1;
//    global.level = obj_stage2;
//    global.level = obj_extra;
//    global.level = obj_testlvl;

    global.levelpos = 1; // Default 1
    global.spellstart = 1; // Starting Spell Card, Default 1

// Player related variables:

    global.char = 0; // Player char (only 1 in game atm)

    global.life = 2; // Starting lives (0-8) default 2
    global.bombs = 3; // Starting bombs (0-8) default 3
    global.pow = 1; // Starting power level! (1-4) default 1
    
    global.continues = 3; // Number of Continues (0-∞)
    global.can_save = true; // If you can save a replay or not
    
    global.player_x = global.xview / 2;
    global.player_y = global.yview - 50;

// Shot hitbox Radius's by number (Circles only)

    global.shot0 = 3;
    global.shot1 = 5;
    global.shot2 = 10;
    global.shot3 = 2;
    global.shot4 = 4;
    global.shot5 = 4;
    global.shot9 = 5;

// Color for Death animations

    global.gray = c_white;
    global.blue = c_blue;
    global.ltblue = make_colour_rgb(0,150,255);
    global.purple = c_purple;
    global.pink = c_fuchsia;
    global.red = c_red;
    global.orange = c_orange;
    global.yellow = c_yellow;
    global.green = c_lime;
    
    global.pshot_impact = make_colour_rgb(255,150,255);