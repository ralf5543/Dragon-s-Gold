
function PlayerState_Combo2(){
	
	is_sliding = true;
	
	if (can_combo2 == true) {
		audio_sound_pitch(snd_attack_miss, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_attack_miss, 6, false);

		// Start of the attack
		if (skeleton_animation_get() != "combo2") {
			skeleton_animation_set("combo2")
		}

					
			
		var inst = instance_create_layer(x, y - 60, "layer_players", obj_attack);
		with (inst) {
			sprite_index = asset_get_index("spr_knight_combo2_strip9");
				
			image_xscale = other.facing;
				
			//to avoid hitting himself
			attack_id_receiver = other.gamepad_id_owner;
		}
		
		can_combo2 = false;
	}
	
	
}