

with (other) {
	if (!is_invicible) {
		if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
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
	

}


with (obj_player.gamepad_id_owner) {
	if (skeleton_animation_get() == "attack") {
		has_touched_ennemy1 = true;
	}
	
	if (skeleton_animation_get() == "combo1") {
		has_touched_ennemy2 = true;	
	}
}

