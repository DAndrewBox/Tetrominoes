/// @description 
if (shake != 0) {
	var _offset = (2 + shake) * dsin(t * 2);
	
	camera_set_view_pos(view_camera[0], camera_x + _offset, camera_y + _offset);
	shake = lerp(shake, 0, .050);
	t = lerp(t, 0, .10);
}