/// @description Adds infos or colors to te player

draw_self();// default draw, needed if draw event exists

if (flash > 0) {
	flash --;
	shader_set(shd_white);
	draw_self();
	shader_reset();//prevents the shader to apply to all
};

if (room != rm_start) {

	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(x - 10, y - 70, "Player " + string(pad_num + 1));
	draw_text(x - 10, y - 50, "Class " + string(character));
	draw_text(x - 10, y - 90, "State " + string(state));
}