// Handle Character Animation
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
var health_percentage = (global.hp / global.max_hp) * 100;
var food_percentage = (global.food / global.max_food) * 100;

// Smaller health bar (20x20)
draw_healthbar(cam_x + 10, cam_y + 10, cam_x + 30, cam_y + 30, health_percentage, c_black, c_red, c_lime, 0, true, true);

// Smaller food bar (20x20), positioned below health bar
draw_healthbar(cam_x + 10, cam_y + 35, cam_x + 30, cam_y + 55, food_percentage, c_black, c_red, c_gray, 0, true, true);

draw_self();
