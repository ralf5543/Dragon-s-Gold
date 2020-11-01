/// @description Block fireballs
var knockback = other.size;

with (other) {
	if (can_play_sound) {
		audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
		audio_play_sound(snd_fireball_hit, 6, false);
		can_play_sound = false;
		
		sprite_index = spr_fireball_explosion_strip8;
		speed = 0;
		image_speed = 1;
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