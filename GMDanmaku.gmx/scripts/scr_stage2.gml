// The Level

switch global.levelpos {
    case 1:
        instance_create(0, 0, obj_stg2_control1);
        break;
    case 2:
        instance_create(0, 0, obj_stg2_control2);
        break;
    case 3:
        instance_create(0, 0, obj_stg2_control3);
        break;
    case 4:
        instance_create(0, 0, obj_stg2_control4);
        break;
    case 5:
        global.replay_save_state = true;
        break;
    case 6:
        instance_create(200, 0, obj_stg2_midboss);
        break;
    case 7:
//        instance_create(0, 0, obj_stg2_control1);
        break;
    case 8:
//        instance_create(0, 0, obj_stg2_control1);
        break;
    case 9:
        instance_create(0, 0, obj_stg2_control5);
        break;
    case 10:
//        instance_create(0, 0, obj_stg2_control1);
        break;
    case 11:
        instance_create(0, 0, obj_stg2_control6);
        break;
}
global.levelpos++;
