audio_stop_sound(bgm_menu);
audio_stop_sound(bgm_stage1);
audio_stop_sound(bgm_stage2);

if instance_exists(obj_track_name) {
    with obj_track_name {
        instance_destroy();
    }
}
