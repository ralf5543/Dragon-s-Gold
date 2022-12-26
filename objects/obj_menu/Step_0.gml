/// @description Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

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
		alarm[0] = room_speed / 6;
	}
	
	if (keyboard_check_pressed(vk_enter)) or (gamepad_button_check_pressed(0, gp_face1)) {
		menu_x_target = gui_width + 200;
		menu_comitted = menu_cursor;
		menu_control = false;
	}

	if (menu_comitted != -1) {
		switch (menu_comitted) {
			case 2: default : room_goto(rm_select); break;
			case 0: default : game_end(); break;
		}
	}
}























