// The Level
switch global.levelpos {
    case 1:
        instance_create(0, 0, obj_stg1_control1);
        break;
    case 2:
        instance_create(0, 0, obj_stg1_control2);
        break;
    case 3:
        instance_create(0, 0, obj_stg1_control3);
        break;
    case 4:
        instance_create(0, 0, obj_stg1_control4);
        break;
    case 5:
        instance_create(0, 0, obj_stg1_control5);
        break;
    case 6:
        instance_create(400, -20, obj_stg1_midboss);
        break;
    case 7: // Start
        if global.seconds > 2 {
            instance_destroy();
            go_to_stage(2);
        }
        break;
}
global.levelpos++;