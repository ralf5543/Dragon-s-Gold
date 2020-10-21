/// @description Hit ennemy

if (can_hit == true) {//so apply only once
	show_debug_message("Prends ça, vile " + string(other.character));

	with (other) {
		if (point_direction(other.x, other.y, x, y) > 90) {
			hitfrom = -1;// attack from the right
		} else {
			hitfrom = 1;//attack from the left
		}
		facing = -hitfrom;//(faces the origin of the attack)
		flash = 10;
		
		state = PLAYERSTATE.HURT;
		
	}
	can_hit = false;
}