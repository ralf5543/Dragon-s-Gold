/// @description Block attacks

with (other) {
	audio_sound_pitch(snd_shield_hit, choose(.8, 1, 1.2));
	audio_play_sound(snd_shield_hit, 8, false);
	instance_destroy();
}