/// @description Insert description here
// You can write your code in this editor

if (room != rm_start) {
			
	for (var i = 0; i < halls_list_size; i ++) {
		show_debug_message("azerty");
		if (!instance_exists(ds_list_find_value(halls_list, i))) {
			show_debug_message("zzzzzzz");
			instance_create_layer(x, y, "layer_control", ds_list_find_value(halls_list, i));
		}
	}
	
	for (i = 0; i < start_players; i ++) {	
		show_debug_message("obj_player.pad_num: " + string(obj_player.pad_num));
		show_debug_message("halls_list_size : " + string(halls_list_size));
				
		
	}
	
	with (obj_player) {
		if (pad_num == 0) {
			toto = choose(0, 1);
			show_debug_message("toto : " + string(toto));
			x = ds_list_find_value(other.halls_list, 0).hall_x + 100;
			y = ds_list_find_value(other.halls_list, toto).hall_y - 100;
		}
	}
		
}