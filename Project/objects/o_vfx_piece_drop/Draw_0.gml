/// @description 
draw_set_alpha(image_alpha);
gpu_set_blendmode(bm_add);

var _xscale = dsin(t);
var _yscale = dcos(t);
draw_rectangle_colour(x - w * _xscale, y - (96 * _yscale), x + w * _xscale, y, c_p8_black, c_p8_black, c_p8_white, c_p8_white, false);

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);