image_xscale = facing;//so 1 or -1 (-1 is flipping the sprite)
image_yscale = 1
		

switch (state) {
	case PLAYERSTATE.FREE : 
	PlayerState_Free();
	break;
		
	case PLAYERSTATE.HURT : 
	PlayerState_Hurt();
	break;
		
	case PLAYERSTATE.DEAD : 
	PlayerState_Dead();
	break;
		
	case PLAYERSTATE.ATTACK : 
	PlayerState_Attack();
	break;
		
	case PLAYERSTATE.SPECIAL : 
	if (character == "ranger") {
		PlayerState_Ranger_Special();
			
	} else if (character == "knight") {
		PlayerState_Knight_Special();
			
	} else if (character == "wizard") {
		PlayerState_Wizard_Special();
	}
	break;
		
	case PLAYERSTATE.WON : 
	PlayerState_Won();
	break;
		
	case PLAYERSTATE.LOSE : 
	PlayerState_Lose();
	break;
}
	
if (state != PLAYERSTATE.SPECIAL) && (character == "knight") {
	// todo : verify in a game with several knights
	if (instance_exists(obj_shield)) {
		instance_destroy(obj_shield);
	}
}
