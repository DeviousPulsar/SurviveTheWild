// Step Event

// Handle game over
if (!is_game_over && instance_exists(Player)) {
    if (Player.hp <= 0) {
		room_goto(Home);
        is_game_over = true;
		Player.hp = 100;
	    Player.x = 1312;
	    Player.y =608;
		Player.freeze = true;
    }
	
}

// Restart the game
if (is_game_over && keyboard_check_pressed(ord("R"))) {
    is_game_over = false;
	Player.freeze = false;
	
	
		

//Player.persistent = false;
//	room_goto(Home);

	

}