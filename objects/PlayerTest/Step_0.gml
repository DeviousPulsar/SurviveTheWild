// Gravity
ysp += 0.1;
xsp = 0;

// Reduce food over time (ensures food does not go below 0)
global.food = max(global.food - 0.05, 0);

// Movement logic
if (keyboard_check(vk_left)) {
    xsp = -1;
    image_xscale = -0.1;
    sprite_index = CatMove;
} else if (keyboard_check(vk_right)) {
    xsp = 1;
    image_xscale = 0.1;
    sprite_index = CatMove;
} else {
    sprite_index = CatIdle;
}

// Jumping and ground check
if (place_meeting(x, y + 1, Ground)) {
    ysp = 0;
    if (keyboard_check_pressed(vk_up)) {
        ysp = -4; // Jump force
    }
}

// Attack logic (space key)
if (keyboard_check(vk_space)) {
    sprite_index = Test;
    var hit = instance_place(x, y, Enemy);
    if (hit != noone) {
        hit.enemyHealth -= 5;
    }
}

// Item pickup logic (check collision with Object6)
var item = instance_place(x, y, Object6);
if (item != noone) {
    ds_list_add(inventory, item.object_index); // Store item type, not instance ID

    // Destroy the item after adding it to inventory
    with (item) {
        instance_destroy();
    }
}

// Use food from inventory with "E" key
if (keyboard_check_pressed(ord("E"))) {
    if (ds_list_size(inventory) > 0) { // Ensure inventory has items
        var stored_item = ds_list_find_value(inventory, 0); // Get the first item

        if (stored_item == Object6) { // Check if it's food
            global.hp = min(global.hp + 10, global.max_hp);
            global.food = min(global.food + 40, global.max_food);
        }

        // Remove the used item from the inventory
        ds_list_delete(inventory, 0);
    }
}

// Room transition when touching OFlag
if (place_meeting(x, y, OFlag)) {
    room_goto_next();
}

// Handle collision and movement
move_and_collide(xsp, ysp, Ground);
