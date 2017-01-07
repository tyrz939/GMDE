//Load Stuff
ini_open("save.ini");
//Options
global.res_x = ini_read_real("Options", "res_height", 1280);
global.res_y = ini_read_real("Options", "res_width", 960);
global.bgm= ini_read_real("Options","BMG",1);
global.fullscreen= ini_read_real("Options","Fullscreen",0);
global.vsync= ini_read_real("Options","Vsync",1);
global.scanlines= ini_read_real("Options","Scanlines",0);
//Key Binds
global.Up= ini_read_real("KeyBinds","Up",vk_up);
global.Down= ini_read_real("KeyBinds","Down",vk_down);
global.Left= ini_read_real("KeyBinds","Left",vk_left);
global.Right= ini_read_real("KeyBinds","Right",vk_right);
global.Focus= ini_read_real("KeyBinds","Focus",vk_shift);
global.Shoot= ini_read_real("KeyBinds","Shoot",ord('Z'));
global.Bomb= ini_read_real("KeyBinds","Bomb",ord('X'));
ini_close();

// Bin Load
if file_exists(working_directory + string("data.bin")) {
    file = file_bin_open(working_directory + string("data.bin"), 0);
    // First byte
    var levels_cleared = 0;
    var byte = file_bin_read_byte(file);
    if byte >= 8 {levels_cleared += 4; byte -= 8;} else {levels_cleared += 0;}
    if byte >= 4 {levels_cleared += 2; byte -= 4;} else {levels_cleared += 0;}
    if byte >= 2 {levels_cleared += 1; byte -= 2;} else {levels_cleared += 0;}
    if byte >= 1 {global.extra_unlock = true;} else {global.extra_unlock = false;}
    
    global.cleared = levels_cleared;
    
    // Score read loop
    for( var i = 0; i < 5; i++) {
        global.hiscore[i] = file_bin_read_byte(file) * 16777216;
        global.hiscore[i] += file_bin_read_byte(file) * 65536;
        global.hiscore[i] += file_bin_read_byte(file) * 256;
        global.hiscore[i] += file_bin_read_byte(file);
    }
    file_bin_close(file);
} else {
    global.cleared = 0;
    global.extra_unlock = false;
    // Score zero loop
    for( var i = 0; i < 5; i++) {
        global.hiscore[i] = 0;
    }
}