// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//#macro GRAVIDADES .2

//global.controles = [];
//global.gamepad   = 0;


//Criando um enum para facilitar a leitura do codigo
enum status_bloqueio
{
	bloqueado,//0
	desbloqueado//1
}

//Saber quais mundos estao bloqueados
global.mundos = [status_bloqueio.desbloqueado, status_bloqueio.bloqueado, status_bloqueio.bloqueado,
status_bloqueio.bloqueado, status_bloqueio.bloqueado];

global.mundo1 = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0];

//Defininfo a sprite para cada mundo
global.sprite_mundos = [spr_planeta, spr_planeta2, spr_planeta3, spr_planeta4, spr_planeta5];