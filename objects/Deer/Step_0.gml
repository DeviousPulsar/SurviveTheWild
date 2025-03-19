var dt = delta_time/1000000;

if cooldown < 0 {
	var hit = collision_ellipse(x-96, y-32, x+96, y+32, [Player], false, true);
	if (abs(wander_anchor - x) >= wander_dist) {
		wander_dest = x + random_range(-wander_dist, wander_dist);
		cooldown = wander_cooldown
		dashing = false;
	} else if hit != noone {
		xsp = sign(hit.x - x)*dash_speed;
		cooldown = dash_cooldown;
		dashing = true;
	} else {
		wander_dest = x + random_range(-wander_dist, wander_dist);
		cooldown = wander_cooldown;
		dashing = false;
	}
} else  {
	cooldown -= dt;	
}

if dashing {
	// Do nothing!
} else if abs(wander_dest - x) > tolerance and 2*stop_friction*abs(wander_dest - x) > xsp*xsp {
	xsp += sign(wander_dest - x)*acceleration;
} else if abs(xsp*dt) > stop_friction {
	xsp -= sign(xsp*dt)*stop_friction;
} else {
	xsp = 0;
}

if abs(xsp) > stop_friction*dt {
	xsp -= sign(xsp)*stop_friction*dt;
	
	if abs(xsp) > damage_min_speed {
		var hit =  collision_ellipse(x-36, y-18, x+36, y+18, [Player], false, true);
		if hit != noone {
			var dx = hit.x-x;
			var dy = 0.5*(hit.y-y);
			var len = sqrt(power(dx, 2) + power(dy,2))
			var knock_x = knockback*dx/len;
			var knock_y = knockback*dy/len;
			HitPlayer(hit, knock_x, knock_y, atk);
		}
	}
} else {
	xsp = 0;
}


event_inherited();