var hit = collision_circle(x, y+12, 12, [objEnemy], false, true);
if hit != noone {
	instance_destroy(hit);
}