/// @description Insert description here
// You can write your code in this editor

efeitos();

efeito_screenshake(10);
efeito_som(snd_explosion, .1);

alarm[0] = room_speed * .9;

//Checando se eu estou bloqueado
status = global.mundos[mundo];

//Pegando a minha sprite
sprite_index = global.sprite_mundos[mundo];

//show_message(global.mundo1);

