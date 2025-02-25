window_set_size(1280, 720);
xsp = 0;
ysp = 0;
xsp = 0;

global.hp = 100;
 
global.max_hp = 100;

global.pc = (global.hp / global.max_hp) * 100;
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
draw_healthbar(cam_x, cam_y , 280, 430, global.pc, c_black, c_red, c_lime, 0, true, true)


