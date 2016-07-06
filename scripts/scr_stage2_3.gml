if global.seconds == 1{
    repeat global.difficulty+1{
        timeline_run(tl_stg2_rocks);
    }
}else if global.seconds == 11{
    repeat global.difficulty+1{
        timeline_run(tl_stg2_rocks);
    }
}else if global.seconds == 23{
    timeline_run(tl_stg2_meteor3);
}else if global.seconds == 30{
    repeat global.difficulty+1{
        timeline_run(tl_stg2_rocks);
    }
    instance_create(200, 0, obj_life_block);
}else if global.seconds == 44{
    timeline_run(tl_stg2_invis1);
}