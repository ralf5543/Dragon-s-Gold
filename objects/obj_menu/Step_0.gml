/// @description Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

function validateMenuItem() {
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
   	 alarm[0] = room_speed / 6;
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
	   	 switch (menu_comitted) {
	   		 case 2: default : room_goto(rm_select); break;
	   		 case 0: default : game_end(); break;
	   	 }
    }
}

















