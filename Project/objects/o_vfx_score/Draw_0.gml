/// @description 
draw_set_font(fnt_default);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_p8_white);

var _txt = "";
switch (scr / 10) {
	case 100:	_txt = "good!";			break;
	case 200:	_txt = "great!";		break;
	case 300:	_txt = "awesome!";		break;
	case 800:	_txt = "tetris!!!";		break;
	default:
		if ((scr / 10) < 100) {
			_txt = "";
		} else {
			_txt = "outstanding!";
		}
		break;
}

draw_text(x, y, _txt);
draw_text_transformed(x, y + 20, "+" + string(scr / 10), .5, .5, 0);