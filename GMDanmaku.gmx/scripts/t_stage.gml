///t_stage(Stage);
var go = false;
if exec[1] == "test"{
    go = true;
    global.level = obj_testlvl; // Stage
}else if exec[1] == "1"{
    go = true;
    global.level = obj_stage1; // Stage
}else if exec[1] == "2"{
    go = true;
    global.level = obj_stage2; // Stage
}else if exec[1] == "3"{
    go = true;
    global.level = obj_stage3; // Stage
}else if exec[1] == "4"{
    go = true;
    global.level = obj_stage4; // Stage
}else if exec[1] == "5"{
    go = true;
    global.level = obj_stage5; // Stage
}else if exec[1] == "6"{
    go = true;
    global.level = obj_stage6; // Stage
}else if exec[1] == "extra"{
    go = true;
    global.level = obj_extra; // Stage
}
else if exec[1] == ""{
    println("stage: Please select a stage");
}
else{
    println("stage: '" + exec[1] + "' invalid stage");
}

if go{
    println("Going to Stage " + exec[1]);
    global.char = 0;
    global.demo_play = false;
    global.replay = false;
    global.difficulty = 3;
    global.start_game = true;
    scr_start(); // Loads variables
    global.term = false;
    room_goto (room_ingame);
}
