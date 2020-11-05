/// @description Insert description here


if (room != rm_start) {

	//list of all castle roof rooms objets, used or not
	halls_roof_list = ds_list_create();
	ds_list_add(halls_roof_list, obj_hall_roof_A);
	ds_list_add(halls_roof_list, obj_hall_roof_B);
	ds_list_add(halls_roof_list, obj_hall_roof_C);
	ds_list_add(halls_roof_list, obj_hall_roof_D);

	//list of all castle middle rooms objets, used or not
	halls_middle_list = ds_list_create();
	ds_list_add(halls_middle_list, obj_hall_middle_A);
	ds_list_add(halls_middle_list, obj_hall_middle_B);
	ds_list_add(halls_middle_list, obj_hall_middle_C);
	ds_list_add(halls_middle_list, obj_hall_middle_D);

	//list of all castle ground rooms objets, used or not
	halls_ground_list = ds_list_create();
	ds_list_add(halls_ground_list, obj_hall_ground_A);
	ds_list_add(halls_ground_list, obj_hall_ground_B);
	ds_list_add(halls_ground_list, obj_hall_ground_C);
	ds_list_add(halls_ground_list, obj_hall_ground_D);

	//shuffle the list and remove (actually) the last of them
	ds_list_shuffle(halls_roof_list);
	ds_list_delete(halls_roof_list, 3);
	
	ds_list_shuffle(halls_middle_list);
	ds_list_delete(halls_middle_list, 3);
	
	ds_list_shuffle(halls_ground_list);
	ds_list_delete(halls_ground_list, 3);


	//get the number of halls used
	halls_roof_list_size = ds_list_size(halls_roof_list);	
	halls_middle_list_size = ds_list_size(halls_middle_list);	
	halls_ground_list_size = ds_list_size(halls_ground_list);	
		
	// Create halls objects instances
	for (var i = 0; i < halls_roof_list_size; i ++) {

		if (!instance_exists(ds_list_find_value(halls_roof_list, i))) {
			hall_roof = instance_create_layer(x, y, "layer_walls", ds_list_find_value(halls_roof_list, i));
			hall_roof.hall_number = i;
		}
	}
		
	// Create halls objects instances
	for (var i = 0; i < halls_middle_list_size; i ++) {

		if (!instance_exists(ds_list_find_value(halls_middle_list, i))) {
			hall_middle = instance_create_layer(x, y, "layer_walls", ds_list_find_value(halls_middle_list, i));
			hall_middle.hall_number = i;
		}
	}
		
	// Create halls objects instances
	for (var i = 0; i < halls_ground_list_size; i ++) {

		if (!instance_exists(ds_list_find_value(halls_ground_list, i))) {
			hall_ground = instance_create_layer(x, y, "layer_walls", ds_list_find_value(halls_ground_list, i));
			hall_ground.hall_number = i;
		}
	}
	
	//creates a staiwary in a random hall at each floor
	ds_list_find_value(halls_roof_list, random(halls_roof_list_size)).has_stairs = true;
	ds_list_find_value(halls_middle_list, random(halls_middle_list_size)).has_stairs = true;
	ds_list_find_value(halls_ground_list, random(halls_ground_list_size)).has_stairs = true;
	
	

	//==================-------------- Create treasure chest at random position
	var chest = instance_create_layer(0, 0, "layer_walls", obj_chest);
	Random_Position(chest);


	//============================---------------------------- Create keys at random positions
	
	//======-------- BRONZE keys
	for (var i = 0; i < 3; i ++) {
		var new_item = instance_create_layer(0, 0, "layer_walls", obj_key);
		Random_Position(new_item);
		
		new_item.value = "bronze";

	}
	
	
	//======-------- SILVER keys
	for (var i = 0; i < 3; i ++) {
		var new_item = instance_create_layer(0, 0, "layer_walls", obj_key);
		Random_Position(new_item);
		
		new_item.value = "silver";

	}
	
	
	//======-------- GOLD keys
	for (var i = 0; i < 3; i ++) {
		var new_item = instance_create_layer(0, 0, "layer_walls", obj_key);
		Random_Position(new_item);
		
		new_item.value = "gold";

	}
	

	//==================-------------- Players starting position
	with (obj_player) {
		//Places each player in a different used hall, at 1 tile from left/right from it
		
		if (pad_num == 0) {			
			x = ds_list_find_value(other.halls_roof_list, 0).hall_x + 128;
			y = ds_list_find_value(other.halls_roof_list, 0).hall_y - 32;

		} else if (pad_num == 1) {
			x = room_width - 128;
			y = ds_list_find_value(other.halls_ground_list, ds_list_size(other.halls_ground_list) -1).hall_y - 32;
			facing = -1;

		} else if (pad_num == 2) {
			x = room_width - 128;;
			y = ds_list_find_value(other.halls_roof_list, ds_list_size(other.halls_ground_list) -1).hall_y - 32;
			facing = -1;

		} else {
			x = ds_list_find_value(other.halls_ground_list, 0).hall_x + 128;
			y = ds_list_find_value(other.halls_ground_list, 0).hall_y - 32;
		}
		
		//starting position at game launch AND when players dies
		xstart = x;
		ystart = y;
	}	
	
}