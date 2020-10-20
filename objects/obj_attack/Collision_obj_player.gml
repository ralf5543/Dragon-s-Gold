/// @description Hit ennemy

if (can_hit == true) {//so apply only once
	show_debug_message("Prends ça, vile " + string(other.character));

	with (other) {
		flash = 10;
		//hitfrom = other.direction;
		state = PLAYERSTATE.HURT;
	}
	can_hit = false;
}