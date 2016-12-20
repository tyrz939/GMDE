//Spellcard Start Event

if spell_start==true
{
    hp=0;
    maxhp=5000;
    spell_timer=1800;
    spell_timer_start = spell_timer;
    timer=-60;
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
    wait0 += 9 - (global.difficulty * 2);
    spd0 = 5;
    re0 = 5;
    dir0 = irandom_sync(359);
    repeat(re0)
    {
        shot_create( obj_ball, BLUE,x+lengthdir_x(dist,dir0),y+lengthdir_y(dist,dir0),spd0,dir0);
        spd0 -= 2.5/re0;
    }
}
