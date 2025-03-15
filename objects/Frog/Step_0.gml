var dt = delta_time/1000000;

if IsObjectGrounded(self) {
	var hit = collision_ellipse(x-detect_range, y-detect_range, x+detect_range, y+detect_range, [Player], false, true);
	if hit != noone {
		jump(-sign(hit.x - x)*flee_dist, 1);
		cooldown = wander_cooldown;
	} else if cooldown > 0 {
		if abs(xsp*dt) > stop_friction {
			xsp -= sign(xsp*dt)*stop_friction;
		} else {
			xsp = 0;
		}
		cooldown -= dt;
	} else  {
		if wander_anchor - wander_dist < x and x < wander_anchor + wander_dist {
			jump(random_range(-wander_dist, wander_dist), random(1));
		} else {
			jump(sign(wander_anchor-x)*min(abs(wander_anchor-x + random(wander_dist)), wander_dist), random(0.5)+0.5);
		}
		cooldown = wander_cooldown;
	}
}

event_inherited();

function jump(dist, pow) {
	var t = min_jump_time + pow*add_jump_time;
	ysp = -0.5*t*gravity;
	xsp = dist/t;
}