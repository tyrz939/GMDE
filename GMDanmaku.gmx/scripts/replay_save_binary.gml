/* Writes to a replay file when the player selects to do so.*/
if global.pause==1 && replay_save==true{
    if file_exists(working_directory + string(rpl)){
        file_delete(working_directory + string(rpl));
    }
    file = file_bin_open(working_directory + string(rpl), 1);
    
    // Difficulty, Character
    file_bin_write_byte(file, global.difficulty);
    file_bin_write_byte(file, global.char);
    
    // Write Date
    var date_string = string(string(current_day) + "/" + string (current_month) + "/" + string(current_year));
    file_bin_write_byte(file, string_byte_length(date_string));
    for(var i = 0; i <= string_byte_length(date_string); i++){
        file_bin_write_byte(file, string_byte_at(date_string, i));
    }
    
    // Write Time
    var time_string = string(string(current_hour) + ":" + string(current_minute));
    file_bin_write_byte(file, string_byte_length(time_string));
    for(var i = 0; i <= string_byte_length(time_string); i++){
        file_bin_write_byte(file, string_byte_at(time_string, i));
    }
    
    file_bin_write_byte(file, level); // Starting Level
    file_bin_write_byte(file, levelpos); // Level start position (mainly for demo play)
    
    // What points you can load from
    var states0 = 0;
    states0 += save_points[0] *128;
    states0 += save_points[1] *64;
    states0 += save_points[2] *32;
    states0 += save_points[3] *16;
    states0 += save_points[4] *8;
    states0 += save_points[5] *4;
    states0 += save_points[6] *2;
    states0 += save_points[7];
    file_bin_write_byte(file, states0);
    var states1 = 0;
    states1 += save_points[8] *32;
    states1 += save_points[9] *16;
    states1 += save_points[10] *8;
    states1 += save_points[11] *4;
    states1 += save_points[12] *2;
    states1 += save_points[13];
    file_bin_write_byte(file, states1);
    
    // How long in frames
    var fc = global.frame;
    var ef0 = floor(fc/65536);
    fc -= ef0 * 65536;
    var ef1 = floor(fc/256);
    fc -= ef1 * 256;
    var ef2 = fc;
    file_bin_write_byte(file, ef0);
    file_bin_write_byte(file, ef1);
    file_bin_write_byte(file, ef2);
    
    // Start lives, bombs and power
    file_bin_write_byte(file, life);
    file_bin_write_byte(file, bombs);
    file_bin_write_byte(file, pow);
    
    // Starting Score
    var s0 = floor(s_score/16777216);
    s_score -= s0 * 16777216;
    var s1 = floor(s_score/65536);
    s_score -= s1 * 65536;
    var s2 = floor(s_score/256);
    s_score -= s2 * 256;
    var s3 = s_score;
    file_bin_write_byte(file, s0);
    file_bin_write_byte(file, s1);
    file_bin_write_byte(file, s2);
    file_bin_write_byte(file, s3);

    // Player Start X/Y
    var x0 = floor(start_x / 256);
    var x1 = start_x - (x0 * 256);
    file_bin_write_byte(file, x0);
    file_bin_write_byte(file, x1);
    var y0 = floor(start_y / 256);
    var y1 = start_y - (y0 * 256);
    file_bin_write_byte(file, y0);
    file_bin_write_byte(file, y1);
    
    // Save States loop
    var p0, p1, s0, s1;
    var f0, f1, f2, inp;
    for(var i = 0; i < states_saved; i++){
        // Player X, Y
        var x0 = floor(state[0, i] / 256);
        var x1 = state[0, i] - (x0 * 256);
        file_bin_write_byte(file, x0);
        file_bin_write_byte(file, x1);
        var y0 = floor(state[1, i] / 256);
        var y1 = state[1, i] - (y0 * 256);
        file_bin_write_byte(file, y0);
        file_bin_write_byte(file, y1);
        // Lifes
        file_bin_write_byte(file, state[2, i]);
        // Bombs
        file_bin_write_byte(file, state[3, i]);
        // Power
        p0 = floor(state[4,i]);
        p1 = frac(state[4,i]) * 100;
        file_bin_write_byte(file, p0);
        file_bin_write_byte(file, p1);
        // Frame
        f0 = floor(state[5,i]/65536);
        state[5,i] -= f0 * 65536;
        f1 = floor(state[5,i]/256);
        state[5,i] -= f1 * 256;
        f2 = state[5,i];
        file_bin_write_byte(file, f0);
        file_bin_write_byte(file, f1);
        file_bin_write_byte(file, f2);
        // Seconds
        s0 = floor(state[6,i]);
        s1 = frac(state[6,i]) * 100;
        file_bin_write_byte(file, s0);
        file_bin_write_byte(file, s1);
        // Level
        file_bin_write_byte(file, state[7,i]);
        // Level Position
        file_bin_write_byte(file, state[8,i]);
        // Score
        var s0 = floor(state[9,i]/16777216);
        state[9,i] -= s0 * 16777216;
        var s1 = floor(state[9,i]/65536);
        state[9,i] -= s1 * 65536;
        var s2 = floor(state[9,i]/256);
        state[9,i] -= s2 * 256;
        var s3 = state[9,i];
        file_bin_write_byte(file, s0);
        file_bin_write_byte(file, s1);
        file_bin_write_byte(file, s2);
        file_bin_write_byte(file, s3);
        // Shot GCD
        file_bin_write_byte(file, state[10, i]);
        // Graze count
        var g0 = floor(state[11, i] / 256);
        var g1 = state[11, i] - (g0 * 256);
        file_bin_write_byte(file, g0);
        file_bin_write_byte(file, g1);
        // Point items collected
        var p0 = floor(state[12, i] / 256);
        var p1 = state[12, i] - (p0 * 256);
        file_bin_write_byte(file, p0);
        file_bin_write_byte(file, p1);
    }
    
    // De-sync Detection Code
    
    // Frame & Input save loop
    for(var i = 0; i < pos; i++){
        // Frame Count
        f0 = floor(replay[timer,i]/65536);
        replay[timer,i] -= f0 * 65536;
        f1 = floor(replay[timer,i]/256);
        replay[timer,i] -= f1 * 256;
        f2 = replay[timer,i];
        file_bin_write_byte(file, f0);
        file_bin_write_byte(file, f1);
        file_bin_write_byte(file, f2);
        
        // Input
        inp = 0;
        inp += replay[up, i] <<6;
        inp += replay[down, i] <<5;
        inp += replay[left, i] <<4;
        inp += replay[right, i] <<3;
        inp += replay[focus, i] <<2;
        inp += replay[shoot, i] <<1;
        inp += replay[bomb, i];
        file_bin_write_byte(file, inp);
    }
    
    file_bin_close(file);
    scr_save();
    room_goto(room_menu);
    global.pause=0;
    global.reset=0;
}
