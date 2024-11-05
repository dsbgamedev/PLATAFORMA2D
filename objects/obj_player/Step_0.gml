/// @description Insert description here
// You can write your code in this editor

var _colisao = [layer_tilemap_get_id("Solidos")];
var _col = [layer_tilemap_get_id("ponte")];

//Volta para o menu Mundos
if(keyboard_check_released(vk_escape))
{
	room_goto(rm_mundos);	
}


//Pula sobre o tilemap ponte
if(velv >= 0)
{
	array_push(_colisao, layer_tilemap_get_id("ponte"));	
}

//Checando se estou tocando no chão
chao       = place_meeting(x, y + 1, _colisao  );
parede_dir = place_meeting(x + 1, y,  _colisao);
parede_esq = place_meeting(x - 1, y,  _colisao);
pontes     = place_meeting(x - 1, y,  _col);


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

if(parede_dir || parede_esq )
{
	if(parede_dir) ultima_parede = 0;
	else ultima_parede = 1;
	timer_parede = limite_parede;
}
else
{
	if(timer_parede > 0) timer_parede--;	
}

//-------------------------Controles
/*
var _left, _right,_up, _down, _jump, _jumps, _dash;

_left  = keyboard_check(ord("A"));
_right = keyboard_check(ord("D"));
_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));
_jump  = keyboard_check_pressed(vk_space);
_dash  = keyboard_check_pressed(ord("L"));
_jumps  = keyboard_check_released(vk_space);
//Configurando informações da movimentação
avanco_h = (_right - _left) * max_velh;
*/

controla();

//Valor da aceleração
if(chao) acel = acel_chao;
else     acel = acel_ar; 


#region Switch Estado
//------------------------- STATE MACHINE------------------------\\
switch(estado)
{
	#region Parado
	case state.parado:
		
		velh = 0;
		velv = 0;
		
		//Posso mudar minha velocidade
		if(_jump && chao && pontes)
		{
			velv =- max_velv;	
		}
		
		//Aplicando gravidade
		if(!chao || !pontes) velv += grav;
		
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
			if(_right || _up || _left || _down)
			  dir = point_direction(0, 0, (_right - _left), (_down - _up));
			else
				//Indo para a direção que estou olhando
				dir = point_direction(0,0,ver,0);
			
			estado = state.dash;	
			carga--;
		}
		
		break;
		#endregion

    #region Movendo	
	case state.movendo:
	

		//Abaixando
		if(chao && _down || pontes && _down)
		{
			xscale = 1.5;	
			yscale = .5;	
		}
		
		
		//Movendo
		velh = lerp(velh, avanco_h, acel);
		
		//Aplicando "poeira"
		if(abs(velh) > max_velh - .5 && chao)
		{
			//Criando a poeira
			var _chance = random(100);
			if(_chance > 90)
			{
				for(var i = 0; i <random_range(4, 10); i++ )
				{
					var _xx = random_range(x - sprite_width/2, x + sprite_width/2);	
		
					instance_create_layer(_xx, y, "particulas", obj_vel);	
				}
			}
		}
		
		//Gravidade && Parede
	
		if(!chao && (parede_dir || parede_esq || timer_parede))
		{
			//Não estou no chão, mas estou tocando na parede
			if(velv > 0) //Estou na parede e estou caindo
			{
				velv = lerp(velv, deslize, acel);
				
				//Criando a poeira
				//Criando a poeira
			    var _chance = random(100);
				if(_chance > 90)
				{
					for(var i = 0; i <random_range(4, 10); i++ )
					{
						var _onde = parede_dir - parede_esq;
						var _xx   = x + _onde * sprite_width/2;
						var _yy   = y + random_range(- sprite_height/4, 0);
		
						instance_create_layer(_xx, y, "particulas", obj_vel);	
					}
				}
			}
			else
			{
				//Estou subindo
				velv += grav;
				
			}
			
			//Pulando pelas paredes!!!
			if(!ultima_parede && _jump) //Estou na parede e tentei pular
			{
				velv =- max_velv;
				velh   =- max_velh;
				xscale = .5;
				yscale = 1.5;
				
								
				for(var i = 0; i <random_range(4, 10); i++ )
				{
					var _onde = parede_dir - parede_esq;
					var _xx   = x + sprite_width/2;
					var _yy   = y + random_range(- sprite_height/4, 0);
		
					instance_create_layer(_xx, y, "particulas", obj_vel);	
				}
				
			}
			else if(ultima_parede && _jump)
			{
				velv   =- max_velv;
				velh   = max_velh;
				xscale = .5;
				yscale = 1.5;
				
				//Criando poeira				
				for(var i = 0; i <random_range(4, 10); i++ )
				{
					var _onde = parede_dir - parede_esq;
					var _xx   = x - sprite_width/2;
					var _yy   = y + random_range(- sprite_height/4, 0);
		
					instance_create_layer(_xx, y, "particulas", obj_vel);	
				}
			}
		}
		else if(!chao || !pontes) //Não estou no chão e nem na parede
		{
		   velv += grav;
		}
		
		//Pulando
		if (_jump && (chao || pontes || timer_pulo))//ou ele ta no chao ou timer pulo ainda tem valor
		{
			

		//show_message("ativooo");
			velv =- max_velv;
			
			//Alterando a escala
			xscale = .5;
			yscale = 1.5;
			
			//Criando a poeira
			for(var i = 0; i <random_range(4, 10); i++ )
			{
				var _xx = random_range(x - sprite_width, x + sprite_width);	
		
				instance_create_layer(_xx, y, "particulas", obj_vel);	
			}
			
		}
				
		//Buffer do pulo
		if(_jump) timer_queda = limite_buffer;//controla o tempo
		
		if(timer_queda > 0) buffer_pulo = true;//controla se posso ou nao pular
		else buffer_pulo = false;
		
		if(buffer_pulo)//Eu posso pular
		{
			if(chao || pontes || timer_pulo)//Ase demais condições para o pulo são verdadeiras
			{
				velv =- max_velv;
					
				//Alterando a escala
				xscale = .5;
				yscale = 1.5;
					
				//Garantir que não vai pular infinitamente
				timer_pulo  = 0;
				timer_queda = 0;
				
				//Criando a poeira
				for(var i = 0; i <random_range(4, 10); i++ )
				{
					var _xx = random_range(x - sprite_width, x + sprite_width);	
		
					instance_create_layer(_xx, y, "particulas", obj_vel);	
				}
				
			}
			
			timer_queda--;
		}
		
		//Controlando a altura do pulo
		if(_jumps && velv < 0) velv *= .7;
		
		//Dash
		if(_dash && carga > 0)
		{
			
			//Decidindo a direção
			if(_right || _up || _left || _down)
			  dir = point_direction(0, 0, (_right - _left), (_down - _up));
			else
				//Indo para a direção que estou olhando
				dir = point_direction(0,0,ver,0);
			
			estado = state.dash;	
			carga--;
		}
		
		//limitando as velocidades
		velv = clamp(velv, -max_velv, max_velv);
		
		
		break;
		#endregion	

    #region Dash	
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
		var _rastro = instance_create_layer(x, y, "player_rastro", obj_player_vest);
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
		#endregion
		
	#region Morte
		case state.morte:
		
			///Explodindo o player
			if(criar_pedaco)
			{
				for(var i = 0; i < 10; i++)
				{
					show_debug_message(i);
					var p		   = instance_create_layer(x, y, layer, obj_pedaco);
					p.speed        = random_range(2,4);
					p.direction    = random(360);
					p.image_angle  = p.direction;
					p.image_xscale = random_range(.2,.6); 
					p.image_yscale = p.image_xscale; 
					p.dest_x       = xstart;
					p.dest_y       = ystart;
					p.velh_inicial = velh_inicial;
					p.velv_inicial = velv_inicial;
					p.image_blend  =  make_color_hsv(20, sat, 255);
					lista[i]    = p.id;
					if(i >= 9) 
					{
						criar_pedaco    = false;
						p.criador       = true;
						p.lista         = lista;
						obj_camera.alvo = p;
						instance_destroy();

					}
				}
					
			}
	
		
		break;
	#endregion
	
	#region
		case state.voltar:
			

	
		break;
	
	#endregion
}
#endregion

#region Carga

//Definindo a cor dele
image_blend = make_color_hsv(20, sat, 255);
switch(carga)
{
	case 0:
	sat = lerp(sat, 50, .5);
	break;
	
	case 1:
	sat = lerp(sat, 255, .5);
	break;
}
#endregion

//Definindo a cor dele
image_blend = make_color_hsv(20, sat, 255);

//Voltando player para escala original
xscale = lerp(xscale, 1, .15);
yscale = lerp(yscale, 1, .15);

//Limita e impede o Player sair da room no eixo X

x = clamp(x, 0 + sprite_width / 2, room_width - sprite_width/2);




