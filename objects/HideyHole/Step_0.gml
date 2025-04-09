var hit = collision_rectangle(x-12, y-24, x+12, y, [objEnemy], false, true);
if hit != noone and respawn_cooldown - cooldown > hide_cooldown {
	instance_deactivate_object(hit);
	hit.visible = false;
	ds_list_add(hiding, hit);
}

hit = collision_circle(x, y, respawn_radius, Player, false, true);
if cooldown > 0 {
	cooldown -= delta_time/1000000;	
} else if hit == noone and !ds_list_empty(hiding) {
	var to_respawn = hiding[| 0]
	instance_activate_object(to_respawn)
	to_respawn.visible = true;
	ds_list_delete(hiding, 0);
	cooldown = respawn_cooldown;
}