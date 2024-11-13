/// @description Insert description here
// You can write your code in this editor

audio_stop_all();
fazer = true;

//Indo para meu destino
var _room    = room_get_name(room);
var _level   = "_level_" + string(level);
var _destino = _room + _level;
destino      = asset_get_index(_destino);

//Room ta segurando rm_mundo1
var _mundo = string_split(_room, "rm_");

//Vendo se a variavel global do meu mundo existe
var _global = variable_global_get(_mundo[1]);
status = _global[level-1];
//show_message(status);

efeitos();





