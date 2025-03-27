global.playerID = noone;
	
function SetPlayer(_id) {
	if global.playerID != noone {
		instance_destroy(_id);
	} else {
		global.playerID = _id;
	}
}
	
function GetPlayer() {
	return global.playerID;	
}

function HitPlayer(to_hit, x_knockback, y_knockback, damage) {
	if (to_hit.object_index != Player) { return; }
	if (to_hit.hitstun > 0) { return; }
	
	to_hit.xsp = x_knockback;
	to_hit.ysp = y_knockback;
	to_hit.hp -= damage;
	to_hit.hitstun = 30;
}