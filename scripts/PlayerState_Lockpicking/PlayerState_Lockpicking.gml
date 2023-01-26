// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Lockpicking(){
	
	if (can_lockpick == true) {
		can_lockpick = false;
		
		//we need 3 keys to unlock the chest
	focus_lockpick = ((sprite_get_width(spr_lockpick_bar)) - ((sprite_get_width(spr_lockpick_bar) / 3) * chest_keys_missing));
		
		var inst = instance_create_layer(x - (sprite_get_width(spr_lockpick_bar_bkg) / 2), y - 120, "layer_players", obj_lockpick_bar);
		with (inst) {
			lockpick_id_receiver = other.gamepad_id_owner;		
			
		}
		
		
		show_debug_message("lockpick !");
		

		if (skeleton_animation_get() != "lockpick") {
			skeleton_animation_set("lockpick");		
		}
		
	}

	
	with (obj_lockpick_bar) {
		if (lockpick_id_receiver == other.gamepad_id_owner) {
			focus_lockpicked = other.focus_lockpick;
		}
	}
	
	focus_lockpick ++;
	show_debug_message("focus_lockpick : " + string(focus_lockpick));

	if (focus_lockpick > 32) {//button pressed at least 1 second
		show_debug_message("crocheté !");
			
	}

}