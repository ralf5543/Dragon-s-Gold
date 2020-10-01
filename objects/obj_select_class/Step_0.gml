/// @description Insert description here
// You can write your code in this editor

//so the menu smoothly goes to the left

//keyboard controls
if (menu_control) {
	if (gamepad_button_check_pressed(obj_player.pad_num, gp_padu)) {
		menu_cursor ++;
	   
		//if on first item, go to last item if key up
		if (menu_cursor >= menu_items) {
		    menu_cursor = 0;
		}
		show_debug_message("vers le haut");
	}
	
	if (gamepad_button_check_pressed(obj_player.pad_num, gp_padd)) {
		menu_cursor --;
	   
		//if on last item, go to first item if key down
		if (menu_cursor < 0) {
		    menu_cursor = menu_items - 1;
		}
		show_debug_message("vers le bas");
	}
	
	if (gamepad_button_check_pressed(obj_player.pad_num, gp_face1)) {
		//move the menu outside the screen, to the right
		menu_x_target += menu_width;
		menu_committed = menu_cursor;
		menu_control = false;
		room_goto_next();

			show_debug_message("menu_committed : " + string(menu[menu_committed]));
			//character = menu[menu_committed];
			obj_player.character = menu[menu_committed];

	}
}

/*if (menu_width > gui_width + 150) && (menu_committed != -1) {
	switch (menu_committed) {
		
		//new game
		// calls the script with black rectangle transition,
		//with "go to next room" argument
		case 2 : slideTransition(TRANS_MODE.NEXT);
		break;
		
		// continue
		case 1 : {
			show_debug_message("click continue : SAVEFILE : " + string(SAVEFILE));
			//show_debug_message("click continue : file : " + file);
			if (!file_exists(SAVEFILE)) {
				show_debug_message("save NOT exists");
				// if no save, start a  new game
				slideTransition(TRANS_MODE.NEXT);
			} else {
				show_debug_message("save exists");
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				slideTransition(TRANS_MODE.GOTO, target);
			}
		}
		break;
		
		// quit game
		case 0 : game_end();
		break;
	}
}

*/