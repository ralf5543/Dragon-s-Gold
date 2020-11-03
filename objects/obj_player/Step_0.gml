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
	
key_run = gamepad_button_check(pad_num, gp_shoulderrb);// Right trigger
key_jump = gamepad_button_check_pressed(pad_num, gp_face1);// A (green) button
key_attack = gamepad_button_check_pressed(pad_num, gp_face3);// X (blue) button
key_special = gamepad_button_check_pressed(pad_num, gp_face2);// B (red) button
key_special_released = gamepad_button_check_released(pad_num, gp_face2);// B (red) button
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
		
	if (facing == 1) {
		player_orientation = 0;
	} else {
		player_orientation = 180;
	}
		
	if (energy < energy_max) {
		energy += .1;
	}
	var inst = true;
	if (inst) {
		alarm[3] = 32;
		inst = false;
	}
	
	//==========------------- Invicible "state"
	if (is_invicible) {
		
		blink_timer ++;
		invincible_timer ++;
		
		if (blink_timer == 8) {
			if (image_alpha == 0) {
				image_alpha = 1;
			} else {
				image_alpha = 0;
			}
			
			blink_timer = 0;	
		}
		
		if (invincible_timer == 128) {
			is_invicible = false;
		}
	}

	switch (state) {
		case PLAYERSTATE.FREE : 
		PlayerState_Free();
		break;
		
		case PLAYERSTATE.HURT : 
		PlayerState_Hurt();
		break;
		
		case PLAYERSTATE.DEAD : 
		PlayerState_Dead();
		break;
		
		case PLAYERSTATE.ATTACK : 
		PlayerState_Attack();
		break;
		
		case PLAYERSTATE.SPECIAL : 
		if (character == "ranger") {
			PlayerState_Ranger_Special();
			
		} else if (character == "knight") {
			PlayerState_Knight_Special();
			
		} else if (character == "wizard") {
			PlayerState_Wizard_Special();
		}
		break;
		
		case PLAYERSTATE.WON : 
		PlayerState_Won();
		break;
		
		case PLAYERSTATE.LOSE : 
		PlayerState_Lose();
		break;
	}
	
	if (state != PLAYERSTATE.SPECIAL) && (character == "knight") {
		// todo : verify in a game with several knights
		if (instance_exists(obj_shield)) {
			instance_destroy(obj_shield);
		}
	}
}