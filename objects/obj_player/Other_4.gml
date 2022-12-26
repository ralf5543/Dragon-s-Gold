/// @description Insert description here
// You can write your code in this editor

if (room == rm_game) {
	
	var shadow = instance_create_layer(x, y, "layer_players", obj_shadow);
	with (shadow) {
		shadow_id_receiver = other.gamepad_id_owner;
	}
}