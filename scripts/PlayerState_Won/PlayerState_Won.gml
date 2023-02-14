
function PlayerState_Won(){

	can_attack = false;
	audio_stop_sound(snd_lockpick);
	
	if (can_play_victory) {
		audio_play_sound(snd_victory_music, 7, 0);
		audio_play_sound(snd_victory_cry, 5, 0);
		can_play_victory = false;
	}
	
	if (skeleton_animation_get() != "victory") {
		skeleton_animation_set("victory")
	}
	
	global.game_state = "over";

}