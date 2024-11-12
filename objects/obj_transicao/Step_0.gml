/// @description Insert description here
// You can write your code in this editor


//Só roda se for a entrada
if (entrando)
{
	//Para todos os audios
	audio_stop_all();
	//Animando a sprite
	//Sprite, você é muito bonita e legal!
	img += img_vel;

	if (img > 8) global.pause = true;

	//Checando se ele terminou de preencher todas as colunas
	if (img - img_num > cols + 1)
	{
		//audio_stop_all();
		//Checando se existe a room destino
		if (room_exists(destino))
		{
			room_goto(destino);
			
			//show_debug_message(destino);
			//Aviso que não estou entrando mais
			entrando = false;
			
		}
	}
	
}
else
{
	//Estou saindo da animação
	img -= img_vel;
	
	if (img < 5)
	{
		global.pause = false;
	}
	
	//Terminou de sair, eu me destruo
	if (img < -5)
	{
		instance_destroy();
	}
}

//entrando = false;