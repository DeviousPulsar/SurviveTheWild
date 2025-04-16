// Handle character animation
if attack_cooldown > 0 and (xsp > 0 or lastdir >= 0) {
	if sprite_index != AttackRight {
		sprite_index = AttackRight;	
		image_index = 0;
	}
} else if attack_cooldown > 0 and (xsp < 0 or lastdir < 0) {
	if sprite_index != AttackLeft {
		sprite_index = AttackLeft;	
		image_index = 0;
	}	
} else if xsp > 0 {
	sprite_index = MoveRight;
} else if xsp < 0 {
	sprite_index = MoveLeft
} else if lastdir > 0 {
	sprite_index = IdleRight;
} else if lastdir < 0 {
	sprite_index = IdleLeft;
}

// Get camera position
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// Calculate percentages for health and food
var health_percentage = (hp / max_hp) * 100;
var food_percentage = (food / max_food) * 100;

// Smaller health bar (40x5)
draw_healthbar(cam_x + 10, cam_y + 10, cam_x + 50, cam_y + 16, health_percentage, c_black, c_red, c_lime, 0, true, true);

// Smaller food bar (35x5), positioned below health bar
draw_healthbar(cam_x + 10, cam_y + 18, cam_x + 45, cam_y + 22, food_percentage, c_black, c_red, c_gray, 0, true, true);
// Labels for the bars
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Health text
draw_text(cam_x + 55, cam_y + 13, "Health");

// Food text
draw_text(cam_x + 50, cam_y + 20, "Food");


// Draw inventory items below the food bar
var item_x = cam_x + 18; // Starting X position
var item_y = cam_y + 40; // Position below the food bar
var item_spacing = 22; // Space between items

for (var i = 0; i < ds_list_size(inventory); i++) {
    var item_type = ds_list_find_value(inventory, i);

    // Draw the item sprite
    draw_sprite(item_type.sprite_index, 0, item_x + (i * item_spacing), item_y);
}

// Draw the player sprite
draw_self();
