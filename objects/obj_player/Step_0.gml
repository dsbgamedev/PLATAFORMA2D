/// @description Insert description here
// You can write your code in this editor

//Checando se estou tocando no chão
chao = place_meeting(x, y + 1, obj_plat);

//Configurando meu timer do pulo
if(chao)
{
	timer_pulo = limite_pulo;
}
else
{
	if(timer_pulo > 0) timer_pulo--;	
}

//-------------------------Controles
var _left, _right, _jump, _avanco_h;

_left  = keyboard_check(ord("A"));
_right = keyboard_check(ord("D"));
_jump  = keyboard_check_pressed(vk_space);
//Configurando informações da movimentação
_avanco_h = (_right - _left) * max_velh;
//Valor da aceleração
if(chao) acel = acel_chao;
else     acel = acel_ar; 

//------------------------- STATE MACHINE------------------------\\
switch(estado)
{
	case state.parado:
		
		velh = 0;
		velv = 0;
		
		//Posso mudar minha velocidade
		if(_jump && chao)
		{
			velv =- max_velv;	
		}
		
		//Aplicando gravidade
		if(!chao) velv += grav;
		
		//Saindo do estado
		if(abs(velh > 0) || abs(velv == 0) || _left || _right || _jump)
		{
			estado = state.movendo;	
		}
		
		break;
	
	case state.movendo:
		
		//Movendo
		velh = lerp(velh, _avanco_h, acel);
		
		//Gravidade
		if(!chao) velv += grav;
		
		//Pulando
		if (_jump && (chao || timer_pulo))//ou ele ta no chao ou timer pulo ainda tem valor
		{
			velv =- max_velv;
			
			//Alterando a escala
			xscale = .5;
			yscale = 1.5;
		}
		
		
		//Buffer do pulo
		if(_jump)
		
		break;
	
	case state.dash:
		
		break;
}

show_debug_message(estado);

//Voltando player para escala original
xscale = lerp(xscale, 1, .15);
yscale = lerp(yscale, 1, .15);

//limitando as velocidades
velv = clamp(velv, -max_velv, max_velv);

