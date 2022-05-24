/// @description 
t++;

if (t mod room_speed == 0) {
	if (image_index < 3) {
		image_index += 1;
	} else {
		image_index = ( image_index == 3 ? 4 : 3 );
		count += 1;
		t = room_speed - (room_speed / count);
		
		if (count >= 6) {
			audio_play_sound(snd_explosion, .65, false);
			var _vfx = instance_create_depth(x, y, depth - 10, o_vfx_explosion);
				_vfx.image_xscale = 3;
				_vfx.image_yscale = 3;
				 
			o_Camera.shake += 6;
			o_Camera.t = 360;
				
			ds_grid_set_disk(o_Controller.tetris_grid, (x - GRID_XOFF) div 16, (y - GRID_YOFF) div 16, 4, -1);
			tt_clear_empty();
			
			instance_destroy();
		}
	}
}

if (in_player) {
	if (instance_exists(o_Player)) {
		x = o_Player.x;
		y = o_Player.y - 16;
		
		if (keyboard_check_pressed(vk_down)) {
			o_Player.arms_up = false;
			in_player = false;
		}
		
	} else {
		in_player = false;
	}
} else {
	if !(place_meeting(x, y + 1, o_Block)) {
		y = round(y + 3);
	}
}