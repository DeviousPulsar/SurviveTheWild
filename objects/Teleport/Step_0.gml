var hit = collision_rectangle(x - extents_x, y - extents_y, x + extents_x, y + extents_y, Player, false, true);
if hit != noone  {
	if dest_room != noone and dest_room != room {
		room = dest_room;	
	}
	hit.x = dest_x;
	hit.y = dest_y;
}