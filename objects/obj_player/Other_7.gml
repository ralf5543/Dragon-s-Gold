/// @description 

/*switch(sprite_index) {
  case (asset_get_index("spr_" + character + "_attack_strip7")):
    sprite_index = asset_get_index("spr_" + character + "_stand_strip2");
	state = PLAYERSTATE.FREE;
    break;
}*/

if (sprite_index == asset_get_index("spr_" + character + "_attack_strip7")) {
    sprite_index = asset_get_index("spr_" + character + "_stand_strip2");
	state = PLAYERSTATE.FREE;
}