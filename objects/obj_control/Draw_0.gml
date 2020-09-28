/// @description Insert description here
// You can write your code in this editor

var _num = 0;
for (var i = 0; i < 12; i++;)
{
var xx = 32;
var yy = 32 + (160 * _num);
if gamepad_is_connected(i)
    {
    _num++;
    draw_text(xx, yy, "Gamepad Slot - " + string(i));
    draw_text(xx, yy + 20, "Gamepad Type - " + string(gamepad_get_description(i)));
    draw_text(xx, yy + 40, "Left H Axis - " + string(gamepad_axis_value(i, gp_axislh)));
    draw_text(xx, yy + 60, "Left V Axis - " + string(gamepad_axis_value(i, gp_axislv)));
    draw_text(xx, yy + 80, "Right H Axis - " + string(gamepad_axis_value(i, gp_axisrh)));
    draw_text(xx, yy + 100, "Right V Axis - " + string(gamepad_axis_value(i, gp_axisrv)));   
    draw_text(xx, yy + 120, "Fire Rate - " + string(gamepad_button_value(i, gp_shoulderrb)));
    }
}
