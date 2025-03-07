var dt = delta_time/1000000;

if cooldown < 0 {
	var hit = collision_ellipse(x-96, y-32, x+96, y+32, [Player], false, true);
	if hit != noone {
		xsp = sign(hit.x - x)*dash_speed;
		cooldown = dash_cooldown;
	} else {
		if (abs(wander_anchor - x) >= wander_dist) {
			xsp = sign(wander_anchor - x)*wander_speed;
		} else {
			xsp = sign(random(2) - 1)*wander_speed;
		}
		
		cooldown = wander_cooldown;
	}
} else  {
	cooldown -= dt;
	
	if abs(xsp) > stop_friction*dt {
		xsp -= sign(xsp)*stop_friction*dt;
		
		var x1 = x;
		var x2 = x;
		if sign(xsp == -1) {
			x1 -= 16;
		} else if sign(xsp == 1) {
			x2 += 16;	
		}
		
		var hit =  collision_ellipse(x-36, y-18, x+36, y+18, [Player], false, true); //collision_ellipse(x1, y-8, x2, y+8, [Player], false, true);
		if hit != noone {
			var dx = hit.x-x;
			var dy = hit.y-y;
			var len = sqrt(power(dx, 2) + power(dy,2))
			var knock_x = knockback*dx/len;
			var knock_y = knockback*dy/len;
			HitPlayer(hit, knock_x, knock_y, atk);
		}
	} else {
		xsp = 0;
	}
}

event_inherited();