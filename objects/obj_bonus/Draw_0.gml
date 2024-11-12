/// @description Insert description here
// You can write your code in this editor

//Uma maneira de fazer
//visible = false;

//Outra maneira de fazer sumir e aparecer objeto bonus
if(sumir)
{
	//Tenho que sumir	
	sprite_index = -1;
}
else
{
	//Tenho que aparecer
	sprite_index = spr_bonus;
	draw_self();
}