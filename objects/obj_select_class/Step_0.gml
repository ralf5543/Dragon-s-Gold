/// @description Select class actions

//keyboard controls
if (menu_control) {
	
	if(Check_Pad = 1) {
		
		// ========---------------- LEFT
	    if (abs(min(gamepad_axis_value(player_number, gp_axislh), 0))) {
		
			if (cursor.x != x) {	
				cursor.x -= portrait_size;
				menu_cursor --;
			}
		gamepad_id_receiver.character = menu[menu_cursor];
		gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
		Check_Pad = 0;
	    alarm[0] = room_speed / 6;
		} 
		
		// ========---------------- RIGHT
		if (max(gamepad_axis_value(player_number, gp_axislh), 0)) {
			if (cursor.x != x + portrait_size * 2) {	
				cursor.x += portrait_size;
				menu_cursor ++;
			} 

		}
		gamepad_id_receiver.character = menu[menu_cursor];
		gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
	    Check_Pad = 0;
	    alarm[0] = room_speed / 6;
		
		// ========---------------- UP
		if (abs(min(gamepad_axis_value(player_number, gp_axislv), 0))) {
			if (cursor.y != y) {	
				cursor.y -= portrait_size;
				menu_cursor = menu_cursor - 3;
			}
		}
		gamepad_id_receiver.character = menu[menu_cursor];
		gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
	    Check_Pad = 0;
	    alarm[0] = room_speed / 6;
		
		// ========---------------- DOWN
		if (max(gamepad_axis_value(player_number, gp_axislv), 0)) {
			if (cursor.y != y + ((ceil(menu_items / 3) -1) * portrait_size)) {	
				cursor.y += portrait_size;
				menu_cursor = menu_cursor + 3;
			}
		}
		gamepad_id_receiver.character = menu[menu_cursor];
		gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character + "_stand_strip2");
	    Check_Pad = 0;
	    alarm[0] = room_speed / 6;
	}
	
	

	
	
	if (gamepad_button_check_pressed(player_number, gp_face1)) {

		menu_control = false;
		

			//show_debug_message("menu_committed : " + string(menu[menu_committed]));
			//character = menu[menu_committed];
			//obj_player.character = menu[menu_committed];
			gamepad_id_receiver.character = menu[menu_cursor];
			show_debug_message("gamepad_id_receiver.character : " + string(gamepad_id_receiver.character));
			obj_control.ready_players ++;
			show_debug_message("ready_players : " + string(obj_control.ready_players));
	}
}