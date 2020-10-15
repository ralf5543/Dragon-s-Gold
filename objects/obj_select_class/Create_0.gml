/// @description Select class variables

//if false, can't use the menu anymore
menu_control = true;

// Better for perfs to enter last array entries first
menu[7] = "wizard";
menu[6] = "wizard";
menu[5] = "ranger";
menu[4] = "wizard";
menu[3] = "knight";
menu[2] = "ranger";
menu[1] = "wizard";
menu[0] = "knight";

//number of items in menu array
menu_items = array_length(menu);

menu_columns = 3;// number of portraits by line

// if == 0, the grid is full of portraits, no empty case at the end of the last line
//if == 1, there's 1 empty space at the end of the grid
//if ==2, 2 empty spaces, etc.
menuFilled = menu_items mod menu_columns;

//the current selected item
menu_cursor = 0;


cursor = instance_create_layer(x, y, "Instances_1", obj_cursor);

portrait_size = 128;// size of the portrait square

free_stick = 1;// if false (0), can't use gamepad stick for a few milliseconds