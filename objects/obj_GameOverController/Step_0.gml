if (!is_game_over && instance_exists(Player)) {
    if (Player.hp <= 0) {
        is_game_over = true;
    }
}
if (keyboard_check_pressed(ord("R"))) {
    game_restart(); // Or room_restart() if you want to restart just the room
	is_game_over = false;
	camera_set_view_target(view_camera[0], Player);
}