/// @description Hit ennemy

with (other) {
	if (state != PLAYERSTATE.HURT) {
		if (point_direction(other.x, other.y, x, y) > 90) {
			hitfrom = -1;// attack from the right
		} else {
			hitfrom = 1;//attack from the left
		}
		
		facing = -hitfrom;//(faces the origin of the attack)
		flash = 10;
		
		audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
		audio_play_sound(snd_fireball_hit, 9, false);
		
		state = PLAYERSTATE.HURT;
		hp -= 10;
	}
}

instance_destroy();
