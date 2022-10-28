/// @description Doors use

audio_play_sound(snd_door_opened, 5, 0);
//left door
if (other.side == "left") {
	//go to next hall
	x = instance_find(obj_door, other.door_number - 1).x - 64;
	y = instance_find(obj_door, other.door_number - 1).y + 128;
	
//right door
} else {
	//go to previous hall
	x = instance_find(obj_door, other.door_number + 1).x + 96;
	y = instance_find(obj_door, other.door_number + 1).y + 128;
}

