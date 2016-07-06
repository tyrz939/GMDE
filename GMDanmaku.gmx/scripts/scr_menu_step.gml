alpha = 0.8 + lengthdir_x(0.2, alpha_dir);
alpha_dir += 3;

move = 0;
move -= max(input.up,0);
move += max(input.down,0);

if move !=0{
    alpha_dir = 0;
    alpha=1
    audio_stop_sound(sfx_menu_move);
    audio_play_sound(sfx_menu_move,1,false);
    mpos += move;
    if (mpos <0){
        mpos = array_length_1d(menu) -1;
    }
    if (mpos > array_length_1d(menu) -1){
        mpos =0;
    }
}