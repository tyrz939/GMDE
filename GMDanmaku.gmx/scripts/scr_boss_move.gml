///scr_boss_move(Dest_X, Dest_Y, Average Speed, Instant speedup?)

//Create control object
with instance_create(x, y, obj_boss_move) {
    // Saving variables to object
    start_x = other.x;
    start_y = other.y;
    var dest_x = other.argument0
    var dest_y = other.argument1;
    var avg_speed = other.argument2;
    boss = other.id;
    instant = argument3;
    
    if instant {
        d = 0;
    } else {
        d = -90;
    }
    
    // Math stuff
    dist = sqrt(sqr(start_x-dest_x)+sqr(start_y-dest_y));
    dir = point_direction(start_x, start_y, dest_x, dest_y);
    mid_x = start_x + ((dist * cos (dir * pi / 180)) * 0.5)
    mid_y = start_y + ((dist * -sin (dir * pi / 180)) * 0.5)
    frames = dist / avg_speed;
}