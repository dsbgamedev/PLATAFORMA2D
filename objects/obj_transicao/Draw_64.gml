/// @description Insert description here
// You can write your code in this editor


//Desenhando meus quadradinhos

//Linhas
for (var i = 0; i < lins; i++)
{
	//Colunas
	for (var j = 0; j < cols; j++)
	{
		//Celula
		//draw_sprite(spr_quad, 9, j * tamanho, i * tamanho);
		
		//Garantindo que ele vai fazer a animação começando da primeira coluna
		//E avançando até a ultima
		var _img	= min(max(0, img - j), img_num);
		
		draw_sprite_ext(spr_quad, _img, j * tamanho, i * tamanho, 1, 1, 0, c_black, 1);
	}
}