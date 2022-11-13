if (!place_meeting(x, y, obj_shield) ) {
	//if the attack is not meeting a shield (even if touching a player's collision box)
	
	if (other.id != attack_id_receiver) {
		
		if (other.is_invicible == false) && (other.state != PLAYERSTATE.HURT) && (other.state != PLAYERSTATE.DEAD) {
		
			if ((x - other.x) > 0) {
				other.hitfrom = -1;// attack from the right
			} else {
				other.hitfrom = 1;//attack from the left
			}

			other.facing = -other.hitfrom;//(faces the origin of the attack)
			other.flash = 10;
					
			audio_play_sound(snd_smash, 7, false);
		
		other.state = PLAYERSTATE.HURT;
		other.hp -= 10;
		}
		
		
		with (obj_player.gamepad_id_owner) {
			show_debug_message("combo 1");
			if (skeleton_animation_get() == "attack") {
				has_touched_ennemy1 = true;
			}
	
			if (skeleton_animation_get() == "combo1") {
				show_debug_message("combo 2");
				has_touched_ennemy2 = true;	
			}
		}
		
	}
			
}




