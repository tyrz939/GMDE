draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_menu);

var m;
for (m =0; m < array_length_1d(menu); m+=1)
{
    //Menu Shadow
    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_text(x+2,y+2+(m*space),string(menu[m]));
    //Menu
    draw_set_alpha(1);
    draw_set_colour(c_gray);
    draw_text(x,y+(m*space),string(menu[m]));
    //Pulsing Selection
    draw_set_alpha(alpha);
    draw_set_colour(global.text_pulse_color);
    
    if m==mpos {draw_text(x,y+(m*space),string(menu[m]));}
    draw_set_alpha(1);    
}