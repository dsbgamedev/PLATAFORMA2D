/// @description Insert description here
// You can write your code in this editor


qtd = instance_number(obj_item);

//fazer = false;

//Checando meu mundo atual
var _room = room_get_name(room);

//Separando o mundo atual do level atual
var _tudo = string_split(_room, "_level_");

var _mundo = _tudo[0];
var _level = _tudo[1];

show_message(_mundo);
show_message(_level);

//Meu destino é o mesmo mundo, só que o proximo level
var _destino = _mundo + "_level_" + string(real(_level)+1);
destino      = asset_get_index(_destino); 

//Se ele nao tem destino, então o valor do destino é -1
//Nesse caso eu volto para seleção de leveis e desbloqueio um novo mundo
if(destino == -1)
{
	destino = asset_get_index(_mundo);	
	global.mundos[mundo+1] = status_bloqueio.desbloqueado;	
}

var _mundo2 = string_split(_mundo, "rm_");
//Desbloqueando o meu level desse mundo
var _global = variable_global_get(_mundo2[1]);
//Falando que este mundo esta desbloqueado
_global[real(_level)-1] = true;

//Definindo a variável global com base na minha variável local
variable_global_set(_mundo2[1], _global);