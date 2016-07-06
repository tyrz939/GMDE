if (file_exists("save.ini")) {file_delete("save.ini");}
ini_open("save.ini");
//options
ini_write_real("Options","Resolution",global.resolution);
ini_write_real("Options","BMG",global.bgm);
ini_write_real("Options","Fullscreen",global.fullscreen);
ini_write_real("Options","Vsync",global.vsync);
ini_write_real("Options","Scanlines",global.scanlines);
//Score
ini_write_real("HighScores","EasyScore",global.highscore0);
ini_write_real("HighScores","NormalScore",global.highscore1);
ini_write_real("HighScores","HardScore",global.highscore2);
ini_write_real("HighScores","LunaticScore",global.highscore3);
ini_write_real("HighScores","ExtraScore",global.highscore4);
ini_write_real("ExtraStage","ExtraStage",global.extra_stage);
//Key Binds
ini_write_real("KeyBinds","Up",global.Up);
ini_write_real("KeyBinds","Down",global.Down);
ini_write_real("KeyBinds","Left",global.Left);
ini_write_real("KeyBinds","Right",global.Right);
ini_write_real("KeyBinds","Focus",global.Focus);
ini_write_real("KeyBinds","Shoot",global.Shoot);
ini_write_real("KeyBinds","Bomb",global.Bomb);
ini_close();
if global.quit=true {game_end();}