if abs(xsp) == 0 {
	sprite_index = SquirrelIdle;	
} else if xsp < 0 {
	sprite_index = SquirrelMove;
	image_xscale = abs(image_xscale);
} else if xsp > 0 {
	sprite_index = SquirrelMove;
	image_xscale = -1*abs(image_xscale);
}

draw_self();