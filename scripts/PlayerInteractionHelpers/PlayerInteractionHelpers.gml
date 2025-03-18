function PlayerSingleton() constructor {
	static playerID = undefined;
	
	function Set(_id) {
		if (playerID != undefined) {
			instance_destroy(playerID);
		}
		playerID = 	_id;
	}
	
	function Get() {
		return playerID;	
	}
}

function HitPlayer(to_hit, x_knockback, y_knockback, damage) {
	if (to_hit.object_index != Player) { return; }
	if (to_hit.hitstun > 0) { return; }
	
	to_hit.xsp = x_knockback;
	to_hit.ysp = y_knockback;
	to_hit.hp -= damage;
	to_hit.hitstun = 30;
}