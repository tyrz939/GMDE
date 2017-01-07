///go_to_stage(x);

with global.level {
    instance_destroy();
}

global.seconds = 0;
global.levelpos = 1;
var stage = noone;

switch(argument0) {
    case 1:
        stage = obj_stage1;
        break;
    case 2:
        stage = obj_stage2;
        break;
    case 3:
        stage = obj_stage3;
        break;
    case 4:
        stage = obj_stage4;
        break;
    case 5:
        stage = obj_stage5;
        break;
    case 6:
        stage = obj_stage6;
        break;
    case 7:
        stage = obj_stage7;
        break;
    case 8:
        stage = obj_stage8;
        break;
}

instance_create(0, 0, stage);
