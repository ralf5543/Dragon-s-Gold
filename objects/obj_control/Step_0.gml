/// @description Controls

// On Start menu page, launch the game when all players phave selected their character
if (room == rm_start) {
	//!=0, to let the time of the gamepads detection
	if (ready_players >= start_players) && (start_players != 0) {
		with (obj_player) {
			if (isActive == false) {
				//destroy instances of all not playing characters
				instance_destroy();
			}				
		}

	    room_goto_next();
	}
}