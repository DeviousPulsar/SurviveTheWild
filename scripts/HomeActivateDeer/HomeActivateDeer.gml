function HomeActivateDeer(){
	for (var i = 0; i < instance_number(Deer); ++i;) {
	    instance_find(Deer, i).activated = true;
	}
	
	instance_find(objHome, 0).active = true;
}