/// @description Fell in a hole !

if (character == "male") {
	audio_play_sound(choose(snd_fall_male1, snd_fall_male2), 9, false);
} else {
	audio_play_sound(choose(snd_fall_female1, snd_fall_female2), 9, false);
}

hp = 0;