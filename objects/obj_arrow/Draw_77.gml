/// @description Insert description here

// not good, find a better way ;(
if (place_meeting(x + 16, y, obj_wall)) {
	no_wall = false;
	
	if (can_play_sound) {
		speed = 0;
		vsp = 0

		audio_play_sound(snd_arrow_wall, 4, false);
		can_play_sound = false;
		
		//let the arrow stuck in a wall for 3 seconds
		alarm[0] = room_speed * 3;
	}
}
