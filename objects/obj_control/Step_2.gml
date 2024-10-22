/// @description Insert description here
// You can write your code in this editor

//Colisão horizontal

var _col = instance_place(x + velh, y, global.col)

if(_col) //place_meeting(x + velh, y, global.col)
{
	while(!instance_place(x + sign(velh), y, global.col))
	{
		x += sign(velh);
	}
	velh = 0;
}


var _colv = instance_place(x , y + velv, global.col)
////Colisão vertical
if(_colv)
{
	while(!instance_place(x , y + sign(velv), global.col))
	{
		y += sign(velv);
	}
	velv = 0;
}

x += velh;

//Limita e impede o Player sair da room no eixo X
//Aqui entre o x + = velh ele fica para o player nao tremeer na hora
//que encostar no eixo x da room
//se nao ficar aqui ele da um efeito de tentando empurrar
//x = clamp(x, 0 + sprite_width / 2, room_width - sprite_width/2);

y += velv;


