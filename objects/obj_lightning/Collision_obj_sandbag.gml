/// @description Insert description here


with (other) {
	if (!is_invicible) {
		if (state != PLAYERSTATE.HURT) && (state != PLAYERSTATE.DEAD) {
			if (other.facing == 1) {
				hitfrom = 1;// attack from the right
			} else {
				hitfrom = -1;//attack from the left
			}
		

			flash = 10;
		
		
			state = PLAYERSTATE.HURT;
		
	
			hp -= 10;

		}
	}
}




















