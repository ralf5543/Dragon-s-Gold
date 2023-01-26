/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_sprite_part(spr_lockpick_bar, 0, 0, 0, focus_lockpicked, sprite_height, x + 2, y + 2);

draw_sprite_ext(spr_key_generic, 0, x + (sprite_width / nb_keys_needed), y - 10, .3, .3, 0, c_white, 1);
draw_sprite_ext(spr_key_generic, 0, x + ((sprite_width / nb_keys_needed) * 2), y - 10, .3, .3, 0, c_white, 1);
draw_sprite_ext(spr_key_generic, 0, x + sprite_width, y - 10, .3, .3, 0, c_white, 1);

if (nb_keys_needed > 1) {
	if (nb_keys_possessed > 0) {
		draw_sprite_ext(spr_check, 0, x + (sprite_width / nb_keys_needed), y - 10, .3, .3, 0, c_white, 1);
	}
	
	if (nb_keys_possessed > 1) {
		draw_sprite_ext(spr_check, 0, x + ((sprite_width / nb_keys_needed) * 2), y - 10, .3, .3, 0, c_white, 1);
	}
}











