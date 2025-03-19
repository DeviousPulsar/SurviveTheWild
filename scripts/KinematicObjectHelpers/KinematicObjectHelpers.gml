function GetCollisionMask(fallthrough = false) {
	return [layer_tilemap_get_id(layer_get_id("Ground")), objStaticParent, objKinematicParent, (fallthrough ? objStaticParent : objFallthrough)];
}

function IsObjectGrounded(obj, fallthrough = false) {
	return place_meeting(obj.x, obj.y + 1, GetCollisionMask(fallthrough));
}