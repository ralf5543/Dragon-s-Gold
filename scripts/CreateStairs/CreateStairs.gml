// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateStairs(){
	if (room != rm_start) {
		
		if (hall_floor == "roof") {
			
			var newDoor = instance_create_layer(hall_x + 500, hall_y - 96, "layer_items", obj_stairway);
			newDoor.stairway_floor = hall_floor;
		}
		if (hall_floor == "middle") {
			var newDoor = instance_create_layer(hall_x + 500, hall_y - 96, "layer_items", obj_stairway);
			newDoor.stairway_floor = hall_floor;
		}
		if (hall_floor == "ground") {
			var newDoor = instance_create_layer(hall_x + 500, hall_y - 96, "layer_items", obj_stairway);
			newDoor.stairway_floor = hall_floor;
		}
	}
}