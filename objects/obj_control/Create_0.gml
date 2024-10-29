/// @description Insert description here
// You can write your code in this editor

grav       = .3;
acel_chao  = .1;
acel_ar    = .07;
acel       = acel_chao;
deslize    = 2;

//-----------------------velocidades
velh = 0;
velv = -8;
velv_inicial = -8;
velh_inicial = 0;

//----------------------Limite das velocidades
max_velh = 6;
max_velv = 8;
len      = 10;

//-----------------------Bonus para pulo
limite_pulo   = 6;
timer_pulo    = 0;

limite_buffer = 6;
timer_queda   = 0;
buffer_pulo   = false;

limite_parede = 6;
timer_parede  = 0;

//----------------------Variaveis de controle

criar_pedaco = true;
chao          = false;
parede_dir    = false;
parede_esq    = false;
pontes        = false;
xscale	      = 1;
yscale	      = 1;
dura	      = room_speed / 4;
dir		      = 0;
carga	      = 1;
ultima_parede = 0;
ver           = 1;
iniciado      = true;
lista         = noone;

//----------------------Controlando cor
sat = 255;