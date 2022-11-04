
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
				//ds_list_clear(hitByAttack);
			}
						
			
			var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
			with (inst) {
				sprite_index = asset_get_index("spr_slash_strip9");
				//mask_index = spr_slash_strip9;
				
				image_xscale = other.facing;
				
				//to avoid hitting himself
				attack_id_receiver = other.gamepad_id_owner;
			}
		}
		
		can_attack = false;
	}
}