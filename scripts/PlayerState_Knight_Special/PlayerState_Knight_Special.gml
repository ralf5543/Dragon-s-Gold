
function PlayerState_Knight_Special(){
	if (can_attack == true) {
		// Start of the attack
		if (sprite_index != spr_knight_shield_strip8) {
			sprite_index = spr_knight_shield_strip8;
			image_index = 0;
		}
		
		audio_sound_pitch(snd_shield, choose(.6, .8, 1));//change the "bass" of the sound
		audio_play_sound(snd_shield, 6, false);
	
		//use attack hitbox and checks for hits
		shield = instance_create_layer(x, y, "layer_players", obj_shield);
		shield.image_xscale = facing;	
		
		can_attack = false;
	}
	
	if (key_special_released) {
		state = PLAYERSTATE.FREE;
		can_attack = true;
		instance_destroy(shield);
	}
}