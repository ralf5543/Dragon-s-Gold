/// @description Doors use

if (other.can_animate) {
	audio_play_sound(snd_door_opened, 5, 0);
	//left door
	if (other.side == "left") {
		//go to next hall
		other.image_speed = 1;
		//x = instance_find(obj_door, other.door_number - 1).x - 32;
		//y = instance_find(obj_door, other.door_number - 1).y + 64;
	
	//right door
	} else {
		//go to previous hall
		other.image_speed = 1;
		x = instance_find(obj_door, other.door_number + 1).x + 48;
		y = instance_find(obj_door, other.door_number + 1).y + 64;
	}
	other.can_animate = false;
}

