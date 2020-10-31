
function PlayerState_Wizard_Special(){
	if (can_sound_cast) {
		audio_play_sound(snd_cast, 6, false);
		can_sound_cast = false;
	}
	if (can_attack == true) {

		// Start of the attack
		if (sprite_index != spr_wizard_cast_strip5) {
			sprite_index = spr_wizard_cast_strip5;
			image_index = 0;
		}	

		can_attack = false;
	}
	
	focus_fireball ++;
	
	if (focus_fireball > 64) {//button pressed at least 2 seconds
		if (can_cast) {
			fireball = instance_create_layer(x + (other.facing * 64), y + 16, "layer_players", obj_fireball);
			with (fireball) {
				fireball_orientation = other.player_orientation;
				image_xscale = other.facing;
				image_speed = 0;
				
				//more focus, more speed
				//speed = 16 * (other.focus_bow / 100);
				//speed = clamp(speed, 4, 64);
				
			}
			
			can_cast = false;
		}

	}
	
	if (key_special_released) {

		audio_pause_sound(snd_cast);
		if (focus_fireball > 64) {
			audio_sound_pitch(snd_fireball, choose(.8, 1, 1.2));
			audio_play_sound(snd_fireball, 6, false);
			
			with (fireball) {
				is_casted = false;
				speed = 16;
				direction = other.player_orientation;
				image_angle = 0;
				image_index = 1;
			}
			
		}
		focus_fireball = 0;
		state = PLAYERSTATE.FREE;
		can_attack = true;
		can_cast = true;
	}
	
	
}