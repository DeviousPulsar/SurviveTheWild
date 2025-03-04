var dt = delta_time/1000000;

if cooldown < 0 {
	var hit = collision_ellipse(x-48, y-16, x+48, y+16, [Player], false, true);
	if hit != noone {
		xsp = sign(hit.x - x)*dash_speed;
		cooldown = dash_cooldown;
	}
} else  {
	cooldown -= dt;
	if abs(xsp) > stop_friction*dt {
		xsp -= sign(xsp)*stop_friction*dt;
	} else {
		xsp = 0;
	}
}

event_inherited();