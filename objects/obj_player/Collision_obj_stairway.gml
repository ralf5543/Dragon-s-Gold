/// @description Stairs use

if (state != PLAYERSTATE.HURT) {

	if (free_stick == 1) {

		if (max(gamepad_axis_value(pad_num, gp_axislv), 0)) && (other.stairway_floor != "ground") {
			key_down = undefined;
			stairs_direction = "down";
			state = PLAYERSTATE.TAKINGSTAIRS;
			free_stick = 0;
			alarm[7] = 64;
		} else if (abs(min(gamepad_axis_value(pad_num, gp_axislv), 0))) && (other.stairway_floor != "roof") {
			stairs_direction = "up";
			state = PLAYERSTATE.TAKINGSTAIRS;
			free_stick = 0;
			alarm[7] = 64;
		}
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
