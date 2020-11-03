
function PlayerState_Lose(){

	if (sprite_index != asset_get_index("spr_" + character + "_die_strip6")) {
		sprite_index = asset_get_index("spr_" + character + "_die_strip6");
		image_index = 0;
		image_speed = 1;
	}
}