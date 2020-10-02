/// @description Temp gamepads infos
// You can write your code in this editor


var _num = 0;

	var xx = 32;

for (var i = 0; i < 12; i++;) {
	//var xx = 32 + ((room / i) * _num);
	xx = (128 + (room_width / 4) * i);
	var yy = 32;
	
	if gamepad_is_connected(i) {
	    _num++;
		
	    draw_text(xx, yy, "Gamepad Slot - " + string(i));
	    draw_text(xx, yy + 20, "Gamepad Type - " + string(gamepad_get_description(i)));
	    draw_text(xx, yy + 40, "Left H Axis - " + string(gamepad_axis_value(i, gp_axislh)));
	    draw_text(xx, yy + 60, "Left V Axis - " + string(gamepad_axis_value(i, gp_axislv)));
	    draw_text(xx, yy + 80, "Right H Axis - " + string(gamepad_axis_value(i, gp_axisrh)));
	    draw_text(xx, yy + 100, "Right V Axis - " + string(gamepad_axis_value(i, gp_axisrv)));   
	    draw_text(xx, yy + 120, "Fire Rate - " + string(gamepad_button_value(i, gp_shoulderrb)));
	    draw_text(xx, yy + 140, "Press START to join");
	} else {
		draw_text(xx, yy, "Add a controller ");
	}
}

draw_text(500, 500, "Nombre de manettes branchees " + string(_num));
draw_text(500, 600, "gamepad_get_device_count() " + string(gamepad_get_device_count()));
