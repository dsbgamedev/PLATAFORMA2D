/// @description Insert description here
// You can write your code in this editor

//Ir para room inicial
if(fazer)
{
	if(status == status_bloqueio.desbloqueado)
	{
		//instance_create_layer(0,0,layer, obj_transicao, {destino: destino});
		room_goto(destino);	
	}
}

fazer = false;