/// @description Stuff
#region // Add score
if !(GAME_OVER) {
	player_score += tetris_speed;
	platf_time++;
	
	if (platf_time mod (room_speed * 20) == 0) {
		game_drop_card(irandom(3));
	}
} else {
	platf_time++;
	if (platf_time > room_speed) {
		if (keyboard_check_pressed(vk_down)) {
			game_restart();
		}
	}
}
#endregion

if (keyboard_check_pressed(vk_f1)) {
	screen_save("file_" + string(delta_time) + ".png");
}