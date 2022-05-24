/// @description 
t--;
y = lerp(ystart, ystart - 16, .05);

if (t <= 0) {
	image_alpha -= .1;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}