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
key_action = gamepad_button_check_pressed(pad_num, gp_face4);// Y (yellow) button
key_action_released = gamepad_button_check_released(pad_num, gp_face4);// Y (yellow) button
key_start = gamepad_button_check_pressed(pad_num, gp_start);

key_equipment_up = gamepad_button_check_pressed(pad_num, gp_padu);
key_equipment_right = gamepad_button_check_pressed(pad_num, gp_padr);
key_equipment_down = gamepad_button_check_pressed(pad_num, gp_padd);
key_equipment_left = gamepad_button_check_pressed(pad_num, gp_padl);


// used only for characters selection screen
if (room == rm_select) {
	if (
		skeleton_skin_get() != "alt1" && skeleton_skin_get() != "alt2" && skeleton_skin_get() != "alt3"
	) {
		skeleton_skin_set("standard");
	}
	
	//character waiting for selection
	if (isActive == false) {
			if (skeleton_animation_get() != "stand") {
			skeleton_animation_set("stand");		
		}
	}		
	
		
	if (key_start) or (keyboard_check_pressed(vk_enter)) {	
		
		//Can push Start only once
		if (can_push_start == true) {
	
			//var list = ds_list_create();
			//skeleton_skin_list(spr_knight, list);
	
			//// from 1 (alt1) to 4 (standard)
			//skeleton_skin_set(list[| 4])
			//ds_list_destroy(list);
			
			// create class selection menu linked to this instance
			var inst = instance_create_layer(x, y + 250, "layer_players", obj_select_class);
			
			//audio_sound_pitch(snd_start, choose(.8, 1, 1.2));
			//audio_play_sound(snd_start, 10, false);

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
			
			// Remove "push start" text
			if (isActive) {
				//show_debug_message("pad_num : " + string(pad_num))
			with (obj_control) {
				
					text_start_player = "";
				}
				
			}
		}
	}
		   
} else if (room == rm_game) {
	if (has_taken_stairs >= 40)  {
		//if (can_display_blackBars) {
		//	percent = min(1, percent + max((percent / 10), 0.005));
		//	if (percent >= 2) {
		//		can_display_blackBars = false;
		//	}
		//} else {
		//	percent = max(0, percent - max(((1 - percent) / 10), 0.01));
		//}
	} 

	image_xscale = facing;//so 1 or -1 (-1 is flipping the sprite)
	image_yscale = 1
	
	// TODO : draw animations for alternate facing !
		
	//if (facing == 1) {
	//	skeleton_attachment_set("main-gauche", "main-gauche-bouclier");
	//	skeleton_attachment_set("main-droite-epee", "main-droite-epee");
	//	skeleton_attachment_set("main-droite-bouclier", -1);
	//	player_orientation = 0;
	//} else {
	//	player_orientation = 180;
	//	skeleton_attachment_set("main-gauche", "main-gauche-epee");
	//	skeleton_attachment_set("main-droite-epee", -1);
	//	skeleton_attachment_set("main-droite-bouclier", "main-droite-bouclier");
	//}
		
	if (energy < energy_max) {
		energy += .1;
	}
	
	if (is_sliding) {
		if (skeleton_animation_get() == "attack") {
			Player_Slide(3)
		}
		else if (skeleton_animation_get() == "dash") {
			Player_Slide(8)
		}
		else if (skeleton_animation_get() == "combo1") {
			if (character == "knight" or character == "wizard") {
				Player_Slide(5)
			} else {
				Player_Slide(3)
			}
		}
		else if (skeleton_animation_get() == "combo2") {
			Player_Slide(3)
		}
	};
	
	//==========------------- Invicible "state"
	if (is_invicible) {

		blink_timer ++;
		invincible_timer ++;
		
		if (state != PLAYERSTATE.CROSSINGDDOOR) && (state != PLAYERSTATE.TAKINGSTAIRS) {

			if (blink_timer >= 8) {
				if (image_alpha == 0) {
					image_alpha = 1;
				} else {
					image_alpha = 0;
				}
			
				blink_timer = 0;	
			}
		}
		if (is_drinking_invincibility_potion) {
			if (invincible_timer >= 320 + irandom_range(0, 320)) {// between 5 and 10 secs
				is_invicible = false;
				is_drinking_invincibility_potion = false;
				invincible_timer = 0;
				image_alpha = 1;
			}
		} else {
			if (invincible_timer >= 128) {
				is_invicible = false;
				invincible_timer = 0;
				image_alpha = 1;// just to be sure he's visible again
			}
		}
	}
	
	function Win() {
		state = PLAYERSTATE.WON;
		
		with (obj_player) {
			if (state != PLAYERSTATE.WON) {
				state = PLAYERSTATE.LOSE;
			}
		}
	}
	
	// Condition to win : 3 different keys in the chest
	if (key_win_bronze) && (key_win_silver) && (key_win_gold) {
		Win();
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
		
		case PLAYERSTATE.COMBO1 : 
		PlayerState_Combo1();
		break;
		
		case PLAYERSTATE.COMBO2 : 
		PlayerState_Combo2();
		break;
		
		case PLAYERSTATE.LOCKPICKING : 
		PlayerState_Lockpicking(argument0, argument1);
		break;
		
		case PLAYERSTATE.SPECIAL : 
		switch (character) {
			case "knight" :
			PlayerState_Knight_Special();
			break;
			
			case "ranger" :
			PlayerState_Ranger_Special();
			break;
			
			case "wizard" :
			PlayerState_Wizard_Special();
			break;
			
			case "thief" :
			PlayerState_Thief_Special();
			break;
			
		}
		break;
		
		case PLAYERSTATE.WON : 
		PlayerState_Won();
		break;
		
		case PLAYERSTATE.LOSE : 
		PlayerState_Lose();
		break;
		
		case PLAYERSTATE.CROSSINGDDOOR : 
		PlayerState_Crossing_Door();
		break;
		
		case PLAYERSTATE.TAKINGSTAIRS : 
		PlayerState_Taking_Stairs();
		break;
		
		case PLAYERSTATE.DRINKINGPOTION : 
		PlayerState_Drinking_Potion();
		break;
	}
	
	if (character =="ranger") {
		sexe = "female";
	} else {
		sexe =  "male"
	}

//show_debug_message("can_take_stairs_controller" + string(can_take_stairs_controller))

	//if (has_taken_stairs >= 60) {
	//	percent = min(1.2, percent + max((1.2 - percent / 10), 0.05));
	
	//} else {
	//	percent = max(0, percent - max((percent / 10), 0.05))
	//}

	//use items
	
	if (key_equipment_up) {
		if (EquipmentSlot[0] != undefined) {
			 if (EquipmentSlot[0] == "potion_health") || (EquipmentSlot[0] == "potion_energy") || (EquipmentSlot[0] == "potion_invincibility") || (EquipmentSlot[0] == "potion_poison") {
				state = PLAYERSTATE.DRINKINGPOTION;
				Drink_Potion(EquipmentSlot[0]);
			 }

			EquipmentSlot[0] = undefined;
			equipments_number -- ;
		}
	}
	
	if (key_equipment_right) {
		if (EquipmentSlot[1] != undefined) {
			 if (EquipmentSlot[1] == "potion_health") || (EquipmentSlot[1] == "potion_energy") || (EquipmentSlot[1] == "potion_invincibility") || (EquipmentSlot[1] == "potion_poison") {
				state = PLAYERSTATE.DRINKINGPOTION;
				Drink_Potion(EquipmentSlot[1]);
			 }

			EquipmentSlot[1] = undefined;
			equipments_number -- ;
		}
	}
	
	if (key_equipment_down) {
		if (EquipmentSlot[2] != undefined) {
			 if (EquipmentSlot[1] == "potion_health") || (EquipmentSlot[2] == "potion_energy") || (EquipmentSlot[2] == "potion_invincibility") || (EquipmentSlot[2] == "potion_poison") {
				state = PLAYERSTATE.DRINKINGPOTION;
				Drink_Potion(EquipmentSlot[2]);
			 }

			EquipmentSlot[2] = undefined;
			equipments_number -- ;
		}
	}
	
	if (key_equipment_left) {
		if (EquipmentSlot[3] != undefined) {
			 if (EquipmentSlot[3] == "potion_health") || (EquipmentSlot[3] == "potion_energy") || (EquipmentSlot[3] == "potion_invincibility") || (EquipmentSlot[3] == "potion_poison") {
				state = PLAYERSTATE.DRINKINGPOTION;
				Drink_Potion(EquipmentSlot[1]);
			 }

			EquipmentSlot[3] = undefined;
			equipments_number -- ;
		}
	}
	
	if (character == "thief") {
		
		if (key_action_released) {
			state = PLAYERSTATE.FREE;
			
			with (obj_lockpick_bar) {
				if (lockpick_id_receiver == other.gamepad_id_owner) {
					instance_destroy();
				}
			}
		}
	}
	
}

