/// @description Insert description here
// You can write your code in this editor
/*
if(fazer)
{
	instance_create_layer(0,0,layer, obj_transicao, {destino: destino});
}
*/
//Ir para room inicial
//room_goto(rm_mundos);
//Checando se posso ir para próxima room (se ela existe)
if(fazer & qtd <= 0)
{
		
		//if(qtd <= 0)
		//{
			room_goto(destino);
	
}
fazer = false;

//Desbloqueando o proximo level
//global.mundos[mundo+1] = status_bloqueio.desbloqueado;
	