// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Drinking_Potion(){
	if (skeleton_animation_get() != "drink-potion") {
		skeleton_animation_set("drink-potion");				
	}
}