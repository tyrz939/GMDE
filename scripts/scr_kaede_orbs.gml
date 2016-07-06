// xn, yn Normal
// xf, yf Focused

var dist = 48;

var n = instance_number(obj_char_orbs)+1;

var dir = 0;

xn = lengthdir_x(dist, dir + (180/n) * orb);
yn = lengthdir_y(dist, dir + (180/n) * orb);

xf = lengthdir_x(dist/2, dir + (180/n) * orb);
yf = lengthdir_y(dist/2, dir + (180/n) * orb);