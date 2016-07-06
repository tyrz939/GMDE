//Spellcard Start Event

if spell_start==true
{
    hp=0;
    maxhp=5000;
    spell_timer=1800;
    spell_timer_start = spell_timer;
    timer=-350;
    spell_start=false;
    spell_get = false;
    spellcard_on = false;
    
    wait0 = 0;
    dist = 15;
    re1 = 2 + global.difficulty;
    
    d1 = 0;
    d2 = 0;
}
if timer<0 && timer>=-60 && hp<maxhp {hp+=maxhp/60;} // HP regen

// Spellcard Scripts

if timer == wait0
{
    wait0 += 15 - (global.difficulty*2);
    spd0 = 4;
    re0 = 3 + global.difficulty;
    dir0 = point_direction(x,y,global.player_x,global.player_y) - 90 + irandom(180);
    repeat(re0)
    {
        shot_create( obj_ball, RED,x+lengthdir_x(dist,dir0),y+lengthdir_y(dist,dir0),spd0,dir0);
        spd0 -= 2.5/re0;
    }
    repeat (global.difficulty+1)*2{
        dir1 = irandom(359);
        shot_create( obj_ani8, GRAY8,x+lengthdir_x(dist,dir1),y+lengthdir_y(dist,dir1),2,dir1);
    }
}
if timer >= 0{
    d1 += 2;
    if d2 < 75{
        d2 += 0.5
    }
    x1 = lengthdir_x(d2, d1);
    y1 = lengthdir_y(d2*0.5, d1);
    x1 += lengthdir_x(d2*0.5, -d1*2.1);
    y1 += lengthdir_y(d2*0.25, -d1*2.1);
    x1 += lengthdir_x(d2*0.5, d1*1.4);
    y1 += lengthdir_y(d2*0.25, d1*1.4);
    x = 200 + x1;
    y = 160 + y1;
}