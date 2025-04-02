draw_healthbar(x-25, y-24, x+25, y-21, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true)

if abs(xsp) == 0 {
	sprite_index = FrogIdle;	
} else if xsp < 0 {
	sprite_index = FrogJump;
	image_xscale = -1*abs(image_xscale);
} else if xsp > 0 {
	sprite_index = FrogJump;
	image_xscale = abs(image_xscale);
}


draw_self();