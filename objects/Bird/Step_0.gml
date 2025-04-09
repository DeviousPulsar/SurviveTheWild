var dt = delta_time/1000000;
var isGrounded = IsObjectGrounded(self);

var hit = collision_circle(x, y - image_yscale*16, detect_range, [Player], false, true);
if hit != noone or (flying and cooldown > 0) {
	var a = 0;
	if hit != noone {
		cooldown = fleeing_cooldown;
		a = arctan2(place_meeting(x, y + 32, GetCollisionMask(flying))? -100 : -1.2*(hit.y - y), -(hit.x - x));
	} else {
		a = arctan2(ysp, xsp);
	}
	xsp += cos(a)*acceleration*dt;
	ysp += sin(a)*acceleration*dt;
	
	flying = true;
} else {
	if abs(xsp*dt) > stop_friction {
		xsp -= sign(xsp*dt)*stop_friction;
	} else {
		xsp = 0;
	}
	
	if not isGrounded {
		ysp += gravity*dt;
	} else if ysp > 0 {
		ysp = 0;	
	}
	
	flying = false;
}

if (cooldown > 0) {
	cooldown -= dt;	
}


move_and_collide(xsp*dt, ysp*dt, GetCollisionMask(flying or ysp < 0));