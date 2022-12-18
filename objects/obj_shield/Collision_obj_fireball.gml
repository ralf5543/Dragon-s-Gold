/// @description Block fireballs
var knockback = other.size;

with (other) {
	if (can_play_sound) {
		audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
		audio_play_sound(snd_fireball_hit, 6, false);
		can_play_sound = false;
		
		if (skeleton_skin_get() != "explosion") {
			skeleton_animation_set("explosion");
		}
		speed = 0;
	}
}


with (obj_player) {
	if (id == other.shield_receiver) {
		// The largest the fireball is, the further the player is knocked back
		if (knockback == "small") {
			x -= 2 * facing;
		} else if (knockback == "medium") {
			x -= 6 * facing;
		} else {
			x -= 10 * facing;
		}
	}
}