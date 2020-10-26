/// @description Insert description here
// You can write your code in this editor




/*if (other.id != obj_control.hall_A.door_left) {
	show_debug_message("ds_list_find_value(halls_list, 0): " + string(ds_list_find_value(obj_control.halls_list, 0)));
	x = obj_control.hall_A.door_left.x + 200;
	y = obj_control.hall_A.door_left.y - 64;
}*/



if (other.side == "left") {
	x = instance_find(obj_door, other.door_number - 1).x - 100;
	y = instance_find(obj_door, other.door_number - 1).y;
} else {
	x = instance_find(obj_door, other.door_number + 1).x + 100;
	y = instance_find(obj_door, other.door_number + 1).y;
}

