
function PlayerState_Lose(){
	if (skeleton_animation_get() != "dead") {
		skeleton_animation_set("dead")
	}
}