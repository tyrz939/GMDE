if global.seconds == 3{
    repeat global.difficulty+1{
        timeline_run(tl_stg2_rocks);
    }
}else if global.seconds == 15{
    timeline_run(tl_stg2_meteor1);
}else if global.seconds == 25{
    timeline_run(tl_stg2_bluethings);
}else if global.seconds == 44{
    timeline_run(tl_stg2_meteor2);
}else if global.seconds == 54{
    global.levelpos++;
    global.seconds = 0;
}