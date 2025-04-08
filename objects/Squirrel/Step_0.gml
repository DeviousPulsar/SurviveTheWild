var dt = delta_time/1000000;

var hit = collision_ellipse(x-x_detect_range, y-16, x+x_detect_range, y+16, [Player], false, true);
if hit != noone and !fleeing {
	var px = hit.x
	wander_dest = x - sign((px - x))*flee_dist
	
	hit = collision_line(x, y-8, wander_dest, y-8, GetCollisionMask(), false, true);
	if hit != noone {
		wander_dest = x + 2*sign((px - x))*flee_dist;
	}
	
	cooldown = flee_cooldown
	fleeing = true;
}

if cooldown > 0 {
	cooldown -= dt;
} else  {
	wander_dest = wander_anchor + random(wander_dist);

	hit = collision_line(x, y-8, wander_dest, y-8, GetCollisionMask(), false, true);
	if hit != noone {
		wander_dest = x - sign(wander_dest - x)*wander_dist;
		wander_anchor = wander_dest;
	}
	
	cooldown = wander_cooldown;
	fleeing = false;
}

if (abs(wander_dest - x) > tolerance and 2*stop_friction*abs(wander_dest - x) > xsp*xsp) or fleeing {
	xsp += sign(wander_dest - x)*aceeleration*dt;
} else if abs(xsp*dt) > stop_friction {
	xsp -= sign(xsp*dt)*stop_friction;
} else {
	xsp = 0;
}

if xsp > max_speed {
	xsp = max_speed;
}

/*show_debug_message(
	string("Squirrel inst {0}: dest ({1}, {2}); speed ({3}, {4}) ", 
	self, wander_dest, y, xsp, ysp));*/

event_inherited();