/// @description GUI vars menu setup

gui_width = room_width;
gui_height = room_height;
gui_margin = 32;

menu_x = gui_width + 400;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 15; // lower is faster
menu_font = fnt_menu;
menu_itemheight = font_get_size(menu_font);
menu_comitted = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Options";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = 2;

free_stick = true;





















