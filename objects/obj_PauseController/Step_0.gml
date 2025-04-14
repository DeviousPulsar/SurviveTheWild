// Pause game
if (keyboard_check_pressed(vk_escape)) {
    is_paused = !is_paused;

    if (is_paused) {
        // Deactivate everything EXCEPT the pause controller
        instance_deactivate_all(true); // true = notme
    } else {
        // Reactivate everything
        instance_activate_all();
    }
}
