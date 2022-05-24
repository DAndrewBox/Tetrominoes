/// @description 
draw_set_colour(c_p8_black);
draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);

draw_set_colour(c_p8_white);
var _var_to_check = ( index == 0 ? o_Controller.tetris_piece_hold : ( index == 2 ? o_Controller.tetris_piece_next : o_Controller.platf_item_now ) );
if (index != 1) {
	var _piece_spr = tt_get_piece_sprite(_var_to_check);
	var _xoff = abs(sprite_get_xoffset(_piece_spr) - sprite_get_width(_piece_spr)/2) * (sprite_get_xoffset(_piece_spr) > sprite_get_width(_piece_spr)/2 ? 1 : -1 );
	
	draw_sprite(_piece_spr, 0, x + sprite_width/2 + _xoff, y + sprite_height/2);
} else {
	if (_var_to_check > -1) {
		draw_sprite_ext(s_platf_cards, _var_to_check, x + sprite_width/2, y + sprite_height/2, 2, 2, 0, -1, 1);
	}
}
draw_rectangle(x, y, x + sprite_width, y + sprite_height, true);

draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_colour(c_p8_lgrey);

draw_text(x + sprite_width/2 + 4, y + sprite_height + 8, TEXT);