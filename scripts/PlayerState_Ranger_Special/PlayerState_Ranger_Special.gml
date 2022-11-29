
function PlayerState_Ranger_Special(){

	if (can_attack == true) {

		// Start of the attack
		if (skeleton_animation_get() != "bow") {
			skeleton_animation_set("bow");		
		}
		
		can_attack = false;
	}
	
	focus_bow ++;
	
	if (key_special_released) {
		if (focus_bow > 32) {//button pressed at least 1 second
			audio_sound_pitch(snd_bow, choose(.8, 1, 1.2));//change the "bass" of the sound
			audio_play_sound(snd_bow, 6, false);
			
			if (skeleton_animation_get() != "bow-end") {
				skeleton_animation_set("bow-end");	
			}
			
			
	
			//use ranger hitbox
			var inst = instance_create_layer(x + (20 * facing), y - 55, "layer_players", obj_arrow);
			with (inst) {
				arrow_orientation = other.facing;
				image_xscale = arrow_orientation;
				attack_id_receiver = other.gamepad_id_owner;
				
				//more focus, more speed
				speed_orientation = (16 * (other.focus_bow / 100)) * arrow_orientation;
				speed = clamp(speed_orientation, -64, 64);
			
				// more focus, more straight shot
				vsp = -1 * (floor(other.focus_bow / 10));
				vsp = clamp(vsp, -2, 0);

				// random_range adds a bit of random to the angle
				direction = arrow_orientation + random_range(-3, 3);
			
			}
		} else {
			state = PLAYERSTATE.FREE;
		}
		focus_bow = 0;
	}
}