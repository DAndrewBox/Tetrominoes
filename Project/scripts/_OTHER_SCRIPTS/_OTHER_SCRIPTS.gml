/// @function player_add_score(score)
/// @param	{real}	score
function player_add_score(_score) {
	var _inst = instance_create_depth(GRID_XOFF + 80, GRID_YOFF + 48, depth, o_vfx_score);
		_inst.scr = _score * 10;
		
	o_Controller.player_score += _score * 10;
}

/// @function player_use_item(index)
/// @param	{real}	index
function player_use_item(_index) {
	_index = ( _index == 3 ? irandom(2) : _index );
	
	switch (_index) {
		case 0:
			var _item = instance_create_depth(x, y - 16, depth - 1, o_bomb);
				_item.in_player = true;
				
			with (o_Player) {
				arms_up = true;
			}
			break;
			
		
		case 1:
			var _item = instance_create_depth(x, y + 4, depth - 1, o_drill);
				_item.in_player = true;
		
			with (o_Player) {
				in_drill = true;
			}
			break;
		
		case 2:
			for (var i = GRID_H - 2; i >= 0; i--) {
				for (var j = 0; j < GRID_W; j++) {
					var _block = collision_point((GRID_XOFF + (j * CELL_W)) + 1, (GRID_YOFF + (i * CELL_H)) + 1, o_Block, false, true);
			
					if (_block != noone) {
						if (_block.visible) {
							var _col_other_block = collision_point(_block.x + 1, _block.y + 17, o_Block, false, true);
							
							while (_col_other_block == noone) && (_block.y < 336) {
								_block.y = ((_block.y + 16) div 16) * 16;
								_col_other_block = collision_point(_block.x + 1, _block.y + 17, o_Block, false, true);
							}
						}
					}
				}
			}
			
			tt_update_grid();
			tt_check_rows();
			audio_play_sound(snd_block_place, 80, false);
			break;
	}
	
	o_Controller.platf_item_now = -1;
	audio_play_sound(snd_item_use, 65, false);
}


/// @function game_set_gameover()
function game_set_gameover() {
	o_Controller.GAME_OVER = true;
	o_Controller.platf_time = 0;
	
	instance_destroy(o_Piece);
	instance_destroy(o_Player);
	
	audio_stop_sound(global.music);
}


/// @function game_drop_card(index)
/// @param	{real}	index
function game_drop_card(_index) {
	// TODO: drop cards
	var _x = (o_Player.x div 16) * 16;
	var _y = -16;
	
	var _inst = instance_create_depth(_x + 8, _y, -30, o_drop);
		_inst.index = _index;
		_inst.image_index = _index;
}