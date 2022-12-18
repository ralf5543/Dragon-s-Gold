
function PlayerState_Wizard_Special(){
	if (can_sound_cast) {
		audio_play_sound(snd_cast, 6, false);
		can_sound_cast = false;
	}
	if (can_attack == true) {

		// Start of the attack
		if (skeleton_animation_get() != "fireball-invocation") {
			skeleton_animation_set("fireball-invocation");		
		}	

		can_attack = false;
	}
	
	focus_fireball ++;
	
	if (focus_fireball > 96) {//button pressed at least 3 seconds
		if (can_cast) {
			fireball = instance_create_layer(x + (other.facing * 8), y - 64, "front_objects", obj_fireball);
			with (fireball) {
				skeleton_animation_set("invocation");
				size = "small";
				fireball_orientation = other.facing;
				attack_id_receiver = other.gamepad_id_owner;
				image_xscale = other.facing * 0.3;
				image_yscale = 0.3;
			}

			can_cast = false;
		}
		
		if (focus_fireball > 192) {// 6 seconds

			with (fireball) {
				size = "medium";
				image_xscale = other.facing * 0.6;
				image_yscale = 0.6;
			}
		}
		
		if (focus_fireball > 288) {// 9 seconds

			with (fireball) {
				size = "large";
				image_xscale = other.facing;
				image_yscale = 1;
			}
		}

	} 
	
	if (key_special_released) {

		audio_pause_sound(snd_cast);
		if (focus_fireball > 96) {
			audio_sound_pitch(snd_fireball, choose(.8, 1, 1.2));
			audio_play_sound(snd_fireball, 6, false);
			if (skeleton_skin_get() != "fireball-throw") {
					skeleton_animation_set("fireball-throw");
				}
			
			with (fireball) {
				
				if (skeleton_skin_get() != "fireball") {
					skeleton_animation_set("fireball");
				}
				is_casted = false;
				speed = 16 * other.facing;
				direction = other.facing;
				image_angle = 0;
				image_index = 1;
			}
			
		}
	}
}