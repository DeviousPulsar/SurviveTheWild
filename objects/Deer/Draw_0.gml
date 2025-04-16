if(activated) {
	if dashing {
		if sprite_index != DeerAttack {
			image_index = 0;
		}
		sprite_index = DeerAttack;
	} else if abs(xsp) == 0 {
		sprite_index = DeerIdle;	
	} else {
		if sprite_index != DeerMove {
			image_index = 0;
		}
		sprite_index = DeerMove;
	}
	
	if sign(xsp) != 0 {
		lastdir = sign(xsp);
	}
	image_xscale = lastdir*abs(image_xscale);

	draw_self();	
}