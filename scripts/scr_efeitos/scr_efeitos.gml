// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.pause  = false;

function efeitos()
{
	bloqueado = true;
	#region variaveis dos efeitos
	scale_original = image_xscale;
	scale = scale_original;
	valor = shader_get_uniform(sh_cor, "valor");
	valor2 = bloqueado;
	
	#endregion

	#region efeitos
	efeito_mouse = function()
	{
		var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);
	
		if (_mouse_sobre)
		{
			scale = scale_original * 1.5;
		}
		else
		{
			scale = scale_original;
		}	
	
		image_xscale = lerp(image_xscale, scale, .07);
		image_yscale = image_xscale;
	}

	efeito_cor = function()
	{
		if (valor2 > 0)
		{
			valor2 -= 0.01;
		}
		else
		{
			valor2 = 0;
		}
	}
	
	efeito_screenshake = function(_shake)
	{
		var _screenshake = instance_create_layer(0 , 0, layer, obj_screenshake);
		_screenshake.shake = _shake;
	}

	efeito_som = function(_som , _variacao = .1)
	{
		var _pitch = random_range(1 - _variacao, 1 + _variacao);	
		audio_play_sound(_som, 0, 0, , , _pitch);
	}
	
	#endregion
}