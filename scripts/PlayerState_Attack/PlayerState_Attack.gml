
function PlayerState_Attack(){
	
	if (can_attack == true) {
		
		audio_sound_pitch(snd_attack_miss, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_attack_miss, 6, false);
		
		if (energy > 0) && (key_run) {
			// Start of the attack
			if (sprite_index != asset_get_index("spr_" + character + "_dash_strip2")) {
				sprite_index = asset_get_index("spr_" + character + "_dash_strip2");
				image_index = 0;
			}
			
			is_sliding = true;
			
			
		} else {

			// Start of the attack
			if (sprite_index != asset_get_index("spr_" + character + "_attack_strip7")) {
				sprite_index = asset_get_index("spr_" + character + "_attack_strip7");
				image_index = 0;
			}
		
			
	
			//use attack hitbox and checks for hits
			var inst = instance_create_layer(x, y, "layer_players", obj_attack);
			with (inst) {
				sprite_index = asset_get_index("spr_" + other.character + "_attackHB_strip7");
				image_xscale = other.facing;
			}
		}
		
		can_attack = false;
	}
}