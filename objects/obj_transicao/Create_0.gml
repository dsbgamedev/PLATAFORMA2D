/// @description Insert description here
// You can write your code in this editor

//global.pause = true;
var _width = view_wport[0];

var _height = view_hport[0];
tamanho = sprite_get_width(spr_quad);

cols	= ceil(_width / tamanho);

lins	= ceil(_height / tamanho);
//Variáveis para a animação da sprite
//Imagem inicial
img		= 0;

//Velocidade da animação
img_vel	= sprite_get_speed(spr_quad) / game_get_speed(gamespeed_fps);

//Total da animação
img_num	= sprite_get_number(spr_quad) - 1;

//Controlando para saber se eu estou entrando ou saindo da animação
entrando = true;