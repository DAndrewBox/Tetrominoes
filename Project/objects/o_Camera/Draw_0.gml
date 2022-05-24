/// @description 
bg_t -= 2;
bg_t = clamp(bg_t, 0, 90);

var _alpha = .33 * dsin(bg_t);

draw_set_colour(BG_COL);
draw_set_alpha(_alpha);
draw_rectangle(GRID_XOFF, GRID_YOFF, GRID_XOFF + 160, GRID_YOFF + 320, false);

draw_set_alpha(1);