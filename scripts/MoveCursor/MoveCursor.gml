
function MoveCursor(){
	gamepad_id_receiver.character = selectClass[selectClass_cursor];
	gamepad_id_receiver.sprite_index = asset_get_index("spr_" + gamepad_id_receiver.character);
	audio_play_sound(snd_bump, 5, false);
	free_stick = 0;
	alarm[0] = room_speed / 6;
}