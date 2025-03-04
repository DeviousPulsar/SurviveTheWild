function GetCollisionMask(fallthrough) {
	return [objStaticParent, objKinematicParent, (fallthrough ? objStaticParent : objFallthrough)];
}

function IsObjectGrounded(obj, fallthrough = false) {
	return place_meeting(obj.x, obj.y + 1, GetCollisionMask(fallthrough));
}