/// @description Insert description here
// You can write your code in this editor

//Se eu apertar o backspace o jogo pausa
if (keyboard_check_released(vk_backspace)){
	
	//audio_play_sound(som_icones_menu,0,0);
	efeito_som(som_icones_menu, .1);
	global.pause = !global.pause;
} 



