move(delta_time/1000000);
attack();

function move (dt) {
	
	var control_mod = 1;
	
	if isGrounded {
		ysp = 0;
	
		if keyboard_check(vk_up) and jump_charge < 1 {
			jump_charge += dt*jump_charge_rate;
			jump_charge = min(jump_charge, 1);
		} else if keyboard_check_released(vk_up) {
			ysp = -(jump_charge*additional_jump_speed + min_jump_speed);	
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
		sprite_index = CatIdle;	
	} else if dir != 0 and (sign(xsp) == 0 or dir == sign(xsp)) {
		xsp += dir*control_mod*acceleration*dt;
		sprite_index = CatMove;
	} else if dir == -sign(xsp) {
		xsp += dir*control_mod*(acceleration+stop_friction)*dt;
		sprite_index = CatMove;
	} else if abs(xsp) > control_mod*stop_friction*dt  {
		xsp -= sign(xsp)*control_mod*stop_friction*dt;
		sprite_index = CatIdle;	
	} else {
		xsp = 0;
		sprite_index = CatIdle;	
	}

	if abs(xsp) > max_hspeed {
		xsp = sign(xsp)*max_hspeed;	
	}

	if abs(ysp) > max_vspeed {
		ysp = sign(ysp)*max_vspeed;	
	}

	move_and_collide((jump_charge > 0 ? 0.2 : 1)*xsp*dt, ysp*dt, [objStaticParent, objKinematicParent]);
}

function attack () {
	var hit = instance_place(x,y,Enemy);

	if (hit != noone){
		hit.enemyHealth = hit.enemyHealth -5;
	}
}