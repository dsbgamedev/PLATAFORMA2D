/// @description Insert description here
// You can write your code in this editor


//Checando se posso ir para próxima room (se ela existe)
if(qtd <= 0)
{
	if(room_next(room) != -1)
	{
		room_goto_next();	
	}
	else
	{
		//Nao tem outra room para ir
		game_restart();
	}
}