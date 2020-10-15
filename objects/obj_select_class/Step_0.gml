/// @description Select class actions

// B button to cancel choice and select again
if (gamepad_button_check_pressed(player_number, gp_face2)) {
	menu_control = true;
	obj_control.ready_players --;
}

// if menu is active (class not yet selected)
if (menu_control) {
	
	if(free_stick = 1) {//see create event...
		
		// ========---------------- MOVE TO THE LEFT
	    if (abs(min(gamepad_axis_value(player_number, gp_axislh), 0))) {
		
			//if cursor not at extreme left of the select grid -> move it to the left
			if (cursor.x != x) {	
				cursor.x -= portrait_size;
				menu_cursor --;//select the the previous class
			}
				
			gamepad_id_receiver.character = menu[menu_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
			free_stick = 0;
		    alarm[0] = room_speed / 6;
		} 
		
		// ========---------------- MOVE TO THE RIGHT
		if (max(gamepad_axis_value(player_number, gp_axislh), 0)) {

			//if cursor at last portrait
			if (cursor.y == y + (floor(menu_items / menu_columns) * portrait_size)) && (cursor.x == x + (portrait_size * (menuFilled - 1))) {	
				//don't do anything...
		
			} else {
				//if cursor not at extreme right of the select grid -> move it to the left
				if (cursor.x != x + portrait_size * (menu_columns - 1)) {	
					cursor.x += portrait_size;
					menu_cursor ++;//select the the next class
				}
			}
			
			
			gamepad_id_receiver.character = menu[menu_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
		    free_stick = 0;
		    alarm[0] = room_speed / 6;
		}
		
		// ========---------------- MOVE UP
		if (abs(min(gamepad_axis_value(player_number, gp_axislv), 0))) {
			
			// if cursor not on first line of the grid
			if (cursor.y != y) {	
				cursor.y -= portrait_size;
				// select the X preivous class (when X = columns number)
				menu_cursor = menu_cursor - menu_columns;
			}
			gamepad_id_receiver.character = menu[menu_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
		    free_stick = 0;
		    alarm[0] = room_speed / 6;
		}
		
		
		// ========---------------- MOVE DOWN
		if (max(gamepad_axis_value(player_number, gp_axislv), 0)) {		
		
				//if before last floor AND no portrait below it
			    if ((cursor.y == y + (floor((menu_items / menu_columns) -1) * portrait_size))) && (cursor.x >= x + (portrait_size * menuFilled)) {	
					// does nothing...			
				} else {
					if (cursor.y != y + (floor(menu_items / menu_columns)* portrait_size)) {	
					cursor.y += portrait_size;
					menu_cursor = menu_cursor + menu_columns;
				}
			}
			
			gamepad_id_receiver.character = menu[menu_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
		    free_stick = 0;
		    alarm[0] = room_speed / 6;
		} 
	}
	
	

	
	// A button to valid player's choice
	if (gamepad_button_check_pressed(player_number, gp_face1)) {

		menu_control = false;
		
		gamepad_id_receiver.character = menu[menu_cursor];
		show_debug_message("gamepad_id_receiver.character : " + string(gamepad_id_receiver.character));
		obj_control.ready_players ++;
		show_debug_message("ready_players : " + string(obj_control.ready_players));
	}
}