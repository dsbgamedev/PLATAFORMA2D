/// @description Insert description here
// You can write your code in this editor



if(instance_exists(obj_plat))
{
	
	if(y + 5 > obj_player.y -2)
	{
		sprite_index = spr_plat_cima;
		image_alpha = 1
	}
	else
	{
		sprite_index = -1;
		image_alpha = 0.4;
	}
	
}
