/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_plat))
{
	if(obj_player.y > y) //Estou mais alto que o player
	{
		sprite_index =- 1;
	}
	else
	{
		sprite_index = spr_plat_cima;
	}	
}
