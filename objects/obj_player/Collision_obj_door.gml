/// @description Doors use

if (state != PLAYERSTATE.HURT) {
	
	// if not crossing door backwards after been hurt, for exemple)	
	if (facing == other.facing) {
		if (other.is_opening) {
	
			if (place_meeting(x,  y + 1, obj_wall)) {
		
				state = PLAYERSTATE.CROSSINGDDOOR;
				audio_play_sound(snd_door_opened, 5, 0);
		
				with(other) {
					skeleton_animation_set("open");
					image_speed = 1;
					is_opening = false;
				}
			}
		}


		//left door

		if (countdown_door < 0) {
			if (other.side == "left") {
				//go to previous hall
				x = instance_find(obj_door, other.door_number - 1).x - 64;
				y = instance_find(obj_door, other.door_number - 1).y -8;
	
			//right door
			} else {
				//go to next hall
				x = instance_find(obj_door, other.door_number + 1).x + 64;
				y = instance_find(obj_door, other.door_number + 1).y -8;
			}
			is_invicible = false;
			state =  PLAYERSTATE.FREE;
	
			//re init variables used with the door
			can_cross_doors = true;
			is_crossing_door = false;
			countdown_door = 64;
	
			// re init door's vars
			with (other) {
				skeleton_animation_set("open");
				skeleton_animation_set_frame(0, 0);
				image_speed = 0;
				is_opening = true;
			}
		}
		}
} else {
//re init variables used with the door
	can_cross_doors = true;
	is_crossing_door = false;
	countdown_door = 64;
	
	// re init door's vars
	with (other) {
		skeleton_animation_set("open");
		skeleton_animation_set_frame(0, 0);
		image_speed = 0;
		is_opening = true;
	}
}
