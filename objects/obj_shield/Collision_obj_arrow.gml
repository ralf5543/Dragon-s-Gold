/// @description Block arrows

audio_sound_pitch(snd_shield_hit, choose(.8, 1, 1.2));
audio_play_sound(snd_shield_hit, 8, false);

with (other) {
	if (other.image_xscale == 1) {
		direction = -180 + random_range(-30, 30);
	} else {

		direction = 180 + random_range(-30, 30);
	}
}

with (shield_receiver) {
	if (skeleton_animation_get() != "shield-block") {
			skeleton_animation_set("shield-block");	
	}	
}