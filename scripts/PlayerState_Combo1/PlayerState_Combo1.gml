
function PlayerState_Combo1(){
	
	is_sliding = true;
	
	if (can_combo1 == true) {
		audio_sound_pitch(snd_attack_miss, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_attack_miss, 6, false);

		// Start of the attack
		if (skeleton_animation_get() != "combo1") {
			skeleton_animation_set("combo1")
		}
					
			
		var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
		with (inst) {
			sprite_index = asset_get_index("spr_" +  other.character + "_combo1");
				
			image_xscale = other.facing;
				
			//to avoid hitting himself
			attack_id_receiver = other.gamepad_id_owner;
		}
		
		can_combo1 = false;
	}
	
	if (character == "ranger") {
		if (image_index > 20) {
			is_sliding = false;
		}
	}
	
	
	if (character == "wizard") {
		if (image_index > 10) {
			is_sliding = false;
		}
	}
	var num = skeleton_animation_get_frames(skeleton_animation_get());
	if (character == "knight") {
		if (can_combo2) && (has_touched_ennemy2) && (key_attack) && (image_index > (num - 5)) && (image_index < (num)) {
			state = PLAYERSTATE.COMBO2;
		}
	} else if (character == "ranger") {
		if (can_combo2) && (has_touched_ennemy2) && (key_attack) && (image_index > (num - 50)) && (image_index < (num)) {
			state = PLAYERSTATE.COMBO2;
		}
	} else if (character == "wizard") {
		if (can_combo2) && (has_touched_ennemy2) && (key_attack) && (image_index > (num - 25)) && (image_index < (num)) {
			state = PLAYERSTATE.COMBO2;
		}
	}
	
	has_touched_ennemy1 = false;

}