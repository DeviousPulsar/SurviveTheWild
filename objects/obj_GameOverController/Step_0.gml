// Step Event
gameover = global.gameover;

// Handle game over
if (!gameover && instance_exists(Player) && Player.hp <= 0) {
    gameover = true;
	GetPlayer().visible = false;
}

if gameover {
	// Restart the game
	if (keyboard_check_pressed(ord("R"))) {
	    gameover = false;
		ResetPlayer();
		game_restart();
	} else {
		GetPlayer().freeze = true;
	}
}