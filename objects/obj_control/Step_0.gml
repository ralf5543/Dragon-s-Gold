/// @description Controls

// On Start menu page, launch the game when all players have selected their character
if (room == rm_select) {
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
} else if (room == rm_game) {  
	if (door_calculate) {
		//attributes an order to each existing DOOR instance
		for (var i = 0; i < instance_number(obj_door); i ++) {
			instance_find(obj_door, i).door_number = i;
		}
		//attributes an order to each existing STAIRWAY instance
		for (var i = 0; i < instance_number(obj_stairway); i ++) {
			instance_find(obj_stairway, i).stairway_number = i;
		}
		
		door_calculate = false;
	}
	
	if (global.game_state == "over") {
		
		if (can_end_game) {
			alarm[0] = 384;
			can_end_game = false;
		}
	}
	
	//========------- PAUSE
	if keyboard_check_pressed(ord("P")) or (gamepad_button_check_pressed(0, gp_start)) or (gamepad_button_check_pressed(1, gp_start)) or (gamepad_button_check_pressed(2, gp_start)) or (gamepad_button_check_pressed(3, gp_start)) {
	    paused = !paused;
		
	    if paused == false {
	        instance_activate_all();
	        surface_free(paused_surf);
	        paused_surf = -1;
	    }
	}
	
	if paused == true {
		//pause alarms here
	    alarm[0]++;
	 }
}
