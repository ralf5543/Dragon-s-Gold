/// @description Select class variables

//if false, can't use the menu anymore
selectClass_control = true;

// Better for perfs to enter last array entries first
selectClass[7] = "thief";
selectClass[6] = "wizard";
selectClass[5] = "ranger";
selectClass[4] = "knight";
selectClass[3] = "thief";
selectClass[2] = "wizard";
selectClass[1] = "ranger";
selectClass[0] = "knight";

//number of items in menu array
selectClass_items = array_length(selectClass);

selectClass_columns = 3;// number of portraits by line

// if == 0, the grid is full of portraits, no empty case at the end of the last line
//if == 1, there's 1 empty space at the end of the grid
//if ==2, 2 empty spaces, etc.
selectClass_filled = selectClass_items mod selectClass_columns;

//the current selected item
selectClass_cursor = 0;

portrait_size = 128;// size of the portrait square

cursor = instance_create_layer(x - (portrait_size * 1.5), y, "layer_above", obj_cursor);

free_stick = true;// if false, can't use gamepad stick for a few milliseconds
init_player_selection = true;

x -= ((selectClass_columns * portrait_size) / 2);// centers the menu
