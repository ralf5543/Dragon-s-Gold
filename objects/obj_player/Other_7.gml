/// @description 

//jump up animation
if (skeleton_animation_get() == "jump-up") {
	image_index = 0;
	image_speed = 0;
}

//hurt animation
if (skeleton_animation_get() == "hurt") {
    image_index = 0;
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
if (skeleton_animation_get() == "bow") {
	//loop on the 40th frame
	image_index =40;
}

//bow end animation
if (skeleton_animation_get() == "bow-end") {
	state = PLAYERSTATE.FREE;
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
//if (sprite_index == spr_wizard_cast_strip5) {
//    can_sound_cast = true;

//}

//death animation
if (skeleton_animation_get() == "dead") {
	image_index = 0;
	image_speed = 0;
}