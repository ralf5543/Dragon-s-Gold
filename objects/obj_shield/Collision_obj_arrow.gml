/// @description Block arrows

audio_sound_pitch(snd_shield_hit, choose(.8, 1, 1.2));
audio_play_sound(snd_shield_hit, 8, false);

with (other) {
	if (other.image_xscale == 1) {
		direction = 0 + random_range(-30, 30);
	} else {
		direction = 180 + random_range(-30, 30);
	}
	image_xscale = -image_xscale;
}