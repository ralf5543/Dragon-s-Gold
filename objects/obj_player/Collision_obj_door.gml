/// @description Insert description here
// You can write your code in this editor


if (other.side == "left") {
	x = instance_find(obj_door, other.door_number - 1).x - 32;
	y = instance_find(obj_door, other.door_number - 1).y + 64;
} else {
	x = instance_find(obj_door, other.door_number + 1).x + 48;
	y = instance_find(obj_door, other.door_number + 1).y + 64;
}

