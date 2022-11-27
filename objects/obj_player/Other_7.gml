/// @description 

//jump up animation
if (skeleton_animation_get() == "jump-up") {
	image_index = -1;
	image_speed = 0;
	//show_debug_message("fini jump-up");
}

//hurt animation
if (skeleton_animation_get() == "hurt") {
    image_index = -1;
	image_speed = 0;
}

//attack animation
if (skeleton_animation_get() == "attack") {
    state = PLAYERSTATE.FREE;
}

//combo1 animation
if (skeleton_animation_get() == "combo1") {
    state = PLAYERSTATE.FREE;
}

//combo2 animation
if (skeleton_animation_get() == "combo2") {
    state = PLAYERSTATE.FREE;
	is_sliding = false;
}

//dash animation
if (skeleton_animation_get() == "dash") {
	image_index = -1;
	image_speed = 0;
}

//victory animation
if (skeleton_animation_get() == "victory") {
	//loop on the 40th frame
	image_index =40;
}

//bow animation
if (sprite_index == spr_ranger_bow_strip8) {
    //sprite_index = asset_get_index("spr_" + character + "_stand_strip2");
	//state = PLAYERSTATE.FREE;
	//can_attack = true;
	image_index = -1;
	image_speed = 0;
}

//shield animation
if (skeleton_animation_get() == "shield") {
	//loop on the 10th frame
	image_index =10;
}

//shield block animation
if (skeleton_animation_get() == "shield-block") {
	skeleton_animation_set("shield");
	image_index =10;
}

//Fireball animation
if (sprite_index == spr_wizard_cast_strip5) {
    can_sound_cast = true;

}

//death animation
if (skeleton_animation_get() == "dead") {
	image_index = -1;
	image_speed = 0;
}