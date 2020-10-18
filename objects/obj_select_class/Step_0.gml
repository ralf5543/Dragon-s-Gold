/// @description Select class actions

// B button to cancel choice and select again
if (gamepad_button_check_pressed(player_number, gp_face2)) {
	selectClass_control = true;
	obj_control.ready_players --;
}

if (init_player_selection == true) {
	//gives the next skin to each player
	gamepad_id_receiver.sprite_index = asset_get_index("spr_" + selectClass[player_number] + "_stand_strip2");
	
	//moves the cursor to the next portrait for each new player
	if (player_number > selectClass_columns - 1) {
		cursor.x = x + portrait_size * (player_number - selectClass_columns);
		cursor.y = y + (floor(player_number / (selectClass_columns))) * portrait_size;
		
	} else {
		//automatically put the cursor at next line, if needed
		cursor.x = x + portrait_size * player_number;
	}
	
	//assigns the right class to the new player, equal to the cursor position
	selectClass_cursor = player_number;
	
	// so it will run only once, at select class menu creation
	init_player_selection = false;
}


// if menu is active (class not yet selected)
if (selectClass_control) {
	
	
	if(free_stick = 1) {//see create event...
		
		// ========---------------- MOVE TO THE LEFT
	    if (abs(min(gamepad_axis_value(player_number, gp_axislh), 0))) {
		
			//if cursor not at extreme left of the select grid -> move it to the left
			if (cursor.x != x) {	
				cursor.x -= portrait_size;
				selectClass_cursor --;//select the the previous class
			}
				
			gamepad_id_receiver.character = selectClass[selectClass_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
			free_stick = 0;
		    alarm[0] = room_speed / 6;
		} 
		
		// ========---------------- MOVE TO THE RIGHT
		if (max(gamepad_axis_value(player_number, gp_axislh), 0)) {

			//if cursor at last portrait
			if (cursor.y == y + (floor(selectClass_items / selectClass_columns) * portrait_size)) && (cursor.x == x + (portrait_size * (selectClass_filled - 1))) {	
				//don't do anything...
		
			} else {
				//if cursor not at extreme right of the select grid -> move it to the left
				if (cursor.x != x + portrait_size * (selectClass_columns - 1)) {	
					cursor.x += portrait_size;
					selectClass_cursor ++;//select the the next class
				}
			}
			
			
			gamepad_id_receiver.character = selectClass[selectClass_cursor];
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
				selectClass_cursor = selectClass_cursor - selectClass_columns;
			}
			gamepad_id_receiver.character = selectClass[selectClass_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
		    free_stick = false;
		    alarm[0] = room_speed / 6;
		}
		
		
		// ========---------------- MOVE DOWN
		if (max(gamepad_axis_value(player_number, gp_axislv), 0)) {		
		
				//if before last floor AND no portrait below it
			    if ((cursor.y == y + (floor((selectClass_items / selectClass_columns) -1) * portrait_size))) && (cursor.x >= x + (portrait_size * selectClass_filled)) {	
					// does nothing...			
				} else {
					if (cursor.y != y + (floor(selectClass_items / selectClass_columns)* portrait_size)) {	
					cursor.y += portrait_size;
					selectClass_cursor = selectClass_cursor + selectClass_columns;
				}
			}
			
			gamepad_id_receiver.character = selectClass[selectClass_cursor];
			gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
		    free_stick = 0;
		    alarm[0] = room_speed / 6;
		} 
	}
	
	

	
	// A button to valid player's choice
	if (gamepad_button_check_pressed(player_number, gp_face1)) {
		selectClass_control = false;// deactive the class selector		
		gamepad_id_receiver.character = selectClass[selectClass_cursor];// gives the character the selected class
		obj_control.ready_players ++;//tells the Controller that 1 more player pushed the start button
		gamepad_id_receiver.isActive = true;//tells the Controller that the active player is ready to play
	}
}