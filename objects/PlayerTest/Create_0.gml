// Window and movement setup
window_set_size(1280, 720);
xsp = 0;
ysp = 0;

// Health system
global.hp = 100;
global.max_hp = 100;

// Food system
global.food = 100;
global.max_food = 100;

// Camera variables
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

// Create inventory list (only once)
inventory = ds_list_create();
