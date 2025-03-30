// Gravity
ysp += 0.1;
xsp = 0;
inventory = ds_list_create();

// Reduce food over time
global.food -= 0.05;

// Stop food from going below 0
if (global.food < 0) {
    global.food = 0;
}

// Movement logic (left)
if (keyboard_check(vk_left)) {
    xsp = -1;
    image_xscale = -0.1;
    sprite_index = CatMove;
} else {
    sprite_index = CatIdle;
}

// Movement logic (right)
if (keyboard_check(vk_right)) {
    xsp = 1;
    image_xscale = 0.1;
    sprite_index = CatMove;
} else {
    sprite_index = CatIdle;
}

// Go to the next room if touching flag
if (place_meeting(x, y, OFlag)) {
    room_goto_next();
}

// Jump and ground check
if (place_meeting(x, y + 1, Ground)) {
    ysp = 0;
    if (keyboard_check(vk_up)) {
        ysp = 0;
    }
}

// Attack logic with space key
if (keyboard_check(vk_space)) {
    sprite_index = Test;

    var hit;
    hit = instance_place(x, y, Enemy);

    if (hit != noone) {
        hit.enemyHealth -= 5;
    }
}

// Item pickup logic (check collision with items)
var item = instance_place(x, y, Object6);  // Check if touching Object6

if (item != noone) {
    // Add item to inventory
    ds_list_add(inventory, item.object_index);

    // ✅ Restore health and food when picking up the item
    global.hp += 10;  // Increase health (Adjust value if needed)
    global.food += 15; // Increase food (Adjust value if needed)

    // ✅ Prevent health and food from exceeding max values
    if (global.hp > global.max_hp) global.hp = global.max_hp;
    if (global.food > global.max_food) global.food = global.max_food;

    // Destroy the item after picking it up
    with (item) {
        instance_destroy();
    }
}

// Handle collision and movement
move_and_collide(xsp, ysp, Ground);
