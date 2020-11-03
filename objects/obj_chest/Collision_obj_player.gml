/// @description keys use

//if (can_play_sound) {


if (has_bronze_key < 1) {
	with (other) {
		if (has_bronze_key > 0) {
			other.has_bronze_key ++;
			has_bronze_key --;
			
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
			
			audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
			audio_play_sound(snd_unlock, 10, false);
			audio_play_sound(snd_key_fall, 8, false);
		}
	}
}

if (has_bronze_key > 0) && (has_silver_key > 0) && (has_gold_key > 0) {
	other.state = PLAYERSTATE.WON;
	
	with (obj_player) {
		if (state != PLAYERSTATE.WON) {
			state = PLAYERSTATE.LOSE;
		}				
	}
}