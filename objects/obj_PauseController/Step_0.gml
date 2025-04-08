if (keyboard_check_pressed(vk_escape)) {
    is_paused = !is_paused;

    if (is_paused) {
        instance_deactivate_all(false);
        instance_activate_object(id); // keep the pause controller active
    } else {
        instance_activate_all();
    }
}activate_all()