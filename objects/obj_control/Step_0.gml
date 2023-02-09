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
			
			//menu	
			menu_x_target = gui_width + 200;
	    }
	}
	
	if paused == true {
		//pause alarms here
	    alarm[0]++;
		
		//menu
		menu_x_target = gui_width - gui_margin;
		menu_comitted = -1;
		menu_control = true;
		menu_cursor = 2;
	 }
}

//========------- MENU
if (room == rm_start) {
	menu[2] = "New Game";
	menu[1] = "Options";
	menu[0] = "Quit";
} else {
	menu[2] = "Back to main menu";
	menu[1] = "Options";
	menu[0] = "Quit";
}

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

function validateMenuItem() {
	//paused = false;
	menu_x_target = gui_width + 200;
	menu_comitted = menu_cursor;
	menu_control = false;
}

//keyboard controls
if (menu_control) {
	if(free_stick = 1) {
	   	if (keyboard_check_pressed(vk_up)) or (abs(min(gamepad_axis_value(0, gp_axislv), 0))) {
	   		menu_cursor ++;
   	 
	   		if (menu_cursor >= menu_items) {
	   			menu_cursor = 0;
	   		}
	   	}
    
	   	if (keyboard_check_pressed(vk_down)) or (max(gamepad_axis_value(0, gp_axislv), 0)) {
	   		menu_cursor --;
   	 
	   		if (menu_cursor < 0) {
	   			menu_cursor = menu_items - 1;
	   		}
	   	}
   	 
	   	free_stick = 0;
	   	alarm[1] = room_speed / 6;
	}
    
	if (keyboard_check_pressed(vk_enter)) or (gamepad_button_check_pressed(0, gp_face1)) or (gamepad_button_check_pressed(0, gp_start)) {
		validateMenuItem()
	}
		
   
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) {
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if (mouse_check_button_pressed(mb_left)) {
			validateMenuItem()
		}
	}

		 
	if (menu_comitted != -1) {
			if (room == rm_start) {
				switch (menu_comitted) {
					case 2: room_goto(rm_select);
					break;
					case 0: game_end();
					break;
				}
			} else {
				switch (menu_comitted) {
					case 2: game_restart();
					break;
					case 0: game_end();
					break;
				}
			}
	}
		

}


