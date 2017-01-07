//Spellcard Start Event

if spell_start==true {
    hp=0;
    maxhp=4000;
    spell_timer=18000;
    spell_timer_start = spell_timer;
    timer=-120;
    spell_start=false;
    spell_get = false;
    spellcard_on = false;
    scr_boss_move(200, 100, 3, true);
    
    wait0 = 30;
    amount0 = 8 + (global.difficulty * 8);
    add0 = 360 / (amount0 * 4);
    color0 = RED;
}
if timer<0 && timer>=-60 && hp<maxhp {hp+=maxhp/60;} // HP regen
if timer == 240 {timer = 0;}

if timer == 0 {
    wait0 = 30;
    add0 = -add0;
    dir0 = point_direction( x, y, global.player_x, global.player_y );
    spd0 = 2 + global.difficulty * 0.3;
    if color0 == RED {
        color0 = YELLOW;
    } else {
        color0 = RED
    }
}

// Spellcard Scripts

if timer == wait0 && timer < 180 {
    wait0 += 8;
    shot_pattern_circle( obj_outlineball, color0, x, y, amount0, dir0, spd0, 15, 16 );
    dir0 += add0;
}
if wait0 == timer && timer >= 180 && timer < 210 {
    wait0 += 2;
    shot_pattern_circle( obj_smalloval, color0-1, x, y, amount0, irandom_sync(359), spd0 + random_sync(1), 15, 16 );
}

if timer == 239 {
    var r = 4 * (global.difficulty+1)
    var dir1 = point_direction( x, y, global.player_x, global.player_y )
    for( var i = 0; i < r; i++ ) {
        laser_create( obj_curv_laser_prim, color0, x + lengthdir_x(30, dir1), y + lengthdir_y(30, dir1), 2, dir1, 128 );
        dir1 += 360/r;
    }
}
