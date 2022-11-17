/// @description Attachement and size

with (obj_player.gamepad_id_owner) {
	nearest_floor = instance_nearest(x, y, obj_wall).y;
}

x = obj_player.gamepad_id_owner.x + 5;
y = obj_player.nearest_floor - 28;

//The farthest the character is from the floor, the thinner the shadow is
image_alpha = .8 - ((y - obj_player.gamepad_id_owner.y) / 200);
image_xscale = 1 - ((y - obj_player.gamepad_id_owner.y) / 300);












