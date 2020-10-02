/// @description Insert description here
// You can write your code in this editor


if (room == rm_start) {
	//!=0, to let the time of the gamepads detection
	if (ready_players >= total_pads) && (total_pads != 0) {
		show_debug_message("total_pads : " + string(total_pads));
	   show_debug_message("ready_players : " + string(ready_players));
	    room_goto_next();
	}
}