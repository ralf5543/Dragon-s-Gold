// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//argument0 = total keys needed number
//argument1 = keys left needed
function PlayerState_Lockpicking(argument0, argument1) {
	
	if (skeleton_animation_get() != "lockpick") {
		skeleton_animation_set("lockpick")
	}
	
	if (focus_lockpick < sprite_get_width(spr_lockpick_bar)) {
	
		if (can_lockpick == true) {
			can_lockpick = false;
		
			if (object_lockpicked == "chest") {
				argument0 = 3;
				argument1 = chest_keys_missing;
			}
		
			focus_lockpick = ((sprite_get_width(spr_lockpick_bar)) - ((sprite_get_width(spr_lockpick_bar) / argument0) * argument1));
		
			var inst = instance_create_layer(x - (sprite_get_width(spr_lockpick_bar_bkg) / 2), y - 120, "layer_players", obj_lockpick_bar);
			with (inst) {
				nb_keys_needed = argument0;
				nb_keys_possessed = nb_keys_needed - other.chest_keys_missing;
				lockpick_id_receiver = other.gamepad_id_owner;		
			}
		

			if (skeleton_animation_get() != "lockpick") {
				skeleton_animation_set("lockpick");		
			}
		
		audio_play_sound(snd_lockpick, 10, true);
		
		}

	
		with (obj_lockpick_bar) {
			if (lockpick_id_receiver == other.gamepad_id_owner) {
				focus_lockpicked = other.focus_lockpick;
			}
		}
	
		// the more players, the fastest the lockpick bar moves
		focus_lockpick = focus_lockpick + (.05 * obj_control.start_players);

	} else { 
		has_unlocked = true;
		audio_sound_pitch(snd_unlock, choose(.8, 1, 1.2));
		audio_play_sound(snd_unlock, 10, false);
		audio_play_sound(snd_key_fall, 8, false);
	}

}