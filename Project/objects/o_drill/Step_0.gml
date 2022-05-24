/// @description 
var _col_block = collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, o_Block, false, true);
yspd = clamp(yspd + .125, -4, 3);


if (_col_block != noone) {	
	if (count > 0) {
		audio_play_sound(snd_explosion, .65, false);
		var _vfx = instance_create_depth(x, y + 8, depth - 10, o_vfx_explosion);
			_vfx.image_xscale = 2;
			_vfx.image_yscale = 2;

		o_Camera.shake += 3;
		o_Camera.t = 360;
				
		if (_col_block.visible) {
			player_add_score(25);
			o_Controller.tetris_grid[# (x - GRID_XOFF) div 16, (y + 16 - GRID_YOFF) div 16] = -1;
			tt_clear_empty();
		} else {
			count = 0;
		}
			
		count--;
	} else {
		if (in_player) {
			with (o_Player) {
				in_drill = false;
			}
		}
		instance_destroy();
	}
}

if (in_player) {
	if (instance_exists(o_Player)) {
		o_Player.y += yspd;
		
		x = o_Player.x;
		y = o_Player.y + 4;
		
		if (keyboard_check_pressed(vk_down)) {
			o_Player.in_drill = false;
			in_player = false;
		}
		
		if (_col_block != noone) {
			o_Player.yspd = -random_range(4, 6);
			yspd *= -.80;
		}
		
	} else {
		in_player = false;
	}
} else {
	if !(place_meeting(x, y + 1, o_Block)) {
		y = round(y + yspd);
	}
}