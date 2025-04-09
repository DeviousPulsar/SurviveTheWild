var isGrounded = IsObjectGrounded(self, true);
var dt = delta_time/1000000;
	
if not isGrounded {
	ysp += gravity*dt;
} else if ysp > 0 {
	ysp = 0;	
}

// Check if the player is colliding with Object6
var player = instance_place(x, y, Player);

if (player != noone) {
    // Add food item to player's inventory
    ds_list_add(player.inventory, self); // Store object type

    // Deactivate this item after adding it to inventory
    instance_deactivate_object(self);
}

move_and_collide(0, ysp*dt, GetCollisionMask(true))