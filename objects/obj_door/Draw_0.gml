/// @description Insert description here
// You can write your code in this editor
draw_self();

if (side == "left") {
	draw_text(x + 150, y - 50, "Door number " + string(door_number));
} else {
	draw_text(x - 150, y - 50, "Door number " + string(door_number));
}