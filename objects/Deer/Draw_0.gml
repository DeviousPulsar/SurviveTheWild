if(activated) {
	if abs(xsp) == 0 {
		sprite_index = FrogIdle;	
	} else {
		if sprite_index != DeerMove {
			image_index = 0;
		}
		sprite_index = DeerMove;
		image_xscale = sign(xsp)*abs(image_xscale);
	}

	draw_self();	
}