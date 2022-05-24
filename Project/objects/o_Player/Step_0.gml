/// @description 
#region // Keypress locals
var _key_l = keyboard_check(vk_left);
var _key_r = keyboard_check(vk_right);
var _key_u = keyboard_check_pressed(vk_up);
var _key_d = keyboard_check(vk_down);
#endregion

#region // Movement
#region // Vertical movement
yspd += ( state == STATES.FALL ? grav / 2 : grav );
yspd = clamp(yspd, -3 * yspd_max, yspd_max);
#endregion

#region // Horizontal movement
if (_key_l || _key_r) {
	image_xscale = ( _key_l ? -1 : 1 );
	xspd += .25 * image_xscale;
	xspd = clamp(xspd, -xspd_max, xspd_max);
	
	if !(place_meeting(x + xspd, y, parent_collider)) {
		x += xspd;
	}
} else {
	xspd = lerp(xspd, 0, .10);
}
#endregion

#region // Jump
if !(in_drill) && ((_key_u) && (can_jump)) {
	state = STATES.JUMP;
	can_jump = false;
	yspd = -yspd_max * 2;
	audio_play_sound(snd_player_jump, 50, false);
}
#endregion

#region // Collision check
if (collision_point(x, y, o_Block, false, true) != noone) {
	instance_create_depth(x, y, depth - 10, o_vfx_explosion);
	audio_play_sound(snd_player_explosion, 50, false);
	game_set_gameover();
}

var _col_block = instance_place(x, y + yspd + 1, parent_collider);
if (_col_block != noone) {
	if (_col_block.object_index == o_Piece) {
		if (bbox_bottom > _col_block.bbox_top) {
			y += o_Controller.tetris_speed;
		}
		
	}
	
	if (yspd > 0) {
		state = STATES.IDLE;
	}
	
	yspd = 0;
	can_jump = true;
}

y += yspd;
#endregion
#endregion

#region // Card effects
if (_key_d) {
	var _card = o_Controller.platf_item_now;
	if (_card > -1) {
		player_use_item(_card);
	}
}
#endregion

#region // Change states by movement speed
if (yspd < 0) {
	state = STATES.JUMP;
	image_speed = 0;
	image_index = 5;
} else if (yspd > 0) {
	state = STATES.FALL;
	image_speed = 0;
	image_index = 5;
} else {
	if (abs(xspd) < .10) {
		state = STATES.IDLE;
		xspd = 0;
		image_speed = 0;
		image_index = 0;
	} else {
		state = STATES.MOVE;
		image_speed = 0;
		var _next_frame = image_index + (.125 * abs(xspd));
		image_index = ( _next_frame >= 6 ? 1 : _next_frame );
	}
}
#endregion