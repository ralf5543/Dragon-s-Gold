/// @description Select class variables





menu_font = fnt_menu;
menu_itemHeight = font_get_size(menu_font);
//menu_committed = -1;

//just to active the menu
menu_control = true;

// Better for perfs to enter last array entries first
menu[6] = "wizard";
menu[5] = "ranger";
menu[4] = "wizard";
menu[3] = "knight";
menu[2] = "ranger";
menu[1] = "wizard";
menu[0] = "knight";

//number of items in menu array
menu_items = array_length(menu);

//the current selected item
menu_cursor = 0;

cursor = instance_create_layer(x, y, "Instances_1", obj_cursor);
portrait_size = 128;// size of the portrait square

Check_Pad = 1;