if active {
	var hit = collision_circle(x, y, 64, [Player], false, true);
	if hit != noone {
		global.gameover = true;
		GetPlayer().freeze = true;
	}
}