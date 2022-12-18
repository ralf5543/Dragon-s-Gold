/// @description Hit ennemy

//so it won't hurt the caster
if (other.id != attack_id_receiver) {

	if (can_play_sound) {
		audio_sound_pitch(snd_fireball_hit, choose(.8, 1, 1.2));
		audio_play_sound(snd_fireball_hit, 6, false);
		can_play_sound = false;
	}

	sprite_index = spr_fireball_explosion;
	speed = 0;
	
	x = other.x;
		

	with (other) {
		if (!is_invicible) {
			if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) && (other.is_deadly) {
				hitfrom = other.fireball_orientation;
		
				facing = hitfrom;//(faces the origin of the attack)
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
				//so it stops hitting the playing during the explosion animation
				other.is_deadly = false;
			}
		}
	
	}
}
