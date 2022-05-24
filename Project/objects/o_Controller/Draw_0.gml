/// @description Draw Grid
if (surface_exists(tetris_grid_surf)) {
	draw_set_alpha(.16);
	draw_surface(tetris_grid_surf, GRID_XOFF, GRID_YOFF);
	draw_set_alpha(1);
} else {
	tetris_grid_surf = surface_create(GRID_W * 16, GRID_H * 16);
	surface_set_target(tetris_grid_surf);
	draw_clear_alpha(c_p8_black, 0.0);
	#region // Draw grid
	draw_set_colour(c_ltgray);
	draw_set_alpha(1);
	
	draw_rectangle(1, 1, 158, 318, true);
	
	for (var i = 0; i < GRID_H; i++) {
		draw_line(0, (i * 16), GRID_W * 16, (i * 16));
	}

	for (var i = 0; i < GRID_W; i++) {
		draw_line((i * 16), 0, (i * 16), GRID_H * 16);
	}

	draw_set_alpha(1);
	#endregion
	surface_reset_target();
}

#region // Draw other stuff
draw_set_alpha(1);
draw_set_font(fnt_default);
draw_set_valign(fa_top);
draw_set_colour(c_p8_white);

draw_set_halign(fa_center);

// Game title
draw_text_transformed(350, 32, "Tetrominoes", 2, 2, 0);

draw_set_colour(c_p8_lavender);
draw_set_halign(fa_right);
draw_text_transformed(476, 66, "by d'Andrew box", .5, .5, 0);

// Score
draw_set_halign(fa_center);
draw_set_colour(c_p8_white);

var _pad = "";
var _scr = string(round(o_Controller.player_score / 10));

for (var i = 0; i < 8 - string_length(_scr); i++) {
	_pad += "0";
}

draw_text(350, 328, "score: " + _pad + _scr);

// Game over
if (GAME_OVER) {
	draw_set_colour(c_p8_black);
	draw_rectangle(GRID_XOFF, 154, GRID_XOFF + 160, 196, false);
	
	draw_set_colour(c_p8_red);
	draw_text(112, 160, "game over");
	
	draw_set_colour(c_p8_white);
	draw_text_transformed(112, 180, "- press down try again -", .5, .5, 0);
}
#endregion