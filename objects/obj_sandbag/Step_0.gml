
// used only for characters selection screen
if (room == rm_start) {
		skeleton_animation_set("stand");
		
	if (key_start) || keyboard_check(vk_enter) {	
		
		
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
		skeleton_attachment_set("main-gauche", "main-gauche-bouclier");
		skeleton_attachment_set("main-droite-epee", "main-droite-epee");
		skeleton_attachment_set("main-droite-bouclier", -1);
		player_orientation = 0;
	} else {
		player_orientation = 180;
		skeleton_attachment_set("main-gauche", "main-gauche-epee");
		skeleton_attachment_set("main-droite-epee", -1);
		skeleton_attachment_set("main-droite-bouclier", "main-droite-bouclier");
	}
		
	if (energy < energy_max) {
		energy += .1;
	}
	
	if (is_sliding) {
		var slideDistance = (6 * facing);
		
		//smoothly slow down the slide
		retarder = retarder - clamp(retarder, 0, 6) / 5;
		slideDistance = slideDistance + retarder
		// detects a collision at (x + hsp) distance (won't slide into a wall !)
		if (place_meeting(x + slideDistance, y, obj_wall)) {
			//while detects NO collision at 1px (sign(hsp), so 1 and -1) x distance
			while (!place_meeting(x + sign(slideDistance), y, obj_wall)) {
				//move from the "rest" to be the closest as possible from collision
			    x += sign(facing);
			}
		} else {
			x += slideDistance;
		}
		
		if (can_slide) {
			//slides for 0.5 second
			alarm[3] = 16;
			
			//stucks for 0.5 second more
			alarm[0] = 32;
			can_slide = false;
		}
	};
	
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
	
	// Condition to win : 3 different keys in the chest
	if (key_win_bronze) && (key_win_silver) && (key_win_gold) {
		state = PLAYERSTATE.WON;
		
		with (obj_player) {
			if (state != PLAYERSTATE.WON) {
				state = PLAYERSTATE.LOSE;
			}
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