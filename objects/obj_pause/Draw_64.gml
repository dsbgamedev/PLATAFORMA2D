/// @description Insert description here
// You can write your code in this editor

//Exibindo se o jogo esta ou não pausado
if (global.pause && !instance_exists(obj_transicao))
{
	
	//Escurecendo a tela
	draw_set_alpha(.6);
	draw_rectangle_color(0, 0, 1280, 720, c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	
	draw_set_color(c_black);
	draw_set_halign(1);
	draw_set_valign(1);
	draw_set_font(fnt_pause);
	draw_text(room_width / 2, room_height / 2, "O JOGO ESTA PAUSADO, NÃO OUSE SE MOVER!");
	draw_set_color(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
}