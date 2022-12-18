/// @description Insert description here
// You can write your code in this editor

if (can_play_sound) {
	speed = 0;
	vsp = 0;
	grv = 0;

	audio_play_sound(snd_arrow_wall, 4, false);
	can_play_sound = false;
		
	//let the arrow stuck in a wall for 3 seconds
	alarm[0] = room_speed * 3;
}




















