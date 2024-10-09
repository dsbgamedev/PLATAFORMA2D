/// @description Insert description here
// You can write your code in this editor

//Checando se estou tocando no chão
chao = place_meeting(x, y + 1, obj_plat);

//Configurando meu timer do pulo
if(chao)
{
	timer_pulo = limite_pulo;
	carga = 1;
}
else
{
	if(timer_pulo > 0) timer_pulo--;	
}

//-------------------------Controles
var _left, _right,_up, _down, _jump, _jumps, _avanco_h, _dash;

_left  = keyboard_check(ord("A"));
_right = keyboard_check(ord("D"));
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));
_jump  = keyboard_check_pressed(vk_space);
_dash  = keyboard_check_pressed(ord("L"));
_jumps  = keyboard_check_released(vk_space);


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
		//Movendo 
		if(abs(velh > 0) || abs(velv == 0) || _left || _right || _jump)
		{
			estado = state.movendo;	
		}
		
		//Dash
		if(_dash && carga > 0)
		{
			//Decidindo a direção
			dir = point_direction(0, 0, (_right - _left), (_down - _up));
			
			estado = state.dash;	
			carga--;
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
		if(_jump) timer_queda = limite_buffer;//controla o tempo
		
		if(timer_queda > 0) buffer_pulo = true;//controla se posso ou nao pular
		else buffer_pulo = false;
		
		if(buffer_pulo)//Eu posso pular
		{
			if(chao || timer_pulo)//Ase demais condições para o pulo são verdadeiras
			{
				velv =- max_velv;
					
				//Alterando a escala
				xscale = .5;
				yscale = 1.5;
					
				//Garantir que não vai pular infinitamente
				timer_pulo  = 0;
				timer_queda = 0;
			}
			timer_queda--;
		}
		
		//Controlando a altura do pulo
		if(_jumps && velv < 0) velv *= .7;
		
		//Dash
		if(_dash && carga > 0)
		{
			//Decidindo a direção
			dir = point_direction(0, 0, (_right - _left), (_down - _up));
			
			estado = state.dash;	
			carga--;
		}
		
		//limitando as velocidades
		velv = clamp(velv, -max_velv, max_velv);
		
		break;
	
	case state.dash:
		
		dura--;
		
		velh = lengthdir_x(len, dir);
		velv = lengthdir_y(len, dir);
		
		//Deformando o player
		if(dir == 90 || dir == 270)
		{
			yscale = 1.5;	
			xscale = .5;	
		}
		else
		{
			yscale = .5;	
			xscale = 1.6;
		}
		
		//image_blend = c_red;
		
		//Criando rastro
		var _rastro = instance_create_layer(x, y, layer, obj_player_vest);
		_rastro.xscale = xscale;
		_rastro.yscale = yscale;
		
		//Saindo do estado
		if(dura <= 0)
		{
			estado      = state.movendo;
			dura        = room_speed/4;
			//image_blend = c_white;
			
			//Diminuindo a velocidade
			velh = (max_velh * sign(velh) * .5);
			velv = (max_velv * sign(velv) * .5);
		}
		
		break;
}

show_debug_message(estado);

switch(carga)
{
	case 0:
	sat = lerp(sat, 50, .5);
	break;
	
	case 1:
	sat = lerp(sat, 255, .5);
	break;
}

//Definindo a cor dele
image_blend = make_color_hsv(20, sat, 255);

//Voltando player para escala original
xscale = lerp(xscale, 1, .15);
yscale = lerp(yscale, 1, .15);



