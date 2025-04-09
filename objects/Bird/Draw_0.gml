if flying {
	if sprite_index != BirdFly {
		image_index = 0;
	}
	sprite_index = BirdFly;
	image_xscale = -sign(xsp)*abs(image_xscale);
} else {
	sprite_index = BirdIdle;	
} 

draw_self();