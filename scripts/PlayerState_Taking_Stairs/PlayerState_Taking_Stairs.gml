
function PlayerState_Taking_Stairs(){
	
	if (can_take_stairs) {
		if (skeleton_animation_get() != "looking-up") {
			skeleton_animation_set("looking-up");		
		}
		alarm[6] = 64;
		
		can_take_stairs = false;
	}
	
	if (is_taking_stairs) {
		image_speed = 1;
		if (skeleton_animation_get() != "walk") {
			skeleton_animation_set("walk");		
		}
		
		if (can_footStep == true) {
			audio_play_sound(choose(snd_footstep1, snd_footstep2, snd_footstep3, snd_footstep4), 1, false);
			
			if (character == "knight") {
				audio_play_sound(snd_metal_step, 5, false, 0.3);

			}
			can_footStep = false;	
			alarm[1] = 20;
		}
		
		is_invicible = true;
		y = y - 0.2;
		//x = x + lengthdir_x(1, instance_nearest(x, y, obj_stairway));
		//x = x + lengthdir_x(1, other.x);
		has_taken_stairs ++;
		
		if (has_taken_stairs >= 96) {
			is_taking_stairs = false;
			state = PLAYERSTATE.FREE;
			is_invicible = false;
			has_taken_stairs = 0;
			can_take_stairs = true;
			has_finished_stairs = true;
		}
	}

}