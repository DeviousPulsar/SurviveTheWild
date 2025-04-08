x = player.x;
y = player.y;

var charge = player.jump_charge;
var ydir = -max(charge*player.additional_jump_speed - player.horisontal_jump_damp*abs(player.xsp), 0) - player.min_jump_speed;
var xdir = player.xsp*(1+charge*player.horisontal_jump_damp);
image_angle = point_direction(x, y, x+xdir, y+ydir) + 45;

if charge == 0 {
	image_index = 0;
	visible = false	
} else {
	visible = true;
	image_index = min(floor(charge/0.25), 4)
}

/*show_debug_message(
	string("Charge info: visible={0}, pos=({1},{2}), rotation={5}, charge={3}, image_index={4}", 
	visible, x, y, charge, image_index, image_angle));*/