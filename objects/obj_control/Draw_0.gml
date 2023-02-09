/// @description Temp gamepads infos
// You can write your code in this editor

if (room == rm_select) {
	var _num = 0;//number of plugged gamepads
	draw_set_color(c_black);

	for (var i = 0; i < 4; i++;) { //4 players max
		var xx = (room_width / 4) * i;// centered on the screen quarter
		var yy = 32;
		
		text_start_player = "";
	
		if gamepad_is_connected(i) {
		    _num++;
			text_start_player = "Press START to join !"
			

		} else {
			text_start_player = "No controller!"
		}
		
		draw_set_halign(fa_center);
		draw_text(xx + (room_width / 8), yy + (room_height / 2), text_start_player);
		draw_set_halign(fa_left);
	}
} else if (room == rm_game) {
	
	

}
