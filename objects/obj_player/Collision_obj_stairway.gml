/// @description Stairs use

//taking stairs, up or down
if (gamepad_button_check_pressed(pad_num, gp_padd)) or (gamepad_button_check_pressed(pad_num, gp_padu)) {
	state = PLAYERSTATE.TAKINGSTAIRS;
	//is_taking_stairs = true;
	//alarm[6] = 64;
}

if (gamepad_button_check_pressed(pad_num, gp_padd)) {
	stairs_direction = "down";
} else if (gamepad_button_check_pressed(pad_num, gp_padu)) {
	stairs_direction = "up";
}

	
if (has_finished_stairs == true) {

		//go downstairs
	if (stairs_direction == "down") {

		if (other.stairway_floor == "roof") || (other.stairway_floor == "middle") {
			audio_play_sound(snd_stairs, 5, 0);
			x = instance_find(obj_stairway, other.stairway_number + 1).x;
			y = instance_find(obj_stairway, other.stairway_number + 1).y + 17;
		}

			
		//go upstairs
	} else if (stairs_direction == "up") {

		if (other.stairway_floor == "ground") || (other.stairway_floor == "middle") {
			audio_play_sound(snd_stairs, 5, 0);
			x = instance_find(obj_stairway, other.stairway_number - 1).x;
			y = instance_find(obj_stairway, other.stairway_number - 1).y + 17;
		}

	}
	stairs_direction = undefined;
	
	has_finished_stairs = false;
}


