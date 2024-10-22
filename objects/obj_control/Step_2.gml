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

y += velv;
x += velh;
