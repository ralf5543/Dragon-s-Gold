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
	
	

	//==================-------------- Create treasure chest at random positions
	var chest = instance_create_layer(0, 0, "layer_walls", obj_chest);
	chest.x = ds_list_find_value(other.halls_roof_list, 0).hall_x + 600;
	chest.y = ds_list_find_value(other.halls_roof_list, 0).hall_y + 16;
	

	//==================-------------- Create keys at random positions
	var gold_key = instance_create_layer(0, 0, "layer_walls", obj_key);
	var silver_key = instance_create_layer(0, 0, "layer_walls", obj_key);
	var bronze_key = instance_create_layer(0, 0, "layer_walls", obj_key);
	var tutu = instance_create_layer(0, 0, "layer_walls", obj_key);
	
	//var inst = instance_find(OBJECT, irandom(instance_number(OBJECT) - 1));
	gold_key.value = "gold";
	silver_key.value = "silver";
	bronze_key.value = "bronze";
	tutu.value = "bronze";
	//gold_key.x = obj_hall_roof_A.hall_x + 200;
	//gold_key.y = obj_hall_roof_A.hall_y - 32;
	gold_key.x = ds_list_find_value(other.halls_roof_list, 0).hall_x + 200;
	gold_key.y = ds_list_find_value(other.halls_roof_list, 0).hall_y - 32;
	
	silver_key.x = ds_list_find_value(other.halls_roof_list, 0).hall_x + 300;
	silver_key.y = ds_list_find_value(other.halls_roof_list, 0).hall_y - 32;
	
	bronze_key.x = ds_list_find_value(other.halls_roof_list, 0).hall_x + 400;
	bronze_key.y = ds_list_find_value(other.halls_roof_list, 0).hall_y - 32;
	
	tutu.x = ds_list_find_value(other.halls_roof_list, 0).hall_x + 432;
	tutu.y = ds_list_find_value(other.halls_roof_list, 0).hall_y - 32;

	//==================-------------- Players starting position
	with (obj_player) {
		//Places each player in a different used hall, at 1 tile from left of it
		
		if (pad_num == 0) {			
			x = ds_list_find_value(other.halls_roof_list, pad_num).hall_x + 128;
			y = ds_list_find_value(other.halls_roof_list, pad_num).hall_y - 32;

		} else if (pad_num == 1) {
			x = ds_list_find_value(other.halls_roof_list, pad_num).hall_x + 128;
			y = ds_list_find_value(other.halls_roof_list, pad_num).hall_y - 32;

		} else if (pad_num == 2) {
			x = ds_list_find_value(other.halls_roof_list, pad_num).hall_x + 128;
			y = ds_list_find_value(other.halls_roof_list, pad_num).hall_y - 32;

		}
		
		//starting position at game launch AND when players dies
		xstart = x;
		ystart = y;
	}	
	
}