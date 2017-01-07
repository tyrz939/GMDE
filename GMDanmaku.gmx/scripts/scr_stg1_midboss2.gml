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
    amount0 = 4 + (global.difficulty * 2);
}
if timer<0 && timer>=-60 && hp<maxhp {hp+=maxhp/60;} // HP regen
if timer == 90 {timer = 0;}

// Spellcard Scripts

if timer == 0 {
    wait0 = 0;
}

if timer == wait0 {
    wait0 += 7 - min(6, global.difficulty *2);
    repeat 2 {
        color0 = choose(YELLOW, LTGRAY);
        dir0 = irandom_sync(359);
        shot_create( obj_stg1_midboss_shot2, color0, x, y, 3.5 + random_sync(1), dir0, 16 );
    }
}
if global.difficulty > 0 {
    if timer == 0 {
        var dir1 = point_direction( x, y, global.player_x, global.player_y );
        shot_pattern_arc( obj_bigball8, RED8, x, y, 3+global.difficulty, 8+global.difficulty*2, dir1, 3, 20, 8 );
    }
}
if timer == 0 {
    scr_boss_move_random(30, 200, 1, true);
}
