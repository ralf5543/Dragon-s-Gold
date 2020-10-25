/// @description Insert description here


if (room != rm_start) {
		
	// Create halls objects instances
	for (var i = 0; i < halls_list_size; i ++) {
		if (!instance_exists(ds_list_find_value(halls_list, i))) {
			instance_create_layer(x, y, "layer_control", ds_list_find_value(halls_list, i));
		}
	}
	
	for (i = 0; i < start_players; i ++) {	
		//show_debug_message("obj_player.pad_num: " + string(obj_player.pad_num));
		//show_debug_message("halls_list_size : " + string(halls_list_size));
				
		
	}
	
	with (obj_player) {
		//Places each player in a different used hall, at 1 tile from left of it
		x = ds_list_find_value(other.halls_list, pad_num).hall_x + 64;
		y = ds_list_find_value(other.halls_list, pad_num).hall_y;
	}
		
}