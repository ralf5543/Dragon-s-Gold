/// @description Insert description here
// You can write your code in this editor

	
if (gamepad_button_check_pressed(pad_num, gp_padd)) {

	if (other.stairway_floor == "roof") || (other.stairway_floor == "middle") {
		audio_play_sound(snd_stairs, 5, 0);
		x = instance_find(obj_stairway, other.stairway_number + 1).x + 32;
		y = instance_find(obj_stairway, other.stairway_number + 1).y + 64;
	}
			
	
} else if (gamepad_button_check_pressed(pad_num, gp_padu)) {

	if (other.stairway_floor == "ground") || (other.stairway_floor == "middle") {
		audio_play_sound(snd_stairs, 5, 0);
		x = instance_find(obj_stairway, other.stairway_number - 1).x + 32;
		y = instance_find(obj_stairway, other.stairway_number - 1).y + 64;
	}
}


