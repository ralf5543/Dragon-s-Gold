/// @description Temp gamepads infos
// You can write your code in this editor

var _num = 0;//number of plugged gamepads
draw_set_color(c_black);

for (var i = 0; i < 4; i++;) { //4 players max
	var xx = (room_width / 4) * i;// centered on the screen quarter
	var yy = 32;
	
	if gamepad_is_connected(i) {
	    _num++;
		
	    /*draw_text(xx, yy, "Gamepad Slot - " + string(i));
	    draw_text(xx, yy + 20, "Gamepad Type - " + string(gamepad_get_description(i)));
	    draw_text(xx, yy + 40, "Left H Axis - " + string(gamepad_axis_value(i, gp_axislh)));
	    draw_text(xx, yy + 60, "Left V Axis - " + string(gamepad_axis_value(i, gp_axislv)));
	    draw_text(xx, yy + 80, "Right H Axis - " + string(gamepad_axis_value(i, gp_axisrh)));
	    draw_text(xx, yy + 100, "Right V Axis - " + string(gamepad_axis_value(i, gp_axisrv)));   
	    draw_text(xx, yy + 120, "Fire Rate - " + string(gamepad_button_value(i, gp_shoulderrb))); */
		draw_set_halign(fa_center);
		draw_text(xx + (room_width / 8), yy + (room_height / 2), "Press START to join !");
		draw_set_halign(fa_left);
	} else {
		draw_set_halign(fa_center);
		draw_text(xx + (room_width / 8), yy + (room_height / 2), "No controller");
		draw_set_halign(fa_left);
	}
}

