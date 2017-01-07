///shot_pattern_arc(type, color, x, y, amount, arc degrees, target direction, speed, dist from center, Sub image count);

var type = argument0;
var color = argument1;
var xs = argument2;
var ys = argument3;
var amount = argument4 - 1;
var arc = argument5;
var dir = argument6 - arc * 0.5;
var spd = argument7;

for( var i = 0; i < amount; i++ ) {
    shot_create(type, color, xs + lengthdir_x(argument8, dir), ys + lengthdir_y(argument8, dir), spd, dir, argument9);
    dir += arc/amount;
}
shot_create(type, color, xs + lengthdir_x(argument8, dir), ys + lengthdir_y(argument8, dir), spd, dir, argument9);
