/// @description Hit ennemy

with (other) {
	if (!is_invicible) && (no_wall) {
		if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
			if (point_direction(other.x, other.y, x, y) > 90) {
				hitfrom = -1;// attack from the right
			} else {
				hitfrom = 1;//attack from the left
			}
		
			facing = -hitfrom;//(faces the origin of the attack)
			flash = 10;
		
			audio_play_sound(snd_arrow_hit, 7, false);
		
			state = PLAYERSTATE.HURT;
			hp -= 10;
		}
	}
}

instance_destroy();
