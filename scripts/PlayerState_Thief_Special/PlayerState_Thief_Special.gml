
function PlayerState_Thief_Special(){
	
	if (place_meeting(x, y + 1, obj_wall) and energy >= 50) {// on the floor
		
		if (skeleton_animation_get() != "rolling") {
			skeleton_animation_set("rolling")
		}
		if (can_play_roll) {
			audio_play_sound(snd_roll, 6, false);
			//energy = energy - 50;
		}
		can_play_roll = false;
		
		var num = skeleton_animation_get_frames(skeleton_animation_get());
		
		if (image_index > 10) and (image_index < (num - 50)) {
			is_invicible = true;
			image_alpha = 1;
		} else {
			is_invicible = false;
			image_alpha = 1;//just to be sure it doesn't blink
		}		
		
		if (place_meeting(x + (rolling_distance * facing), y, obj_wall)) {
			//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
			while (!place_meeting(x + sign(rolling_distance * facing), y, obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    x += sign(rolling_distance * facing);
			}
			rolling_distance = 0;
		} 
		
		x += rolling_distance * facing;// the player will be thrown to the left or the right

	}
	
}