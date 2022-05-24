/// @description Setting up macros
randomize();

#macro	CELL_W	16
#macro	CELL_H	16

#macro	GRID_W	10
#macro	GRID_H	20

#macro	GRID_XOFF	32
#macro	GRID_YOFF	32

#macro	c_p8_black		make_colour_rgb(0, 0, 0)
#macro	c_p8_dblue		make_colour_rgb(29, 43, 83)
#macro	c_p8_dpurple	make_colour_rgb(126, 37, 83)
#macro	c_p8_dgreen		make_colour_rgb(0, 135, 81)
#macro	c_p8_brown		make_colour_rgb(171, 82, 54)
#macro	c_p8_dgrey		make_colour_rgb(95, 87, 79)
#macro	c_p8_lgrey		make_colour_rgb(194, 195, 199)
#macro	c_p8_white		make_colour_rgb(255, 241, 232)
#macro	c_p8_red		make_colour_rgb(255, 0, 77)
#macro	c_p8_orange		make_colour_rgb(255, 163, 0)
#macro	c_p8_yellow		make_colour_rgb(255, 236, 39)
#macro	c_p8_green		make_colour_rgb(0, 228, 54)
#macro	c_p8_blue		make_colour_rgb(41, 173, 255)
#macro	c_p8_lavender	make_colour_rgb(131, 118, 156)
#macro	c_p8_pink		make_colour_rgb(255, 119, 168)
#macro	c_p8_lpeach		make_colour_rgb(255, 204, 170)

enum STATES {
	IDLE,
	MOVE,
	JUMP,
	FALL
}