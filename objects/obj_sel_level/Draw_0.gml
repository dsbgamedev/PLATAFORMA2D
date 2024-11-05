/// @description Insert description here
// You can write your code in this editor

//Me desenhando
draw_self();


//Desenhando o level que eu sou
draw_set_color(c_black);
draw_set_halign(1);
draw_set_valign(1);
draw_set_font(fnt_level);
draw_text_transformed(x, y, level, image_xscale, image_yscale, 0);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color(-1);

