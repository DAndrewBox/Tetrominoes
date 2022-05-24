/// @description 
if (DIE) {
	image_alpha -= .10;
	image_blend = merge_colour(c_navy, c_p8_white, image_alpha);
	
	if (image_alpha <= 0) {
		instance_destroy();
		tt_update_pieces();
	}
}