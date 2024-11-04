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


/*
//shader_set();

//shader_set_uniform_f(valor, valor2);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_yellow, image_alpha);

shader_reset();

//Desenhando o level que eu sou
draw_set_color(c_black);
draw_set_halign(1);
draw_set_valign(1);
//draw_set_font(fnt_level);
draw_text_transformed(x + 37.5 , y + 50 , level, image_xscale , image_yscale , 0);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color(-1);