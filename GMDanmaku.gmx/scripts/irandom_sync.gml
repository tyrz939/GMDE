///irandom_sync(x);

random_set_seed(global.seed);
var r = irandom(argument0);
global.seed++;
return r;
