/// @description Insert description here
// You can write your code in this editor

grav       = .3;
acel_chao  = .1;
acel_ar    = .07;
acel       = acel_chao;

//-----------------------velocidades
velh = 0;
velv = 0;

//----------------------Limite das velocidades
max_velh = 6;
max_velv = 8;
len      = 10;

//-----------------------Bonus para pulo
limite_pulo   = 6;
timer_pulo    = limite_pulo;

limite_buffer = 6;
timer_queda   = 0;
buffer_pulo   = false;

//----------------------Variaveis de controle
chao   = false;
xscale = 1;
yscale = 1;
dura   = room_speed / 4;
dir    = 0;
carga  = 1;

//----------------------Controlando cor
sat = 255;

//State Machine
enum state //variavel global state usa uma vez e depois se perde
{
	parado, movendo, dash	
}

estado = state.parado;


