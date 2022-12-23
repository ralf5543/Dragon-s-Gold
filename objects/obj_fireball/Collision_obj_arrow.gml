/// @description Insert description here

if (can_play_sound) {
	audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
	audio_play_sound(snd_fireball_hit, 6, false, 0.5);
	can_play_sound = false;
}

//if small fireball, fireball and arrow are destroyed
if (size == "small") {
	sprite_index = spr_fireball_explosion;
	speed = 0;
	image_speed = 1;
	instance_destroy(other);

// if medium or large fireball, arrow is destroyed
} else {
	instance_destroy(other);
}
