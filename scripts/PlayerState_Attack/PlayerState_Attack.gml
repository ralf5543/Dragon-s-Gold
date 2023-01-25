
function PlayerState_Attack(){
	
	if (can_attack == true) {
		audio_sound_pitch(snd_attack_miss, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_attack_miss, 6, false);
		
		var chance = choose(0, 1, 2);
				
		// 1 chance for 3 to cry
		if (chance > 1) {
			if (character == "thief") {
				audio_sound_pitch(snd_steal_try, choose(.8, 1, 1.2));
				audio_play_sound(snd_steal_try, 6, false, 0.5);
				
			} else if (sexe == "male") {
				audio_sound_pitch(snd_battlecry_male1, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_male2, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_male3, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_male4, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_male5, choose(.8, 1, 1.2));
				audio_play_sound(choose(snd_battlecry_male1, snd_battlecry_male2, snd_battlecry_male3, snd_battlecry_male4, snd_battlecry_male5), 6, false, 0.5);
				
			} else {
				audio_sound_pitch(snd_battlecry_female1, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_female2, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_female3, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_female4, choose(.8, 1, 1.2));
				audio_sound_pitch(snd_battlecry_female5, choose(.8, 1, 1.2));
				audio_play_sound(choose(snd_battlecry_female1, snd_battlecry_female2, snd_battlecry_female3, snd_battlecry_female4, snd_battlecry_female5), 6, false, 0.5);
			}
		}
		
		if (energy > 0) && (key_run) && (character != "thief") {
			// Start of the attack
			if (skeleton_animation_get() != "dash") {
				skeleton_animation_set("dash")
			}
			

			var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
			with (inst) {
				sprite_index = asset_get_index("spr_" + other.character + "_dash");
				image_xscale = other.facing;
				attack_id_receiver = other.gamepad_id_owner;
			}
			
			is_sliding = true;
		
			alarm[0] = 32;
			
		} else {

			// Start of the attack
			if (skeleton_animation_get() != "attack") {
				skeleton_animation_set("attack")
			}
			
			if (character != "thief") {
				is_sliding = true;
			}
						
			
			var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
			with (inst) {
				sprite_index = asset_get_index("spr_" + other.character + "_attack");
				
				image_xscale = other.facing;
				
				//to avoid hitting himself
				attack_id_receiver = other.gamepad_id_owner;
			}
			
		}

		
		can_attack = false;
	}
	var num = skeleton_animation_get_frames(skeleton_animation_get());
	if (character == "knight") {		
		if (can_combo1) && (has_touched_ennemy1) && (key_attack) && (image_index > (num - 10)) && (image_index < (num)) {
			state = PLAYERSTATE.COMBO1;
		}
	} else if (character == "ranger") {
		if (can_combo1) && (has_touched_ennemy1) && (key_attack) && (image_index > (num - 40)) && (image_index < (num)) {
			state = PLAYERSTATE.COMBO1;
		}
	} else if (character == "wizard") {
		if (can_combo1) && (has_touched_ennemy1) && (key_attack) && (image_index > (num - 25)) && (image_index < (num)) {
			state = PLAYERSTATE.COMBO1;
		}
	}
		
}