
if (can_hit == true) {//so apply only once
	show_debug_message("ouahhhh")

	with (other) {
		show_debug_message("other.attack_id_receiver : " + string(other.attack_id_receiver));
		show_debug_message("id : " + string(id));
		
		if(other.attack_id_receiver != id) {
			if (!is_invicible) {
				if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
					if (point_direction(other.x, other.y, x, y) > 90) {
						hitfrom = -1;// attack from the right
					} else {
						hitfrom = 1;//attack from the left
					}
					facing = -hitfrom;//(faces the origin of the attack)
					flash = 10;
				}
		
				audio_play_sound(snd_smash, 7, false);
		
				state = PLAYERSTATE.HURT;
				hp -= 10;
			}
		}
	}
	can_hit = false;
}
