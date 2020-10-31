/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x - 16, y, obj_wall)) || (place_meeting(x + 16, y, obj_wall)) {
	if (can_play_sound) {
		speed = 0;
		vsp = 0
		y = y;
		audio_play_sound(snd_arrow_wall, 4, false);
		can_play_sound = false;
		alarm[0] = room_speed * 3;
		show_debug_message("vsp: " + string(vsp));
		show_debug_message("y: " + string(y));
	}
}
