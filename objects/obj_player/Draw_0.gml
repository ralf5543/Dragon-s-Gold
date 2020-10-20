/// @description Insert description here
// You can write your code in this editor

draw_self();// default draw, needed if draw event exists

if (flash > 0) {
	flash --;
	shader_set(shd_white);
	draw_self();
	shader_reset();//prevents the shader to apply to all
};