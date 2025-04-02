// Get camera position
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

// Calculate percentages for health and food
var health_percentage = (global.hp / global.max_hp) * 100;
var food_percentage = (global.food / global.max_food) * 100;

// Draw health bar (20x20)
draw_healthbar(cam_x + 10, cam_y + 10, cam_x + 30, cam_y + 30, health_percentage, c_black, c_red, c_lime, 0, true, true);

// Draw food bar (20x20), positioned below health bar
draw_healthbar(cam_x + 10, cam_y + 35, cam_x + 30, cam_y + 55, food_percentage, c_black, c_red, c_gray, 0, true, true);

// Draw inventory items below the food bar
var item_x = cam_x + 10; // Starting X position
var item_y = cam_y + 60; // Position below the food bar
var item_spacing = 22; // Space between items

for (var i = 0; i < ds_list_size(inventory); i++) {
    var item_type = ds_list_find_value(inventory, i);

    // Draw the item sprite
    draw_sprite(item_type.sprite_index, 0, item_x + (i * item_spacing), item_y);
}

// Draw the player sprite
draw_self();
