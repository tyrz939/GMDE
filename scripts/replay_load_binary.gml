//rpl_length = 0;

if file_exists(working_directory + string(global.rpl)){
    
    FRAME = 0;
    UP = 1;
    DOWN = 2;
    LEFT = 3;
    RIGHT = 4;
    FOCUS = 5;
    SHOOT = 6;
    BOMB = 7;
    
    file = file_bin_open(working_directory + string(global.rpl), 0);
    
    // Difficulty, Character
    global.difficulty = file_bin_read_byte(file);
    global.char = file_bin_read_byte(file);
    
    // Skip Date
    var date_string = file_bin_read_byte(file)+1;
    file_bin_seek(file, file_bin_position(file) + date_string);
    
    // Skip Time
    var time_string = file_bin_read_byte(file)+1;
    file_bin_seek(file, file_bin_position(file) + time_string);
    
    // Level & Position in level
    global.level = file_bin_read_byte(file);
    global.levelpos = file_bin_read_byte(file);
    
    // What points you can load from
    var states0 = file_bin_read_byte(file);
    if states0 >= 128 {save_points[0] = true; states0 -= 128;} else {save_points[0] = false;}
    if states0 >= 64 {save_points[1] = true; states0 -= 64;} else {save_points[1] = false;}
    if states0 >= 32 {save_points[2] = true; states0 -= 32;} else {save_points[2] = false;}
    if states0 >= 16 {save_points[3] = true; states0 -= 16;} else {save_points[3] = false;}
    if states0 >= 8 {save_points[4] = true; states0 -= 8;} else {save_points[4] = false;}
    if states0 >= 4 {save_points[5] = true; states0 -= 4;} else {save_points[5] = false;}
    if states0 >= 2 {save_points[6] = true; states0 -= 2;} else {save_points[6] = false;}
    if states0 >= 1 {save_points[7] = true; states0 -= 2;} else {save_points[7] = false;}
    var states1 = file_bin_read_byte(file);
    if states1 >= 32 {save_points[8] = true; states1 -= 32;} else {save_points[8] = false;}
    if states1 >= 16 {save_points[9] = true; states1 -= 16;} else {save_points[9] = false;}
    if states1 >= 8 {save_points[10] = true; states1 -= 8;} else {save_points[10] = false;}
    if states1 >= 4 {save_points[11] = true; states1 -= 4;} else {save_points[11] = false;}
    if states1 >= 2 {save_points[12] = true; states1 -= 2;} else {save_points[12] = false;}
    if states1 >= 1 {save_points[13] = true; states1 -= 2;} else {save_points[13] = false;}
    
    // How long in frames
    global.rpllength = file_bin_read_byte(file) *65536;
    global.rpllength += file_bin_read_byte(file) *256;
    global.rpllength += file_bin_read_byte(file);
    
    // Start lives, bombs and power
    global.life = file_bin_read_byte(file);
    global.bombs = file_bin_read_byte(file);
    global.pow = file_bin_read_byte(file);
    
    global.score = file_bin_read_byte(file) * 16777216;
    global.score += file_bin_read_byte(file) * 65536;
    global.score += file_bin_read_byte(file) * 256;
    global.score += file_bin_read_byte(file);

    // Player Start X/Y
    var x0 = file_bin_read_byte(file) * 256;
    var x1 = file_bin_read_byte(file);
    global.player_x = x0 + x1;
    var y0 = file_bin_read_byte(file) * 256;
    var y1 = file_bin_read_byte(file);
    global.player_y = y0 + y1;
    
    // Read Saved States
    for(var i = 0; i <= 13; i++){
        if save_points[i] == true{
            // Player X, Y
            state[0, i] = file_bin_read_byte(file) * 256;
            state[0, i] += file_bin_read_byte(file);
            state[1, i] = file_bin_read_byte(file) * 256;
            state[1, i] += file_bin_read_byte(file);
            // Lifes
            state[2, i] = file_bin_read_byte(file);
            // Bombs
            state[3, i] = file_bin_read_byte(file);
            // Power
            state[4, i] = file_bin_read_byte(file);
            state[4, i] += file_bin_read_byte(file) / 100;
            // Frame
            state[5, i] = file_bin_read_byte(file) * 65536;
            state[5, i] += file_bin_read_byte(file) * 256;
            state[5, i] += file_bin_read_byte(file);
            // Seconds
            state[6, i] = file_bin_read_byte(file);
            state[6, i] += file_bin_read_byte(file) / 100;
            // Level
            state[7, i] = file_bin_read_byte(file);
            // Level Position
            state[8, i] = file_bin_read_byte(file);
            // Score
            state[9, i] = file_bin_read_byte(file) * 16777216;
            state[9, i] += file_bin_read_byte(file) * 65536;
            state[9, i] += file_bin_read_byte(file) * 256;
            state[9, i] += file_bin_read_byte(file);
            // Rank
            state[10, i] = file_bin_read_byte(file);
            // Shot GCD
            state[11, i] = file_bin_read_byte(file);
            // Graze count
            state[12, i] = file_bin_read_byte(file) * 256;
            state[12, i] += file_bin_read_byte(file);
            // Point items collected
            state[13, i] = file_bin_read_byte(file) * 256;
            state[13, i] += file_bin_read_byte(file);
        }
    }
    
    // Frame & Input read loop
    var inp, f0, f1, f2;
    var i = 0;
    replay_length = -1;
    while file_bin_position(file) < file_bin_size(file){
        // Frame Count
        f0 = file_bin_read_byte(file) * 65536;
        f1 = file_bin_read_byte(file) * 256;
        replay[FRAME, i] = file_bin_read_byte(file) + f1 + f0;
        
        // Input
        inp = file_bin_read_byte(file);
        if inp >= 64 {replay[UP, i] = true; inp -= 64;} else {replay[UP, i] = false;}
        if inp >= 32 {replay[DOWN, i] = true; inp -= 32;} else {replay[DOWN, i] = false;}
        if inp >= 16 {replay[LEFT, i] = true; inp -= 16;} else {replay[LEFT, i] = false;}
        if inp >= 8 {replay[RIGHT, i] = true; inp -= 8;} else {replay[RIGHT, i] = false;}
        if inp >= 4 {replay[FOCUS, i] = true; inp -= 4;} else {replay[FOCUS, i] = false;}
        if inp >= 2 {replay[SHOOT, i] = true; inp -= 2;} else {replay[SHOOT, i] = false;}
        if inp >= 1 {replay[BOMB, i] = true; inp -= 2;} else {replay[BOMB, i] = false;}
        
        i++;
        replay_length++;
    }
    
    // Close File
    file_bin_close(file);
    load_state = true;
}
pos = 0;