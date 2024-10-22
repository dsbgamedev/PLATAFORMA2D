/// @description Insert description here
// You can write your code in this editor

//Gerando os pedaçoes part(particulas)
for(var i = 0; i < irandom_range(20, 50); i++)
{
	var ped = instance_create_layer(x, y, "particulas", obj_part);
	ped.sprite_index = sprite_index;
}

audio_emitter_free(eu);
instance_destroy();