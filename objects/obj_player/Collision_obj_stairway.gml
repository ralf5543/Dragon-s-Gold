/// @description Stairs use
	
	//go downstairs
if (gamepad_button_check_pressed(pad_num, gp_padd)) {

	if (other.stairway_floor == "roof") || (other.stairway_floor == "middle") {
		audio_play_sound(snd_stairs, 5, 0);
		x = instance_find(obj_stairway, other.stairway_number + 1).x;
		y = instance_find(obj_stairway, other.stairway_number + 1).y + 17;
	}
			
	//go upstairs
} else if (gamepad_button_check_pressed(pad_num, gp_padu)) {

	if (other.stairway_floor == "ground") || (other.stairway_floor == "middle") {
		audio_play_sound(snd_stairs, 5, 0);
		x = instance_find(obj_stairway, other.stairway_number - 1).x;
		y = instance_find(obj_stairway, other.stairway_number - 1).y + 17;
	}
}


