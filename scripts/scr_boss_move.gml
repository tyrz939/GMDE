///scr_boss_move(Dest_X, Dest_Y, Max Speed, Speed up/Slow down frame count)
// 0 in Dest_X AND Dest_Y means it will pick random

if argument0==0 && argument1==0
    {
    move_dist=0;
    while move_dist<50
        {
        dest_x=irandom(300)+75;
        dest_y=irandom(75)+100;
        move_dist=distance_to_point(dest_x,dest_y);
        }
    }
else if argument0==-1 && argument1==-1
    {
    move_dist=0;
    while move_dist<50 || move_dist > 100
        {
        dest_x=irandom(300)+75;
        dest_y=irandom(75)+100;
        move_dist=distance_to_point(dest_x,dest_y);
        }
    }
else
    {
    dest_x=argument0;
    dest_y=argument1;
    move_dist=distance_to_point(dest_x,dest_y);
    }

//Variables
step_spd=argument2/argument3;

//Create control object
with instance_create(x,y,obj_boss_move)
    {
    function=0;
    dest_x=other.dest_x;
    dest_y=other.dest_y;
    max_spd=other.argument2;
    frames=other.argument3;
    boss=other.id;
    step_spd=other.step_spd;
    distance=other.move_dist
    }