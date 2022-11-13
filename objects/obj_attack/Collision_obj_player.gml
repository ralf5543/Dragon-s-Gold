if (!place_meeting(x, y, obj_shield) ) {
	//if the attack is not meeting a shield (even if touching a player's collision box)
	show_debug_message("attack_id_receiver" + string(attack_id_receiver));
	show_debug_message("other.id" + string(other.id));
	
	
	
	if (other.id != attack_id_receiver) {
		show_debug_message("et paf !");
		
		show_debug_message("x victime" + string(other.x));
		
		show_debug_message( "other.state" + string(other.state));
		
		//if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) && (other.attack_id_receiver) != id && (!is_invicible) {
		show_debug_message("difference : " + string(x - other.x));
		
			if ((x - other.x) > 0) {
				other.hitfrom = -1;// attack from the right
			} else {
				other.hitfrom = 1;//attack from the left
			}
		
			//if (point_direction(x, y, other.x, other.y) > 90) {
			//	other.hitfrom = -1;// attack from the right
			//} else {
			//	other.hitfrom = 1;//attack from the left
			//}
			other.facing = -other.hitfrom;//(faces the origin of the attack)
			other.flash = 10;
					
			audio_play_sound(snd_smash, 7, false);
		
		other.state = PLAYERSTATE.HURT;
		other.hp -= 10;
		}

			
	with (other.id != attack_id_receiver) {
		
		//show_debug_message( "victime id" + string(id));

		// if ennemy isn't already hurt OR dead OR invincible
		// AND the target isn't the attack origin player

		//if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) && (other.attack_id_receiver) != id && (!is_invicible) {
		
		
		//	if (point_direction(other.x, other.y, x, y) > 90) {
		//		hitfrom = -1;// attack from the right
		//	} else {
		//		hitfrom = 1;//attack from the left
		//	}
		//	facing = -hitfrom;//(faces the origin of the attack)
		//	flash = 10;
					
		//	audio_play_sound(snd_smash, 7, false);
		
		//state = PLAYERSTATE.HURT;
		//hp -= 10;
		//}
	
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




