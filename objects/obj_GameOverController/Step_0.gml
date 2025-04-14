// Step Event

// Handle game over
if (!is_game_over && instance_exists(Player)) {
    if (Player.hp <= 0) {
        is_game_over = true;
    }
}

// Restart the game
if (is_game_over && keyboard_check_pressed(ord("R"))) {
    is_game_over = false; // Optional but clean
    game_restart();
}