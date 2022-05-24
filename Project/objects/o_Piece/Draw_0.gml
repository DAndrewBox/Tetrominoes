/// @description 
var _yy = ((y div 16) * 16);
var _yoff = 0;

while !(place_meeting(x, _yy + _yoff, parent_collider)) {
	_yoff += 16;
}

gpu_set_blendmode(bm_max);
draw_sprite_ext(sprite_index, 0, x, (_yy + _yoff) - 16, 1, 1, image_angle, c_p8_white, .16);
gpu_set_blendmode(bm_normal);

draw_self();