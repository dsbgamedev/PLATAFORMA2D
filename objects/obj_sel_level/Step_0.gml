/// @description Insert description here
// You can write your code in this editor

if(status == status_bloqueio.desbloqueado)
{
	efeito_mouse();	
	image_blend = c_yellow;
}

if(keyboard_check(vk_escape))
{
	room_goto(rm_mundos);	
}
