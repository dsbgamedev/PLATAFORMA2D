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

//----------------------Variaveis de controle
chao   = false;
xscale = 1;
yscale = 1;

//State Machine
enum state //variavel global state usa uma vez e depois se perde
{
	parado, movendo, dash	
}

estado = state.parado;


