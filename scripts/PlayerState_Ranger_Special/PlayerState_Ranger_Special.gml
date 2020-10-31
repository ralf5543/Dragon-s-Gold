
function PlayerState_Ranger_Special(){

	if (can_attack == true) {

		// Start of the attack
		if (sprite_index != spr_ranger_bow_strip8) {
			sprite_index = spr_ranger_bow_strip8;
			image_index = 0;
		}
		
		can_attack = false;
	}
	
	focus_bow ++;
	
	if (key_special_released) {
		if (focus_bow > 32) {//button pressed at least 2 seconds
			audio_sound_pitch(snd_bow, choose(.8, 1, 1.2));//change the "bass" of the sound
			audio_play_sound(snd_bow, 6, false);
	
			//use ranger hitbox
			var inst = instance_create_layer(x, y + 16, "layer_players", obj_arrow);
			with (inst) {
				arrow_orientation = other.facing;
				image_xscale = arrow_orientation;
				
				//more focus, more speed
				speed = 16 * (other.focus_bow / 100);
				speed = clamp(speed, 4, 64);
			
				// more focus, more straight shot
				vsp = -1 * (floor(other.focus_bow / 10));
				vsp = clamp(vsp, -2, 0);

				// random_range adds a bit of random to the angle
				direction = other.player_orientation + random_range(-3, 3);
				
			}
		}
		focus_bow = 0;
		state = PLAYERSTATE.FREE;
		can_attack = true;
	}
}