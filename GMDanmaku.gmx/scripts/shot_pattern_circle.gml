///shot_pattern_circle(type, color, x, y, amount, start direction, speed, dist from center, Sub image count);

var d;

for( var i = 0; i < argument4; i++ ) {
    d = argument5 + (i / argument4) * 360;
    shot_create(argument0, argument1, argument2 + lengthdir_x(argument7, d), argument3 + lengthdir_y(argument7, d), argument6, d, argument8);
}
