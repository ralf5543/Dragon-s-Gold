/// @description Controls

// On Start menu page, launch the game when all players phave selected their character
if (room == rm_start) {
	//!=0, to let the time of the gamepads detection
	//if (ready_players >= total_pads) && (total_pads != 0) {
	if (ready_players >= start_players) && (start_players != 0) {
	    room_goto_next();
	}
}