
function PlayerState_Ranger_Special(){
	
	if (can_attack == true) {

		// Start of the attack
		if (sprite_index != spr_ranger_bow_strip8) {
			sprite_index = spr_ranger_bow_strip8;
			image_index = 0;
		}
		
		audio_sound_pitch(snd_bow, choose(.8, 1, 1.2));//change the "bass" of the sound
		audio_play_sound(snd_bow, 6, false);
	
		//use attack hitbox and checks for hits
		var inst = instance_create_layer(x, y + 16, "layer_players", obj_arrow);
		with (inst) {
			speed = 16;
			// random_range adds a bit of random to the angle
			direction = other.player_orientation + random_range(-3, 3);
			image_angle = direction;
		}
		
		can_attack = false;
	}
}