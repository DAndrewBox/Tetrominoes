/// @description 
randomize();
display_set_gui_maximise(2, 2);
depth = -50;

tetris_grid = ds_grid_create(GRID_W, GRID_H);
ds_grid_clear(tetris_grid, -1);

tetris_piece_now	= irandom(6);
tetris_piece_hold	= -1;
tetris_piece_next	= irandom(6);
tetris_piece_delay	= room_speed / 3;
tetris_can_switch	= true;
tetris_speed		= 1;
tetris_grid_surf	= -1;

platf_item_now = -1;
platf_time	= 0;

player_score = 0;

GAME_OVER = false;

global.music = audio_play_sound(msc_main, 100, true);

window_set_caption("Tetrominoes (Mix & Gamejam version) by D'Andrëw Box")