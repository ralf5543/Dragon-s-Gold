/// @description Select class actions

//keyboard controls
if (menu_control) {
	if (gamepad_button_check_pressed(player_number, gp_padu)) {
		menu_cursor ++;
	   
		//if on first item, go to last item if key up
		if (menu_cursor >= menu_items) {
		    menu_cursor = 0;
		}

	}
	
	if (gamepad_button_check_pressed(player_number, gp_padd)) {
		menu_cursor --;
	   
		//if on last item, go to first item if key down
		if (menu_cursor < 0) {
		    menu_cursor = menu_items - 1;
		}
	}
	
	if (gamepad_button_check_pressed(player_number, gp_face1)) {
		//move the menu outside the screen, to the right
		menu_x_target += menu_width;
		menu_committed = menu_cursor;
		//menu_control = false;
		

			show_debug_message("menu_committed : " + string(menu[menu_committed]));
			//character = menu[menu_committed];
			//obj_player.character = menu[menu_committed];
			gamepad_id_receiver.character = menu[menu_committed];
			obj_control.ready_players ++;
			show_debug_message("ready_players : " + string(obj_control.ready_players));
	}
}