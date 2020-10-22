/// @description Players commands


// stops the character when sticks are released
key_left = 0
key_right = 0;

// test horizontal axe for left stick for first slot controller, ignoring dead zone (0.2)
// abs takes a number, and change it to positive equivalent ("-9" -> "9")
if (abs(gamepad_axis_value(pad_num, gp_axislh)) > .2) {
	key_left = abs(min(gamepad_axis_value(pad_num, gp_axislh), 0));
	key_right = max(gamepad_axis_value(pad_num, gp_axislh), 0);	    
}

// same for vertical axe
if (abs(gamepad_axis_value(pad_num, gp_axislv)) > .2) {
	key_up = abs(min(gamepad_axis_value(pad_num, gp_axislv), 0));
	key_down = max(gamepad_axis_value(pad_num, gp_axislv), 0);
}
	
key_jump = gamepad_button_check_pressed(pad_num, gp_face1);// A (green) button
key_attack = gamepad_button_check_pressed(pad_num, gp_face3);// X (blue) button
key_start = gamepad_button_check_pressed(pad_num, gp_start);	

// used only for characters selection screen
if (room == rm_start) {
	
	if (key_start) {
		
		//Can push Start only once
		if (can_push_start == true) {
			// create class selection menu linked to this instance
			var inst = instance_create_layer(x, y + 250, "layer_players", obj_select_class);
			
			audio_sound_pitch(snd_start, choose(.8, 1, 1.2));
			audio_play_sound(snd_start, 10, false);

			image_xscale = 1.5;
			image_yscale = 1.5;

			with (inst) {
				//give gamepad number (from 0 to 3) to that obj_select_class instance
			   player_number = other.pad_num;
		   
			   //give gamepad id to the obj_select_class, via gamepad_id_receiver var
			   gamepad_id_receiver = other.gamepad_id_owner;
			}
			
			//tells the Controller that this player is ready
			obj_control.start_players ++;
			can_push_start = false;
		}
	}
		   
} else {
		image_xscale = facing;//so 1 or -1 (-1 is flipping the sprite)
		image_yscale = 1

	switch (state) {
		case PLAYERSTATE.FREE : 
		PlayerState_Free();
		break;
		
		case PLAYERSTATE.HURT : 
		PlayerState_Hurt();
		break;
		
		case PLAYERSTATE.ATTACK : 
		PlayerState_Attack()
		break;

	}
	
}