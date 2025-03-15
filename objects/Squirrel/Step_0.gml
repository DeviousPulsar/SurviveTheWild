var dt = delta_time/1000000;

var hit = collision_ellipse(x-x_detect_range, y-16, x+x_detect_range, y+16, [Player], false, true);
if hit != noone {
	wander_dest = x - sign((hit.x - x))*flee_dist;
	cooldown = flee_cooldown
}

if cooldown > 0 {
	cooldown -= dt;
} else  {
	wander_dest = wander_anchor + random(wander_dist);
	cooldown = wander_cooldown;
}

if abs(wander_dest - x) > tolerance and 2*stop_friction*abs(wander_dest - x) > xsp*xsp {
	xsp += sign(wander_dest - x)*aceeleration;
} else if abs(xsp*dt) > stop_friction {
	xsp -= sign(xsp*dt)*stop_friction;
} else {
	xsp = 0;
}

if xsp > max_speed {
	xsp = max_speed;
}

event_inherited();