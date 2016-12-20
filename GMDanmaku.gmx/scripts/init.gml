

if global.fullscreen==1 {window_set_fullscreen(1);}
if global.vsync==1 {display_reset(0, true);}
//Resolution set:
window_set_size(global.res_x, global.res_y);

config();
date_set_timezone(timezone_local);
global.demo_play = false;
global.term = false;
global.player = noone;

// Get shortcut parameters
p = parameter_count();
if p > 0 {
    for (i = 0; i < p; i += 1) {
       if parameter_string(i + 1) == string("-debug") {global.debug = true;}
    }
}

if global.debug == true {
    show_debug_overlay(true);
}

// Shader check
global.GFX = false;
if shader_is_compiled(shd_gaussian_vertical) && shader_is_compiled(shd_boss) && shader_is_compiled(shd_gaussian_horizontal)
    {global.GFX = true;}

// Input Create
instance_create(0,0,input);
instance_create(0,0,terminal);