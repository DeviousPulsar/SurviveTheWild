var hit = collision_rectangle(x-12, y-24, x+12, y, [objEnemy], false, true);
if hit != noone {
	instance_destroy(hit);
}