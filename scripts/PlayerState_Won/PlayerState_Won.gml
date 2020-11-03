
function PlayerState_Won(){

	can_attack = false;
	
	if (can_play_victory) {
		audio_play_sound(snd_victory_music, 7, 0);
		audio_play_sound(snd_victory_cry, 5, 0);
		can_play_victory = false;
	}
	
	if (sprite_index != asset_get_index("spr_" + character + "_win_strip3")) {
		sprite_index = asset_get_index("spr_" + character + "_win_strip3");
		image_index = 0;
	}
	

}