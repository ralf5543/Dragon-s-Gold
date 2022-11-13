
function PlayerState_Combo1(){
	
	if (image_index > 9) {
		x += 20 * facing;
	}
	
	if (image_index > 12) && (image_index < 20) {
		x -= 10 * facing;
	}

	
	if (image_index > 20) {
		x -= 20 * facing;
	}
	
	if (can_combo1 == true) {
		audio_sound_pitch(snd_attack_miss, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_attack_miss, 6, false);

		// Start of the attack
		if (skeleton_animation_get() != "combo1") {
			skeleton_animation_set("combo1")
		}
					
			
		var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
		with (inst) {
			sprite_index = asset_get_index("spr_knight_combo1_strip9");
				
			image_xscale = other.facing;
				
			//to avoid hitting himself
			attack_id_receiver = other.gamepad_id_owner;
		}
		
		can_combo1 = false;
	}
	
		
	if (can_combo2) && (has_touched_ennemy2) && (key_attack) && (image_index > 28) && (image_index < 38) {
		state = PLAYERSTATE.COMBO2;
	}
	
	has_touched_ennemy1 = false;
}