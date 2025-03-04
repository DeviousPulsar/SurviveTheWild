var isGrounded = IsObjectGrounded(self);
var dt = delta_time/1000000;
	
if not isGrounded {
	ysp = 0;
	
	ysp += gravity*dt;
}

move_and_collide(xsp*dt, ysp*dt, GetCollisionMask());