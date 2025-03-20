if attack_cooldown > 0 and (xsp > 0 or lastdir >= 0) {
	if sprite_index != AttackRight {
		sprite_index = AttackRight;	
		image_index = 0;
	}
} else if attack_cooldown > 0 and (xsp < 0 or lastdir < 0) {
	if sprite_index != AttackLeft {
		sprite_index = AttackLeft;	
		image_index = 0;
	}	
} else if xsp > 0 {
	sprite_index = MoveRight;
} else if xsp < 0 {
	sprite_index = MoveLeft
} else if lastdir > 0 {
	sprite_index = IdleRight;
} else if lastdir < 0 {
	sprite_index = IdleLeft;
}

draw_healthbar(x-10, y-15, x+10, y-12, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true)
draw_self();