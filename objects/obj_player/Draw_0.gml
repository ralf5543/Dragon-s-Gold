/// @description Adds infos or colors

draw_self();// default draw, needed if draw event exists

if (flash > 0) {
	flash --;
	shader_set(shd_white);
	draw_self();
	shader_reset();//prevents the shader to apply to all
};

if (room != rm_start) {
	// Temp infos for debugging
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	//draw_text(x - 10, y - 70, "Player " + string(pad_num + 1));
	//draw_text(x - 10, y - 70, "can_take_stairs " + string(can_take_stairs));
	//draw_text(x - 10, y - 90, "is_taking_stairs " + string(is_taking_stairs));
	//draw_text(x - 10, y - 110, "has_taken_stairs " + string(has_taken_stairs));
	
	//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
}