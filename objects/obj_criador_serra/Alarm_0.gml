/// @description Insert description here
// You can write your code in this editor

var xx = (x - sprite_xoffset) + sprite_width / 2;
var yy = y - sprite_yoffset + sprite_height / 2;

//var _tile = layer_tilemap_get_id("serrinha")


var _serra = instance_create_layer(xx, yy, "serra", obj_serra);

_serra.dir    = dir;
_serra.estado = "avanca";
_serra.limite = limite;
_serra.vel    = vel;
_serra.rot    = rot;
_serra.pai    = self.id;
_serra.image_xscale = .2;
_serra.image_yscale = .2;

alarm[0] = room_speed * alarme;

