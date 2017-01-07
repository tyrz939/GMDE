if (file_exists("save.ini")) {file_delete("save.ini");}
ini_open("save.ini");
//options
ini_write_real("Options", "res_height", global.res_x);
ini_write_real("Options", "res_width", global.res_y);
ini_write_real("Options","BMG",global.bgm);
ini_write_real("Options","Fullscreen",global.fullscreen);
ini_write_real("Options","Vsync",global.vsync);
ini_write_real("Options","Scanlines",global.scanlines);
//Key Binds
ini_write_real("KeyBinds","Up",global.Up);
ini_write_real("KeyBinds","Down",global.Down);
ini_write_real("KeyBinds","Left",global.Left);
ini_write_real("KeyBinds","Right",global.Right);
ini_write_real("KeyBinds","Focus",global.Focus);
ini_write_real("KeyBinds","Shoot",global.Shoot);
ini_write_real("KeyBinds","Bomb",global.Bomb);
ini_close();

// Bin Save
if file_exists(working_directory + string("data.bin")) {
    file_delete(working_directory + string("data.bin"));
}
file = file_bin_open(working_directory + string("data.bin"), 1);
var byte = 0;
byte += global.cleared <<1;
byte += global.extra_unlock;
file_bin_write_byte(file, byte);
for( var i = 0; i < 5; i++) {
    // Score
    var tmp_score = global.hiscore[i];
    var s0 = floor(tmp_score/16777216);
    tmp_score -= s0 * 16777216;
    var s1 = floor(tmp_score/65536);
    tmp_score -= s1 * 65536;
    var s2 = floor(tmp_score/256);
    tmp_score -= s2 * 256;
    var s3 = tmp_score;
    file_bin_write_byte(file, s0);
    file_bin_write_byte(file, s1);
    file_bin_write_byte(file, s2);
    file_bin_write_byte(file, s3);
}