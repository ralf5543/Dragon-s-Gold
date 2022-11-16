/// @description Insert description here
// You can write your code in this editor



with (obj_player.gamepad_id_owner) {
	nearest_floor = instance_nearest(x, y, obj_wall).y;
}

x = obj_player.gamepad_id_owner.x + 5;
y = obj_player.nearest_floor - 28;














