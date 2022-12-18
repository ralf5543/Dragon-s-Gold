/// @description Block normal attacks
show_debug_message("block attack");
audio_sound_pitch(snd_shield_hit, choose(.8, 1, 1.2));
audio_play_sound(snd_shield_hit, 8, false);

with (shield_receiver) {
	if (skeleton_animation_get() != "shield-block") {
			skeleton_animation_set("shield-block");	
	}	
}



with (other) {
	instance_destroy();
}