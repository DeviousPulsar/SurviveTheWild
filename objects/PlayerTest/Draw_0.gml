cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

draw_healthbar(cam_x, cam_y, cam_x+20, cam_y+20, global.pc, c_black, c_red, c_lime, 0, true, true)
draw_self();