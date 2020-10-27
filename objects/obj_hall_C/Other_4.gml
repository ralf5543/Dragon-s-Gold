/// @description Insert description here
// You can write your code in this editor

if (room != rm_start) {
	if (hall_number != 0) {
		door_left = instance_create_layer(hall_x + 48, hall_y - 64, "layer_walls", obj_door);
		door_left.side = "left";
	}
	
	if (hall_number < obj_control.halls_list_size - 1) {// -1, because list starts from 0
	//door_left.hall_id_receiver = hall_id_owner;
		show_debug_message("obj_control.halls_list_size: " + string(obj_control.halls_list_size));
		show_debug_message("info hall: " + string(hall_number) + string(hall_name));
		door_right = instance_create_layer(room_width - 80, hall_y - 64, "layer_walls", obj_door);
		door_right.side = "right";
	}
}