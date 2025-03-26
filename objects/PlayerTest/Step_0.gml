// Gravity
ysp += 0.1;
xsp = 0;

// Reduce food over time
global.food -= 0.05;  // Gradually reduce food each frame

// Stop food from going below 0
if global.food < 0 {
    global.food = 0;
}

// Movement logic (left)
if keyboard_check(vk_left) {
    xsp = -1;
    image_xscale = -0.1;
    sprite_index = CatMove;
} else {
    sprite_index = CatIdle;
}

// Movement logic (right)
if keyboard_check(vk_right) {
    xsp = +1;
    image_xscale = +0.1;
    sprite_index = CatMove;
} else {
    sprite_index = CatIdle;
}

// Go to the next room if touching flag
if (place_meeting(x, y, OFlag)) {
    room_goto_next();
}

// Jump and ground check
if place_meeting(x, y + 1, Ground) {
    ysp = 0;
    if keyboard_check(vk_up) {
        ysp = 0;
    }
}

// Attack logic with space key
if keyboard_check(vk_space) {
    sprite_index = Test;
    
    var hit;
    hit = instance_place(x, y, Enemy);
    
    if (hit != noone) {
        hit.enemyHealth = hit.enemyHealth - 5;
    }
}

// Handle collision and movement
move_and_collide(xsp, ysp, Ground);
