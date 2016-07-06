// The Level

switch global.levelpos
{
    case 1:
        if global.seconds == 5{
            timeline_run(tl_stg1_greenthings);
        }
        break;
    case 2:
        break;
    case 3: // Start
        if global.seconds > 10{
            instance_destroy();
            instance_create(0,0,obj_stage2);
            global.levelpos = 1;
        }
        break;
}