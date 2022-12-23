

if (other.id != attack_id_receiver) {

	// "is_hurt" var, because "state" get a number, not a FREEPLAYERSTATE. Dunno why...
	if (other.is_invicible == false) && (other.is_hurt == false) && (other.state != PLAYERSTATE.HURT) && (other.state != PLAYERSTATE.DEAD) {

		
		if  (vsp != 0) {	
			if ((x - other.x) > 0) {
				other.hitfrom = -1;// attack from the right
			} else {
				other.hitfrom = 1;//attack from the left
			}

			other.facing = -other.hitfrom;//(faces the origin of the attack)
			other.flash = 10;
					
			audio_play_sound(snd_arrow_hit, 7, false);
		
			other.state = PLAYERSTATE.HURT;
			other.hp -= 10;
			
			AddBlood();
	
			instance_destroy();
		}
	}
}
