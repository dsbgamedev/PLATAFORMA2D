/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player))
{
	x =lerp(obj_player.x, x, .1);
	y =lerp(obj_player.y, y, .1);
}

//Configurando o listner
audio_listener_position(x,y,0);

if(instance_exists(obj_player))
{
	audio_listener_velocity(abs(obj_player.velh), abs(obj_player.velv), 0);	
}