/// @description Stairs use

if (state != PLAYERSTATE.HURT) {

	if (gamepad_button_check_pressed(pad_num, gp_padd)) && (other.stairway_floor != "ground") {
		stairs_direction = "down";
		state = PLAYERSTATE.TAKINGSTAIRS;
	} else if (gamepad_button_check_pressed(pad_num, gp_padu)) && (other.stairway_floor != "roof") {
		stairs_direction = "up";
		state = PLAYERSTATE.TAKINGSTAIRS;
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

} else {
	//re init variables used with the stairs
	can_take_stairs = true;
	is_taking_stairs = false;
	has_taken_stairs = 0;
	stairs_direction = undefined;
	has_finished_stairs = false;
}
