/// @description Insert description here
// You can write your code in this editor

if (room != rm_start) {
	door_left = instance_create_layer(hall_x - 16, hall_y - 64, "layer_walls", obj_door);
	door_left.side = "left";
	//door_left.hall_id_receiver = hall_id_owner;
	door_right = instance_create_layer(room_width - 16, hall_y - 64, "layer_walls", obj_door);
	door_right.side = "right";
}