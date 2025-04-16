function HideTextObject(){
	for (var i = 0; i < instance_number(TextBoxJump); ++i;) {
	    instance_find(TextBoxJump, i).visible = false;
	}
}