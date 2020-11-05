/// @description keys use

if (has_bronze_key < 1) {
	with (other) {
		if (has_bronze_key > 0) {
			other.has_bronze_key ++;
			has_bronze_key --;
			
			key_win_bronze = true;
			
			audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
			audio_play_sound(snd_unlock, 10, false);
			audio_play_sound(snd_key_fall, 8, false);
		}
	}
}

if (has_silver_key < 1) {
	with (other) {
		if (has_silver_key > 0) {
			other.has_silver_key ++;
			has_silver_key --;
			
			key_win_silver = true;
			
			audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
			audio_play_sound(snd_unlock, 10, false);
			audio_play_sound(snd_key_fall, 8, false);
		}
	}
}

if (has_gold_key < 1) {
	with (other) {
		if (has_gold_key > 0) {
			other.has_gold_key ++;
			has_gold_key --;
			
			key_win_gold = true;
			
			audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
			audio_play_sound(snd_unlock, 10, false);
			audio_play_sound(snd_key_fall, 8, false);
		}
	}
}
