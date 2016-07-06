///screen_shake(frames, intensity);
with obj_draw_end{
    duration = other.argument0;
    intensity = other.argument1;
    shake_rnd = other.argument1;
    shake_timer = 0;
    shake = true;
}