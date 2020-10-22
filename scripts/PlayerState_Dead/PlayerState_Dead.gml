
function PlayerState_Dead(){
	
	if (sprite_index != asset_get_index("spr_" + character + "_die_strip6")) {
		sprite_index = asset_get_index("spr_" + character + "_die_strip6");
		image_index = 1;
		image_speed = 1;
		audio_play_sound(choose(snd_death_male1, snd_death_male2, snd_death_male3), 7, false);
	}

}