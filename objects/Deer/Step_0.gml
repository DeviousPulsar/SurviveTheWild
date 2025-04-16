if (activated) {
	var dt = delta_time/1000000;

	if cooldown < 0 {
		var hit = collision_circle(x, y-32, 96, [Player], false, true);
		if (abs(wander_anchor - x) >= wander_dist) {
			wander_dest = x + random_range(-wander_dist, wander_dist);
			cooldown = wander_cooldown
			dashing = false;
		} else if hit != noone {
			if collision_line(x, y-16, hit.x, hit.y-16, GetCollisionMask(), false, true) == noone {
				xsp = sign(hit.x - x)*dash_speed;
				cooldown = dash_cooldown;
				dashing = true;
			}
		} else {
			wander_dest = x + random_range(-wander_dist, wander_dist);
			cooldown = wander_cooldown;
			dashing = false;
		}
		
		attacking = false;
	} else {
		cooldown -= dt;	
	}
	
	if abs(xsp) > damage_min_speed {
		var hit =  collision_ellipse(x-48, y-32, x+48, y, [Player], false, true);
		if hit != noone {
			attacking = true;
			var dx = hit.x-x;
			var dy = 0.5*(hit.y-y);
			var len = sqrt(power(dx, 2) + power(dy,2))
			var knock_x = knockback*dx/len;
			var knock_y = knockback*dy/len;
			HitPlayer(hit, knock_x, knock_y, atk);
			cooldown = 1;
		}
	}

	if dashing {
		xsp -= sign(xsp)*stop_friction*dt;
	} else if abs(wander_dest - x) > tolerance and 2*stop_friction*abs(wander_dest - x) > xsp*xsp {
		xsp += sign(wander_dest - x)*acceleration;
	} else if abs(xsp) > stop_friction {
		xsp -= sign(xsp)*stop_friction*dt;
	} else {
		xsp = 0;
	}


	event_inherited();
}