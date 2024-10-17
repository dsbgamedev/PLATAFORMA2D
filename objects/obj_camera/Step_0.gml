/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player))
{
	x =lerp(obj_player.x, x, .1);
	y =lerp(obj_player.y, y, .1);
}