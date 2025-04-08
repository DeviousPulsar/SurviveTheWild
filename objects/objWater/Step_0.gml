var hit = collision_point(x, y, [Player, objEnemy], false, true);
if hit != noone {
	if hit.object_index == Player {
		hit.hp -= 10/60;	
	}
	
	if object_is_ancestor(hit.object_index, objEnemy) {
		instance_destroy(hit);
	}
}