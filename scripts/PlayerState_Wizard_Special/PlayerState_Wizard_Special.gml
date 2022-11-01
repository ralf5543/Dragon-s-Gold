
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
	
	if (focus_fireball > 96) {//button pressed at least 3 seconds
		if (can_cast) {
			fireball = instance_create_layer(x + (other.facing * 64), y + 16, "layer_players", obj_fireball);
			with (fireball) {
				size = "small";
				fireball_orientation = other.player_orientation;
				image_xscale = other.facing;
				image_speed = 0;
			}

			can_cast = false;
		}
		
		if (focus_fireball > 192) {// 6 seconds

			with (fireball) {
				size = "medium";
				image_xscale = other.facing * 1.5;
				image_yscale = 1.5;
			}
		}
		
		if (focus_fireball > 288) {// 9 seconds

			with (fireball) {
				size = "large";
				image_xscale = other.facing * 2;
				image_yscale = 2;
			}
		}

	} 
	
	if (key_special_released) {

		audio_pause_sound(snd_cast);
		if (focus_fireball > 96) {
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
		can_cast = true;
	}
}