/// @description Attachement and size

with (shadow_id_receiver) {
	nearest_floor = instance_nearest(x, y, obj_wall).y;
}

if (shadow_id_receiver) {
	x = shadow_id_receiver.x + 5;
	if (shadow_id_receiver.state == PLAYERSTATE.TAKINGSTAIRS) {
		y = shadow_id_receiver.y + 2;
	} else {
		y = shadow_id_receiver.nearest_floor - 28;
	}
}

if (shadow_id_receiver.state != PLAYERSTATE.TAKINGSTAIRS) {
	//The farthest the character is from the floor, the thinner the shadow is
	image_alpha = .8 - ((y - shadow_id_receiver.y) / 200);
	image_xscale = 1 - ((y - shadow_id_receiver.y) / 300);
}








