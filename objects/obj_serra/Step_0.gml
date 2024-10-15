/// @description Insert description here
// You can write your code in this editor

//Rodando

image_angle += rot;

switch(estado)
{
	case "avanca":
		
		//Descobrindo a direção do limte
		var _limite_x = lengthdir_x(limite, real(dir));
		var _limite_y = lengthdir_y(limite, real(dir));
		
		//Movendo
		x += lengthdir_x(vel, real(dir));
		y += lengthdir_y(vel, real(dir));
		
		//Trocando de estado
		if(_limite_x > 0) //tem que ir para direita
		{
			if(x >= xstart + _limite_x) estado = "recua";	
		}
		else if(_limite_x < 0) //Tenho que ir para a esquerda
		{
			if(x <= + _limite_x) estado = "recua";	
		}
		
		if(_limite_x > 0) //tem que ir para direita
		{
			if(y >= ystart + _limite_y) estado = "recua";	
		}
		else if(_limite_y < 0) //Tenho que ir para a esquerda
		{
			if(y <= + _limite_y) estado = "recua";	
		}
		
	break;
	
	case "recua":	
		
		//Movendo
		x -= lengthdir_x(vel, real(dir));
		y -= lengthdir_y(vel, real(dir));
		
		//Mudando de estado
		if(x == xstart && y == ystart) estado = "avanca";
	
	break;
	
	case "parado":	
	
	break;
	
	default:	
		show_message("Voce digitou nome do estado errado!!!");
		
		break;
}

show_debug_message(estado);