
function CreateDoors(){
	if (room != rm_start) {
		// creates a door on the extreme left of the room, except if it is the first one of the floor
		if (hall_number > 0) {
			door_left = instance_create_layer(hall_x + 112, hall_y - 64, "layer_items", obj_door);
			door_left.side = "left";
			door_left.sprite_index = spr_door_left_strip4;
		}
	
		// =============-------------- ROOF	
		if (hall_floor == "roof") {
			// creates a door on the extreme right of the room, except if it is the last one of the floor
			if (hall_number < obj_control.halls_roof_list_size - 1) {// -1, because list starts from 0
				door_right = instance_create_layer(room_width - 142, hall_y - 64, "layer_items", obj_door);
				door_right.side = "right";
				door_right.sprite_index = spr_door_right_strip4;
			}
		}
		
		// =============-------------- MIDDLE
		if (hall_floor == "middle") {
			// creates a door on the extreme right of the room, except if it is the last one of the floor
			if (hall_number < obj_control.halls_middle_list_size - 1) {// -1, because list starts from 0
				door_right = instance_create_layer(room_width - 142, hall_y - 64, "layer_items", obj_door);
				door_right.side = "right";
				door_right.sprite_index = spr_door_right_strip4;
			}
		}
		
		// =============-------------- GROUND	
		if (hall_floor == "ground") {
			// creates a door on the extreme right of the room, except if it is the last one of the floor
			if (hall_number < obj_control.halls_ground_list_size - 1) {// -1, because list starts from 0
				door_right = instance_create_layer(room_width - 142, hall_y - 64, "layer_items", obj_door);
				door_right.side = "right";
				door_right.sprite_index = spr_door_right_strip4;
			}
		}
	}
}