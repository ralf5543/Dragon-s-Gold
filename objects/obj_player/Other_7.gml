/// @description 

//attack animation
if (sprite_index == asset_get_index("spr_" + character + "_attack_strip7")) {
    sprite_index = asset_get_index("spr_" + character + "_stand_strip2");
	state = PLAYERSTATE.FREE;
	can_attack = true;
}

//death animation
if (sprite_index == asset_get_index("spr_" + character + "_die_strip6")) {
	image_index = -1;
	image_speed = 0;
}