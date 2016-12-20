// The Level

switch global.levelpos
{
    case 1:
        if global.seconds == 5{
            instance_create(0, 0, obj_stg1_control1);
        }
        if global.seconds == 20{
            timeline_run(tl_stg1_tracker0);
        }
        break;
    case 2:
        if global.seconds == 5 {
            global.levelpos = 3;
            global.seconds = 0;
        }
        break;
    case 3: // Start
        if global.seconds > 10{
            instance_destroy();
            goto_stage(2);
        }
        break;
}
