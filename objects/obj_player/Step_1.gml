/// @description Insert description here
// You can write your code in this editor

//Checando se eu acabei de cair no chão
var _temp = place_meeting(x, y + 1, obj_plat);

//Exemplo como Begin Step roda primeiro
//Entao ele consegue checar se estava no ar antes
//como a variave _chao ficara true primeiro pq esta no ar


//Se isso acontecer quer dizer uqe eu estava no ar 
if(_temp && !chao)//Acabei de tocar no chão !!!
{
	xscale = 1.6;
	yscale = .5;
}

//Reiniciando o jogo

