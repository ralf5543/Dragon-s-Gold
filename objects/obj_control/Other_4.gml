/// @description Insert description here


if (room != rm_start) {
	/*hall_A = instance_create_layer(x, y, "layer_walls", obj_hall);
	with (hall_A) {
		hall_y = 448;
		hall_name = "Salle A";
		door_left = instance_create_layer(hall_x - 16, hall_y - 64, "layer_walls", obj_door);
		door_left.side = "left";
		door_left.hall_id_receiver = hall_id_owner;
		door_right = instance_create_layer(room_width - 16, hall_y - 64, "layer_walls", obj_door);
		door_right.side = "right";
	}

	hall_B = instance_create_layer(x, y, "layer_walls", obj_hall);
	with (hall_B) {
		hall_y = 1600;
		hall_name = "Salle B";
		door_left = instance_create_layer(hall_x - 16, hall_y - 64, "layer_walls", obj_door);
		door_left.side = "left";
		door_right = instance_create_layer(room_width - 16, hall_y - 64, "layer_walls", obj_door);
		door_right.side = "right";
	}

	hall_C = instance_create_layer(x, y, "layer_walls", obj_hall);
	with (hall_C) {
		hall_y = 2752;
		hall_name = "Salle C";
		door_left = instance_create_layer(hall_x - 16, hall_y - 64, "layer_walls", obj_door);
		door_left.side = "left";
		door_right = instance_create_layer(room_width - 16, hall_y - 64, "layer_walls", obj_door);
		door_right.side = "right";
	}*/

	//list of all castle rooms objets, used or not
	halls_list = ds_list_create();
	ds_list_add(halls_list, obj_hall_A);
	ds_list_add(halls_list, obj_hall_B);
	ds_list_add(halls_list, obj_hall_C);

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
		//show_debug_message("obj_hall.door_left: " + string(obj_hall.door_left));
		//obj_hall.door_left.door_number = i;
		//show_debug_message("door_A_left (control): " + string(hall_A.door_left));
		//door_left.door_number = 1;
		if (!instance_exists(ds_list_find_value(halls_list, i))) {
			instance_create_layer(x, y, "layer_walls", ds_list_find_value(halls_list, i));
			//door_left = instance_create_layer(hall_x - 16, hall_y - 64, "layer_walls", obj_door);
			//door_right = instance_create_layer(room_width - 16, hall_y - 64, "layer_walls", obj_door);
			//show_debug_message("hall_y: " + string(hall_y));
			
		}
	}

	
	with (obj_player) {
		//Places each player in a different used hall, at 1 tile from left of it
		x = ds_list_find_value(other.halls_list, pad_num).hall_x + 64;
		y = ds_list_find_value(other.halls_list, pad_num).hall_y;
	}
	
	
		
}