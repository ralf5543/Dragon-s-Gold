/// @description keys use

with (other) {
	if (has_bronze_key > 0) && (!key_win_bronze) {
		has_bronze_key --;
		key_win_bronze = true;
		chest_keys_missing --;
			
		audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
		audio_play_sound(snd_unlock, 10, false);
		audio_play_sound(snd_key_fall, 8, false);
	}
	
	if (has_silver_key > 0) && (!key_win_silver) {
		has_silver_key --;
		key_win_silver = true;
		chest_keys_missing --;
			
		audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
		audio_play_sound(snd_unlock, 10, false);
		audio_play_sound(snd_key_fall, 8, false);
	}
	
	if (has_gold_key > 0) && (!key_win_gold) {
		has_gold_key --;
		key_win_gold = true;
		chest_keys_missing --;
			
		audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
		audio_play_sound(snd_unlock, 10, false);
		audio_play_sound(snd_key_fall, 8, false);
	}
	
	if (character == "thief") {
		if (key_action) {
			if (focus_lockpick < sprite_get_width(spr_lockpick_bar)) {
				state = PLAYERSTATE.LOCKPICKING;
				object_lockpicked = "chest";
			}			
		}
		
		if (has_unlocked) {
			Win();
		}
	}
}

