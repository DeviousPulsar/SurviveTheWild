xsp = 0;
ysp = 0;
jump_charge = 0;
fallthrough = false;
hitstun = 0;
lastdir = 0;
attack_cooldown = 0;

// Health system
global.hp = 100;
global.max_hp = 100;

// Food system
global.food = 100;
global.max_food = 100;

// Camera variables
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

new PlayerSingleton().Set(self);
