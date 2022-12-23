/// @description Crossing door

if (skeleton_animation_get() != "walk") {
	skeleton_animation_set("walk");
	is_crossing_door = true;
	
	show_debug_message("bbbb")
	show_debug_message("skeleton_animation_get()" + string(skeleton_animation_get()))
}





















