if (!place_meeting(x, y, obj_shield) ) {
	//if the attack is not meeting a shield (even if touching a player's collision box)
			
	with (other) {

		// if ennemy isn't already hurt OR dead OR invincible
		// AND the target isn't the attack origin player

		if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) && (other.attack_id_receiver) != id && (!is_invicible) {
		
		
			if (point_direction(other.x, other.y, x, y) > 90) {
				hitfrom = -1;// attack from the right
			} else {
				hitfrom = 1;//attack from the left
			}
			facing = -hitfrom;//(faces the origin of the attack)
			flash = 10;
					
			audio_play_sound(snd_smash, 7, false);
		
		state = PLAYERSTATE.HURT;
		hp -= 10;
		}
	
	}
	
	with (obj_player.gamepad_id_owner) {
		if (skeleton_animation_get() == "attack") {
			has_touched_ennemy1 = true;
		}
	
		if (skeleton_animation_get() == "combo1") {
			has_touched_ennemy2 = true;	
		}
	}
			
}




