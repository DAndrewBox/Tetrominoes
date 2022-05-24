/// @function tt_set_piece()
function tt_set_piece() {
	for (var i = 0; i < GRID_W; i++) {
		for (var j = 0; j < GRID_H; j++) {
			var _block_in_pos = collision_point(GRID_XOFF + (i * CELL_W), GRID_YOFF + (j * CELL_H), o_Piece, true, false);
			
			if (_block_in_pos != noone) {
				o_Controller.tetris_grid[# i, j] = o_Controller.tetris_piece_now;
				
				var _block = instance_create_depth(GRID_XOFF + (i * CELL_W), GRID_YOFF + (j * CELL_H), depth, o_Block);
					_block.image_index = o_Controller.tetris_grid[# i, j];
			}
		}
	}
	
}

/// @function tt_update_piece()
function tt_update_piece() {
	randomize();
	var _next_piece = irandom(6);
	
	while (_next_piece == o_Controller.tetris_piece_now) {
		randomize();
		_next_piece = irandom(6);
	}
	
	o_Controller.tetris_piece_now = o_Controller.tetris_piece_next;
	o_Controller.tetris_piece_next = _next_piece;
	
	x = xstart;
	y = -sprite_height;
	
	while (place_meeting(x, y, o_Block)) {
		y--;
	}
}

/// @function tt_update_piece_sprite(index)
/// @param {real}	index
function tt_update_piece_sprite(_index) {
	var _new_sprite = s_shape_I;
	
	switch (_index) {
		case 0:	_new_sprite	= s_shape_I;	break;
		case 1:	_new_sprite	= s_shape_J;	break;
		case 2:	_new_sprite	= s_shape_L;	break;
		case 3:	_new_sprite	= s_shape_O;	break;
		case 4:	_new_sprite	= s_shape_S;	break;
		case 5:	_new_sprite	= s_shape_T;	break;
		case 6:	_new_sprite	= s_shape_Z;	break;
	}
	
	sprite_index = _new_sprite;
}

/// @function tt_get_piece_sprite(index)
/// @param	{real}	index
function tt_get_piece_sprite(_index) {
	var _sprite;
	
	switch (_index) {
		default: _sprite = s_Empty;		break;
		case 0:	_sprite	= s_shape_I;	break;
		case 1:	_sprite	= s_shape_J;	break;
		case 2:	_sprite	= s_shape_L;	break;
		case 3:	_sprite	= s_shape_O;	break;
		case 4:	_sprite	= s_shape_S;	break;
		case 5:	_sprite	= s_shape_T;	break;
		case 6:	_sprite	= s_shape_Z;	break;
	}
	
	return _sprite;
}

/// @function tt_check_rows()
function tt_check_rows() {
	var _row_count = 0;
	
	for (var j = GRID_H - 1; j > 0; j--) {
		var _full_row = true;
		
		for (var i = 0; i < GRID_W; i++) {
			if (o_Controller.tetris_grid[# i, j] == -1) {
				_full_row = false;
			}
		}
		
		if (_full_row) {
			for (var i = 0; i < GRID_W; i++) {
				var _block = collision_point((GRID_XOFF + (i * CELL_W)) + 1, (GRID_YOFF + (j * CELL_H)) + 1, o_Block, false, true);
				
				if (_block != noone) {
					if (_block.visible) {
						o_Controller.tetris_grid[# i, j] = -1;
						_block.DIE = true;
					}
				}
			}
			
			// Ordenar
			for (var _cell_y = j; _cell_y > 0; _cell_y--) {
				for (var _cell_x = 0; _cell_x < GRID_W; _cell_x++) {
					if (o_Controller.tetris_grid[# _cell_x, _cell_y - 1] > -1) {
						o_Controller.tetris_grid[# _cell_x, _cell_y] = o_Controller.tetris_grid[# _cell_x, _cell_y - 1];
						o_Controller.tetris_grid[# _cell_x, _cell_y - 1] = -1;
						
					}
				}
			}
			tt_clear_empty();
			o_Camera.shake += 2;
			o_Camera.t = 360;
			
			_row_count++;
			j += 1;
		}
	}
	
	if (_row_count > 0) {
		var _score = 0;
		switch (_row_count) {
			case 1:	_score = 100;	break;
			case 2:	_score = 200;	break;
			case 3:	_score = 300;	break;
			case 4:	_score = 800;	break;
			default: _score = 800 + (_row_count - 4) * 400;	break;
		}
		
		player_add_score(_score);
	}
}


/// @function tt_clear_empty()
function tt_clear_empty() {
	for (var i = 0; i < GRID_W; i++) {
		for (var j = 0; j < GRID_H; j++) {
			if (o_Controller.tetris_grid[# i, j] == -1) {
				with (o_Block) {
					if ((x - GRID_XOFF) div CELL_W == i && (y - GRID_YOFF) div CELL_H == j) {
						instance_destroy();
					}
				}
			}
		}
	}
}

/// @function tt_update_pieces()
function tt_update_pieces() {
	for (var i = 0; i < GRID_W; i++) {
		for (var j = 0; j < GRID_H; j++) {
			var _value = o_Controller.tetris_grid[# i, j];
			if (_value != -1) {
				var _block = collision_point((GRID_XOFF + (i * CELL_W)) + 1, (GRID_YOFF + (j * CELL_H)) + 1, o_Block, false, true);
				if (_block == noone) {
					var _block = instance_create_depth(GRID_XOFF + (i * CELL_W), GRID_YOFF + (j * CELL_H), -10, o_Block);
						_block.image_index = _value;
				}
			}
		}
	}
}

/// @function tt_update_grid()
function tt_update_grid() {
	for (var i = 0; i < GRID_W; i++) {
		for (var j = 0; j < GRID_H; j++) {
			var _block = collision_point((GRID_XOFF + (i * CELL_W)) + 1, (GRID_YOFF + (j * CELL_H)) + 1, o_Block, false, true);
			
			if (_block != noone) {
				o_Controller.tetris_grid[# i, j] = _block.image_index;
			} else {
				o_Controller.tetris_grid[# i, j] = -1;
			}
		}
	}
}