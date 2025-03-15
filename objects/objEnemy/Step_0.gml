var isGrounded = IsObjectGrounded(self);
var dt = delta_time/1000000;
	
if not isGrounded {
	ysp += gravity*dt;
} else if ysp > 0 {
	ysp = 0;	
}

move_and_collide(xsp*dt, ysp*dt, GetCollisionMask());