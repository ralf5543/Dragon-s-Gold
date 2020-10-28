
function CreateDoors(){
	if (room != rm_start) {
		// creates a door on the extreme left of the room, except if it is the first one of the floor
		if (hall_number > 0) {
			door_left = instance_create_layer(hall_x + 48, hall_y - 64, "layer_walls", obj_door);
			door_left.side = "left";
		}
	
		// creates a door on the extreme right of the room, except if it is the last one of the floor
		if (hall_number < obj_control.halls_list_size - 1) {// -1, because list starts from 0
			door_right = instance_create_layer(room_width - 80, hall_y - 64, "layer_walls", obj_door);
			door_right.side = "right";
		}
	}
}