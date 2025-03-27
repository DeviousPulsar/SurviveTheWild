var hit = collision_rectangle(x - extents_x, y - extents_y, x + extents_x, y + extents_y, Player, false, true);
if hit != noone  {
	script_execute(script, args);
}