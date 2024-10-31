/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


//State Machine
enum state //variavel global state usa uma vez e depois se perde
{
	parado, movendo, dash, morte, voltar	
}

estado = state.movendo;

lista = noone;

//----------------CRIANDO A CAMERA
#region Camera
if(!instance_exists(obj_camera))
{
	//Camera não existe
	instance_create_layer(x, y, "camera", obj_camera);
}

//Definindo a cor dele
image_blend = make_color_hsv(20, sat, 255);
#endregion


////---------------------FUNÇÕES-------------------------------/////
#region Gamepad Joystick

//Checa quantos Gamepad tem conectado
checa_gamepad = function()
{
	//rodar por todos os controles e ver se alum
	//esta conectado
	var _qtd     = gamepad_get_device_count();//Verifica se detectou controle
	var _gamepad = 0;
	for(var i = 0; i < _qtd; i++)
	{
		//Se o slot da entrada atual estiver conectada, eu aviso 
		//no meu Array de controles
		global.controles[i] = gamepad_is_connected(i);
		if(global.controles[i])
		{
			_gamepad++;	
		}
	}
	
	if(_gamepad)
	{
		//Definindo a deadzone do axis
		gamepad_set_axis_deadzone(0, .2);	
	}
	
	return _gamepad;
	
	show_message(global.controles);
}

	
global.gamepad = checa_gamepad();

//Controla e verifica qual escolher
controla = function()
{
	//testando se apertar ENTER fica true
	if(keyboard_check_pressed(vk_enter))
	{
		global.gamepad = !global.gamepad;
	}	
	
	//Se o gamepad esta conectado, eu uso o gamepad
	if(global.gamepad)
	{
		controla_gamepad();	
	}
	else //Se nao estiver conectado, eu uso gamepad
	{
		controla_keyboard();	
	}
}

//Controla teclado
controla_keyboard = function()
{
	//Se mover para as direções
	//-------------------------Controles

	//var _left, _right,_up, _down, _jump, _jumps, _dash;
	show_debug_message("Teclado")

	_left  = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_jump  = keyboard_check_pressed(vk_space);
	_dash  = keyboard_check_pressed(ord("L"));
	_jumps  = keyboard_check_released(vk_space);
	//Configurando informações da movimentação
	avanco_h = (_right - _left) * max_velh;
}

//Controla gamepad
controla_gamepad = function()
{
	show_debug_message("Gamepad");
	
	var _velhg = gamepad_axis_value(0, gp_axislh);
	var _velvg = gamepad_axis_value(0, gp_axislv);
	var _a     = gamepad_button_check_pressed(0, gp_face1);
	
	//if(_velhg > 0)
	//{
	//	_velhg = ceil(_velhg);
	//}
	//else
	//{
	//	_velhg = floor(_velhg);	
	//}
	////show_debug_message(_velhg);
	
	////operardor ternario
	//_velvg = _velvg > 0 ? ceil(_velvg) : floor(_velvg);
	
	
	
	//Configurando informações da movimentação
	velh = _velhg * max_velh;
	velv = _velvg * max_velv;
		
}

#endregion


