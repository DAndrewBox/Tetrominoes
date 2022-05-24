/// @description
hold_t--;
if (hold_t <= 0) {
	var _yspd = o_Controller.tetris_speed;

	var _key_l = keyboard_check_pressed(ord("A"));
	var _key_r = keyboard_check_pressed(ord("D"));
	var _key_u = keyboard_check_pressed(ord("W"));
	var _key_d = keyboard_check_pressed(ord("S"));
	var _key_h = keyboard_check_pressed(vk_space);
	
	if (_key_l ^^ _key_r) {
		#region // Move piece
		var _next_x = x + ( _key_l ? -CELL_W : CELL_W );
		place_t = room_speed * .10;
		
		if !(place_meeting(_next_x, y, parent_collider)) {
			x = (_next_x div 16) * 16;
		}
		#endregion
	}
	
	if (_key_u) {
		#region // Rotate piece
		var _deg_or = image_angle;
		image_angle -= 90;
		
		if (place_meeting(x, y, parent_collider)) {
			image_angle = _deg_or;
		} else {
			place_t = room_speed * .10;
		}
		#endregion	
	}
	
	if (_key_d) {
		#region // Drop piece
		while !(place_meeting(x, y + 16, parent_collider)) {
			y = ((y + 16) div 16) * 16;
		}
		
		audio_play_sound(snd_block_drop, 50, false);
		
		var _vfx = instance_create_depth(bbox_left + (abs(bbox_left - bbox_right) / 2), bbox_bottom, depth + 5, o_vfx_piece_drop);
			_vfx.w = (abs(bbox_left - bbox_right) + 8) / 2;
		
		o_Camera.shake = o_Controller.tetris_speed;
		o_Camera.t = 360;
		place_t = 0;
		
		o_Controller.player_score += 25 * 10;
		#endregion
	} else if (_key_h) {
		#region // Hold piece
		if (o_Controller.tetris_can_switch) {
			var _piece_held = o_Controller.tetris_piece_hold;
			if (_piece_held != -1) {
				o_Controller.tetris_piece_hold = o_Controller.tetris_piece_now;
				o_Controller.tetris_piece_now = _piece_held;
			
				tt_update_piece_sprite(_piece_held);
				x = xstart;
				y = -sprite_height;
			
				o_Controller.tetris_can_switch = false;
			} else {
				o_Controller.tetris_piece_hold = o_Controller.tetris_piece_now;
				tt_update_piece();
				tt_update_piece_sprite(o_Controller.tetris_piece_now);
			}
			
			audio_play_sound(snd_block_switch, 50, false);
		}
		#endregion
	}

	// Piece fall movement
	if !(place_meeting(x, y + _yspd, parent_collider)) {
		y += _yspd;	
		x = (x div 16) * 16;
	} else {
		place_t--;
		
		if (bbox_top < GRID_YOFF - 16) {
			game_set_gameover();
		}
		
		if (place_t <= 0) {
			y = ((y +_yspd) div 16) * 16;
			o_Camera.BG_COL = ( y > 160 ? c_p8_white : ( y > 96 ? c_p8_orange : c_p8_red ) );
			
			tt_set_piece();
			tt_check_rows();
			
			tt_update_piece();
			tt_update_piece_sprite(o_Controller.tetris_piece_now);

			hold_t = o_Controller.tetris_piece_delay;
			o_Controller.tetris_speed += .01;
			o_Controller.tetris_can_switch = true;
			o_Camera.bg_t = 90;
			audio_play_sound(snd_block_place, 50, false);
		}
	}
}