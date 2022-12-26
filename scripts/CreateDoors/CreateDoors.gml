
function CreateDoors(){
	if (room == rm_game) {
		// creates a door on the extreme left of the room, except if it is the first one of the floor
		if (hall_number > 0) {
			door_left = instance_create_layer(hall_x + 82, hall_y + 32, "layer_walls", obj_door);
			door_left.side = "left";
		}
	
		// =============-------------- ROOF	
		if (hall_floor == "roof") {
			// creates a door on the extreme right of the room, except if it is the last one of the floor
			if (hall_number < obj_control.halls_roof_list_size - 1) {// -1, because list starts from 0
				door_right = instance_create_layer(room_width - 80, hall_y + 32, "layer_walls", obj_door);
				door_right.side = "right";
			}
		}
		
		// =============-------------- MIDDLE
		if (hall_floor == "middle") {
			// creates a door on the extreme right of the room, except if it is the last one of the floor
			if (hall_number < obj_control.halls_middle_list_size - 1) {// -1, because list starts from 0
				door_right = instance_create_layer(room_width - 80, hall_y + 32, "layer_walls", obj_door);
				door_right.side = "right";
			}
		}
		
		// =============-------------- GROUND	
		if (hall_floor == "ground") {
			// creates a door on the extreme right of the room, except if it is the last one of the floor
			if (hall_number < obj_control.halls_ground_list_size - 1) {// -1, because list starts from 0
				door_right = instance_create_layer(room_width - 80, hall_y + 32, "layer_walls", obj_door);
				door_right.side = "right";
			}
		}
	}
}