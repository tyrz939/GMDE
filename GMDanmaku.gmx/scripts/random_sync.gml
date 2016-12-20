///random_sync(x);

random_set_seed(global.seed);
var r = random(argument0);
global.seed++;
return r;
