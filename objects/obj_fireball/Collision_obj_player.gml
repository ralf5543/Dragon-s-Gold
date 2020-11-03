/// @description Hit ennemy

if (can_play_sound) {
	audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
	audio_play_sound(snd_fireball_hit, 6, false);
	can_play_sound = false;
}

sprite_index = spr_fireball_explosion_strip8;
speed = 0;
image_speed = 1;
		

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
		
		
			state = PLAYERSTATE.HURT;
		
			if (other.size == "small") {
				hp -= 10;
			
			} else if (other.size == "medium") {
				hurt_hsp = 6;
				hurt_vsp = -7;
				hp -= 15
			
			} else if (other.size == "large") {
				hurt_hsp = 8;
				hurt_vsp = -9;
				hp -= 20
			}
		}
	}
}

//instance_destroy();
