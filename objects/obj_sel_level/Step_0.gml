/// @description Insert description here
// You can write your code in this editor

if(status == status_bloqueio.desbloqueado)
{
	efeito_mouse();	
	image_blend = c_yellow;
	
}

if(keyboard_check(vk_escape))
{
	//audio_stop_sound(snd_voltar);
	efeito_som(snd_voltar, .1);
	room_goto(rm_mundos);	
}
