/// @description Block fireballs
var knockback = other.size;


with (shield_receiver) {
	if (skeleton_animation_get() != "shield-block") {
		skeleton_animation_set("shield-block");	
	}	
}
	
with (other) {

	if (can_play_sound) {
		audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
		audio_play_sound(snd_fireball_hit, 6, false, 0.5);
		can_play_sound = false;
		
		sprite_index = spr_fireball_explosion;
		speed = 0;	
	}
}


with (obj_player) {
	if (id == other.shield_receiver) {
		var pushback = 0;
		// The largest the fireball is, the further the player is knocked back
		if (knockback == "small") {
			pushback = 2 * facing;
		} else if (knockback == "medium") {
			pushback = 6 * facing;
		} else {
			pushback = 10 * facing;
		}
		
		show_debug_message("pushback" + string(pushback))
		
		// detects a collision at (x + hsp) distance (won't slide into a wall !)
	if (place_meeting(x + pushback, y, obj_wall)) {
		//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
		while (!place_meeting(x + sign(pushback), y, obj_wall)) {
			//move from the "rest" to be the closest as possible from collision
			x -= sign(facing);
		}
	} else {
		x -= pushback;
	}
		
		
	}
}