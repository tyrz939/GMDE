display_set_gui_size(1280,960);

var xvs = global.xvstart*2;

if e > 0.1{
    dir = 275 + (e * sin (d * pi / 180));
    e -= e / 240;
    d += 2;
}
draw_sprite_ext(spr_pause_thing, 0, 130 + xvs, 575, 1, 1, dir, make_colour_rgb(255,150,150), 1);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_pause_menu);

var m;
for(m = 0; m < array_length_1d(menu); m +=1 ){
    //Menu Shadow
    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_text(100+2 + xvs,500+2+(m*space),string(menu[m]));
    
    if gray[m] == true{
        draw_set_alpha(1); // Rest of Menu
        draw_set_colour(c_dkgray);
    }
    else if m == mpos{ // Pulsing Selection
        draw_set_alpha(alpha);
        draw_set_colour(global.text_pulse_color);
    }else{
        draw_set_alpha(1); // Rest of Menu
        draw_set_colour(c_gray);
    }
    draw_text(100 + xvs,500+(m*space),string(menu[m]));
}
    
// Title
//    draw_set_font(font2);
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_text(50+2 + xvs,400+2,string(title));
    draw_set_color(c_red);
    draw_text(50 + xvs,400,string(title));
