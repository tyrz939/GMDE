///scr_boss_move_random( Distance, Max Height, Average Speed, Instant speedup? )

var dist = argument0;
var height = argument1;
var Xs = -1000;
var Ys = -1000;

while !(Xs > 30) || !(Xs < global.xview - 30) || !(Ys > 30) || !(Ys < height) {
    var dir = irandom_sync( 359 );
    var Xs = x + lengthdir_x( dist, dir );
    var Ys = y + lengthdir_y( dist, dir );
}
scr_boss_move( Xs, Ys, argument2, argument3);
