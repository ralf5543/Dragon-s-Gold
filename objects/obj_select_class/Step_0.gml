/// @description Select class actions

// B button to cancel choice and select again
if (gamepad_button_check_pressed(player_number, gp_face2)) {
	selectClass_control = true;
	obj_control.ready_players --;
}

if (init_player_selection == true) {
	//gives the next skin to each player
	gamepad_id_receiver.sprite_index = asset_get_index("spr_" + selectClass[player_number]);

	
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
				MoveCursor();
			}
				
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
					MoveCursor();
				}
			}
		}
		
		// ========---------------- MOVE UP
		if (abs(min(gamepad_axis_value(player_number, gp_axislv), 0))) {
			
			// if cursor not on first line of the grid
			if (cursor.y != y) {	
				cursor.y -= portrait_size;
				// select the X previous class (when X = columns number)
				selectClass_cursor = selectClass_cursor - selectClass_columns;
				MoveCursor();
			}
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
					MoveCursor();
				}
			}
		} 
	}
	
	// A button to valid player's choice
	if (gamepad_button_check_pressed(player_number, gp_face1)) or (keyboard_check_pressed(vk_tab)) {
		//audio_sound_pitch(snd_tada, choose(.8, 1, 1.2));
		//audio_play_sound(snd_tada, 8, false);
		
		selectClass_control = false;// deactive the class selector		
		gamepad_id_receiver.character = selectClass[selectClass_cursor];// gives the character the selected class
		obj_control.ready_players ++;//tells the Controller that 1 more player pushed the start button
		gamepad_id_receiver.isActive = true;//tells the Controller that the active player is ready to play


//====================-------------------- Check if a same character is taken by multi players, and if so, give each one a different skin

		switch (gamepad_id_receiver.character) {
			case "knight" : 
			obj_control.knight_ready_players ++
			same_characters_number = obj_control.knight_ready_players; 
			break;
			
			case "ranger" : 
			obj_control.ranger_ready_players ++
			same_characters_number = obj_control.ranger_ready_players; 
			break;
			
			case "wizard" : 
			obj_control.wizard_ready_players ++
			same_characters_number = obj_control.wizard_ready_players; 
			break;
		}
		

		switch (same_characters_number) {
							
			case 2 : 
			with(gamepad_id_receiver) {
				skeleton_skin_set("alt1");
			}

			break;
							
			case 3 : 
			with (gamepad_id_receiver) {
				skeleton_skin_set("alt2");
			}
			break;
							
			case 4 :
			with (gamepad_id_receiver) {
				skeleton_skin_set("alt3");
			}
			break;
		
			default :
			with (gamepad_id_receiver) {
				skeleton_skin_set("standard");
				break;
			}	
		}


		with(gamepad_id_receiver) {
		
			if (skeleton_animation_get() != "victory") {
				skeleton_animation_set("victory")
			}
		}
	}
}
