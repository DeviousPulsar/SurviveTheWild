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
		
		var x1 = x;
		var x2 = x;
		if sign(xsp == -1) {
			x1 -= 16;
		} else if sign(xsp == 1) {
			x2 += 16;	
		}
		
		var hit =  collision_ellipse(x-18, y-9, x+18, y+9, [Player], false, true); //collision_ellipse(x1, y-8, x2, y+8, [Player], false, true);
		if hit != noone {
			hit.xsp = sign(xsp)*200;
			hit.ysp = -100;
			hit.hp -= 10;
		}
	} else {
		xsp = 0;
	}
}

event_inherited();