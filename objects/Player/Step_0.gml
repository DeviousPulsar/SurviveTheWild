var dt = delta_time/1000000;
hunger(dt)
move(dt);
attack(dt);

if (hitstun > 0) {
	hitstun--;	
}

function hunger(dt) {
	// Reduce food over time
	food -= food_drain*dt;  // Gradually reduce food each frame

	// Stop food from going below 0
	if food < 0 {
	    food = 0;
	}
}

function move (dt) {
	var control_mod = 1;
	var isGrounded = ysp >= 0 && IsObjectGrounded(self, fallthrough);
	
	if isGrounded {
		ysp = 0;
	
		if keyboard_check(vk_up) and jump_charge < 1 {
			jump_charge += dt*jump_charge_rate;
			jump_charge = min(jump_charge, 1);
		} else if keyboard_check_released(vk_up) {
			ysp = -max(jump_charge*additional_jump_speed - horisontal_jump_damp*abs(xsp), 0) - min_jump_speed;
			xsp *= 1+jump_charge*horisontal_jump_damp;
			jump_charge = 0;
		}
	} else {
		ysp += gravity*dt;
		control_mod = air_control;
	}

	var dir = 0;
	if keyboard_check(vk_left) {
		dir = -1;
	} else if keyboard_check(vk_right) {
		dir = 1;
	}

	if dir == 0 and xsp = 0 {
	}  else if dir == 0 and abs(xsp) > control_mod*stop_friction*dt or abs(xsp) > max_hspeed {
		xsp -= sign(xsp)*control_mod*stop_friction*dt;
	} else if dir != 0 and (sign(xsp) == 0 or dir == sign(xsp)) {
		xsp += dir*control_mod*acceleration*dt;
	} else if dir == -sign(xsp) {
		xsp += dir*control_mod*(acceleration+stop_friction)*dt;
	} else {
		xsp = 0;
	}

	if abs(ysp) > max_vspeed {
		ysp = sign(ysp)*max_vspeed;	
	}
	
	if keyboard_check(vk_down) or ysp < 0 {
		fallthrough = true;
	} else if ysp > 0 {
		fallthrough = false;
	}
 
	move_and_collide((jump_charge > 0 ? 0.2 : 1)*xsp*dt, ysp*dt, GetCollisionMask(fallthrough));

	lastdir = dir != 0 ? dir: lastdir;
}

function attack (dt) {
	if keyboard_check(vk_space) and attack_cooldown <= 0{
		var _list = ds_list_create();
		var _num = collision_ellipse_list(x-attack_range, y-attack_range, x+attack_range, y+attack_range, [objEnemy], false, false, _list, false);
		sprite_index = AttackRight;

		if (_num > 0) {
			for (var i = 0; i < _num; ++i;) {
				_list[| i].hp -= 1;
			}
		}
		
		attack_cooldown = 0.5;
	} else if attack_cooldown > 0{
		attack_cooldown -= dt;
	}
}
