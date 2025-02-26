ysp += 0.1
xsp = 0



if keyboard_check(vk_left)
{
        xsp = -1
		image_xscale = -0.1;
		sprite_index = CatMove;
} else{
		sprite_index = CatIdle;
}

if keyboard_check(vk_right)
{
        xsp = +1
		image_xscale = +0.1;
		sprite_index = CatMove;
		
} else{
	sprite_index = CatIdle;	
}


if (place_meeting(x, y, OFlag))
{
    room_goto_next();
}

if place_meeting(x, y+1, Ground)
{
        ysp = 0
        if keyboard_check(vk_up)
        {
                ysp = 0        
        }
}

if keyboard_check(vk_space){
	
	sprite_index = Test;
	
	
var hit;	
hit	= instance_place(x,y,Enemy);

	if (hit != noone){
		hit.enemyHealth = hit.enemyHealth -5;
	
	
	}	
}


move_and_collide(xsp, ysp, Ground)



