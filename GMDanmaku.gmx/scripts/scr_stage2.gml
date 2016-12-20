// The Level

switch global.levelpos
{
    case 1: // Start
        scr_stage2_1(); break;
    case 2:
        if global.seconds == 6{
            global.replay_save_state = true;
        }
        if global.seconds == 10{
            instance_create(200, 0, obj_stg2_midboss);
        }
        break;
    case 3:
        scr_stage2_3(); break;
}
