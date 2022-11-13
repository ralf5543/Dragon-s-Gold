
function PlayerState_Attack(){
	
	if (can_attack == true) {
		audio_sound_pitch(snd_attack_miss, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_attack_miss, 6, false);
		
		if (energy > 0) && (key_run) {
			// Start of the attack
			if (skeleton_animation_get() != "dash") {
				skeleton_animation_set("dash")
			}
			

			var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
			with (inst) {
				sprite_index = asset_get_index("spr_" + other.character + "_dash_strip9");
				image_xscale = other.facing;
				attack_id_receiver = other.gamepad_id_owner;
			}
			
			is_sliding = true;
			
			
		} else {

			// Start of the attack
			if (skeleton_animation_get() != "attack") {
				skeleton_animation_set("attack")
			}
						
			
			var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
			with (inst) {
				sprite_index = asset_get_index("spr_slash_strip9");
				
				image_xscale = other.facing;
				
				//to avoid hitting himself
				attack_id_receiver = other.gamepad_id_owner;
			}
			
		}

		
		can_attack = false;
	}
		
		if (can_combo1) && (has_touched_ennemy1) && (key_attack) && (image_index > 18) && (image_index < 38) {
			state = PLAYERSTATE.COMBO1;
		}
		
}