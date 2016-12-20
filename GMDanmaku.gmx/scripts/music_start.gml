///music_start(File Name);

scr_music_stop();
audio_play_sound(argument0, 10, true);

with instance_create(0, 0, obj_track_name) {
    if argument0 == bgm_menu {
        music = "A Himitsu - Icy Vindur";
    } else if argument0 == bgm_stage1 {
        music = "A Himitsu - Cease";
    } else if argument0 == bgm_stage2 {
        music = "Unknown";
    } else {
        music = "Unknown";
    }
}
