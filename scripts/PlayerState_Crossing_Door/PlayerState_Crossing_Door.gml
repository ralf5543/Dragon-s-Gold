
function PlayerState_Crossing_Door(){
	if (is_crossing_door) {
		
		is_invicible = true;
		x = x + 1 * (facing);
		countdown_door --;
		
		if (can_footStep == true) {
			audio_play_sound(choose(snd_footstep1, snd_footstep2, snd_footstep3, snd_footstep4), 1, false);
			
			if (character == "knight") {
				audio_play_sound(snd_metal_step, 5, false, 0.3);

			}
			can_footStep = false;	
			alarm[1] = 20;
		}
	}
	
	if (can_cross_doors) {

		if (skeleton_animation_get() != "stand") {
			skeleton_animation_set("stand");				
		}
		alarm[5] = 96;
			
		can_cross_doors = false;
	}

}