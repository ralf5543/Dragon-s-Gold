/// @description Insert description here
// You can write your code in this editor

if (room != rm_start) {
	
	var toto = instance_create_layer(x, y, "layer_players", obj_shadow);
	toto.shadow_id_receiver = gamepad_id_owner;

	//if (!instance_exists(ds_list_find_value(halls_middle_list, i))) {
	//	hall_middle = instance_create_layer(x, y, "layer_walls", ds_list_find_value(halls_middle_list, i));
	//	hall_middle.hall_number = i;
	//}
}