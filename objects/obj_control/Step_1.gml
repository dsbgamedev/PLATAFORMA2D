/// @description Insert description here
// You can write your code in this editor

//Checando se eu acabei de cair no chão
var _temp = instance_place(x, y + 1, global.col);

//Exemplo como Begin Step roda primeiro
//Entao ele consegue checar se estava no ar antes
//como a variave _chao ficara true primeiro pq esta no ar


//Se isso acontecer quer dizer uqe eu estava no ar 
if(_temp && !chao)//Acabei de tocar no chão !!!
{
	xscale = 1.6;
	yscale = .5;
	
	//Criando a poeira
	for(var i = 0; i <random_range(4, 10); i++ )
	{
		var _xx = random_range(x - sprite_width, x + sprite_width);	
		
		instance_create_layer(_xx, y, "particulas", obj_vel);	
	}
}

//Reiniciando o jogo
