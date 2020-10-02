/// @description Select class variables

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

//so the menu is not stuck to the right and bottom of the screen
gui_margin = 32;

menu_width = gui_width;
menu_height = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;

menu_font = fnt_menu;
menu_itemHeight = font_get_size(menu_font);
menu_committed = -1;

//just to active the menu
menu_control = true;

// Better for perfs to enter last array entries first
menu[2] = "knight";
menu[1] = "wizard";
menu[0] = "ranger";

//number of items in menu array
menu_items = array_length(menu);

//the current selected item
menu_cursor = 2;

