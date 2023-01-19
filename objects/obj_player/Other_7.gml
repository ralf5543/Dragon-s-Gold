/// @description 

//jump up animation
if (skeleton_animation_get() == "jump-up") {
	var num = skeleton_animation_get_frames(skeleton_animation_get());
	image_index = num -1;
	image_speed = 0;
}

//look up animation
if (skeleton_animation_get() == "looking-up") {
	var num = skeleton_animation_get_frames(skeleton_animation_get());
	image_index = num -1;
	image_speed = 0;
}

//hurt animation
if (skeleton_animation_get() == "hurt") {
    var num = skeleton_animation_get_frames(skeleton_animation_get());
	image_index = num -1;
	image_speed = 0;
}

//drink potion animation
if (skeleton_animation_get() == "drink-potion") {

	if (is_drinking_health_potion) {
		if (hp != hp_max) {
			
			while (hp < hp_max) {
				// todo : make it raise slowly (doesn't work actually ;(
				hp = hp + 0.5;
			}
		
			if (hp >= hp_max) {
				hp = hp_max;
				is_drinking_health_potion = false;
			}
		}
	}
	
	else if (is_drinking_energy_potion) {
		if (energy != energy_max) {
			
			while (energy < energy_max) {
				energy = energy +5;
			
				if (energy >= energy_max) {
					energy = energy_max;
					is_drinking_energy_potion = false;
				}
			}
		}
	} else if (is_drinking_invincibility_potion) {
		is_invicible = true;
	}
	
    state = PLAYERSTATE.FREE;
	can_drink = true;
	audio_play_sound(snd_potion_heal, 4, false);
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
	
	if (character == "wizard") {
		audio_stop_sound(snd_cast);
	}
}

//dash animation
if (skeleton_animation_get() == "dash") {
	var num = skeleton_animation_get_frames(skeleton_animation_get());
	image_index = num -1;
	image_speed = 0;
}

//victory animation
if (skeleton_animation_get() == "victory") {
	if (character == "wizard") {
		//loop on the 30th frame
		image_index =30;
	} else {
		//loop on the 40th frame
		image_index =40;
	}
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

//Fireball animations
if (skeleton_animation_get() == "fireball-invocation") {
	image_index =30;
}

if (skeleton_animation_get() == "fireball-throw") {
	image_index =30;
	focus_fireball = 0;
	can_cast = true;
	can_sound_cast = true;
	state = PLAYERSTATE.FREE;
}

//death animation
if (skeleton_animation_get() == "dead") {
	var num = skeleton_animation_get_frames(skeleton_animation_get());
	image_index = num -1;
	image_speed = 0;
}

//thief rolling animation
if (skeleton_animation_get() == "rolling") {
    state = PLAYERSTATE.FREE;
	can_play_roll = true;
	rolling_distance = 5;
}