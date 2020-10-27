/// @description Insert description here


if (room != rm_start) {

	//list of all castle rooms objets, used or not
	halls_list = ds_list_create();
	ds_list_add(halls_list, obj_hall_A);
	ds_list_add(halls_list, obj_hall_B);
	ds_list_add(halls_list, obj_hall_C);
	ds_list_add(halls_list, obj_hall_D);

	//shuffle the list and remove (actually) the last of them
	ds_list_shuffle(halls_list);
	ds_list_delete(halls_list, 2);
	
	show_debug_message("halls_list: " + string(halls_list));

	//get the number of halls used
	halls_list_size = ds_list_size(halls_list);
	show_debug_message("halls_list_size: " + string(halls_list_size));
	
		
	// Create halls objects instances
	for (var i = 0; i < halls_list_size; i ++) {
		show_debug_message("ds_list_find_value(halls_list, i): " + string(ds_list_find_value(halls_list, i)));

		if (!instance_exists(ds_list_find_value(halls_list, i))) {
			hall = instance_create_layer(x, y, "layer_walls", ds_list_find_value(halls_list, i));
			hall.hall_number = i;
		}
	}

	
	with (obj_player) {
		//Places each player in a different used hall, at 1 tile from left of it
		x = ds_list_find_value(other.halls_list, pad_num).hall_x + 128;
		y = ds_list_find_value(other.halls_list, pad_num).hall_y;
	}	
}